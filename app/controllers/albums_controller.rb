class AlbumsController < ApplicationController
  before_action :get_band

  def index
  	albums = @band.albums
    respond_to do |format|
      format.json { render json: albums, status: 200 }
      format.xml { render xml: albums, status: 200 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_band
      @band = Band.find(params[:band_id])
    end
end