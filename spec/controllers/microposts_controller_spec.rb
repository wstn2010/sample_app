require 'spec_helper'

describe MicropostsController do
	
	describe "category goods" do
    	let(:user) { FactoryGirl.create(:user) }
    	before do
    		FactoryGirl.create(:micropost, user: user, title:"Goods1", category:"helth")
    		FactoryGirl.create(:micropost, user: user, title:"Goods2", category:"food")

    		@category = "food"
    		@goods = MicropostsController.todays_goods @category
    	end

    	it "todays category extracted goods is not nil" do
    		expect(@goods).not_to be_nil
		end        

    	it "the category of extracted goods is specified one" do
    		expect(@goods.category).to eq "food"
		end        
    end

end