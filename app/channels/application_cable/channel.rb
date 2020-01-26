module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def unsubscribed
      stop_all_streams
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
