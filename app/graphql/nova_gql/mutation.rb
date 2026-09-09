# frozen_string_literal: true

module NovaGQL
  class Mutation < Base::ProtectedObject
    graphql_name 'Mutation'

    field :echo, mutation: Mutations::Echo
  end
end
