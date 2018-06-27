Talks::Mutations::Create = GraphQL::Field.define do
  description 'Creates a Talk'
  type Talks::Type

  argument :talk, Talks::Mutations::InputType

  resolve ApplicationService.call(:talk, :create)
end
