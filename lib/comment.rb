class Comment
  def self.create(diary_entry_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (diary_entry_id, text) VALUES ('#{diary_entry_id}','#{text}') RETURNING id, text, diary_entry_id;")
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      diary_entry_id: result[0]['diary_entry_id']
    )
  end

  attr_reader :id, :text, :diary_entry_id

  def initialize(id:, text:, diary_entry_id:)
    @id = id
    @text = text
    @diary_entry_id = diary_entry_id
  end
end
