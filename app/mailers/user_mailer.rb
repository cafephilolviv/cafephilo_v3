class UserMailer < ActionMailer::Base
  def welcome_for_subscriber(email)
    mail(to: email, subject: t("welcome.subsription.email.subject"))
  end
end
