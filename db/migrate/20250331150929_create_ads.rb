class CreateAds < ActiveRecord::Migration[7.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.references :account, null: false, foreign_key: true
      t.integer :view_count, default: 0, null: false

      t.timestamps
    end
  end
end
