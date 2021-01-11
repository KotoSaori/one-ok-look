class SectionsController < ApplicationController
  def index
  end

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
      render :new
    end
  end
  
  private
  def section_params
    params.require(:section).permit(:name, :email)
  end

  def edit
  end

  def destroy
  end
end
