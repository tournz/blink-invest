class CreateInvestmentHighlights < ActiveRecord::Migration[6.0]
  def change
    create_table :investment_highlights do |t|
      t.string :title
      t.text :content
      t.references :project

      t.timestamps
    end
  end
end
