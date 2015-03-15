class StaticPagesController < ApplicationController

  def home
    @primary_goods = Micropost.where('goods_seq=0')

  end

  def primary
    @goods = Micropost.find_by(id: params[:goods])
    @sub_goods = Micropost.where('goods_seq > 0 and goods_seq <> ? and maker=?', @goods.goods_seq, @goods.maker)
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
