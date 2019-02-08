class Api::UsersController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_game, only: :show

  # api :GET, 'http://localhost:3000/api/users/:id'
  def show
    render json: @user, serializer: Api::Users::ShowSerializer
  end

  # api :POST, 'http://localhost:3000/api/users/search?radius=5&&lat=55.75&&lng=37.6167'
  def search
    friends = FindFriendsService.new(user_params).call
    if friends.present?
      render json: friends, status: 201, each_serializer: Api::Users::SearchSerializer
    else
      render json: { errors: friends }, status: 422
    end
  end

  private

  def user_params
    params.permit(:radius, :lat, :lng)
  end

  def set_game
    @user = User.find params[:id]
  end
end
