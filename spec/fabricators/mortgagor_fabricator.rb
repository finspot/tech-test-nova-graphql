# frozen_string_literal: true

Fabricator(:mortgagor) do
  mortgage_project
  first_name 'Alex'
  last_name 'Marchand'
  employment_status 'employee'
  main true
end
