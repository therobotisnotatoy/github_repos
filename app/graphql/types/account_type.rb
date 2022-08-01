
module Types
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :nick_name, String
    field :user_name, String
    field :repos, [Types::RepoType]
    field :repos_count, Integer, null: true  
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def repos_count
      object.repos.size
    end
  end
end
