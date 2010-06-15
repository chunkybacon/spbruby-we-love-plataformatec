!SLIDE

# Inherited Resources

!SLIDE

## Делает из

@@@ ruby
  class TricksController < ApplicationController
    # GET /tricks
    # GET /tricks.xml
    def index
      @tricks = Trick.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @tricks }
      end
    end
    # И еще 70 строк в этом духе
  end
@@@

!SLIDE

## Вот это

@@@ ruby
  class TricksController < InheritedResources::Base
  end
@@@

!SLIDE

# Дьявол-то в деталях

!SLIDE

## Наследовать нельзя расширять

@@@ ruby
  class TricksController < ApplicationController
    inherit_resources
  end
@@@

!SLIDE

## Я — педант

@@@ ruby
  class TricksController < InheritedResources::Base
    actions :index, :show
  end

  class TricksController < InheritedResources::Base
    actions :all, :except => [:destroy]
  end
@@@

!SLIDE

## Я — педант

@@@ ruby
  class TricksController < InheritedResources::Base
    respond_to :html, :xml
  end

  class TricksController < InheritedResources::Base
    respond_to :html
    respond_to :xml, :only => :index
  end
@@@

## TODO: А что по дефолту?

!SLIDE

## У меня все запущенно

@@@ ruby
  class TricksController < InheritedResources::Base
    defaults :resource_class => Joke,
             :collection_name => 'jokes',
             :instance_name => 'joke'
  end
@@@

!SLIDE

## У меня все по полочкам

@@@ ruby
  # Namespaces просто работают
  class Admin::TricksController < InheritedResources::Base
  end

  # И еще настраиваются
  class Administration::TricksController < InheritedResources::Base
    defaults :route_prefix => 'admin'
  end
@@@

!SLIDE

## У меня все по полочкам

@@@ ruby
  # /trickster/1/tricks
  class TricksController < InheritedResources::Base
    belongs_to :trickster
  end

  # /tricksters/jose/tricks
  # /tricksters/:trickster_name/tricks
  class TricksController < InheritedResources::Base
    belongs_to :trickster,
               :finder => 'find_by_name!',
               :param  => 'trickster_name'
  end

  # /trickster/1/tricks
  # /tricks
  class TricksController < InheritedResources::Base
    belongs_to :trickster, :optional => true
  end
@@@

!SLIDE

## У меня все по полочкам

@@@ ruby
  # /trickster/1/tricks/1/comments
  class CommentsController < InheritedResources::Base
    nested_belongs_to :trickster, :ticks
  end

  # /trickster/1/comments
  # /tricks/1/comments
  class CommentsController < InheritedResources::Base
    belongs_to :trickster, :tricks, :polymorphic => true
  end

  # /trickster/1/tricks
  # /tricks
  class TricksController < InheritedResources::Base
    belongs_to :trickster, :optional => true
  end
@@@

!SLIDE

## У меня все по полочкам

@@@ ruby
  # /trickster/jose/tricks/1/comments
  class CommentsController < InheritedResources::Base
    belongs_to :trickster, :finder => 'find_by_name!', :param => :trickster_name do
      belongs_to :trick
    end
  end

  # /trickster/1/tricks/1/comments
  # /trickster/1/jokes/1/comments
  # /tricks/1/comments
  class CommentsController < InheritedResources::Base
    belongs_to :trickster do
      belongs_to :tricks, :jokes, :polymorphic => true
    end
  end
@@@
