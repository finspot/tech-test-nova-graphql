# frozen_string_literal: true

class GraphqlController < ActionController::API
  def execute
    result = NovaGQL::Schema.execute(
      params[:query],
      variables: params[:variables] || {},
      operation_name: params[:operationName],
      context: { viewer: }
    )

    render json: result
  end

  private

  # Authentication is faked in this starter. The real nova-api builds the
  # caller from a cookie; here you pick a role with headers:
  #
  #   X-Role: client | advisor
  #   X-Project-Id: 1
  #
  def viewer
    role = request.headers['X-Role']
    return if role.blank?

    Viewer.new(
      role: role.to_sym,
      project_id: request.headers['X-Project-Id'].presence&.to_i,
      mortgagor_id: request.headers['X-Mortgagor-Id'].presence&.to_i
    )
  end
end
