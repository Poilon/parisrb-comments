Talks::Type = GraphQL::ObjectType.define do
  name 'Talk'
  field :id, !types.String
  field :tag_ids, !types[!types.String]
  field :tags, !types[!Tags::Type]
  field :comment_ids, !types[!types.String]
  field :comments, !types[!Comments::Type]
  field :speaker_id, !types.String
  field :speaker, !Speakers::Type
  field :created_at, types.String
  field :updated_at, types.String
  field :title, types.String
end
