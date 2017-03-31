class Project::StepSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :content, :done
end
