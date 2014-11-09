class Mailer < ActionMailer::Base
  def feedback(name,email,text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "nameless73@mail.ru", subject: "Обратная связь")
  end
end
