class UserMailer < ApplicationMailer
  default from: 'teste@gmail.com'

  def create_user(user)
    @user = user
    mail(to: @user.email, subject: 'Cadastro efetuado com sucesso!')
  end
end