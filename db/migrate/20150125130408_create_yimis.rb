class CreateYimis < ActiveRecord::Migration
  def change
    create_table :yimis do |t|
      t.string :jmeaning

      t.timestamps null: false
    end
  end
end
