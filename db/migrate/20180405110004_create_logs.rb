class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :params
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
