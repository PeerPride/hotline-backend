require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test 'Team requires a name' do
    t1 = Team.new
    assert_not t1.save

    t2 = Setting.new
    t2.name = 'A Team Here'
    assert t2.save
  end

  test 'Team requires a unique name' do
    t1 = Team.new
    t1.name = 'Go Team Go'
    assert t1.save

    t2 = Team.new
    t2.name = 'Go Team Go'
    assert_not t2.save
  end

  test 'Assigning a team member to lead removes from team members' do
    flunk
  end

  test 'Assigning a member to lead removes from members' do
    flunk
  end

  test 'Teams with 0 members are not considered active' do
    assert_not Team.where(:name => 'A Second Team').first.is_active?
  end

  test 'Teams with 1 or more members are considered active' do
    assert Team.where(:name => 'Team 3!').first.is_active?
  end


end
