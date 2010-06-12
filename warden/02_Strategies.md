!SLIDE
# Стратегии, "логика" аутентификации: Warden::Strategies. #

!SLIDE
    Warden::Strategies.add(:passport) do

      def valid?
        params[:passport]
      end

      def authenticate!
        u = User.authenticate(params[:passport])
        u.nil? ? fail!("Go Away!") : success!(u)
      end
    end

!SLIDE bullets incremental
# Использование стратегий. #

    env['warden'].authenticate(:passport, :password)

* by passport
* by password
* GoAway

