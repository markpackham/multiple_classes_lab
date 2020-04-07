require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus')
require_relative('../person')


class BusTest < MiniTest::Test

    def setup()
        @bus = Bus.new(22,"Ocean Terminal")
        @person = Person.new("John Smith", "40")
        @person2 = Person.new("Jane Doe", "80")
        @person3 = Person.new("Mathuzela", "1040")
      end
    
      def test_get_route()
        assert_equal(22, @bus.route_number)
      end

      def test_get_destination()
        assert_equal("Ocean Terminal", @bus.destination)
      end

      def test_drive()
        assert_equal("Brum brum", @bus.drive)
      end   

      def test_passanger_count()
        @bus.pick_up(@person)
        @bus.pick_up(@person2)
        @bus.pick_up(@person3)
        assert_equal(3, @bus.passenger_count)
      end

      def test_pick_up()
        @bus.pick_up(@person)
        assert_equal(1, @bus.passenger_count)
      end

      def test_drop_off()
        @bus.pick_up(@person)
        @bus.pick_up(@person2)

        @bus.drop_off(@person)
        assert_equal(1, @bus.passenger_count)
      end

      def test_remove_all()
        @bus.remove_all()
        assert_equal(0, @bus.passenger_count)
      end
end
