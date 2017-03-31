class CreateProjectSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :project_steps do |t|
      t.text :content
      t.boolean :done

      t.timestamps
    end
  end
end
