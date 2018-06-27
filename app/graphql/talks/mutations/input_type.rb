Talks::Mutations::InputType = GraphQL::InputObjectType.define do
  name 'TalkInputType'
  description 'Properties for updating a Talk'
  argument :tag_ids, !types[!types.String]
  argument :comment_ids, !types[!types.String]
  argument :speaker_id, !types.String

  argument :title, types.String

end
