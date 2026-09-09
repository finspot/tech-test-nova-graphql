# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NovaGQL::Mutations::Echo, '#resolve', type: :mutation do
  subject(:result) { NovaGQL::Schema.execute(query, variables:, context:) }

  let(:query) { <<~GRAPHQL }
    mutation Echo($input: EchoInput!) {
      echo(input: $input) {
        message
        callerRole
      }
    }
  GRAPHQL

  let(:context) { { viewer: Viewer.new(role: :advisor, project_id: nil, mortgagor_id: nil) } }
  let(:variables) { { 'input' => { 'message' => 'hello' } } }

  it 'returns the message and the resolved role' do
    data = result.to_h.fetch('data').fetch('echo')

    expect(data).to eq('message' => 'hello', 'callerRole' => 'advisor')
  end

  context 'without a caller' do
    let(:context) { {} }

    it 'fails with UNAUTHORIZED' do
      expect(result.to_h.dig('errors', 0, 'extensions', 'code')).to eq('UNAUTHORIZED')
    end
  end
end
