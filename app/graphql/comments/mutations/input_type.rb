Comments::Mutations::InputType = GraphQL::InputObjectType.define do
  name 'CommentInputType'
  description 'Properties for updating a Comment'

  argument :body, types.String
  argument :spectator_id, !types.String
  argument :talk_id, !types.String

end
