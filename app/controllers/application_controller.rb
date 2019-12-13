class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_up_path(resource)
		flash[:notice] = 'こんにちは！'
		products_patth
	end

	def after_sign_out_path(resource)
		flash[:notice] = 'またね！'
		new_user_session_path
	end


	protected
		def configure_permitted_parameters
		added_attrs = [:name,:email]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
		end
end