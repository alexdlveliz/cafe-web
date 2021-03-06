class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  #Relación con los comentarios.
  #dependent: :destroy hace lo siguiente:
    #Si un usuario que ya comentó borra su cuenta, también se borrarán sus comentarios
  has_many :comments, dependent: :destroy
  has_many :sells
  
  #Métodos para separar el nombre del apellido del usuario
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
