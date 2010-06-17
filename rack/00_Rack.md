!SLIDE
# Rack #

!SLIDE small
# Python WSGI #
### PEP 333 ###

!SLIDE transition=uncover bullets incremental small

## Server
* Middleware
* Application

!SLIDE small
# Rack::Request #
### Интерфейс доступа к переменным окружения ###

!SLIDE small
# Merb::Request #

    @@@ruby
    def self.new(env, *args)
      if self == Merb::Request
        env["merb.request"] ||= super
      else
        super
      end
    end

!SLIDE small center
# Rack::Response #
### Интерфейс для создания response ###

    @@@ruby
    response.finish #=> [#to_i, #to_hash, #each]