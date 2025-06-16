class User < ApplicationRecord
after_create :send_create_user

  belongs_to :company, inverse_of: :users
  has_many :tweets, dependent: :destroy, inverse_of: :user

  scope :by_company, -> (identifier) { where(company: identifier) if identifier.present? }
  scope :by_username, -> (username) { where('UPPER(username) LIKE UPPER(?)', "%#{username}%") if username.present? }

  private

  def send_create_user
    UserMailer.create_user(self)
  end
end
