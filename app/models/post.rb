class Post < ApplicationRecord

    belongs_to :user
    mount_uploader :image, ImageUploader
    mount_uploader :image2, ImageUploader
    mount_uploader :image3, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    geocoded_by :address
    after_validation :geocode

    validates :address, presence: true  
end
