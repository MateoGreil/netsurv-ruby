module NetSurv
  # Handle NetSurv Packet
  class Packet

    HEADER_FORMAT = 'CCx2IIx2S_I'.freeze
    TAIL_FORMAT = "\x0a\x00".freeze

    attr_accessor :len_data

    def initialize(options = {})
      if options[:coded]
        (@head, @version, @session, @sequence_number, @message_id, @len_data) =
          options[:coded].unpack(HEADER_FORMAT)
      else
        @message_code = options[:message_code]
        @data = options[:data].to_json
        @session = options[:session]
        @packet_count = options[:packet_count]
      end
    end

    def encode
      [255, 0, @session, @packet_count, @message_code, @data.length + 2].pack(HEADER_FORMAT) +
        @data + TAIL_FORMAT
    end
  end
end
