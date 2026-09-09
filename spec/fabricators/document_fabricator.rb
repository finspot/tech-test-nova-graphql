# frozen_string_literal: true

Fabricator(:document) do
  mortgage_project
  kind 'identity_card'
  status 'pending'
end
