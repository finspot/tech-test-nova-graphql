# frozen_string_literal: true

class CreateStarterSchema < ActiveRecord::Migration[8.1]
  def change
    create_table :mortgage_projects do |t|
      t.string :reference, null: false
      t.string :status, null: false, default: 'in_progress'
      t.string :advisor_name
      t.string :contact_phone
      t.timestamps
    end

    create_table :mortgagors do |t|
      t.references :mortgage_project, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :employment_status
      t.boolean :main, null: false, default: false
      t.timestamps
    end

    create_table :documents do |t|
      t.references :mortgage_project, null: false, foreign_key: true
      t.references :mortgagor, foreign_key: true
      t.string :kind, null: false
      t.string :status, null: false, default: 'pending'
      t.string :file_url
      t.string :rejection_reason
      t.text :internal_note
      t.timestamps
    end
  end
end
