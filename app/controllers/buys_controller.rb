class BuysController < ApplicationController

  def index
    @event = Buy.all
  end
  def new
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.save
      redirect_to new_buy_path
    else
      render :new
    end
  end
  def show
    @buy = Buy.find(params[:id])
  end

  def destroy
    @buy = Buy.find(params[:id])
    @buy.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @buy = Buy.find(params[:id])
  end

  def update
    @buy = Buy.find(params[:id])
    if @buy.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  
  private
  def buy_params
    params.require(:buy).permit(:category_id,:item_name,:start_time,:price).merge(user_id: current_user.id)
  end
end