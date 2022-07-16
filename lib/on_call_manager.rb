# frozen_string_literal: true

# Central class to manage queues of users who are on call
class OnCallManager
  ON_CALL_KEY_BASE = 'on_call'

  def self.put_on_call(user, method, language)
    key_values = Rails.cache.read(ON_CALL_KEY_BASE)
    puts key_values

    searchObj = {:user => user.id, :method => method, :language => language.id}

    if key_values.nil?
      Rails.cache.write(key_name, searchObj)
    elsif !key_values.include? searchObj
      Rails.cache.write(key_name, key_values.push(searchObj))
    end
  end

  def self.take_off_call(user, method, language)
    key_values = Rails.cache.read(ON_CALL_KEY_BASE)

    searchObj = {:user => user.id, :method => method, :language => language.id}

    if key_values.nil?
      nil
    else
      key_values.delete searchObj
      Rails.cache.write(key_values.to_json)
    end
  end

  def self.on_call_for(method = nil, language = nil)
    all_on_call = Redis.cache.read(ON_CALL_KEY_BASE)

    if (!language.nil?)
      all_on_call.select! { |record| r[:language] == language }
    end
    
    if (!method.nil?)
      all_on_call.select! { | record| r[:method] == method }
    end

    all_on_call
  end
end
