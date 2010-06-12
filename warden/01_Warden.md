!SLIDE 
# Warden #

!SLIDE
# Installation #

    gem "warden", "0.10.7"
    gem install warden --version=0.10.7

!SLIDE
# Multiple applications. One "shared" authentication. #

!SLIDE

    Rack::Builder.new do

      use Rack::Session::Cookie       # warden MUST be downstream of it
      use MyCustomSessionMiddleware   # and of it...

      use Warden::Manager do |manager|
        manager.default_strategies :passport  # strategies "by default"
        manager.failure_app = GoAway          # failure application (required)
      end

      run SomethingAwesome
    end
