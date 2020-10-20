require 'sinatra/base'
require './lib/diary_entries.rb'

class DailyDiaryManager < Sinatra::Base
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
    content = params['content']
    connection = PG.connect(dbname: 'daily_diary_manager_test')
    connection.exec("INSERT INTO diary_entries (content) VALUES ('#{content}')")
    redirect '/diary_entries'
  end


  run! if app_file == $0
end
