class MapsController < ApplicationController
  before_action :signed_in_user

  def index
  end

  def show
  end

  private

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
    
end
