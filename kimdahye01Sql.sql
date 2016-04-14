grant all privileges on *.* to java72@localhost identified by 'java72'; 
grant all privileges on *.* to java72 identified by 'java72'; 

create table tbl_attach (
  fullName varchar(150) not null, 
  bno int not null,
  regdate timestamp default now(),
  primary key(fullName)
);

alter table tbl_attach add constraint fk_board_attach 
foreign key (bno) references tbl_board (bno);

-- 628 page, 인터셉터를 활용한 로그인처리
create table tbl_user (
  uid varchar(50) NOT NULL,
  upw varchar(50) NOT NULL,
  uname varchar(100) NOT NULL,
  upoint int NOT NULL DEFAULT 0,
  primary key(uid)
);

insert into tbl_user(uid, upw, uname) values ('user00', 'user00', 'IRON MAN');
insert into tbl_user(uid, upw, uname) values ('user01', 'user01', 'CAPTAIN');
insert into tbl_user(uid, upw, uname) values ('user02', 'user02', 'HULK');
insert into tbl_user(uid, upw, uname) values ('user03', 'user03', 'Thor');
insert into tbl_user(uid, upw, uname) values ('user10', 'user10', 'Quick Silver');



