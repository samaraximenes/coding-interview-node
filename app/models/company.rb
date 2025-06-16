class Company < ApplicationRecord
  has_many :users, dependent: :destroy, inverse_of: :company
end
