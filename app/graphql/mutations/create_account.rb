class Mutations::CreateAccount < Mutations::BaseMutation
    argument :nick_name, String, required: true
    argument :user_name, String, required: true

    field :account, Types::AccountType, null: false
    field :errors, [String], null: false

    def resolve(nick_name:, user_name:)
        account = Account.new(nick_name: nick_name, user_name: user_name)
        if (account.save)
            {
                account: account,
                errors: []
            }
        else
            {
                account: nil,
                errors: account.errors.full_messages
            }
        end
    end
end