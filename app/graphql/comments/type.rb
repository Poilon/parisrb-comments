Comments::Type = GraphQL::ObjectType.define do
  name 'Comment'
  field :id, !types.String
  field :created_at, types.String
  field :updated_at, types.String
  field :body, types.String
  field :spectator_id, !types.String
  field :spectator, !Spectators::Type
  field :talk_id, !types.String
  field :talk, !Talks::Type
end
