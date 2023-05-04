class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  has_and_belongs_to_many :product_tags

  mount_uploader :image, ImageUploader

    validates :title, :price, presence: true
    validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
    validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
    validates :price, length: { maximum: 7 }
  
<<<<<<< HEAD
   
=======
    BRAND = %w(Shirt T-Shirt Jeans Shorts Pants Hat Shoes Accessories Other)
    CONDITION = %w(New Excellent Used Poor)

>>>>>>> 16493a57203073a68abcefdb9222878c9e1aa940
    private

    def not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Line items present")
        throw :abort
      end
    end

  end
  