Spectators::Type = GraphQL::ObjectType.define do
  name 'Spectator'
  field :id, !types.String
  field :comment_ids, !types[!types.String]
  field :comments, !types[!Comments::Type]
  field :created_at, types.String
  field :updated_at, types.String
  field :name, types.String
end
