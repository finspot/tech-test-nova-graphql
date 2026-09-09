# frozen_string_literal: true

module NovaGQL
  module Types
    module Payload
      class EchoPayload < Base::Object
        description 'Result of echo. Wiring example, delete it.'

        field :message, String, null: false, description: 'What you sent.'
        field :caller_role, String, null: false, description: 'Role the API resolved from the request.'
      end
    end
  end
end
