FactoryGirl.define do
  factory :project_step, class: 'Project::Step' do
    content "MyText"
    done false
  end
end
