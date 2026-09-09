# frozen_string_literal: true

module NovaGQL
  module Error
    # Raised as a top-level GraphQL error: the caller has no business asking.
    class Unauthorized < GraphQL::ExecutionError
      def initialize(message = 'UNAUTHORIZED')
        super(message, extensions: { 'code' => 'UNAUTHORIZED' })
      end
    end
  end
end
