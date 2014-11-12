class Mailer < ActionMailer::Base
  def feedback(name,email,text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "sylorweb@gmail.com", subject: "Обратная связь")
  end

  def call(phone)
 	@phone = phone
 	mail(to: "nameless7345@gmail.com", subject: "Обратный звонок")
  end
end
