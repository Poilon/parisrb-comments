Comments::Mutations::Update = GraphQL::Field.define do
  description 'Updates a Comment'
  type Comments::Type

  argument :id, !types.String
  argument :comment, Comments::Mutations::InputType

  resolve ApplicationService.call(:comment, :update)
end
