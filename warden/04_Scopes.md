!SLIDE bullets incremental
# Scopes #

* Обеспечивают warden дополнительную гибкость в управлении процессом аутентификации.
* Позволяют реализовать разграничение доступа.
* Devise любит scopes!

!SLIDE
# Scopes #

    @@@ruby
    env['warden'].authenticated?(:citizen)
    env['warden'].authenticate(:passport, :scope => :citizen)
    env['warden'].authenticate!(:passport, :scope => :citizen)
    env['warden'].logout(:citizen)
    env['warden'].logout

!SLIDE
# env['warden'].session тоже любит scopes ;) #

    @@@ruby
    env['warden'].session[:passport]
    env['warden'].session(:citizen)[:passport]

!SLIDE
# warden + scopes = LOVE #
