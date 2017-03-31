FactoryGirl.define do
  factory :project_step, class: 'Project::Step' do
    content "content"
    done false
    project
  end
end
