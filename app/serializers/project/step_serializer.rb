class Project::StepSerializer < ActiveModel::Serializer
  attributes :id, :content, :done
end
