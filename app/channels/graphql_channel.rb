class GraphqlChannel < ApplicationCable::Channel

  def subscribed
    @subscription_ids = []
  end

  # see graphql-ruby from details
  def execute(data)
    query, context, variables, operation_name = options_for_execute(data)
    result = ParisrbCommentsSchema.execute(query: query, context: context,
                                    variables: variables, operation_name: operation_name)
    payload = { result: result.subscription? ? nil : result.to_h, more: result.subscription?,
                errors: result ? result.to_h[:errors] : nil }
    @subscription_ids << result.context[:subscription_id] if result.context[:subscription_id]
    transmit(payload)
  end

  def unsubscribed
    @subscription_ids.each do |sid|
      ParisrbCommentsSchema.subscriptions.delete_subscription(sid)
    end
  end

  def options_for_execute(data)
    query = data['query']
    variables = ensure_hash(data['variables'])
    operation_name = data['operationName']
    context = { current_user: current_user, channel: self }.
              merge(ensure_hash(data['context']).symbolize_keys). # ensure context is filled
              merge(variables) # include variables in context too
    [query, context, variables, operation_name]
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, 'Unexpected parameter: ' + ambiguous_param
    end
  end

end
