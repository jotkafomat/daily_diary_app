require 'database_connection'

class DiaryEntries

  attr_reader :id, :title, :content

  def initialize(id:, title:, content:)
    @id = id
    @title = title
    @content = content
  end

  def self.all

    result = DatabaseConnection.query("SELECT * FROM diary_entries")
    result.map do |entry|
      DiaryEntries.new(
        content: entry['content'],
        title: entry['title'],
        id: entry['id']
      )
    end
  end

  def self.create(content:, title:)

    result = DatabaseConnection.query("INSERT INTO diary_entries (content, title) VALUES('#{content}', '#{title}') RETURNING id, title, content;")

    DiaryEntries.new(id: result[0]['id'], title: result[0]['title'], content: result[0]['content'])
  end

  def self.selecting(id)

    DiaryEntries.all.select { |entry| entry.id == id }.first
  end

  def self.delete(id:)

    DatabaseConnection.query("DELETE FROM diary_entries WHERE id = #{id}")

  end

  def self.update(id:, content:, title:)

    result = DatabaseConnection.query("UPDATE diary_entries SET content = '#{content}', title = '#{title}' WHERE id = #{id} RETURNING id, content, title;")

    DiaryEntries.new(id: result[0]['id'], content: result[0]['content'], title: result[0]['title'])
  end

  def self.find(id:)

    result = DatabaseConnection.query("SELECT * FROM diary_entries WHERE id = #{id};")
    DiaryEntries.new(id: result[0]['id'], content: result[0]['content'], title: result[0]['title'])
  end

end
