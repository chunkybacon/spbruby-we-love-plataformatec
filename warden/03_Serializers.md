!SLIDE bullets
# Хранение информации о пользователе: Serializers #

*  store(user,scope)
*  fetch
*  stored?
*  delete.

!SLIDE small
# Warden::SessionSerializer #

    @@@ruby
    use Warden::Manager do |manager|
      manager.serialize_into_session { |user| user.vkontakte_id }
      manager.serialize_from_session { |vkontakte_id| User.get(vkontakte_id) }
    end

