Comments::Mutations::Destroy = GraphQL::Field.define do
  description 'Destroys a Comment'
  type Comments::Type

  argument :id, !types.String

  resolve ApplicationService.call(:comment, :destroy)
end
