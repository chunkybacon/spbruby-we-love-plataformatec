!SLIDE
# Callbacks #

    @@@ruby
    Warden::Manager.after_authentication do |user,auth,options|
     user.last_login_at = Time.now
    end
