!SLIDE 
# Формочки #

!SLIDE smaller
# form_for #
    @@@html
    <%= form_for(resource, 
                 :as => resource_name, 
                 :url => registration_path(resource_name)) do |f| %>

      <p><%= f.label :email %><br />
      <%= f.text_field :email %></p>

      <p><%= f.label :password %><br />
      <%= f.password_field :password %></p>

      <p><%= f.label :password_confirmation %><br />
      <%= f.password_field :password_confirmation %></p>

      <p><%= f.submit "Sign up" %></p>
    <% end %>

!SLIDE 
# VS #

!SLIDE smaller
# Simple Form #
    @@@html
    <%= simple_form_for(resource, 
                        :as => resource_name, 
                        :url => registration_path(resource_name)) do |f| %>
      <%= f.input :name %>
      <%= f.input :email %>
      <%= f.input :password %>
      <%= f.input :password_confirmation %>

      <p><%= f.button :submit %></p>
    <% end %>

!SLIDE small
# I18n #
    @@@ruby
    ru:
      simple_form:
        "yes": 'Да'
        "no": 'Нет'
        required:
          text: 'Поле обязательно к заполнению'
          mark: '*'
        labels:
          user:
            name: 'Имя'
            email: 'E-mail'
            password: 'Пароль'
            password_confirmation: 'Подтверждение пароля'
            edit:
              name: 'Изменить имя'
              email: 'Изменить E-mail'
        hints:
          user:
            name: 'Максимальная длина имени - 100 символов'%

!SLIDE 
# А так же #

!SLIDE
# Коллекции #

    @@@ruby
    f.input :age, :collection => 18..60, 
                  :prompt => "Select your age"

!SLIDE small
# Приоритеты #

    @@@ruby
    f.input :residence_country, 
            :priority => [ "Russian Federation", "Albania", "Zimbabwe"]

!SLIDE small
# Ассоциации #

    @@@ruby
    f.association :company, :as => :radio
    f.association :roles,   :as => :check_boxes
    f.association :company, 
                  :collection => Company.active.all(:order => 'name'), 
                  :prompt => "Choose a Company"

!SLIDE smaller
# Генераторы #

    @@@sh
    $ rails generate scaffold article \
      title:string body:text author:references
    ...
    create      app/views/articles/_form.html.erb
    ...

!SLIDE smaller
# _form.html.erb #

    @@@html
    <%= simple_form_for(@article) do |f| %>
      <% if @article.errors.any? %>
        <div id="error_explanation">
          <h2><%= pluralize(@article.errors.count, "error") %> prohibited this article from being saved:</h2>

          <ul>
          <% @article.errors.full_messages.each do |msg| %>
            <li><%= msg %></li>
          <% end %>
          </ul>
        </div>
      <% end %>

      <div class="inputs">
        <%= f.input :title %>
        <%= f.input :body %>
        <%= f.association :author %>
      </div>

      <div class="actions">
        <%= f.button :submit %>
      </div>
    <% end %>

