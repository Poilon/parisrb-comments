Talks::Mutations::Destroy = GraphQL::Field.define do
  description 'Destroys a Talk'
  type Talks::Type

  argument :id, !types.String

  resolve ApplicationService.call(:talk, :destroy)
end
