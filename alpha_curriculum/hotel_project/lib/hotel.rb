require_relative "room"
require "byebug"

class Hotel
  def initialize(name, room_info)
    @name = name
    @rooms = {}
    room_info.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.keys.include?(room)
  end

  def check_in(person, room)
    if !room_exists?(room)
      puts "sorry, room does not exist"
    elsif @rooms[room].add_occupant(person)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
   if @rooms.all? {|k, v| v.full? }
     return false
   end
   return true
  end

  def list_rooms
    @rooms.each do |k, v|
      puts "#{k}: #{v.available_space}"
    end
  end
end
