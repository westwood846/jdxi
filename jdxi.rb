require_relative 'midi'

module JDXI
  extend MIDI
  ID = [0x41] # Roland
  MODEL_ID = [0x00, 0x00, 0x00, 0x0E] # JD-XI
  BROADCAST = [0x7F]
  DEVICE_ID = [0x10]
  DATA_REQUEST = [0x11]
  DATA_SET = [0x12]
end
