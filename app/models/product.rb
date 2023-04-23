class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user, optional: true
  
    validates :title, :brand, :price, :model, presence: true
    validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
    validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
    validates :price, length: { maximum: 7 }
  
    BRAND = %w(Apple Samsung Huawei Xiaomi Oppo Sony LG Motorola Nokia Asus Google HTC Lenovo ZTE Alcatel Blackberry Meizu Vodafone)
    CONDITION = %w(New Excellent Used Poor)
  end
  