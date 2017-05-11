class UserMailer < ApplicationMailer
  default from: 'test.unison@yopmail.com'

  def get_target_email_user
    @target_email = Rails.env.production? ? @user.email : "unison.user@yopmail.com"
  end

  def welcome_email user, password
    @user = user
    @password = password
    get_target_email_user

    mail(to: @target_email, subject:"Plataforma concursos Unison",template_path:'user_mailer', template_name: 'welcome_email')
  end

  def tutor_status_email tutor, event
    @tutor = tutor
    get_target_email_user
    mail(to: @target_email, subject:"TUTOR: Información sobre sus alumnos",template_path:'user_mailer', template_name: 'tutor_status_email')
  end

  def rejection_email user
    @user = user
    get_target_email_user
    mail(to: @target_email, subject:"TUTOR: Información sobre sus alumnos",template_path:'user_mailer', template_name: 'rejection_email')
  end

end
