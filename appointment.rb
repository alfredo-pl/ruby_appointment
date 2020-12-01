#SUPER
class Appointment
    #GETTERS AND SETTERS
    attr_accessor :location, :purpose, :hour, :min
    #CONSTRUCTOR
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end

end
#Sub
class MonthlyAppointment < Appointment
    #GETTERS AND SETTERS
    attr_accessor :day
    #CONSTRUCTOR
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day= day
    end

    def occurs_on?(day)
        day == @day    
    end
    #llamado implícito
    def to_s 
        "Reunión mensual en #{location} sobre #{purpose} el día #{day} a la(s) #{hour}:#{min}."
    end

end
#Sub
class DailyAppointment < Appointment
    def occurs_on?(hour,day)
        day == @day && hour == @hour    
    end
    def to_s 
        "Reunión diaria en #{location} sobre #{purpose} la(s) #{hour}:#{min}."
    end
  
end
#Sub 
class OneTimeAppointment < Appointment
    #GETTERS AND SETTERS
    attr_accessor :day, :month , :year
    #CONSTRUCTOR
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day= day
        @month= month
        @year= year
    end
    def occurs_on?(day,month,year)
        day == @day && hour == @hour && year == @year
    end
    def to_s #llamado implícito
        "Reunión única en #{location} sobre #{purpose} el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}."
    end
end
#INSTANCES
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019);
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15);
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23);
