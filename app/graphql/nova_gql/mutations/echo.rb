# frozen_string_literal: true

module NovaGQL
  module Mutations
    # Wiring example, delete it.
    #
    # It does nothing useful on purpose. It shows how a mutation declares its
    # input and its payload, and how it reads the caller. It says nothing about
    # the domain you are asked to model, nor about where business logic belongs.
    class Echo < Base::Mutation
      description 'Returns what you send, plus the resolved role. Wiring example, delete it.'

      argument :input, Types::Input::EchoInput, required: true

      type Types::Payload::EchoPayload, null: false

      def resolve(input:)
        { message: input.message, caller_role: viewer.role.to_s }
      end
    end
  end
end
