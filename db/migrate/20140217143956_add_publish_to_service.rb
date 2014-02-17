class AddPublishToService < ActiveRecord::Migration
  def change
    add_column :services, :publish, :boolean
  end
end
