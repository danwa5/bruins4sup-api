module Api
  module V1
    module Twitter
      class TweetsController < ApplicationController
        before_action :tweeter, only: [:index]

        def index
          if @tweeter
            begin
              res = current_user.twitter.user_timeline(@tweeter.screen_name, { count: 20 })
              render json: res, status: 200
            rescue StandardError
              render json: {}, status: :not_found
            end
          else
            render json: {}, status: :not_found
          end
        end

        private

        def tweeter
          @tweeter ||= Tweeter.where(uid: params[:user_id]).first
        end
      end
    end
  end
end
