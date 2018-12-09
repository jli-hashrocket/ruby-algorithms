require 'pry-byebug'

def length_of_longest_substring(s)
  max_length = 0
  index_start = -1
  char_map = {}

  s.each_char.with_index do |char, index|
    current_index = char_map[char]
    if current_index
      index_start = current_index if current_index > index_start
    end

    char_map[char] = index
    new_length = index - index_start
    max_length = new_length if max_length < new_length
  end
  puts max_length
end

# length_of_longest_substring("pwwkew")
# length_of_longest_substring('bbbbb')
length_of_longest_substring('abcabcbb')
length_of_longest_substring(' ')
length_of_longest_substring('aab')

