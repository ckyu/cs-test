class CreateLabData < ActiveRecord::Migration
  def change
    create_table :lab_data do |t|
      t.references :report, index: true
      t.text :name
      t.string :value
      t.string :unit
      t.string :normal_range

      t.timestamps null: false
    end
    add_foreign_key :lab_data, :reports
  end
end
