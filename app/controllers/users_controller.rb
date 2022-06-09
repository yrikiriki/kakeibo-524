class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.nickname
    @post = @user.posts.order(id:"DESC")
    @buy = @user.buys
    @badget = @user.badgets
    @record =@user.records
    @month = Date.today.month
    @year = Date.today.year
    @spend = @user.records.group("MONTH(start_time)")
    @spending = @spend.sum(:total_price)[Date.today.month]
    case @month 
    when 1 then
    @income = @badget.find_by(month_id:2)
    unless @income == nil
    @incomes = @income.income
    end
  when 2 then
    @income = @badget.find_by(month_id:3)
    unless @income == nil
    @incomes = @income.income
    end
  when 3 then
    @income = @badget.find_by(month_id:4)
    unless @income == nil
    @incomes = @income.income
    end
  when 4 then
    @income = @badget.find_by(month_id:5)
    unless @income == nil
    @incomes = @income.income
    end
  when 5 then
    @income = @badget.find_by(month_id:6)
    unless @income == nil
    @incomes = @income.income
    end
  when 6 then
    @income = @badget.find_by(month_id:7)
    unless @income == nil
    @incomes = @income.income
    end
  when 7 then
    @income = @badget.find_by(month_id:8)
    unless @income == nil
    @incomes = @income.income
    end
  when 8 then
    @income = @badget.find_by(month_id:9)
    unless @income == nil
    @incomes = @income.income
    end
  when 9 then
    @income = @badget.find_by(month_id:10)
    unless @income == nil
    @incomes = @income.income
    end
  when 10 then
    @income = @badget.find_by(month_id:11)
    unless @income == nil
    @incomes = @income.income
    end
  when 11 then
    @income = @badget.find_by(month_id:12)
    unless @income == nil
    @incomes = @income.income
    end
  when 12 then
    @income = @badget.find_by(month_id:13)
    unless @income == nil
    @incomes = @income.income
    end
    end
    if @incomes != nil
    @balance = @incomes - @spending
    else
      @balance = "-#@spending"
    end
  end
end
