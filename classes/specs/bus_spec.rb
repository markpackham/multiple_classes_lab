require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus")
require_relative("../bus_stop")
require_relative("../person")

class BusTest < MiniTest::Test
  def setup()
    @bus = Bus.new(22, "Ocean Terminal")
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

  # def test_customer_can_buy_pet()
  #     customer = Customer.new("Jack Jarvis", 1000)
  #     @pet_shop.sell_pet_to_customer("Sir Percy", customer)
  #     assert_equal(1, customer.pet_count())
  #     assert_equal(1, @pet_shop.stock_count())
  #     assert_equal(1, @pet_shop.pets_sold)
  #   end

  def test_pick_up_from_stop()
    bustop = BusStop.new("Gormanghast")
    bustop.add_person_to_queue(@person)
    bustop.add_person_to_queue(@person1)
    bustop.add_person_to_queue(@person2)
    @bus.pick_up_from_stop(bustop)
    assert_equal(0, bustop.queue_number())
    assert_equal(3, @bus.passenger_count())
  end
end
