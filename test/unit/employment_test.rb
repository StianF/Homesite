require 'test_helper'

class EmploymentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Employment.new.valid?
  end
end
