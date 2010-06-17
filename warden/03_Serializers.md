!SLIDE
# Serializers #
### Хранение информации о пользователе ###

!SLIDE smbullets incremental small

* store(user,scope)
* fetch
* stored?
* delete.

!SLIDE small
# Warden::SessionSerializer #

    @@@ruby
    use Warden::Manager do |manager|
      manager.serialize_into_session do |user|
        user.vkontakte_id
      end
      manager.serialize_from_session do |vkontakte_id|
        User.find_by_vkontakte_id(vkontakte_id)
      end
    end

