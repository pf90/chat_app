class Chatroom < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :chatroom_users, dependent: :destroy
  has_many :users , through: :chatroom_users
  has_many :messages

  # == Validations ==========================================================

  # == Scopes ===============================================================
  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================
  def self.direct_message_for_users(users)
    user_ids = users.map(&:id).sort
    name = "DM:#{user_ids.join(":")}"

    if chatroom = direct_messages.where(name: name).first
      chatroom
    else
      chatroom = Chatroom.new(name: name, direct_message: true)
      chatroom.users = users
      chatroom.save
      chatroom
    end
  end

  # == Instance Methods =====================================================
end
