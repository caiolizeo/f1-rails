class HomeController < ApplicationController
    def index
        resp = Faraday.get('http://ergast.com/api/f1/2022.json')
        @r = JSON.parse(resp.body)
        
    end
end