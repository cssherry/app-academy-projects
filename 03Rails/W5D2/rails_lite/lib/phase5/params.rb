require 'uri'

module Phase5
  class Params
    # use your initialize to merge params from
    # 1. query string
    # 2. post body
    # 3. route params
    #
    # You haven't done routing yet; but assume route params will be
    # passed in as a hash to `Params.new` as below:
    def initialize(req, route_params = {})
      @params = parse_all_params(req, route_params)
    end

    def parse_all_params(req, route_params)
      query = req.query_string ? parse_params(req.query_string) : {}
      body = req.body ? parse_params(req.body) : {}
      query.merge(body).merge(route_params)
    end

    def parse_key(key)
      key.split(/\]\[|\[|\]/)
    end

    def parse_key_and_value(hash, query)
      keys = parse_key(query[0])
      unrepeated_keys = keys.dup #Have to dup or keys will be modified when unrepeated keys modified
      repeated_hash = []
      unrepeated_hash = hash.dup
      keys.each do |key|
        if unrepeated_hash[key].nil?
          break
        else
          hash.delete(key) if hash[key]
          unrepeated_hash = unrepeated_hash[key]
          repeated_hash << unrepeated_keys.shift
        end
      end
      nested_hash = unrepeated_keys.reverse.inject(query[1]) { |hash, key| { key => hash }}
      merged_hashes = unrepeated_hash.merge(nested_hash)

      nested_hashes = repeated_hash.reverse.inject(merged_hashes) { |hash, key| { key => hash }}
      hash.merge(nested_hashes)
    end

    def parse_params(query)
      results = {}
      unless query.nil?
        query_array = URI.decode_www_form(query)
        query_array.each do |query|
          results = parse_key_and_value(results, query)
        end
      end
      results
    end

    def [](key)
      @params[key.to_s]
    end

    def to_s
      @params.to_json.to_s
    end

    class AttributeNotFoundError < ArgumentError; end;

    private
    # this should return deeply nested hash
    # argument format
    # user[address][street]=main&user[address][zip]=89436
    # should return
    # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
    def parse_www_encoded_form(www_encoded_form)
    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
  end
end
