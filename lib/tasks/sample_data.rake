namespace :db do

	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_microposts
	end
end 

def make_users
	User.create!(name: "Example User", 
		email: "example@railstutorial.jp",
		password: "foobar",
		password_confirmation: "foobar",
		admin: true)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.jp"
		password = "password"
		User.create!(name: name, email: email, password: password, 
			password_confirmation: password)
		users = User.all(limit:6)
		50.times do
			c = ["food", "health", "education"]
			i = rand(3)
			users.each { |user| user.microposts.create!(
				title: Faker::Commerce.product_name,
				key: Faker::Code.isbn,
				category: c[i],
				whole_price: Faker::Commerce.price,
				shipping_cost: Faker::Commerce.price,
				short_desc: Faker::Lorem.sentence(1),
				desc: Faker::Lorem.paragraph,
				rep_short_desc: Faker::Lorem.sentence(1),
				rep_desc: Faker::Lorem.paragraph
				) }
		end
	end
end

def make_microposts
	users = User.all(limit:6)
	50.times do
		content = Faker::Lorem.sentence(5)
		users.each { |user| user.microposts.create!(content: content) }
	end	
end

