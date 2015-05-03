namespace :db do

	desc "Fill database with sample data"
	task populate: :environment do
		make_users
	end

	# adminだけ生成
	task seed: :environment do
		make_users2
	end
end 

def make_users
	categories = ["food", "health", "education"]

	User.create!(name: "administrator", 
		email: "wstn2010@gmail.com",
		password: "zaq12345",
		password_confirmation: "zaq12345",
		rep_id: "R0000",
		introduction: "I'm administrator.",
		admin: true)
	5.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.jp"
		password = "password"
		rep_id = "R#{n+1}"
		introduction = Faker::Lorem.sentence(1)
		rep = User.create!(name: name, email: email, password: password, 
			password_confirmation: password, rep_id: rep_id, introduction: introduction)

		#repは３人のmakerを持っている
		3.times do
			maker = Faker::Name.name

			#makerは最大４つの商材を持っている	
			(rand(4) + 1).times do |m|
				title = Faker::Commerce.product_name
				pic = Faker::Avatar.image(title, "250x200")
				rep.microposts.create!(
					title: title,
					category: categories.sample,
					short_desc: Faker::Lorem.paragraph,
					desc: Faker::Lorem.paragraph(4),
					rep_short_desc: Faker::Lorem.paragraph,
					rep_desc: Faker::Lorem.paragraph(4),
					goods_seq: m,
					maker: maker,
					pic_url: pic
				)
			end
		end

	end
end

def make_users2
	categories = ["food", "health", "education"]

	rep = User.create!(name: "administrator", 
		email: "wstn2010@gmail.com",
		password: "zaq12345",
		password_confirmation: "zaq12345",
		rep_id: "R0000",
		introduction: "I'm administrator.",
		admin: true)

		maker = Faker::Name.name

		title = Faker::Commerce.product_name
		pic = Faker::Avatar.image(title, "250x200")
		rep.microposts.create!(
			title: title,
			category: categories.sample,
			short_desc: Faker::Lorem.paragraph,
			desc: Faker::Lorem.paragraph(4),
			rep_short_desc: Faker::Lorem.paragraph,
			rep_desc: Faker::Lorem.paragraph(4),
			goods_seq: 0,
			maker: maker,
			pic_url: pic
		)
end
