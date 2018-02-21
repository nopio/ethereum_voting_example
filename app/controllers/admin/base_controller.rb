class Admin::BaseController < ApplicationController
  def authenticate_admin
    redirect_to :root unless current_user.try(:admin)
  end
end
