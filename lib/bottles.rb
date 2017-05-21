class Bottles
  BOTTLE_NAME = 'bottle'.freeze

  def song
    verses(99, 0)
  end

  def verses(start_num_bottles, end_num_bottles)
    verses = start_num_bottles.downto(end_num_bottles).map do |num_bottles|
      verse(num_bottles)
    end

    verses.join("\n")
  end

  def verse(num_bottles)
    verse =
      "#{num_to_s(BOTTLE_NAME, num_bottles).capitalize} of beer on the wall," \
      " #{num_to_s(BOTTLE_NAME, num_bottles)} of beer.\n" \

    verse +=
      if num_bottles > 0
        "Take #{num_to_take(num_bottles)} down and pass it around," \
        " #{num_to_s(BOTTLE_NAME, num_bottles - 1)} of beer on the wall.\n"
      else
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end

    verse
  end

  private
  # taking
  # -1 then fill up to 99
  # no more bottles

  def num_to_take(num_bottles)
    num_bottles == 1 ? 'it' : 'one'
  end

  def num_to_s(word, num)
    num == 0 ? 'no more bottles' : "#{num} #{pluralize(word, num)}"
  end

  def pluralize(word, num)
    num == 1 ? word : "#{word}s"
  end
end
