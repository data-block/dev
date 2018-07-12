DROP TABLE IF EXISTS search_evaluation_by_col;
CREATE TABLE search_evaluation_by_col(
    path      varchar(255)
  , recall    numeric
  , precision numeric
);

INSERT INTO search_evaluation_by_col
VALUES
    ('/search1', 40.0, 60.0)
  , ('/search2', 60.0, 40.0)
  , ('/search3', 50.0, 50.0)
  , ('/search4', 30.0, 60.0)
  , ('/search5', 70.0,  0.0)
;

DROP TABLE IF EXISTS search_evaluation_by_row;
CREATE TABLE search_evaluation_by_row(
    path  varchar(255)
  , index varchar(255)
  , value numeric
);

INSERT INTO search_evaluation_by_row
VALUES
    ('/search1', 'recall'   , 40.0)
  , ('/search1', 'precision', 60.0)
  , ('/search2', 'recall'   , 60.0)
  , ('/search2', 'precision', 40.0)
  , ('/search3', 'recall'   , 50.0)
  , ('/search3', 'precision', 50.0)
  , ('/search4', 'recall'   , 30.0)
  , ('/search4', 'precision', 60.0)
  , ('/search5', 'recall'   , 70.0)
  , ('/search5', 'precision',  0.0)
;
