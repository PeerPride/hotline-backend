# frozen_string_literal: true

module API
  module V1
    class UsersController < API::BaseController # :nodoc:
      def index
        render json: User.all
      end

      def show
        render_jsonapi_response(User.find(params[:id]))
      end
    end
  end
end
