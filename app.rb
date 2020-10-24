require 'sinatra/base'
require './lib/diary_entries.rb'
require_relative './database_connection_setup'
require_relative './lib/comment'


class DailyDiaryManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    "Hello, world!"
  end

  get '/diary_entries' do
    @diary_entries = DiaryEntries.all
    erb :'diary_entries/index'
  end

  get '/diary_entries/new' do
    erb :'diary_entries/new'
  end

  post '/diary_entries' do
    DiaryEntries.create(content: params[:content], title: params[:title])
    redirect '/diary_entries'
  end

  get "/diary_entries/:id" do
    @diary_entry = DiaryEntries.find(id: params[:id])
    erb :'diary_entries/view_entry'
  end

  delete '/diary_entries/:id' do
    DiaryEntries.delete(id: params[:id])
    redirect '/diary_entries'
  end

  get '/diary_entries/:id/edit' do
    @diary_entry = DiaryEntries.find(id: params[:id])
    erb :'diary_entries/edit'
  end

  patch '/diary_entries/:id' do
    DiaryEntries.update(id: params[:id], content: params[:content], title: params[:title])
    redirect('/diary_entries')
  end

  get '/diary_entries/:id/comments/new' do
    @diary_entry = DiaryEntries.find(id: params[:id])
    erb :'comments/new'
  end

  post '/diary_entries/:id/comments' do
    Comment.create(text: params[:comment], diary_entry_id: params[:id])
      redirect '/diary_entries'
  end

  run! if app_file == $0
end
