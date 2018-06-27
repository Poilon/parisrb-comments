Talks::Mutations::Update = GraphQL::Field.define do
  description 'Updates a Talk'
  type Talks::Type

  argument :id, !types.String
  argument :talk, Talks::Mutations::InputType

  resolve ApplicationService.call(:talk, :update)
end
