class AddTransactionFeeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :transaction_fee, :float
  end
end
