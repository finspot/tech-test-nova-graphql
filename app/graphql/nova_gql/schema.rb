# frozen_string_literal: true

module NovaGQL
  class Schema < GraphQL::Schema
    query NovaGQL::Query
    mutation NovaGQL::Mutation

    rescue_from(ActiveRecord::RecordNotFound) { raise Error::NotFound }

    def self.unauthorized_object(_unauthorized_error)
      raise Error::Unauthorized
    end

    def self.unauthorized_field(_unauthorized_error)
      raise Error::Unauthorized
    end
  end
end
