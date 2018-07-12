DROP TABLE IF EXISTS form_error_log;
CREATE TABLE form_error_log(
    stamp       varchar(255)
  , session     varchar(255)
  , form        varchar(255)
  , field       varchar(255)
  , error_type  varchar(255)
  , value       varchar(255)
);

INSERT INTO form_error_log
VALUES
     ('2016-12-30 00:56:08', '004dc3ef', 'regist', 'email', 'require'     , ''            )
   , ('2016-12-30 00:56:08', '004dc3ef', 'regist', 'kana' , 'require'     , ''            )
   , ('2016-12-30 00:57:21', '004dc3ef', 'regist', 'zip'  , 'format_error', '101-'        )
   , ('2016-12-30 00:56:08', '00700be4', 'cart'  , 'email', 'format_error', 'xxx---.co.jp')
   , ('2016-12-30 00:56:09', '01061716', 'regist', 'email', 'format_error', 'xxx@---cojp' )
   , ('2016-12-30 00:56:42', '01061716', 'regist', 'kana' , 'not_kana'    , '山田 太郎'     )
   , ('2016-12-30 00:56:09', '02596e8a', 'regist', 'kana' , 'require'     , ''            )
   , ('2016-12-30 00:56:09', '035a1ebb', 'cart'  , 'tel'  , 'format_error', '03-99999999' )
;
