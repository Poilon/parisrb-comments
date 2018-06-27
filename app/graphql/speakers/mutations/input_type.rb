Speakers::Mutations::InputType = GraphQL::InputObjectType.define do
  name 'SpeakerInputType'
  description 'Properties for updating a Speaker'
  argument :talk_ids, !types[!types.String]

  argument :name, types.String

end
