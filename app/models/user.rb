class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  after_initialize :set_role_to_standard

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]

  def standard!
    super
    wikis.update_all(private: false)
  end

  private

  def set_role_to_standard
    self.role ||= :standard
  end
end
