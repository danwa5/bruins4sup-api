module Api
  module V1
    class TweetersController < ApplicationController
      before_action :tweeter, only: [:show, :destroy]

      def index
        render json: Tweeter.all, status: 200
      end

      def show
        if @tweeter
          render json: @tweeter, status: 200
        else
          render json: {}, status: :not_found
        end
      end

      def create
        t = Tweeter.new(tweeter_params)
        if t.save
          render json: t, status: 201
        else
          render json: tweeter_params, status: :forbidden
        end
      end

      def destroy
        if @tweeter
          @tweeter.destroy
          render json: {}, status: 200
        else
          render json: {}, status: :not_found
        end
      end

      private

      def tweeter
        return nil if params[:id].blank?
        @tweeter ||= Tweeter.where('LOWER(screen_name) LIKE ?', params[:id].downcase).first
      end

      def tweeter_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:tweeter).permit(:uid, :screen_name, :name, :description, :profile_image_url)
      end
    end
  end
end
