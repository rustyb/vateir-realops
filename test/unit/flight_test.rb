require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Flight.new.valid?
  end
end
