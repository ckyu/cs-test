class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :patient, index: true
      t.text :name
      t.text :physician
      t.datetime :date
      t.text :location

      t.timestamps null: false
    end
    add_foreign_key :reports, :patients
    add_index :reports, [:patient_id, :created_at]
  end
end
