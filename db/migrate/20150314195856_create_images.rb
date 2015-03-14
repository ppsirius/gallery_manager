class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :description
      t.boolean :visible

      t.timestamps
    end
  end
end
