namespace :db do

	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		#make_microposts
	end
end 

def make_users
	User.create!(name: "Example User", 
		email: "example@railstutorial.jp",
		password: "foobar",
		password_confirmation: "foobar",
		rep_id: "R0000",
		introduction: "I'm administrator.",
		admin: true)
	10.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.jp"
		password = "password"
		rep_id = "R#{n+1}"
		introduction = Faker::Lorem.sentence(1)
		User.create!(name: name, email: email, password: password, 
			password_confirmation: password, rep_id: rep_id, introduction: introduction)

		users = User.all.limit(6)
		10.times do
			c = ["food", "health", "education"]
			users.each { |user| user.microposts.create!(
				title: Faker::Commerce.product_name,
				key: Faker::Code.isbn,
				category: c.sample,
				whole_price: Faker::Commerce.price,
				shipping_cost: Faker::Commerce.price,
				short_desc: Faker::Lorem.paragraph,
				desc: Faker::Lorem.paragraph(4),
				rep_short_desc: Faker::Lorem.paragraph,
				rep_desc: Faker::Lorem.paragraph(4)
				) }
		end
	end
end

# def make_microposts
# 	users = User.all(limit:6)
# 	10.times do
# 		users.each { |user| user.microposts.create!(
# 				title: Faker::Commerce.product_name,
# 				key: Faker::Code.isbn,
# 				category: c.sample,
# 				whole_price: Faker::Commerce.price,
# 				shipping_cost: Faker::Commerce.price,
# 				short_desc: Faker::Lorem.sentence(1),
# 				desc: Faker::Lorem.paragraph,
# 				rep_short_desc: Faker::Lorem.sentence(1),
# 				rep_desc: Faker::Lorem.paragraph
# 			) }
# 	end	
# end

