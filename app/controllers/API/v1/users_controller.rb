# frozen_string_literal: true

module API
  module V1
    class UsersController < API::BaseController # :nodoc:
      def index
        render json: UserPolicy::Scope.new(current_user, User.all).resolve
      end

      def show
        user = User.find(params[:id])

        if UserPolicy.new(current_user, user).show?
          render_jsonapi_response(User.find(params[:id]))
        else
          render json: 'no'
        end
      end

      def update
        user = User.find(params[:id])

        if UserPolicy.new(current_user, user).show?
          render_jsonapi_response(User.find(params[:id]))
        else
          render json: 'no'
        end
      end

      def oncall
        # if params[:language_id].present?
        #   render_json_api_response(OnCallManager.on_call_for(Language.find(params[:language_id])))
        # else
        #   render_json_api_response(OnCallManager.on_call_for_language)
        # end
      end
    end
  end
end
