class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :message, validate: true
  attribute :nickname, captcha: true

  def headers
    { to: "fomaxxi@gmail.com",
      subject: "Railscoder Contact Form",
      from: "admin@fomaxxie.com",
      reply_to: %("#{name}" <#{email}>) }
  end
end
