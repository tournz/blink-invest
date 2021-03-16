class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :risk
      t.string :horizon
      t.integer :income_inv_percentage
      t.integer :annual_income
      t.string :risk_case
      t.integer :age

      t.timestamps
    end
  end
end
