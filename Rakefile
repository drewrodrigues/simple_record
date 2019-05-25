require "sqlite3"

task :setup do
  Setup::test_database
end

task :setup_test_database do
  Setup::test_databse
end

module Setup
  def self.test_database
    db = SQLite3::Database.open "simple_record.db" 

    db.execute_batch <<-SQL
      DROP TABLE IF EXISTS posts;
      DROP TABLE IF EXISTS comments;

      CREATE TABLE posts (
        id      INTEGER PRIMARY KEY,
        content TEXT
      );

      CREATE TABLE comments (
        id      INTEGER PRIMARY KEY,
        content TEXT,
        post_id INTEGER,
        FOREIGN KEY(post_id) REFERENCES posts(id)
      );

      INSERT INTO posts(id, content) VALUES(15, "Let's build the things.");
      INSERT INTO comments(content, post_id) VALUES("Okay!", 15);
      INSERT INTO comments(content, post_id) VALUES("I'm down!", 15);

      INSERT INTO posts(id, content) VALUES(32, "Who wants to go to the park?");
      INSERT INTO comments(content, post_id) VALUES("Of course everyone.", 32);
      INSERT INTO comments(content, post_id) VALUES("Who wouldn't!", 32);
    SQL
  end
end
