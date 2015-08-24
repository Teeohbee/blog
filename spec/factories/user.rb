FactoryGirl.define do
  factory :user do
    email "juan@test.com"
    username "juantest"
    name "Juan Smith"
    password "12345"
    passwordconfirm "12345"
    phone "0208123456"
  end
end
