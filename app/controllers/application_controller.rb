class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  include Pagy::Backend

  after_action :user_actitvity

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def user_actitvity
    current_user.try :touch
  end
end
