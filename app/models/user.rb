class User < ApplicationRecord


  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # == Relationships ========================================================
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
