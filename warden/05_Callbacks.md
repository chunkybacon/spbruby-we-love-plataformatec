!SLIDE small
# Callbacks #

    @@@ruby
    Warden::Manager.after_authentication do |user,auth,options|
     user.touch(:last_login_at)
    end
