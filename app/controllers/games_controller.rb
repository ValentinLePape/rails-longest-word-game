require 'net/http'
require 'json'

class GamesController < ApplicationController
  def new
    @grid = ('a'..'z').to_a.sample(10)
  end

  def score()
    valid_word
  end

  def valid_word(word)
    url = URI("https://dictionary.lewagon.com/#{word}")
    response = Net::HTTP.get(url)
    result = JSON.parse(response)
    result["congratulation"] == true
  end
end
