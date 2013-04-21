FactoryGirl.define do
  sequence :first_name do |n|
    'Name #{n}'
  end

  sequence :last_name do |n|
    "Last #{n}"
  end

  sequence :email do |n|
    "user#{n}@domain.com"
  end

  factory :user do
    first_name { Factory.next :first_name }
    last_name  { Factory.next :last_name }
    email      { Factory.next :email }
  end

end
