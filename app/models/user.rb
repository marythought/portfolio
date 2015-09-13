class User < ActiveRecord::Base
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def editor?
    role == "editor"
  end

  def author?
    role == "author"
  end
end
