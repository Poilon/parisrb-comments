Speakers::Mutations::Destroy = GraphQL::Field.define do
  description 'Destroys a Speaker'
  type Speakers::Type

  argument :id, !types.String

  resolve ApplicationService.call(:speaker, :destroy)
end
