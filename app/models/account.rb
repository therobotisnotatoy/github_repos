class Account < ApplicationRecord
    has_many :repos, dependent: :destroy
end
