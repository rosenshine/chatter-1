class ConversationsController < ApplicationController

  get '/all' do
    @conversations = Conversation.all
    erb :'conversations/all'
  end

  get '/new' do
    erb :'conversations/send'
  end

  post '/new' do
    if
      params[:message].empty?
      redirect '/new'
    else
      @user = current_user.id
      @user.conversations.build(messaage: params[:message])
      @user.save
      redirect '/new'
    end
  end

end
