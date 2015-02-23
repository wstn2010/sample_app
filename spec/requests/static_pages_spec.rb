require 'spec_helper'

describe "Static Pages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    describe "for annonymous users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, title:"Goods1", category:"helth", short_desc:"It is helthy goods")
        FactoryGirl.create(:micropost, user: user, title:"Goods2", category:"food", short_desc:"It is rare food")
        visit root_path
      end

      it "should render the title of today's goods" do
          expect(page).to have_content("Goods2")
      end

      it "should render the desc of today's goods" do
          expect(page).to have_content("It is rare food")
      end

    end
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Rep Portal' }
    let(:page_title) { ''}

    it_should_behave_like "all static pages"
    it { should_not have_title("| Home") }


    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content:"Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content:"Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.title)
        end
      end

      it { expect(user.microposts.count).to eq 2 }

    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end


end
