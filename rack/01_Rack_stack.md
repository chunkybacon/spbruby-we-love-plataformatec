!SLIDE 
# Rack-Stack #

!SLIDE small transition=uncover
# SPECification

    @@@ruby
    module Rack
      # Forces garbage collection after each request.
      class GarbageCollector
        def initialize(app)
          @app = app
        end

        def call(env)
          @app.call(env)
        ensure
          GC.start
        end
      end
    end

!SLIDE small
# Request and Response Filtering

    @@@ruby
    class Filtering
      def initialize(app)
        @app = app
      end

      def call(env)
        # request = Rack::Request.new(env)
        # враг не пройдет!
        response = @app.call(env)
        # выход по пропускам и только после санитарной обработки
        response # [HTTPStatus, #to_hash, #each (yields Strings)]
      end
    end

!SLIDE bullets incremental small
# Только так, и это Rack %)

* Rack::Static
* Rack::Deflater
* YourMiddlewareNameHere

!SLIDE small
# Builder

    @@@ruby
    use(middleware, *args, &block) #, luke
    run(app)
