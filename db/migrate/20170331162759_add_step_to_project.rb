class AddStepToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :project_steps, :project_id, :integer

    add_index :project_steps, :project_id
  end
end
