class Tweet < ApplicationRecord
  belongs_to :user, inverse_of: :tweets

  scope :by_user_id, -> (user_id) { where(user_id: user_id) if user_id.present? }
end
