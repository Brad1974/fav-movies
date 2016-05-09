class User < ActiveRecord::Base
  # has_secure_password
  has_many :movies

    has_secure_password
end
