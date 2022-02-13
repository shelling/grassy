module Grassy
  autoload :AES, "grassy/aes"
  autoload :Token, "grassy/token"
  autoload :Payment, "grassy/payment"

  ENVIRONMENTS = {
    production: {
      base_url: "https://ecpg.ecpay.com.tw"
    },
    staging: {
      base_url: "https://ecpg-stage.ecpay.com.tw"
    }
  }

  @@environment = :staging

  def self.environment
    @@environment
  end

  def self.environment=(value)
    raise Exception.new("#{value} is not an eligible environment") unless ENVIRONMENTS.keys.include?(value.to_sym)
    @@environment = value.to_sym
  end

  def self.base_url
    ENVIRONMENTS[@@environment][:base_url]
  end
end
