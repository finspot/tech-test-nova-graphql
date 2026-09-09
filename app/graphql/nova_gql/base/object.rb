# frozen_string_literal: true

module NovaGQL
  module Base
    class Object < GraphQL::Schema::Object
      private

      def viewer = context[:viewer]
    end
  end
end
