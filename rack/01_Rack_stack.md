!SLIDE 
# Rack-Stack #

1. Rack-Middleware SPECification

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

2. Request and Response Filtering

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

3. Middleware Stack

  use(middleware, *args, &block)
  run(app)

  M1 -> M2(Auth) -> ... MN -> app(ENDPOINT)
         \
         ENDPOINT
