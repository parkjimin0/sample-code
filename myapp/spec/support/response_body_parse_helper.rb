module ResponseBodyParseHelper
    def json
      JSON.parse(response.body)
    end
end