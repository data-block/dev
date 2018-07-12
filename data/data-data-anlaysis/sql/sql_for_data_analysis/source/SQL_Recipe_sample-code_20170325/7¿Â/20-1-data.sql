DROP TABLE IF EXISTS mst_products_20161201;
CREATE TABLE mst_products_20161201(
    product_id  varchar(255)
  , name        varchar(255)
  , price       integer
  , updated_at  varchar(255)
);

INSERT INTO mst_products_20161201
VALUES
    ('A001', 'AAA', 3000, '2016-11-03 18:00:00')
  , ('A002', 'AAB', 4000, '2016-11-03 19:00:00')
  , ('B001', 'BBB', 5000, '2016-11-03 20:00:00')
  , ('B002', 'BBD', 3000, '2016-11-03 21:00:00')
  , ('C001', 'CCA', 4000, '2016-11-04 18:00:00')
  , ('D001', 'DAA', 5000, '2016-11-04 19:00:00')
;

DROP TABLE IF EXISTS mst_products_20170101;
CREATE TABLE mst_products_20170101(
    product_id  varchar(255)
  , name        varchar(255)
  , price       integer
  , updated_at  varchar(255)
);

INSERT INTO mst_products_20170101
  VALUES
    ('A001', 'AAA', 3000, '2016-11-03 18:00:00')
  , ('A002', 'AAB', 4000, '2016-11-03 19:00:00')
  , ('B002', 'BBD', 3000, '2016-11-03 21:00:00')
  , ('C001', 'CCA', 5000, '2016-12-04 18:00:00')
  , ('D001', 'DAA', 5000, '2016-11-04 19:00:00')
  , ('D002', 'DAD', 5000, '2016-12-04 19:00:00')
;
