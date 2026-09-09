# frozen_string_literal: true

module NovaGQL
  module Types
    class Caller < Base::Object
      description 'Whoever is calling. Wiring example, delete it.'

      field :role, String, null: false, description: 'Role the API resolved from the request.'
      field :project_id, ID, null: true, description: 'Mortgage file the caller is scoped to, if any.'
    end
  end
end
