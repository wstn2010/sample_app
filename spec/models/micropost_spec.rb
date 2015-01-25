require 'spec_helper'

describe Micropost do

	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(
		content: "Lorem ipsum",
		title: "goods",
		key: "0123-goods",
		category: "food",
		whole_price: 2400,
		shipping_cost: 500,
		short_desc: "fancy food",
		desc: "fresh meet from US",
		rep_short_desc: "money earning good",
		rep_desc: "you must use this goods"
		) }

	subject { @micropost }

	it { should respond_to(:title) }
	it { should respond_to(:key) }
	it { should respond_to(:category) }
	it { should respond_to(:whole_price) }
	it { should respond_to(:shipping_cost) }
	it { should respond_to(:short_desc) }
	it { should respond_to(:desc) }
	it { should respond_to(:rep_short_desc) }
	it { should respond_to(:rep_desc) }
	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

	describe "when key is not present" do
		before { @micropost.key = nil }
		it { should_not be_valid }
	end

	describe "when category is not present" do
		before { @micropost.category = nil }
		it { should_not be_valid }
	end

	describe "when whole_price is not present" do
		before { @micropost.whole_price = nil }
		it { should_not be_valid }
	end

	describe "when shipping_cost is not present" do
		before { @micropost.shipping_cost = nil }
		it { should_not be_valid }
	end

	describe "when short_desc is not present" do
		before { @micropost.short_desc = nil }
		it { should_not be_valid }
	end

	describe "when desc is not present" do
		before { @micropost.desc = nil }
		it { should_not be_valid }
	end

	describe "when rep_short_desc is not present" do
		before { @micropost.rep_short_desc = nil }
		it { should_not be_valid }
	end

	describe "when rep_desc is not present" do
		before { @micropost.rep_desc = nil }
		it { should_not be_valid }
	end

	describe "when title is not present" do
		before { @micropost.title = nil }
		it { should_not be_valid }
	end


end
