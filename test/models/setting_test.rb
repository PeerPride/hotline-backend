# frozen_string_literal: true

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  test 'Settings require a name' do
    s1 = Setting.new
    assert_not s1.save

    s2 = Setting.new
    s2.value = 'something'
    assert_not s2.save
  end

  test 'Setting does not require a value' do
    s1 = Setting.new
    s1.name = 'Something'
    assert s1.save
  end

  test 'Setting type_hint must be valid' do
    assert_not Setting.valid_type_hints.include? 'a random string here'
  end

  test 'name_as_env_var removes non-alpha and converts spaces to underscores' do
    s1 = Setting.create(name: 'A 😀Setting 1 Name @ Here', value: 'Test')
    assert s1.name_as_env_var == 'A_SETTING_1_NAME__HERE'
  end
end
