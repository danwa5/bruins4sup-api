module Api
  module V1
    module Twitter
      class UsersController < ApplicationController
        before_action :screen_name, only: [:show]

        def show
          if screen_name
            begin
              res = current_user.twitter.user(screen_name).attrs
              render json: res, status: 200
            rescue
              render json: {}, status: :not_found
            end
          else
            render json: {}, status: :not_found
          end
        end

        private

        def screen_name
          @screen_name ||= (params[:id] || params[:screen_name])
        end
      end
    end
  end
end
