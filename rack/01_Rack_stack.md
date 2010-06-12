!SLIDE 
# Rack-Stack #

!SLIDE smaller transition=uncover
# Rack-Middleware SPECification

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

!SLIDE smaller
# Request and Response Filtering

    @@@ruby
    class Filtering
      def initialize(app)
        @app = app
      end

      def call(env)
        # do something with env
        response = @app.call(env)
        # do something with response
        response # [HTTPStatus, #to_hash, #each (yields Strings)]
      end
    end

!SLIDE small
# Middleware Stack

    use(middleware, *args, &block)
    run(app)

    M1 -> M2(Auth) -> ... MN -> app(ENDPOINT)
           \
           ENDPOINT
