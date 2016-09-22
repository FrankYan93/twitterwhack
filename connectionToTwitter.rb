class ConnTwitter
    def search_tweets(s, count)
        consumer_key = OAuth::Consumer.new(
            'SsgCvkYeforV8SEjPUlDDOe5D',
            're873vthzSWuVH1RYL2IIptGVm55oC5ahG3hUxxQJZChgqOh8W'
        )
        access_token = OAuth::Token.new(
            '750495694624927744-CPeAx8l1ztFw896nILhE9mMk5KxvC1X',
            'cou0PDegxFK1kRbwdcU57h5HLesS58hM6NWHhj1QnMFdQ'
        )
        baseurl = 'https://api.twitter.com'
        path    = '/1.1/search/tweets.json'
        query   = URI.encode_www_form(
            'q' => s,
            'count' => count
        )
        address = URI("#{baseurl}#{path}?#{query}")
        http = Net::HTTP.new address.host, address.port
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        request = Net::HTTP::Get.new address.request_uri
        request.oauth! http, consumer_key, access_token
        http.start
        response = http.request request

        return temp=JSON.parse(response.body), temp['statuses'].size
    end
end
