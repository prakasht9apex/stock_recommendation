class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many :comments, dependent: :destroy

  after_commit :send_notification

  def send_notification
    User.all.reject{ |usr| usr.id == user_id }.each do |user|
      Notification.create(
        content: "New post form #{user.full_name}",
        link: "#{post_path(id)}",
        user_id: user.id
      )
    end
  end
end
