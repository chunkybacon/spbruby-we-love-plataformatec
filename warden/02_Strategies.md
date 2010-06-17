!SLIDE
# Warden::Strategies #
### Логика аутентификации ###

!SLIDE small
# Например #

    @@@ruby
    Warden::Strategies.add(:passport) do

      def valid?
        params[:passport]
      end

      def authenticate!
        u = User.authenticate(params[:passport])
        u.nil? ? fail!("Go Away!") : success!(u)
      end

    end

!SLIDE small
# Encore une fois #

    @@@ruby
    Warden::Strategies.add(:passport) do

      def valid?
        params[:passport] # документики предъявите...
      end

      def authenticate!
        u = User.authenticate(params[:passport])
        if u.nil?
          fail!("Go Away!") # а где прописка?
        else
          success!(u)
        end
      end

    end

!SLIDE bullets incremental small
# Попытка - не пытка #

    @@@ruby
    env['warden'].authenticate!
    env['warden'].authenticate! :passport, :password

    env['warden'].authenticate! :passport

