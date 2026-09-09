# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NovaGQL::Schema do
  it 'matches the checked-in schema.graphql' do
    expect(described_class.to_definition.strip)
      .to eq(Rails.root.join('schema.graphql').read.strip),
          'The schema changed: run `bundle exec rake graphql:schema_dump` and commit schema.graphql'
  end
end
