# frozen_string_literal: true

namespace :graphql do
  desc 'Dump the GraphQL schema to schema.graphql'
  task schema_dump: :environment do
    path = Rails.root.join('schema.graphql')
    path.write("#{NovaGQL::Schema.to_definition.strip}\n")

    puts "Dumped #{path}"
  end
end
