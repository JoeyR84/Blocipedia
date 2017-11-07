class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  has_many :collaborators
  has_many :collaborated_wikis, through: :collaborators, source: :wiki

  after_initialize :set_role_to_standard

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
  def self.non_collaborators
    where(collaborator: false).order('id DESC')
  end

  def self.collaborator
    where(collaborator: true).order('id DESC')
  end
  
  def standard!
    wikis.update_all(private: false)
    super
  end

  private

  def set_role_to_standard
    self.role ||= :standard
  end
end
