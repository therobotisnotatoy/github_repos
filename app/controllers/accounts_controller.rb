class AccountsController < ApplicationController

  before_action :set_account, only: [:update, :destroy, :show, :edit]

  def set_account
    @account = Account.find(params[:id])
    @repos = Repo.where("account_id": params[:id])
    print @repos
  end

  def create
    nick_name = params["account"]["nick_name"].downcase
    exist = Account.where("nick_name": nick_name).pluck(:id)
    
    if exist != []
      redirect_to account_path(exist)
    else
      require "github_info"
      github_info = GithubInfo.new(nick_name)
      repos_data = github_info.repos
      
      user_name, repos = repos_data

      if user_name == "Warning"
        redirect_to new_account_path
      else
        account = Account.create(
          nick_name: nick_name,
          user_name:user_name,
          )
        repos.each do |repo_name|
          Repo.create(
            account_id: account[:id],
            repo_name: repo_name
          )
        end
        redirect_to account_path(account)
      end
    end
  end

  def update
    @account.update(
      nick_name: params[:account][:nick_name],
      user_name: params[:account][:user_name],
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
