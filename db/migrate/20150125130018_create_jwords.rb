class CreateJwords < ActiveRecord::Migration
  def change
    create_table :jwords do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
