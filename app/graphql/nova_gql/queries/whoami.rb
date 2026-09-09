# frozen_string_literal: true

module NovaGQL
  module Queries
    # Wiring example, delete it.
    #
    # It shows how a resolver is declared and how it reads the caller from the
    # context. It says nothing about the domain you are asked to model.
    class Whoami < Base::Query
      description 'Returns the caller the API resolved. Wiring example, delete it.'

      type Types::Caller, null: false

      def resolve
        { role: viewer.role.to_s, project_id: viewer.project_id }
      end
    end
  end
end
