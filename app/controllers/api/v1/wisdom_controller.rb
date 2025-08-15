class Api::V1::WisdomController < ApplicationController
    require "net/http"
    require "uri"
    require "json"
  
    def show
      prompt = "Give me a short and calming quote for daily meditation practice. Keep it under 15 words."
  
      uri = URI("https://api.openai.com/v1/chat/completions")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      request = Net::HTTP::Post.new(uri)
      request["Authorization"] = "Bearer #{ENV['OPENAI_API_KEY']}"
      request["Content-Type"] = "application/json"
  
      request.body = {
        model: "gpt-4.1-nano", # or "gpt-3.5-turbo"
        messages: [
          { role: "system", content: "You are a peaceful meditation guide." },
          { role: "user", content: prompt }
        ],
        temperature: 0.7
      }.to_json
  
      response = http.request(request)
      json = JSON.parse(response.body)
  
      render json: { wisdom: json["choices"][0]["message"]["content"].strip }
    end
  end
  