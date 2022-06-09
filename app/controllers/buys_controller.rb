class BuysController < ApplicationController

  def index
    @event = Buy.all
  end
  def new
    @record = Record.find(params[:record_id])
    @buy = Buy.new
  end

  def create
    @record = Record.find(params[:record_id])
    @buy = Buy.new(buy_params)
    if @buy.save
      add_data
      redirect_to record_path(@record)
    else
      redirect_to record_path(@record)
    end
  end
  def show
    @buy = Buy.find(params[:id])
  end

  def destroy
    buy = Buy.find(params[:record_id])
    delete_data
    redirect_to record_path, notice:"削除しました"
  end

  def edit
    @buy = Buy.find(params[:id])
  end

  def update
    @buy = Buy.find(params[:id])
    if @buy.update(blog_parameter)
      redirect_to buys_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  
  private
  def buy_params
    params.require(:buy).permit(:category_id,:item_name,:price).merge(user_id: current_user.id,record_id: params[:record_id])
  end
  def params_record_id
    @item = Record.find(params[:record_id])
  end
  def add_data
    record = Record.find(params[:record_id])
    record.total_price += @buy.price
    record.save
  end
  def delete_data
    buy = Buy.find(params[:record_id])
    record = Record.find(params[:id])
    record.total_price -= buy.price
    record.save
    buy.destroy
  end
end