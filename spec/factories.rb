FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		sequence(:rep_id) { |n| "R#{n}" }
		introduction "I am sales rep."
		password	"foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end

	factory :micropost do
		content "Lorem ipsum"
		title "Special Goods"
		sequence(:key) { |n| "0123-Goods#{n}"}
		category "Health"
		whole_price 3400
		shipping_cost 500
		short_desc " a special goods"
		desc "best ever super marverous pen"
		rep_short_desc "best item"
		rep_desc "you can earn more money"
		user
	end
end