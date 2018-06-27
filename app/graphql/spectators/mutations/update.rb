Spectators::Mutations::Update = GraphQL::Field.define do
  description 'Updates a Spectator'
  type Spectators::Type

  argument :id, !types.String
  argument :spectator, Spectators::Mutations::InputType

  resolve ApplicationService.call(:spectator, :update)
end
