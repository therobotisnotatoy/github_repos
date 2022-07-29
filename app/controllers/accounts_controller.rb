class AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Account.create(
      nick_name: params[:account][:nick_name],
      user_name: params[:account][:user_name],
      repos: params[:account][:repos]
    )
  end

end
