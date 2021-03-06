class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    if !current_user.admin?
      redirect_to root_url
    else
    	@user = User.new
    end
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    if !current_user.admin?
      redirect_to root_url
    else
    	@user = User.new(user_params)
    	if @user.save
      #   sign_in @user
        flash[:success] = "ユーザを追加しました"
    		redirect_to user_url(current_user)
    	else
    		render 'new'
    	end
    end
  end

  def edit
#    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])

      # 登録されない: strong-paramではじかれる
      @user.password = "dummypass"
      @user.password_confirmation = @user.password

      if @user.update_attributes(user_params_ex_passwd)
        flash[:success] = "プロファイルを更新しました"
        redirect_to @user
      else
        render 'edit'
      end
    end


  private

  	def user_params
  		params.require(:user).permit(
        :name, 
        :email, 
        :password, 
        :password_confirmation,
        :rep_id,
        :introduction
        )
  	end

    def user_params_ex_passwd
      params.require(:user).permit(
        :name, 
        :email, 
        :rep_id,
        :introduction
        )
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
