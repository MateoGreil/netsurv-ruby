# frozen_string_literal: true

module NetSurv
  module PasswordHash
    def self.digest(password)
      md5 = Digest::MD5.digest(password)
      chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
      (0..(md5.length / 2 - 1)).map { |i| chars[md5[2 * i..2 * i + 1].sum % 62] }.join
    end
  end
end
