class Notification < ApplicationRecord

  belongs_to :user
  scope :unread, -> { where(has_read: false)}
  scope :read, -> { where(has_read: true)}

  after_create_commit { NotificationChannel.broadcast_to( user , self) }
  def mark_as_read
    update(has_read: true)
  end
end