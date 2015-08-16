require 'minitest_helper'
require 'support/user'

class TestBicycleOrm < Minitest::Test
  def setup
    system('rake reset_db')
  end

  def test_that_it_has_a_version_number
    refute_nil ::BicycleOrm::VERSION
  end

  def test_it_returns_user_by_id
    user = User.find(1)
    assert 'Friedrich', user.name
    assert 'philosopher', user.occupation
  end

  def test_it_returns_column_names
    User.column_names
    assert_equal %w(id name occupation age), User.column_names
  end

  def test_it_creates_new_record
    User.create(name: 'Fedor', occupation: 'writer', age: 59)
    fedor = User.find_by(name: 'Fedor')
    assert 'Fedor', fedor.name
    assert 'writer', fedor.occupation
    assert 59, fedor.age
  end

  def test_it_returns_records_count
    assert User.count > 0
  end

  def test_it_deletes_record
    user = User.find(2)
    user.delete!
    assert_raises_with_message BicycleOrm::AdapterRecordNotFound, 'record not found' do
      User.find(2)
    end
  end
end
