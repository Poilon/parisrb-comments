Spectators::Mutations::Destroy = GraphQL::Field.define do
  description 'Destroys a Spectator'
  type Spectators::Type

  argument :id, !types.String

  resolve ApplicationService.call(:spectator, :destroy)
end
