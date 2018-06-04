drop sequence edu.seq_ed_cost
;

drop tablespace edu_data01
including contents and datafiles cascade constraints
;

drop tablespace edu_idx01
including contents and datafiles cascade constraints
;

/*
5분정도 소요 , 전체 실행은 F10 
010_테이블스페이스생성.sql 실행
020_교육용테이블생성.sql 실행
030_교육용데이터생성,sql 실행 

*/

