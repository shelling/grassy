module Grassy
  class Token
    def initialize(params)
      @merchant_id = params[:merchant_id]
      @key = params[:key]
      @iv = params[:iv]
    end

    def create(params = {})
      aes = AES.new(@key, @iv)

      response = Net::HTTP.post(
        URI("#{Grassy.base_url}/Merchant/GetTokenbyTrade"),
        JSON.dump({
          'MerchantID'  => @merchant_id,
          'RqHeader'    => {
            'Timestamp' => Time.new.to_i,
            'Revision'  => '1.0.0',
          },
          'Data'        => aes.encrypt(ERB::Util.url_encode(JSON.dump(params))),
        }),
        "Content-Type"  => "application/json"
      )

      # do some error handling

      JSON.parse(URI.decode(aes.decrypt(JSON.parse(response.body)['Data'])))
    end
  end
end
