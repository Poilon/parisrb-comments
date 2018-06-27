Spectators::Mutations::Create = GraphQL::Field.define do
  description 'Creates a Spectator'
  type Spectators::Type

  argument :spectator, Spectators::Mutations::InputType

  resolve ApplicationService.call(:spectator, :create)
end
