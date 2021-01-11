class PositionsController < ApplicationController
  def index
  end
  
  def new
    @position = Position.new
    @positions = Position.all
  end

  def create
     @position = Position.new(position_params)
    if @position.save
      redirect_to new_position_path,  success: '部署名登録完了！'
    else
      flash.now[:danger] = "部署名登録失敗！"
      render :new
    end
  end
  
  private
  def position_params
    params.require(:position).permit(:name)
  end

  def edit
  end

  def destroy
  end
end
