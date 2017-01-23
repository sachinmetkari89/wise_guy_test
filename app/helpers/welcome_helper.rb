module WelcomeHelper


def check_is_admin
    if current_user.is_admin?
       @is_admin = true   
    else
       @is_admin = false
    end

end

end
