class User < ApplicationRecord
  has_secure_password

  has_many :messages

  validates :name, presence: true, uniqueness: true, length: { maximum: 140 }

  validate do
    unless name =~ /\A#{EmojiRegex::RGIEmoji}+\z/
      errors.add(:name, "must be only made out of emojis")
    end
  end
end
