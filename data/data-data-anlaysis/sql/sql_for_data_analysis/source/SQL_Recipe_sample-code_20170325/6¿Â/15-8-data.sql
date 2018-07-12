DROP TABLE IF EXISTS read_log;
CREATE TABLE read_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , url          varchar(255)
);

INSERT INTO read_log
VALUES
    ('2016-12-29 21:45:47', 'afbd3d09', 'view'     , 'http://www.example.com/article?id=news341' )
  , ('2016-12-29 21:45:47', 'df6eb25d', 'view'     , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:45:56', 'df6eb25d', 'read-20%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:05', 'df6eb25d', 'read-40%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:13', 'df6eb25d', 'read-60%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:22', 'df6eb25d', 'read-80%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:25', 'df6eb25d', 'read-100%', 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:45:47', '77d477cc', 'view'     , 'http://www.example.com/article?id=it605'   )
  , ('2016-12-29 21:45:49', '77d477cc', 'read-20%' , 'http://www.example.com/article?id=it605'   )
  , ('2016-12-29 21:45:47', 'a80ded24', 'view'     , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:47', '76c67c39', 'view'     , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:54', '76c67c39', 'read-20%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:59', '76c67c39', 'read-40%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:46:08', '76c67c39', 'read-60%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:47', '08962ace', 'view'     , 'http://www.example.com/article?id=trend132')
;
