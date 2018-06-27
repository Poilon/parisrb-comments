Comments::Mutations::Create = GraphQL::Field.define do
  description 'Creates a Comment'
  type Comments::Type

  argument :comment, Comments::Mutations::InputType

  resolve ApplicationService.call(:comment, :create)
end
