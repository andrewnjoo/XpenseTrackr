class ExpensesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @expenses = user_signed_in? ? current_user.expenses.order(date: :desc) : Expense.none
  end

  def new
    @expense = Expense.new
  end

  def create
    # @expense = Expense.new(expense_params)
    @expense = current_user.expenses.new(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: "Expense was successfully created."
    else
      render :new
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
      redirect_to expenses_path, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path, notice: 'Expense was successfully deleted.'
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :date, :user_id)
  end
end
