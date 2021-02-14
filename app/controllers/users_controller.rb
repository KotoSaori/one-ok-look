class UsersController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    @sections = Section.all
    @positions = Position.all
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
  
  
  def show
  end
  
  
  # def destroy
  #   # binding.pry
  #   user = User.find_by(id: params[:id])
  #   user.destroy
  #   flash[:succes]="ユーザーを削除しました"
  #   redirect_to new_user_path
  # end
  

    # def update
    #   # binding.pry
    #   @user = User.find(id: params[:id])
    #   if @user.update(user_params2)
    #     redirect_to new_user_path, success: '更新完了！'
    #   else
    #   # binding.pry
    #     flash.now[:danger] = "更新失敗！"
    #     @users = User.all
    #     render :new
    #   end  
    # end
  
  def update
    # <--name属性で条件分岐-->
    if params[:update]
        update_user = User.find( params[:id] )
        # binding.pry
        if update_user.update_attributes( :code => params[:user][:code], :section_id => params[:user][:section_id], :position_id => params[:user][:position_id], :name => params[:user][:name])
          # binding.pry
          redirect_to new_user_path, success: '更新完了！'
        else
        # binding.pry
          flash.now[:danger] = "更新失敗！"
          @users = User.all
          @user = User.new
          render :new
        end
    elsif params[:delete]
        destroy_user = User.find( params[:id] )
        destroy_user.destroy
        flash[:succes]="ユーザーを削除しました"
        redirect_to new_user_path
    end
    # <--name属性で条件分岐ここまで-->
  end
  
  
  private
  def user_params
    params.require(:user).permit(:code, :section_id, :position_id, :name, :password)
  end
  
  
  # def user_params2
  #   params.require(:user).permit(:code, :section_id, :position_id, :name)
  # end
  
end