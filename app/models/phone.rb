class Phone < ApplicationRecord
    validates :brand, :model, :size, :colour, :specifications, :price, :image_url, presence: true
    validates :brand, length: { maximum: 15, too_long: "Maximum allowed characters is %{count}" }
    validates :model, length: { maximum: 250, too_long: "Maximum allowed characters is %{count}" }
    validates :colour, length: { maximum: 50, too_long: "Maximum allowed characters is %{count}" }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }, length: { maximum: 9}
    validates :image_url , allow_blank: true , format: { with: %r{\.(gif|jpg|png)\Z}i , message: 'must be a URL for GIF, JPG or PNG image.'}

    BRAND = %w{ Apple Samsung Google OnePlus Sony Huawei Honor Nokia BlackBerry Doro LG Motorola Oppo Xiaomi Other}
    SIZE = %w{ 32GB 64GB 128GB 256GB 512GB 1TB }
end
