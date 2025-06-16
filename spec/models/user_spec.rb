require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:company).inverse_of(:users) }
  it { should have_many(:tweets).dependent(:destroy).inverse_of(:user) }
end