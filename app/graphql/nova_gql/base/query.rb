# frozen_string_literal: true

module NovaGQL
  module Base
    class Query < GraphQL::Schema::Resolver
      private

      def viewer = context[:viewer]

      # Memoized for the duration of the request, so several fields resolving
      # off the same project hit the database once.
      def project = context[:project] ||= ::MortgageProject.find(viewer.project_id)
    end
  end
end
