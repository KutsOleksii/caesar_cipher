LETTERS = ('a'..'z').to_a

def caesar_cipher(string, shift_factor)
  string ||= "Hello, world!"
  string.chars.map { |ch| c_c_char(ch, shift_factor) }.join
end

def c_c_char(ch = '!', shift_factor = 1)
  return ch unless ('a'..'z').include? ch.downcase

  result = proceed_downcased_char(ch.downcase, shift_factor)

  ch == ch.upcase ? result.upcase : result
end

def proceed_downcased_char(ch, shift_factor)
  char_index = LETTERS.find_index(ch)
  shift_index = char_index + shift_factor
  new_index = shift_index % 26
  LETTERS[new_index]
end

# Usage: ruby caesar_cipher.rb "I will be back" 100
pp caesar_cipher(ARGV[0], ARGV[1].to_s.to_i)
