class AddMetaToService < ActiveRecord::Migration
  def change
    add_column :services, :external, :boolean
    add_column :services, :technical, :boolean
  end
end
