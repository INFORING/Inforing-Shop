class Mailer < ActionMailer::Base
  def feedback(name,email,text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "repair@inforing73.net", subject: "Обратная связь")
  end

  def call(phone)
	 	@phone = phone
	 	mail(to: "call@inforing73.net", subject: "Обратный звонок")
  end
end
