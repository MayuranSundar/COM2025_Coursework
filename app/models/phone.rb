class Phone < ApplicationRecord
    # Defining the relationship between phones and line items & orders
    # A phone can be part of many line items
    # A phone can be part of many orders
    has_many :line_items
    has_many :orders, through: :line_items
    # A phone is not destroyed if it is part of a line item
    before_destroy :ensure_not_referenced_by_any_line_item

    # Validates all the attributes to be present when making the phone
    validates :brand, :model, :size, :colour, :specifications, :price, :image_url, presence: true
    # Validates the brand name to be maximum of 15 characters, error message is show if it is too long
    validates :brand, length: { maximum: 15, too_long: "Maximum allowed characters is %{count}" }
    # Validates the model name to be maximum of 250 characters, error message is show if it is too long
    validates :model, length: { maximum: 250, too_long: "Maximum allowed characters is %{count}" }
    # Validates the colour to be maximum of 50 characters, error message is show if it is too long
    validates :colour, length: { maximum: 50, too_long: "Maximum allowed characters is %{count}" }
    # Validates the pice to be a number and greater than or equal to 1 pence. Also maximum length is 9
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }, length: { maximum: 9}
    # Validates the image url. Allows the url to be blank so a product can be without an image.
    # Validates the format of the image to have gif or jpg or png.
    validates :image_url , allow_blank: true , format: { with: %r{\.(gif|jpg|png)\Z}i , message: 'must be an image URL for JPG, PNG, or GIF image.'}
    
    # Private method that stops a phone from being deleted, when its part of a line items
    private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
