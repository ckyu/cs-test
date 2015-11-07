class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients, {:id => false, :primary_key => :ssn} do |t|
      t.integer :ssn, :limit => 8
      t.string :name
      t.date :date_of_birth
      t.string :gender

      t.timestamps null: false
    end
  end
end
