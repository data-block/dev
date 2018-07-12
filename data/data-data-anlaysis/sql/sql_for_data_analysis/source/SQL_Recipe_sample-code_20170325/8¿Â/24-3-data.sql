DROP TABLE IF EXISTS exam_scores;
CREATE TABLE exam_scores(
    name    varchar(255)
  , subject varchar(255)
  , score   integer
);

INSERT INTO exam_scores
VALUES
    ('학생A', '언어',  69)
  , ('학생B', '언어',  87)
  , ('학생C', '언어',  65)
  , ('학생D', '언어',  73)
  , ('학생E', '언어',  61)
  , ('학생A', '수학', 100)
  , ('학생B', '수학',  12)
  , ('학생C', '수학',   7)
  , ('학생D', '수학',  73)
  , ('학생E', '수학',  56)
;
