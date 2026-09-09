# frozen_string_literal: true

module NovaGQL
  module Base
    class Mutation < GraphQL::Schema::Mutation
      private

      def viewer = context[:viewer]

      def project = context[:project] ||= ::MortgageProject.find(viewer.project_id)
    end
  end
end
