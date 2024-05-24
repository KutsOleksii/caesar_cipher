# spec/caesar_cipher_spec.rb

require_relative '../caesar_cipher'

RSpec.describe 'CaesarCipher' do
  describe '#caesar_cipher' do
    it 'returns the correct ciphered string with positive shift' do
      expect(caesar_cipher('I will be back', 100)).to eq('E sehh xa xwyg')
    end

    it 'returns the correct ciphered string with negative shift' do
      expect(caesar_cipher('Hello, world!', -5)).to eq('Czggj, rjmgy!')
    end

    it 'returns the correct ciphered string with zero shift' do
      expect(caesar_cipher('Hello, world!', 0)).to eq('Hello, world!')
    end

    it 'handles uppercase letters correctly' do
      expect(caesar_cipher('Hello, World!', 5)).to eq('Mjqqt, Btwqi!')
    end

    it 'handles non-alphabetic characters correctly' do
      expect(caesar_cipher('Hello, World! 123', 5)).to eq('Mjqqt, Btwqi! 123')
    end

    it 'returns default message when input string is nil' do
      expect(caesar_cipher(nil, 5)).to eq('Mjqqt, btwqi!')
    end
  end

  describe '#c_c_char' do
    it 'shifts lowercase letters correctly' do
      expect(c_c_char('a', 3)).to eq('d')
    end

    it 'shifts uppercase letters correctly' do
      expect(c_c_char('A', 3)).to eq('D')
    end

    it 'returns non-alphabetic characters unchanged' do
      expect(c_c_char('!', 3)).to eq('!')
    end
  end

  describe '#proceed_downcased_char' do
    it 'shifts characters correctly within bounds' do
      expect(proceed_downcased_char('a', 3)).to eq('d')
    end

    it 'wraps around correctly when shift goes past z' do
      expect(proceed_downcased_char('z', 1)).to eq('a')
    end

    it 'handles large shifts correctly' do
      expect(proceed_downcased_char('a', 52)).to eq('a')
      expect(proceed_downcased_char('a', 53)).to eq('b')
    end
  end
end
