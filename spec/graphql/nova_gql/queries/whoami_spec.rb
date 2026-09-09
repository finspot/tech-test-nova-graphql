# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NovaGQL::Queries::Whoami, '#resolve', type: :query do
  subject(:result) { NovaGQL::Schema.execute(query, context:) }

  let(:query) { <<~GRAPHQL }
    query Whoami {
      whoami {
        role
        projectId
      }
    }
  GRAPHQL

  let(:context) { { viewer: Viewer.new(role: :client, project_id: 42, mortgagor_id: nil) } }

  it 'returns the caller the API resolved' do
    expect(result.to_h.fetch('data')).to eq('whoami' => { 'role' => 'client', 'projectId' => '42' })
  end

  context 'without a caller' do
    let(:context) { {} }

    it 'fails with UNAUTHORIZED' do
      expect(result.to_h.dig('errors', 0, 'extensions', 'code')).to eq('UNAUTHORIZED')
    end
  end
end
