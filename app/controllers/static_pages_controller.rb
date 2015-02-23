class StaticPagesController < ApplicationController

  def home
    if signed_in?
    	@micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else 
      @todays_goods = MicropostsController.todays_goods 'food'
      @todays_remaked1 = MicropostsController.goods_remarkable_pickups
      @todays_remaked2 = MicropostsController.goods_remarkable_pickups
      @todays_remaked3 = MicropostsController.goods_remarkable_pickups
    end
  end

  def help
  	@word = "my help"
  end

  def about
  end

  def contact
  end

  
end
