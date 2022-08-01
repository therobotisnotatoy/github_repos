module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    field :accounts, [Types::AccountType], null: false, description: "all accounts"

    def accounts
      Account.all
    end

    field :account, Types::AccountType, null: false, description: "selected accounts" do
      argument :id, ID, required: true
    end

    def account(id:)
      Account.find(id)
    end

    field :repo, Types::RepoType, null: false do
      argument :id, ID, required: true
    end

    def repo(id:)
      Repo.find(id)
    end

  end
end
