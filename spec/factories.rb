FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :course do
  	name		"Introduction to Bulgakov"
  	category	"Literature"
  	description	"Introduction to the works of Mikhail Bulgakov, starting with The Master and Margarita"
  end

  factory :provider do
  	name		"Coursera"
  end
end