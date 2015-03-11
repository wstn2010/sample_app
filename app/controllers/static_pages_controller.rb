class StaticPagesController < ApplicationController

  def home
    @todays_remaked1 = goods_remarkable_pickups
    @todays_remaked2 = goods_remarkable_pickups
    @todays_remaked3 = goods_remarkable_pickups

    @primary_goods = Micropost.where('goods_seq=?', 0)

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
