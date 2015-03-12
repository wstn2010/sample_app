class StaticPagesController < ApplicationController

  def home
    @primary_goods = Micropost.where('goods_seq=?', 0)

  end

  def primary
    @foo = "foo"
    @todays_remaked1 = goods_remarkable_pickups
  end

  def help
  	@word = "my help"
  end

  def about
  end

  def contact
  end

  private

    def goods_remarkable_pickups
      Micropost.offset(rand(Micropost.count)).first 
    end
  
end
