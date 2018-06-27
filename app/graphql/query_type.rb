QueryType = GraphQL::ObjectType.define do
  name 'Query'

  Graphql::Rails::Api::Config.query_resources.each do |resource|
    field resource.singularize do
      description "Return a #{resource.classify}"
      type !"#{resource.camelize}::Type".constantize
      argument :id, !types.String
      resolve ApplicationService.call(resource, :show)
    end

    field resource.pluralize do
      description "Return a #{resource.classify}"
      type !types[!"#{resource.camelize}::Type".constantize]
      argument :page, types.Int
      argument :per_page, types.Int
      resolve ApplicationService.call(resource, :index)
    end

  end

end
