# frozen_string_literal: true

module NovaGQL
  module Error
    class NotFound < GraphQL::ExecutionError
      def initialize(message = 'NOT_FOUND')
        super(message, extensions: { 'code' => 'NOT_FOUND' })
      end
    end
  end
end
