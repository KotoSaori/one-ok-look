class SectionsController < ApplicationController
  def new
    @section = Section.new
    @sections = Section.all
  end

  def create
    # binding.pry
    @section = Section.new(section_params)
    if @section.save
      redirect_to new_section_path,  success: '登録完了！'
    else
      flash.now[:danger] = "登録失敗！"
      @sections = Section.all
      render :new
    end
  end
  
  def update
    # <--name属性で条件分岐-->
    if params[:update]
        update_section = Section.find( params[:id] )
        # binding.pry
        if update_section.update_attributes( :name => params[:section][:name], :email => params[:section][:email])
          # binding.pry
          redirect_to new_section_path, success: '更新完了！'
        else
        # binding.pry
          flash.now[:danger] = "更新失敗！"
          @sections = Section.all
          @section = Section.new
          render :new
        end
    elsif params[:delete]
        destroy_section = Section.find( params[:id] )
        destroy_section.destroy
        flash[:succes]="ユーザーを削除しました"
        redirect_to new_user_path
    end
    # <--name属性で条件分岐ここまで-->
  end
  
  
  
  
  private
  def section_params
    params.require(:section).permit(:name, :email)
  end

  
end
