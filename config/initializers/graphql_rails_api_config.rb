require 'graphql/rails/api/config'

config = Graphql::Rails::Api::Config.instance

config.id_type = :uuid # :id or :uuid

# Possibilites are :create, :update or :destroy
config.basic_mutations = %i[create update destroy]
