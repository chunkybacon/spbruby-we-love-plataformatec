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
