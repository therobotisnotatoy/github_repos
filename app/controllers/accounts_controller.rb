class AccountsController < ApplicationController

  before_action :set_account, only: [:update, :destroy, :show, :edit]

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:nick_name, :user_name, :repos)
  end

  def create
    account = Account.create(account_params)
    redirect_to account_path(account)
  end

  def update
    @account.update(
      nick_name: params[:account][:nick_name],
      user_name: params[:account][:user_name],
      repos: params[:account][:repos]
    )
    redirect_to account_path(@account)
  end

  def destroy
    @account.destroy
    redirect_to account_path(accounts_path)
  end

  def show
  end

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit
  end

end
