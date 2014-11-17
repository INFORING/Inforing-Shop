class Mailer < ActionMailer::Base
  def feedback(name, email, text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "repair@inforing73.net", subject: "Обратная связь")
  end

  def call(phone)
	 	@phone = phone
	 	mail(to: "call@inforing73.net", subject: "Обратный звонок")
  end

  def order_parts(name, email, phone, model, part_number, image)
    @name = name
    @email = email
    @phone = phone
    @model = model
    @part_number = part_number
    attachments["lol.jpg"] = File.read(image.url)
    mail(to: "call@inforing73.net", subject: "Заказ на запчасть")
  end
end
