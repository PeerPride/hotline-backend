# frozen_string_literal: true

module API
  module V1
    class TeamsController < API::BaseController # :nodoc:
      def index
        # render json: TeamPolicy::Scope.new(current_user, Team.all).resolve
        render jsonapi: Team.all, include: [:members]
      end

      def show
        team = Team.includes(:members).find(params[:id])

        render jsonapi: team, include: [:members]
      end

      def update
        team = Team.find(params[:id])
        # TODO
        render_jsonapi_response(team)
      end

      def destroy
        team = Team.find(params[:id])

        team.destroy
      end
    end
  end
end
