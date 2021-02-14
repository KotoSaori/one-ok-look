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
      @positions = Position.all
      render :new
    end
  end
  
  def update
    # <--name属性で条件分岐-->
    if params[:update]
        update_position = Position.find( params[:id] )
        # binding.pry
        if update_position.update_attributes( :position => params[:position][:name] )
          # binding.pry
          redirect_to new_position_path, success: '更新完了！'
        else
        # binding.pry
          flash.now[:danger] = "更新失敗！"
          @positions = Position.all
          @position = Position.new
          render :new
        end
    elsif params[:delete]
        destroy_position = Position.find( params[:id] )
        destroy_position.destroy
        flash[:succes]="部署１つを削除しました"
        redirect_to new_position_path
    end
    # <--name属性で条件分岐ここまで-->
  end
  
  private
  def position_params
    params.require(:position).permit(:name)
  end

end
