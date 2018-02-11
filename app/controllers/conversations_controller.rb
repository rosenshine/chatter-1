class ConversationsController < ApplicationController

  get '/all' do
    @conversations = Conversation.all
    erb :'conversations/all'
  end

end
