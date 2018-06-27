Speakers::Mutations::Update = GraphQL::Field.define do
  description 'Updates a Speaker'
  type Speakers::Type

  argument :id, !types.String
  argument :speaker, Speakers::Mutations::InputType

  resolve ApplicationService.call(:speaker, :update)
end
