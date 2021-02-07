class UsersController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    @section = Section.all
    @position = Position.all
    
  end
  
  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, success: '登録完了！'
    else
      # binding.pry
      flash.now[:danger] = "登録失敗！"
      @users = User.all
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:code, :section_id, :position_id, :name, :password, :password_confirmation)
  end
  
  def show
  end
  
  def destroy
  #   user = User.find_by(admin_id: current_admin.id, user_id: params[:user_id])  # 登録者はadmin!
  #   user.destroy
  #   flash[:succes]="ユーザーを削除しました"
  #   redirect_to new_user_path
  end
  
  def edit
  end
  
end