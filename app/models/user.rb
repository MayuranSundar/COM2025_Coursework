class User < ApplicationRecord
  # Validates the name and ensures it is uinque and has a secured password
  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  # Private method to stop the last user isn't deleted
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end    
end
