class BadgetsController < ApplicationController

  def new
    @badget = Badget.new
  end

  def create
    @badget = Badget.new(badget_params)
    if @badget.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def show 
    @badget = Badget.find(params[:id])
  end

  private
  def badget_params
    params.require(:badget).permit(:month_id,:income).merge(user_id: current_user.id)
  end
  
end
