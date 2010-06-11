!SLIDE 
# Warden #

1. Installation

  gem "warden", "1.1.rc1"
  gem install warden --version=1.1.rc1

2. Multiple applications. One "shared" authentication.

  Rack::Builder.new do

    use Rack::Session::Cookie       # warden MUST be downstream of it
    use MyCustomSessionMiddleware   # and of it...

    use Warden::Manager do |manager|
      manager.default_strategies :passport  # strategies "by default"
      manager.failure_app = GoAway          # failure application (required)
    end

    run SomethingAwesome
  end


3. Стратегии, "логика" аутентификации: Warden::Strategies.

  Warden::Strategies.add(:passport) do

    def valid?
      params[:passport]
    end

    def authenticate!
      u = User.authenticate(params[:passport])
      u.nil? ? fail!("Go Away!") : success!(u)
    end
  end

4. Использование стратегий.

  env['warden'].authenticate(:passport, :password)

  1. by passport
  2. by password
  3. GoAway

5. Хранение информации о пользователе: Serializers

  #store(user,scope)
  #fetch
  #stored?
  #delete.

6. Warden::SessionSerializer

  use Warden::Manager do |manager|
    manager.serialize_into_session { |user| user.vkontakte_id }
    manager.serialize_from_session { |vkontakte_id| User.get(vkontakte_id) }
  end

7. Scopes

  1. Обеспечивают warden дополнительную гибкость в управлении процессом аутентификации.
  2. Позволяют реализовать разграничение доступа.
  3. Devise любит scopes!

8. Scopes#2

  env['warden'].authenticated?(:citizen)
  env['warden'].authenticate(:passport, :scope => :citizen)
  env['warden'].authenticate!(:passport, :scope => :citizen)
  env['warden'].logout(:citizen)
  env['warden'].logout

9. env['warden'].session тоже любит scopes ;)

  env['warden'].session[:passport]
  env['warden'].session(:citizen)[:passport]

10. warden + scopes = LOVE

11. Callbacks.

  Warden::Manager.after_authentication do |user,auth,options|
   user.last_login_at = Time.now
  end
