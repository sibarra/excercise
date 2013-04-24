FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@store.com"
  end

  sequence :first_name do |n|
    "User#{n}"
  end

  sequence :last_name do |n|
    "LastName#{n}"
  end

  factory :user do
    first_name
    last_name
    email
    password 'Password123'
  end

  sequence :code do |n|
    n
  end

  sequence :name do |n|
    'Product #{n}'
  end


  factory :product do
    code
    name
    description 'Amazing super product'
    notes       'Notes be here'
    price       '2.50'
  end
end
