class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :name
      t.string :care

      t.timestamps
    end
  end
end
