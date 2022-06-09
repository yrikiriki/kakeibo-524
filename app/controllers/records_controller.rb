class RecordsController < ApplicationController
  def index
    @event = Record.all
  end
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end
  def show
    @record = Record.find(params[:id])
    @buys = @record.buys
    @buy = Buy.new
  end

  
  private
  def record_params
    params.require(:record).permit(:start_time,:total_price).merge(user_id: current_user.id)
  end
end
