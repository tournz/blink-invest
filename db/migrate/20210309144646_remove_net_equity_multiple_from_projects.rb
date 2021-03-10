class RemoveNetEquityMultipleFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :net_equity_multiple, :float
  end
end
