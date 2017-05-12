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

  def tutor_status_email tutor
    @tutor = tutor
    followed_users = TutorUser.where(tutor_id: tutor.id)
    get_target_email_user
    mail(to: @target_email, subject:"TUTOR: Información sobre sus alumnos", template_path:'user_mailer', template_name: 'tutor_status_email')
  end

  def rejection_email user
    @user = user
    @documents = Documents.reject_and_unsubmitted.where(user_id: user.id)
    get_target_email_user
    mail(to: @target_email, subject:"Hubo un problema con tu inscripción", template_path:'user_mailer', template_name: 'rejection_email')
  end

  def submission_reminder_email user
    @user = user
    @event_subscriptions = user.event_subscriptions.where(approved: false)
    get_target_email_user
    attachments['reporte.csv'] = user.to_csv
    mail(to: @target_email, subject:"Recuerda terminar tu proceso de inscripción!",template_path:'user_mailer', template_name: 'submission_reminder_email')
  end

end
