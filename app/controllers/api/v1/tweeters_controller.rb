module Api
  module V1
    class TweetersController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      before_action :find_tweeter_by_screen_name, only: [:show]
      before_action :find_tweeter_by_id, only: [:destroy]

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
        @tweeter.destroy if @tweeter
      end

      private

      def find_tweeter_by_screen_name
        return nil if params[:id].blank?
        @tweeter ||= Tweeter.where('LOWER(screen_name) LIKE ?', params[:id].downcase).first
      end

      def find_tweeter_by_id
        return nil if params[:id].blank?
        @tweeter ||= Tweeter.find(params[:id])
      end

      def tweeter_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:tweeter).permit(:uid, :screen_name, :name, :description, :profile_image_url)
      end

      def not_found
        render json: {}, status: :not_found
      end
    end
  end
end
