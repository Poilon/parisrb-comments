class ApplicationService

  attr_accessor :params, :object, :fields, :user

  def initialize(params: {}, object: nil, object_id: nil, user: nil, context: nil)
    @params = params.to_h.symbolize_keys
    @context = context
    @object = object || (object_id && model.visible_for(user: user).find_by(id: object_id))
    @object_id = object_id
    @user = user
  end

  def self.call(resource, meth)
    lambda { |_obj, args, context|
      params = args && args[resource] ? args[resource] : args
      "#{resource.to_s.pluralize.camelize.constantize}::Service".constantize.new(
        params: params, user: context[:current_user],
        object_id: args[:id], context: context
      ).send(meth)
    }
  end

  def index
    Graphql::HydrateQuery.new(model.all, @context, user: user).run
  end

  def show
    object = Graphql::HydrateQuery.new(model.all, @context, user: user, id: params[:id]).run
    return not_allowed if object.blank?
    object
  end

  def create
    object = model.new(params.select { |p| model.new.respond_to?(p) })
    if object.save
      object
    else
      graphql_error(object.errors.full_messages.join(', '))
    end
  end

  def destroy
    object = model.find_by(id: params[:id])
    return not_allowed if write_not_allowed
    if object.destroy
      object
    else
      graphql_error(object.errors.full_messages.join(', '))
    end
  end

  def update
    return not_allowed if write_not_allowed
    if object.update_attributes(params)
      object
    else
      graphql_error(object.errors.full_messages.join(', '))
    end
  end

  private

  def write_not_allowed
    !model.writable_by(user: user).include?(object) if object
  end

  def access_not_allowed
    !model.visible_for(user: user).include?(object) if object
  end

  def not_allowed
    graphql_error('403 - Not allowed')
  end

  def graphql_error(message)
    GraphQL::ExecutionError.new(message)
  end

  def singular_resource
    resource_name.singularize
  end

  def model
    singular_resource.camelize.constantize
  end

  def resource_name
    self.class.to_s.split(':').first.underscore
  end

end

