class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :gender

      t.timestamps
    end
  end
end
