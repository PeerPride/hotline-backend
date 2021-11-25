# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController # :nodoc:
  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?

    render_jsonapi_response(resource)
  end
end
