class Mailer < ActionMailer::Base
  def feedback(name,email,text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "sylorweb@gmail.com", subject: "Обратная связь")
  end
end
