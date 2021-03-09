class CreateCashYields < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_yields do |t|
      t.date :date
      t.float :value
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
