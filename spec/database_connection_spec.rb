require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'daily_diary_manager_test')

      DatabaseConnection.setup('daily_diary_manager_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('daily_diary_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM diary_entries;")

      DatabaseConnection.query("SELECT * FROM diary_entries;")
    end
  end
end
