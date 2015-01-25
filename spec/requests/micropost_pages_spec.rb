require 'spec_helper'

describe "MicropostPages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "micropost creation" do
		before  { visit root_path }

		describe "with invalid information" do

			it "should not create a micropost" do
				expect { click_button "Post" }.not_to change(Micropost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before do
				fill_in 'micropost_title', with: "ttt"
				fill_in 'micropost_key', with: "kkk"
				fill_in 'micropost_category', with: "ccc"
				fill_in 'micropost_whole_price', with: 3000
				fill_in 'micropost_shipping_cost', with: 300
				fill_in 'micropost_short_desc', with: "sddddd"
				fill_in 'micropost_desc', with: "ddd"
				fill_in 'micropost_rep_short_desc', with: "repsddd"
				fill_in 'micropost_rep_desc', with: "repddd"
			end

			it "should create a micropost" do
				expect { click_button "Post"}.to change(Micropost, :count).by(1)
			end
		end
	end

	describe "micropost destruction" do
		before { FactoryGirl.create(:micropost, user: user) }

		describe "as correct user" do
			before { visit root_path }

			it "should delete a micropost" do
				expect { click_link "delete" }.to change(Micropost, :count).by(-1)
			end
		end
	end
	

end
