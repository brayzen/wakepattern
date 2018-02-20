class UsersController < ApplicationController
  def fuzzysearch
    @users = User.find_by_fuzzy_name(params[:name], limit: 10).map{ |u| u.name }
    render json: @users.as_json
  end
end
