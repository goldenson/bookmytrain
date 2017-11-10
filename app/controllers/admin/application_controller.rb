module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    before_action :default_params

    def authenticate_admin
      redirect_to root_path, alert: 'Not authorized.' unless user_signed_in? && current_user.admin?
    end

    def default_params
      params[:order] ||= "created_at"
      params[:direction] ||= "desc"
    end
  end
end
