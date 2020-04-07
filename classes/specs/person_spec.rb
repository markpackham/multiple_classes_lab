require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../person")

class PersonTest < MiniTest::Test
  def setup()
    @person = Person.new("John Smith", 40)
  end

  def test_get_name()
    assert_equal("John Smith", @person.name)
  end

  def test_get_age()
    assert_equal(40, @person.age)
  end
end
