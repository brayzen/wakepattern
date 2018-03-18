class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def render_not_found
    redirect_to :not_found
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    return guest_user unless current_user
    if current_and_guest_user?
      add_guest_to_current_user
      delete_guest
    end
    current_user
  end

  def delete_guest
    # reload guest_user to prevent caching problems before destruction
    guest_user(with_retry = false).try(:reload).try(:destroy)
    session[:guest_user_id] = nil
  end

  def current_and_guest_user?
    current_user &&
    session[:guest_user_id] &&
    session[:guest_user_id] != current_user.id
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def add_guest_to_current_user
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  end

  def create_guest_user
    user = User.new(
      first_name: 'guest',
      last_name: 'user',
      email: "guest_#{Time.now.to_i}#{rand(100)}@example.com"
    )
    user.save! validate: false
    session[:guest_user_id] = user.id
    user
  end
end
