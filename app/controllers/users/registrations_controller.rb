# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # super and return 
    # p sign_up_params
    # p params[:registration]
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        p "in 1"
        # set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        render json: { 
              user: resource, 
              message: "user create proccess complete"
            }.to_json and return
        # respond_with(resource, message: "user create proccess complete")
      else
        p "in 2"
        # set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        # respond_with(resource, message: "signed_up_but_#{resource.inactive_message}")
        render json: { 
          user: resource, 
          message: "signed_up_but_#{resource.inactive_message}"
        }.to_json and return
      end
    else
      p "in 3"
      p resource
      clean_up_passwords resource
      set_minimum_password_length
      render json: { 
        message: "invalid email or password",
      }.to_json and return
      # respond_with resource
    end
    # super do
    #   p resource
    #   p flash
    #   return resource
    # end
    #   render json: { 
    #     user: current_user, 
    #     # token: form_authenticity_token 
    #   }.to_json and return
    # end
    # render json: {message: "New user created successfully"}
    
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:registration).permit(:email, :password)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
