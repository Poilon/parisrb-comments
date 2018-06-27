Tags::Mutations::Create = GraphQL::Field.define do
  description 'Creates a Tag'
  type Tags::Type

  argument :tag, Tags::Mutations::InputType

  resolve ApplicationService.call(:tag, :create)
end
