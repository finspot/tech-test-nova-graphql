# frozen_string_literal: true

class Mortgagor < ApplicationRecord
  belongs_to :mortgage_project
  has_many :documents, dependent: :nullify
end
