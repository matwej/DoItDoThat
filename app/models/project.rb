class Project < ApplicationRecord
  has_many :project_steps, :class_name => 'Project::Step'

  validates :title, presence: true
end
