class StaticPagesController < ApplicationController

  def home
    @todays_goods = MicropostsController.todays_goods 'food'
    @todays_remaked1 = MicropostsController.goods_remarkable_pickups
    @todays_remaked2 = MicropostsController.goods_remarkable_pickups
    @todays_remaked3 = MicropostsController.goods_remarkable_pickups
  end


  def help
  	@word = "my help"
  end

  def about
  end

  def contact
  end

  
end
