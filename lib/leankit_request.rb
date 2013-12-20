module LeanKitRequest
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    REPLY_DATA_KEY  = "ReplyData"

    attr_reader :raw_headers, :code, :message, :raw_response

    private
    def get(api_call)
      url = "#{LeanKitKanban::Config.uri}#{api_call}"
      @raw_response = super(url, LeanKitKanban::Config.basic_auth_hash)
      @raw_headers  = @raw_response.headers
      @code         = @raw_response.code
      @message      = @raw_response.message
      parse_body(@raw_response.body)
    end

    def post(api_call, body)
      url = "#{LeanKitKanban::Config.uri}#{api_call}"
      headers("Content-Type" => "application/json")
      request = LeanKitKanban::Config.basic_auth_hash
      request[:body] = body.to_json
      @raw_response = super(url, request)
      @raw_headers  = @raw_response.headers
      @code         = @raw_response.code
      @message      = @raw_response.message
      parse_body(@raw_response.body)
    end

    def parse_body(body)
      json_data = JSON.parse(body)
      json_data[REPLY_DATA_KEY]
    end
  end
end
