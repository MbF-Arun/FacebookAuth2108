# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    super
  end

  puts "$"*25

  def reset_password_instructions(record, token, opts={})
    super
    puts "!*!"*22
    puts token
    puts "&"*22
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def send_reset_password_instructions
    token = set_reset_password_token
    send_reset_password_instructions_notification(token)

    token
  end

  # protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
