require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "new_booking" do
    @expected.subject = 'BookingMailer#new_booking'
    @expected.body    = read_fixture('new_booking')
    @expected.date    = Time.now

    assert_equal @expected.encoded, BookingMailer.create_new_booking(@expected.date).encoded
  end

end
