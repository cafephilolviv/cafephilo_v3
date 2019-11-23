class UserMailer < ActionMailer::Base
  default from: "info@cafephilo.lviv.ua"

  def welcome_for_subscriber(email)
    mail(to: email, subject: t("welcome.subsription.email.subject"))
  end
end
