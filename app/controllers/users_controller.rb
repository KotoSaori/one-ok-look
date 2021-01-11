class UsersController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end
  
  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path,  success: '登録完了！'
    else
      flash.now[:danger] = "登録失敗！"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:code, :section_id, :position_id, :name, :password)
  end
  
  
  
end