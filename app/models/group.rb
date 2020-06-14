class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :name, presence: true, uniqueness: true

  def show_lasted_message
    if (lasted_message = messages.last).present?
      if lasted_message.content?
        lasted_message.content
      else
        "画像が投稿されています。"
      end
    else
        "まだメッセージはありません。"
    end
    
  end
end
