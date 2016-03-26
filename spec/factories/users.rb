FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  factory :user do |u|
    u.email
    u.password 'password'
    u.password_confirmation 'password'
  end

  factory :existing_user, :parent => :user do |e|
    e.email 'existinguser@gmail.com'
    e.sign_in_count 2
  end

end
