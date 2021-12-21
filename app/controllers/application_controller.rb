# frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def json_request?
    request.format.json?
  end
end
