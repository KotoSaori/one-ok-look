class CompanyHolidaysController < ApplicationController
  def new
    @company_holiday = CompanyHoliday.new
    @company_holidays = CompanyHoliday.all
  end

  def create
     @company_holiday = CompanyHoliday.new(company_holiday_params)
    if @company_holiday.save
      redirect_to new_company_holiday_path, success: '登録完了！'
    else
      # binding pry
      flash.now[:danger] = "登録失敗！"
      @company_holidays = CompanyHoliday.all
      render :new
    end
  end
  
  def update
    # <--name属性で条件分岐-->
    if params[:update]
        update_company_holiday = CompanyHoliday.find( params[:id] )
        # binding.pry
        if update_company_holiday.update_attributes(:holiday => params[:company_holiday][:holiday])
        # binding.pry
          redirect_to new_company_holiday_path, success: '更新完了！'
        else
        # binding.pry
          flash.now[:danger] = "更新失敗！"
          @company_holidays = CompanyHoliday.all
          @company_holiday = CompanyHoliday.new
          render :new
        end
    elsif params[:delete]
        destroy_company_holiday = CompanyHoliday.find( params[:id] )
        destroy_company_holiday.destroy
        flash[:succes]="休業日を削除しました"
        redirect_to new_company_holiday_path
    end
    # <--name属性で条件分岐ここまで-->
  end
  
  
  private
  def company_holiday_params
    params.require(:company_holiday).permit(:holiday)
  end
  
end
