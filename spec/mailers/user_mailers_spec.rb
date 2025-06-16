require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#create_user' do
    let(:user) { create(:user) }
    let(:mail) { described_class.create_user(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq('Cadastro efetuado com sucesso!')
    end

    it 'sends to the correct recipient' do
      expect(mail.to).to eq([user.email])
    end

    it 'has the correct sender' do
      expect(mail.from).to eq(['teste@gmail.com'])
    end
  end
end
