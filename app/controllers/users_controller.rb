class UsersController < ApplicationController
  before_action :authenticate_user!, except: :fuzzysearch

  def fuzzysearch
    @users = User.find_by_fuzzy_name(params[:name], limit: 10).map{ |u| u.name }
    render json: @users.as_json
  end

  def dashboard
    context = params[:context] || 'default'
    @context = current_user.contexts.find_by(handle: context)
    @contexts = current_user.contexts
    @questions = current_user.questions
    @trait_averages = current_user.received_trait_averages.sort_by{ |td| td[:name] }
  end
end
