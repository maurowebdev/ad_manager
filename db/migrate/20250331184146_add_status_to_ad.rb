class AddStatusToAd < ActiveRecord::Migration[7.1]
  def change
    add_column :ads, :status, :integer, default: 0
  end
end
