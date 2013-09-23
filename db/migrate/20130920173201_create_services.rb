class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :github
      t.integer :server_id

      t.timestamps
    end
  end
end
