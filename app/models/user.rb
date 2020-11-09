class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true

  validate do
    unless name =~ /\A#{EmojiRegex::RGIEmoji}+\z/
      errors.add(:name, "must be only made out of emojis")
    end
  end
end