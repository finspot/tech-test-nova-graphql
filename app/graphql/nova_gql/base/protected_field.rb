# frozen_string_literal: true

module NovaGQL
  module Base
    # Fields are authenticated by default. Opting out is explicit:
    #
    #   field :ping, String, null: false, enforceable: false
    #
    class ProtectedField < GraphQL::Schema::Field
      def initialize(*args, enforceable: true, **kwargs, &block)
        @enforceable = enforceable
        super(*args, **kwargs, &block)
      end

      def authorized?(object, args, context)
        return super unless @enforceable

        context[:viewer].present? && super
      end
    end
  end
end
