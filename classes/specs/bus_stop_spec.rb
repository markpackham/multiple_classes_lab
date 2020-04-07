require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_stop')
require_relative('../person')


class BusStopTest < MiniTest::Test

    def setup()
        @bus_stop = BusStop.new("Minefield")
        @person = Person.new("Jack Bauer", "20")
        @person2 = Person.new("James Bond", "70")
        @person3 = Person.new("James Blunt", "103")
      end


    def test_get_stop_name()
        assert_equal("Minefield", @bus_stop.name)
    end

    def test_queue_number()
        assert_equal(0, @bus_stop.queue_number)
    end

    def test_add_person_to_queue()
        @bus_stop.add_person_to_queue(@person)
        assert_equal(1,@bus_stop.queue_number)
    end

    def test_clear_queue()
        @bus_stop.clear
        assert_equal(0, @bus_stop.queue_number)
    end
end