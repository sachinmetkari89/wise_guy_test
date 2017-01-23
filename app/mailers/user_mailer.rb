class UserMailer < ApplicationMailer
 default from: "sampleexample@gmail.com"
 
  def registration_confirmation(user)
   @user = user
   mail from: "from@example.com", to: @user.email, subject: 'Please confirm your registration!'
  end


end
