Tags::Mutations::Destroy = GraphQL::Field.define do
  description 'Destroys a Tag'
  type Tags::Type

  argument :id, !types.String

  resolve ApplicationService.call(:tag, :destroy)
end
