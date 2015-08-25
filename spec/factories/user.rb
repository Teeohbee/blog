FactoryGirl.define do
  factory :user do
    email "juan@test.com"
    username "juantest"
    name "Juan Smith"
    password "12345"
    password_confirmation "12345"
    phone "0208123456"
  end
end
