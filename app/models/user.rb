class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  def fullname
    if cjk?(firstname) || cjk?(lastname)
      "#{lastname}#{firstname}"
    else
      "#{firstname} #{lastname}"
    end
  end

  def cjk?(str)
    list_of_chars = str.unpack("U*")
    list_of_chars.each do |char|
      #main blocks
      if char >= 0x4E00 && char <= 0x9FFF
        return true
      end
      #extended block A
      if char >= 0x3400 && char <= 0x4DBF
        return true
      end
      #extended block B
      if char >= 0x20000 && char <= 0x2A6DF
        return true
      end
      #extended block C
      if char >= 0x2A700 && char <= 0x2B73F
        return true
      end
    end
    return false
  end
end
