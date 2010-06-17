!SLIDE
# Serializers #
### Хранение информации о пользователе ###

!SLIDE bullets incremental small

## store(user, scope)
* fetch(scope)
* stored?(scope)
* delete(scope, user=nil)

!SLIDE small
# Setup #

    @@@ruby
    use Warden::Manager do |manager|
      manager.serialize_into_session do |user|
        user.vkontakte_id
      end
      manager.serialize_from_session do |vkontakte_id|
        User.find_by_vkontakte_id(vkontakte_id)
      end
    end

