!SLIDE smaller
# Callbacks #

    @@@ruby
    Warden::Manager.after_authentication do |user,auth,options|
      user.touch(:last_login_at)
    end

!SLIDE smaller
# Callbacks #

    @@@ruby
    Warden::Manager.after_set_user do |user,auth,options|

      scope = options[:scope]

      if auth.authenticated?(scope)

        last_request_at = auth.session(scope)['last_request_at']
        if user.timedout?(last_request_at)
          auth.logout(scope)
          throw :warden, :scope => scope, :message => :timeout
        end

        auth.session(scope)['last_request_at'] = Time.now.utc

      end

    end
