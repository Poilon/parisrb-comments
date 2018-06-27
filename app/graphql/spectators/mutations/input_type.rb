Spectators::Mutations::InputType = GraphQL::InputObjectType.define do
  name 'SpectatorInputType'
  description 'Properties for updating a Spectator'
  argument :comment_ids, !types[!types.String]

  argument :name, types.String

end
