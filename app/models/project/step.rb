class Project::Step < ApplicationRecord
  validates :content, presence: true
end
