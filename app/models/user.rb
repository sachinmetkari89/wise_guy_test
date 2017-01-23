class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true, presence: true 
  
  before_create :confirmation_token
  after_create :send_confirmation_email_to_user


 def active_for_authentication?
  unless  self.is_admin? 
   if self.email_confirmed? 
      super
   else
      return false   
   end
  else
    super
  end
  
 end

private 
  
  def confirmation_token
    if self.confirm_token.blank?
    	self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def send_confirmation_email_to_user
   	UserMailer.registration_confirmation(self).deliver
  end

end
