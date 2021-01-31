class CompanyHolidaysController < ApplicationController
  def index
  end
  
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
  
  private
  def company_holiday_params
    params.require(:company_holiday).permit(:holiday)
  end

  def edit
  end

  def destroy
  end
  
end
