require 'pg'

class DiaryEntries

  attr_reader :id, :title, :content

  def initialize(id:, title:, content:)
    @id = id
    @title = title
    @content = content
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_manager_test')
    else
      connection = PG.connect(dbname: 'daily_diary_manager')
    end

    result = connection.exec("SELECT * FROM diary_entries;")
    result.map { |entry|
      DiaryEntries.new(id: entry['id'], title: entry['title'], content: entry['content'])
    }
  end

  def self.create(content:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_manager_test')
    else
      connection = PG.connect(dbname: 'daily_diary_manager')
    end

    result = connection.exec("INSERT INTO diary_entries (content, title) VALUES('#{content}', '#{title}') RETURNING id, title, content;")

    DiaryEntries.new(id: result[0]['id'], title: result[0]['title'], content: result[0]['content'])
  end

  def self.selecting(id)
    DiaryEntries.all.select { |entry| entry.id == id }.first
  end
end
