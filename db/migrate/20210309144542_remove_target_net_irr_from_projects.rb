class RemoveTargetNetIrrFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :target_net_irr, :float
  end
end
