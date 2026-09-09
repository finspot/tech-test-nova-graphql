# frozen_string_literal: true

class MortgageProject < ApplicationRecord
  has_many :mortgagors, dependent: :destroy
  has_many :documents, dependent: :destroy
end
