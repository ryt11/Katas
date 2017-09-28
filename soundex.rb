require 'pry'



def soundex(names)

end



class Soundexer


  attr_reader :first_letters, :split_name, :score_key

def initialize(name)
  @first_letters = []

  @split_name = name.split.map do |name|
    @first_letters << name.chars.shift.capitalize
    name[1..-1]
  end

  @score_key = {'1'=> ['b','f','p','v'],
                '2' => ['c','g','j','k','q','s','x','z'],
                '3' => ['d', 't'],
                '4' => 'l',
                '5' => ['m', 'n'],
                '6' => 'r'}
  end

  def sanitize
    @split_name.map {|name| name.gsub(/[hwaeiouy]/, '')}
  end

  def frag_converter
    sanitize.map do |frag|
      frag.chars.map.with_index do |char, index|
        char = first_letters[index].downcase if char.to_i != 0
        score_key.map {|k, v| k if v.include?(char)}.join
      end.join
    end
  end

  def zeros(frag)
    return "#{frag}000"[0..3] if frag.length < 4
    frag[0..3]
  end

  def joiner
    frag_converter.map.with_index {|frag, index| zeros("#{first_letters[index]}#{frag.squeeze}") }.join(" ")
  end

end


#Save the first letter. Remove all occurrences of h and w except first letter.
# b, f, p, v = 1
# c, g, j, k, q, s, x, z = 2
# d, t = 3
# l = 4
# m, n = 5
# r = 6

#
# Replace all adjacent same digits with one digit.
# Remove all occurrences of a, e, i, o, u, y except first letter.
#
# If first symbol is a digit replace it with letter saved on step 1.
# Append 3 zeros if result contains less than 3 digits. Remove all except first letter and 3 digits after it


x = Soundexer.new("Aardvark")

puts x.joiner
