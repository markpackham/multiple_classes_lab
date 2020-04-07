
class Bus

    attr_reader :route_number, :destination

    def initialize(route_number, destination )
        @route_number = route_number
        @destination = destination
        @passengers = []
    end

    def drive()
        return "Brum brum"
    end

    def passenger_count()
        return @passengers.length
    end

    def pick_up(person)
        @passengers << person
    end

    def drop_off(person)
        @passengers.delete(person)
    end

    def remove_all()
        @passengers = []
    end

end
