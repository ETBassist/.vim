class Service
  class << self

    private

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: '') do |faraday|
        faraday.params[''] = ENV['']
      end
    end
  end
end
