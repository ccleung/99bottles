class Bottles
  BOTTLE_NAME = 'bottle'.freeze

  def song
    verses(99, 0)
  end

  def verses(start_num_bottles, end_num_bottles)
    start_num_bottles.downto(end_num_bottles).map do |num_bottles|
      verse(num_bottles)
    end.join("\n")
  end

  def verse(num_bottles)
    bottle = BottleBuilder.bottle_for(num_bottles)

    "#{bottle.num_bottles_verse.capitalize} on the wall," \
    " #{bottle.num_bottles_verse}.\n" \
    "#{bottle.take_action}," \
    " #{bottle.build_next.num_bottles_verse} on the wall.\n"
  end
end

class NoBottles
  def take_action
    'Go to the store and buy some more'
  end

  def num_bottles_verse
    "no more bottles of beer"
  end

  def build_next
    BottleBuilder.bottle_for(99)
  end
end

class OneBottle
  def build_next
    BottleBuilder.bottle_for(0)
  end

  def take_action
    "Take it down and pass it around"
  end

  def num_bottles_verse
    '1 bottle of beer'
  end
end

class Bottle
  def initialize(num)
    @num = num
  end

  def take_action
    "Take one down and pass it around"
  end

  def num_bottles_verse
    "#{@num} bottles of beer"
  end

  def build_next
    BottleBuilder.bottle_for(@num - 1)
  end
end

class BottleBuilder
  def self.bottle_for(num)
    if num == 0
      NoBottles.new
    elsif num == 1
      OneBottle.new
    else
      Bottle.new(num)
    end
  end
end
