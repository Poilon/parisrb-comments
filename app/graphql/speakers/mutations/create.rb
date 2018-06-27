Speakers::Mutations::Create = GraphQL::Field.define do
  description 'Creates a Speaker'
  type Speakers::Type

  argument :speaker, Speakers::Mutations::InputType

  resolve ApplicationService.call(:speaker, :create)
end
