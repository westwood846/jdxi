module MIDI
  CLOCK = [0xF8]
  SENSE = [0xFE]
  SYSEX = [0xF0]
  SYSEX_END = [0xF7]
  NOTEOFF = [0x80]
  NOTEON = [0x90]
  CH1 = [0x00]
  CH2 = [0x01]
  CH3 = [0x02]
  CH4 = [0x03]
  CH5 = [0x04]
  CH6 = [0x05]
  CH7 = [0x06]
  CH8 = [0x07]
  CH9 = [0x08]
  CH10 = [0x09]
  CH11 = [0x0A]
  CH12 = [0x0B]
  CH13 = [0x0C]
  CH14 = [0x0D]
  CH15 = [0x0E]
  CH16 = [0x0F]

  def self.b10_array_to_hex_array_s(data)
    data.map{|x| x.to_s(16)}.map{|x| x.rjust(2, '0')}.map(&:upcase).map{|x| "0x#{x}"}.join(' ')
  end

  def self.int_to_byte_array_4(int)
    [
      (int & 0xFF000000) >> 24,
      (int & 0x00FF0000) >> 16,
      (int & 0x0000FF00) >> 8,
      (int & 0x000000FF)
    ]
  end

  def self.checksum(address, data)
    sum = int_to_byte_array_4(address).inject(:+) + data
    remainder = sum % 128
    result = 128 - remainder
    result = result == 128 ? 0 : result # This is undocumented but empirically proven
    [result]
  end

  def self.address(program_address, effect_offset, param_address)
    return program_address + effect_offset + param_address
  end
end
