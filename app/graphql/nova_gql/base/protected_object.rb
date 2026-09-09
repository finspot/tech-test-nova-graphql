# frozen_string_literal: true

module NovaGQL
  module Base
    class ProtectedObject < Object
      field_class ProtectedField
    end
  end
end
