Rails.application.routes.draw do
  post "/accounts", to: "accounts#create"
end
