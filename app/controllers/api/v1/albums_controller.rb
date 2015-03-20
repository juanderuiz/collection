module Api
  module V1
    class AlbumsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      before_action :get_band, except: [:allalbums]

      def default_serializer_options
        {root: false}
      end

      def index
      	albums = @band.albums
        respond_to do |format|
          format.json { render json: albums, status: 200 }
          format.xml { render xml: albums, status: 200 }
        end
      end

      def show
      end

      def allalbums
        albums = Album.all
        render json: albums, status: 200
      end

      def create
        album = @band.albums.new(album_params)
        if album.save
          @band.increaseTotal
          render json: album, status: 201, location: url_for([@band, album])
        else
          render json: album.errors, status: 422
        end
      end

      def destroy
        album = @band.albums.find(params[:id])
        album.destroy!
        @band.decreaseTotal
        render nothing: true, status: 204
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def get_band
          @band = Band.find(params[:band_id])
        end

        def album_params
          params.require(:album).permit(:title, :band_id)
        end
    end
  end
end