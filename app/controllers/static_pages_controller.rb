class StaticPagesController < ApplicationController
  def home
  	@word = "my home"
  end

  def help
  	@word = "my help"
  end

  def about
  end
end
