class CreateFapiaos < ActiveRecord::Migration
  def change
    create_table :fapiaos do |t|
      t.string :fcode

      t.timestamps null: false
    end
  end
end
