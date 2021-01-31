class SessionsController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(id: id_params[:id])
    if admin && admin.authenticate(password_params[:password])
      log_in admin
      redirect_to root_path, success: 'ログイン成功！'
    else
      flash.now[:danger] = 'ログイン失敗！'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, info: 'ログアウトしました！'
  end

  private
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  
  def id_params
      params.require(:session).permit(:id)
  end
  
  def password_params
      params.require(:session).permit(:password)
  end
  
  
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
  
end



