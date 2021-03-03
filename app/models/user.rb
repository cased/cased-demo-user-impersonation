class User < ApplicationRecord
  validates :email, presence: true

  def to_s
    email
  end
end
