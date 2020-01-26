class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
