class TrafficController < ApplicationController
  def index
    logger.debug("TrafficController:index")
    @origin = params[:origin]
    @destination = params[:destination]
    if @origin && @destination
      @travel_info = Traffic.route_details(params[:origin], params[:destination])
    end
  end

  def show
    logger.debug("TrafficController:show")
    @travel_info = Traffic.route_details(params[:origin], params[:destination])
  end
end
