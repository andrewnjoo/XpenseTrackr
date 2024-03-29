require_relative "../constants/expense_constants"

class ExpensesController < ApplicationController
  include ExpenseConstants
  before_action :authenticate_user!, except: [:index, :show]

  def index
    start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today.at_beginning_of_month
    end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : Date.today.at_end_of_month
    
    if user_signed_in?
      @expenses = current_user.expenses.where(datetime: start_date..end_date).order(datetime: :desc, created_at: :desc)
    else
      @expenses = Expense.none
    end
  end

  def new
    @expense = current_user.expenses.new(session.delete(:expense_form_data) || {})
  end

  def create
    @expense = current_user.expenses.new(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: "Expense was successfully created."
    else
      # puts @expense.errors.full_messages
      flash[:error] = @expense.errors.full_messages.join(", ")

      # render :new
      session[:expense_form_data] = expense_params
      redirect_to new_expense_path
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "Expense was successfully updated."
    else
      flash[:error] = @expense.errors.full_messages.join(", ")

      session[:expense_form_data] = expense_params
      redirect_to edit_expense_path(@expense)
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path, notice: "Expense was successfully deleted."
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :datetime, :description, :category, :user_id)
  end
end
