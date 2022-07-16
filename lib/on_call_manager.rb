# frozen_string_literal: true

# Central class to manage queues of users who are on call
class OnCallManager
  ON_CALL_KEY_BASE = 'on_call'

  def self.put_on_call(user, method, language)
    key_name = "#{ON_CALL_KEY_BASE}_#{language.name.downcase}"
    puts key_name

    key_values = Rails.cache.read(key_name)
    puts key_values

    if key_values.nil?
      Rails.cache.write(key_name, [user.id])
    elsif !key_values.include? user.id
      Rails.cache.write(key_name, key_values.push(user.id))
    end
  end

  def self.take_off_call(user, method, language)
    key_name = "#{ON_CALL_KEY_BASE}_#{language.name}"

    key_values = Rails.cache.read(key_name)

    if key_values.nil?
      nil
    else
      key_values.delete user.id
      Rails.cache.write(key_values.to_json)
    end
  end

  def self.on_call_for_language(language = nil)
    users = []
    
    if !language.nil?
      Language.all.each do |l|
        key_name = key_name = "#{ON_CALL_KEY_BASE}_#{language.name.downcase}"
        key_values = Redis.cache.read(key_name)
        if !key_values.nil?
          key_values.each do |u|
            users << User.find(u)
          end
        end
      end
    else
      key_name = "#{ON_CALL_KEY_BASE}_#{language.name.downcase}"
      key_values = Redis.cache.read(key_name)
      if !key_values.nil?
        key_values.each do |u|
          users << User.find(u)
        end
      end
    end

    users
  end
end
