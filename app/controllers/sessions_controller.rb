class SessionsController < Devise::SessionsController
  respond_to :json
  def create
    super { |resource| @resource = resource }
  end

  private

  def respond_with(resource, _opts = {})
    render_jsonapi_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end

end
