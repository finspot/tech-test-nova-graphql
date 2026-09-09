# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :mortgage_project
  belongs_to :mortgagor, optional: true
end
