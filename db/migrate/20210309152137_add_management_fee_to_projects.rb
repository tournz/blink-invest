class AddManagementFeeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :management_fee, :float
  end
end
