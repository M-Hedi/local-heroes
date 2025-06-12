class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path# ou new_user_session_path pour la page de connexion
  # end
end
