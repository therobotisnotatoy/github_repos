# require 'graphql'
#
# class QueryType < GraphQL::Schema::Object
#   field :hello, String
#
#   def hello
#     "Hello world!"
#   end
# end
#
# class Schema < GraphQL::Schema
#   query QueryType
# end
#
# puts Schema.execute('{ hello }').to_json

5.times do
  acct = Account.create(
    nick_name: Faker::Name.name,
    user_name: Facker::Name.name,
    repos: Facker::Name.name
    # ::Lorem.sentence(word_count:3)
  )
end
