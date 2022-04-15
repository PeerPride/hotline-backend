# frozen_string_literal: true

require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  test 'Language requires a name' do
    l1 = Language.new
    assert_not l1.save

    l2 = Language.new
    l2.name = 'A Language Here'
    assert l2.save
  end

  test 'Leaving local_name blank fills it in with name' do
    l1 = Language.new
    l1.name = 'A Language Here'
    l1.save

    assert_equal l1.name, l1.local_name
  end

  test 'Language requires unique name' do
    l1 = Language.new
    l1.name = 'English'
    l1.save

    l2 = Language.new
    l2.name = 'English'
    assert_not l2.save
  end
end
