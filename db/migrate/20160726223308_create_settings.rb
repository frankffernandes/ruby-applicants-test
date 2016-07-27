class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, :unique => true
      t.string :var_type
      t.string :value

      t.timestamps null: false
    end
  end
end
