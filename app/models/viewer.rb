# frozen_string_literal: true

# Whoever is calling the API. In the real nova-api this is built from a cookie;
# here the GraphqlController fakes it from request headers so you can
# play both roles. See STARTER.md.
Viewer = Data.define(:role, :project_id, :mortgagor_id) do
  def client? = role == :client
  def advisor? = role == :advisor
end
