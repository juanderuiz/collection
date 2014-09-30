class BandsController < ApplicationController
  def index
  	bands = Band.all
  	render json: bands, status: 200
  end
end