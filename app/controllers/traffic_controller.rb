class TrafficController < ApplicationController
  before_action :signed_in_user

  def index
    @origin = params[:origin]
    @destination = params[:destination]
    if @origin && @destination
      @travel_info = Traffic.route_details(params[:origin], params[:destination])
    end
  end

  def show
    @travel_info = Traffic.route_details(params[:origin], params[:destination])
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
