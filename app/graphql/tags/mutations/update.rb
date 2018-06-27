Tags::Mutations::Update = GraphQL::Field.define do
  description 'Updates a Tag'
  type Tags::Type

  argument :id, !types.String
  argument :tag, Tags::Mutations::InputType

  resolve ApplicationService.call(:tag, :update)
end
