# frozen_string_literal: true

module NovaGQL
  module Types
    module Input
      class EchoInput < GraphQL::Schema::InputObject
        description 'Input for echo. Wiring example, delete it.'

        argument :message, String, required: true, description: 'Anything. It comes back as is.'
      end
    end
  end
end
