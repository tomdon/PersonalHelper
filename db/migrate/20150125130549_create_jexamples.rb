class CreateJexamples < ActiveRecord::Migration
  def change
    create_table :jexamples do |t|
      t.string :session
      t.string :source

      t.timestamps null: false
    end
  end
end
