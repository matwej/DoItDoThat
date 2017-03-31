class Project::Step < ApplicationRecord
  belongs_to :project

  validates :content, :project_id, presence: true
end
