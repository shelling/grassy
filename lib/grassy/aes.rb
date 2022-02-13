module Grassy
  class AES
    def initialize(key, iv)
      @key = key
      @iv = iv
    end

    def encrypt(payload)
      cipher = OpenSSL::Cipher::AES128.new(:CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      Base64.strict_encode64(cipher.update(payload) + cipher.final)
    end

    def decrypt(payload)
      cipher = OpenSSL::Cipher::AES128.new(:CBC)
      cipher.decrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.update(Base64.decode64(payload)) + cipher.final
    end
  end
end
