module Api
  module V1
    class TweetersController < ApplicationController
      before_action :tweeter, only: [:show]

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

      private

      def tweeter
        return nil if params[:id].blank?
        @tweeter ||= Tweeter.where('LOWER(screen_name) LIKE ?', params[:id].downcase).first
      end
    end
  end
end
