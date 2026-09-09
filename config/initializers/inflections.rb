# frozen_string_literal: true

# Lets Zeitwerk map app/graphql/nova_gql/... onto the NovaGQL namespace,
# the same way nova-api maps AppGQL.
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'GQL'
end
