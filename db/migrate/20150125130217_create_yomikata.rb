class CreateYomikata < ActiveRecord::Migration
  def change
    create_table :yomikata do |t|
      t.string :hiragana

      t.timestamps null: false
    end
  end
end
