!SLIDE
# Scopes #

!SLIDE bullets incremental small

* Одна сессия. Много scopes.
* Scopes позволяют реализовать разграничение доступа.
* Devise любит scopes!

!SLIDE small
# Scopes #

    @@@ruby
    env['warden'].authenticated?(:citizen)
    env['warden'].authenticate(:passport, :scope => :citizen)
    env['warden'].authenticate!(:passport, :scope => :citizen)
    env['warden'].logout(:citizen)
    env['warden'].logout

!SLIDE small
# session тоже любит scopes ;) #

    @@@ruby
    env['warden'].session[:passport]
    env['warden'].session(:citizen)[:passport]

!SLIDE small
# warden + scopes = LOVE #
