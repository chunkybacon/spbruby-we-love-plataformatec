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
### a.k.a "после сборки - обработать напильником" ###

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
        response
      end
    end

!SLIDE smalls
# Builder

    @@@ruby
    use(middleware, *args, &block) #, luke
    run(app)
