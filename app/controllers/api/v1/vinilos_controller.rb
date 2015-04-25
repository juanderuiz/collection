module Api
  module V1
    class VinilosController < ApplicationController
      skip_before_filter  :verify_authenticity_token

      def default_serializer_options
        {root: false}
      end

      def index
      	vinilos = Album.all.shuffle
        render json: vinilos, status: 200
      end
    end
  end
end