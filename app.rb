require 'sinatra'

class ApplicationController < Sinatra::Base

  get '/' do
    "Hello, World!"
  end

  post '/' do
    "Hello, World!"
  end

end
