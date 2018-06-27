Tags::Mutations::InputType = GraphQL::InputObjectType.define do
  name 'TagInputType'
  description 'Properties for updating a Tag'
  argument :talk_ids, !types[!types.String]

  argument :name, types.String

end
