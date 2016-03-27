FactoryGirl.define do
  factory :profile do
    first_name "Julie"
    last_name "Kent"
    birthday "1988-07-13"
    gender "Female"
    city "West Des Moines"
    state "Iowa"

    association :user, factory: :user
  end

end
