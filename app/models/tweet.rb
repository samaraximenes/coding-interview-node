class Tweet < ApplicationRecord

  scope :by_user_id, -> (user_id) { where(user_id: user_id) if user_id.present? }
end
