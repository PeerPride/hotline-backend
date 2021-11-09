class API::V1::UsersController < API::BaseController
  def index
    render json: User.all 
  end

  def show
    render_jsonapi_response(User.find(params[:id]))
  end
end
