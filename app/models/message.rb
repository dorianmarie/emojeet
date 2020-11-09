class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }

  validate do
    unless content =~ /\A#{EmojiRegex::RGIEmoji}+\z/
      errors.add(:content, "must be only made out of emojis")
    end
  end
end
