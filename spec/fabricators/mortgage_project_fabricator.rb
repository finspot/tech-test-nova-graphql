# frozen_string_literal: true

Fabricator(:mortgage_project) do
  reference { sequence(:mortgage_project_reference) { |i| "PRE-#{1042 + i}" } }
  advisor_name 'Camille Rousseau'
  contact_phone '+33600000001'
end
