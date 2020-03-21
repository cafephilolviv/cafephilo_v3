class UserMailer < ActionMailer::Base
  def welcome_for_subscriber(email)
    mail(to: email.email, subject: t('email.subscription.welcome.subject')) do |format|
      format.html {
        render locals: { email_to_destroy: email }
      }
    end
  end
end
