class User < ActiveRecord::Base
  has_many :articles
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

  def visitor?
    role.nil?
  end
end

class NullUser
  def editor?
    false
  end

  def author?
    false
  end

  def visitor?
    true
  end
end
