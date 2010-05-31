!SLIDE 
# Использование #

!SLIDE
# Инициализация #

## Rails3 beta3
    ./script/rails g devise_install

## Rails 2.3
    ./script/generate devise_install

!SLIDE
# Модель #

## Rails3 beta3
    ./script/rails g devise User

## Rails 2.3
    ./script/generate devise User


!SLIDE smaller
# Файл миграции #
    @@@ruby
    class DeviseCreateUsers < ActiveRecord::Migration
      def self.up
        create_table(:users) do |t|
          t.database_authenticatable :null => false
          t.confirmable
          t.recoverable
          t.rememberable
          t.trackable

          # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
          # t.token_authenticatable

          t.timestamps
        end

        add_index :users, :email,                :unique => true
        add_index :users, :confirmation_token,   :unique => true
        add_index :users, :reset_password_token, :unique => true
        # add_index :users, :unlock_token,         :unique => true
      end

      def self.down
        drop_table :users
      end
    end
        
!SLIDE smaller
# Модель в разрезе #

    @@@ruby
    class User < ActiveRecord::Base
      # Include default devise modules. Others available are:
      # :token_authenticatable, :lockable and :timeoutable
      devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

      # Setup accessible (or protected) attributes for your model
      attr_accessible :email, :password, :password_confirmation
    end
