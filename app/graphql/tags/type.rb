Tags::Type = GraphQL::ObjectType.define do
  name 'Tag'
  field :id, !types.String
  field :talk_ids, !types[!types.String]
  field :talks, !types[!Talks::Type]
  field :created_at, types.String
  field :updated_at, types.String
  field :name, types.String
end
