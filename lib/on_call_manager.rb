# frozen_string_literal: true

class OnCallManager
  ON_CALL_KEY_BASE = 'on_call'

  def self.put_on_call(user, method, language)
    key_name = ON_CALL_KEY_BASE + "_" + method + "_" + language.name

    key_values = JSON.parse(Rails.cache.read(key_name))

    if (key_values.nil?)
      Redis.cache.write(key_name, [user.id])
    else
      if (!x.include? user.id)
        Redis.cache.write(key_name, key_values.push(user.id))
      end
    end
  end

  def self.take_off_call(user, method, language)
    key_name = ON_CALL_KEY_BASE + "_" + method + "_" + language.name

    key_values = JSON.parse(Rails.cache.read(key_name))

    if (key_values.nil?)
      return
    else
      key_values.delete user.id
      Rails.cache.write(key_values.to_json)
    end
  end
end
