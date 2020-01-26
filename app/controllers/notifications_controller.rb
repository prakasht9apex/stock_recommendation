class  NotificationsController < ApplicationController
  before_action :set_user, only: [ :mark_all_read ]

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def show
    notification = Notification.find(params[:id])
    notification.mark_as_read
    redirect_to notification.link
  end

  def mark_all_read
    @user.notifications.update_all(has_read: true)
    flash[:success] = 'All notifications marked as read'
    redirect_to user_notifications_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end