# frozen_string_literal: true

# Central class to manage queues of users who are on call
class OnCallManager
  ON_CALL_KEY_BASE = 'on_call'

  def self.put_on_call(user, method, language)
    key_name = "#{ON_CALL_KEY_BASE}_#{method}_#{language.name}"

    key_values = JSON.parse(Rails.cache.read(key_name))

    if key_values.nil?
      Redis.cache.write(key_name, [user.id])
    elsif !x.include? user.id
      Redis.cache.write(key_name, key_values.push(user.id))
    end
  end

  def self.take_off_call(user, method, language)
    key_name = "#{ON_CALL_KEY_BASE}_#{method}_#{language.name}"

    key_values = JSON.parse(Rails.cache.read(key_name))

    if key_values.nil?
      nil
    else
      key_values.delete user.id
      Rails.cache.write(key_values.to_json)
    end
  end
end
