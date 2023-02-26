# frozen_string_literal: true

module NetSurv
  # Handle all camera functions
  class Device

    def initialize(protocol: :tcp)
      raise 'Protocol not handled' if protocol != :tcp

      @protocol = protocol
      @session = 0
      @packet_count = 0
      @alive_time = 20
    end

    def connect(ip:)
      socketaddr = Socket.pack_sockaddr_in(PORT[@protocol], ip)
      @socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
      @socket.connect(socketaddr)
    end

    def login(user, password)
      response = send(CODES[:login],
                      {
                        "EncryptType": 'MD5',
                        "LoginType": 'DVRIP-Web',
                        "PassWord": password,
                        "UserName": user
                      })
      return false if response.nil? || response['Ret'] != 100

      keep_alive
      true
    end

    private

    def keep_alive
      response = send(CODES[:keep_alive], { "Name": 'KeepAlive', "SessionID": "0x#{@session.to_s(16).rjust(8, '0')}" })

      if response.nil?
        @socket.close
      else
        puts 'alive !'
        Thread.new do
          sleep(20)
          keep_alive
        end
      end
    end

    def send(message_code, data)
      packet = NetSurv::Packet.new(message_code:, data:, session: @session, packet_count: @packet_count).encode
      @socket.write(packet)

      response_header = @socket.recv(20)
      return nil if response_header.nil? || response_header.length < 20

      response_header_packet = Packet.new(coded: response_header)
      response = @socket.recv(response_header_packet.len_data)
      response = response.slice(0..(response.index("\n") - 1))

      JSON.parse(response)
    end
  end
end
