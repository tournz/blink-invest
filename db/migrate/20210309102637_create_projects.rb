class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.float :amount
      t.boolean :funded
      t.integer :surface
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :crop
      t.text :description
      t.date :start_date
      t.date :maturity_date
      t.float :target_net_irr
      t.float :net_equity_multiple
      t.float :ltv_ratio

      t.timestamps
    end
  end
end
