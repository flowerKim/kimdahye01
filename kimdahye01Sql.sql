grant all privileges on *.* to java72@localhost identified by 'java72'; 
grant all privileges on *.* to java72 identified by 'java72'; 

-- 370 page Ajax ���ó��
create table tbl_reply (
  rno int not null AUTO_INCREMENT,
  bno int not null default 0,
  replytext varchar(1000) not null,
  replyer varchar(50) not null,
  regdate timestamp not null default now(),
  updatedate timestamp not null default now(),
  primary key(rno)
);

alter table tbl_reply add contraint fk_board 
foreign key (bno) references tbl_board (bno);


--462 page AOP�� �����غ�
create table tbl_message (
  mid int not null auto_increment,
  targetid varchar(50) not null,
  sender varchar(50) not null,
  message text not null,
  opendate timestamp,
  senddate timestamp not null default now(),
  primary key(mid)
);

alter table tbl_message add constraint fk_usertarget 
foreign key (targetid) references tbl_user (uid);

alter table tbl_message add constraint fk_usersender 
foreign key (targetid) references tbl_user (uid);

insert into tbl_user(uid, upw, uname) values ('user00', 'user00', 'IRON MAN');
insert into tbl_user(uid, upw, uname) values ('user01', 'user01', 'CAPTAIN');
insert into tbl_user(uid, upw, uname) values ('user02', 'user02', 'HULK');
insert into tbl_user(uid, upw, uname) values ('user03', 'user03', 'Thor');
insert into tbl_user(uid, upw, uname) values ('user10', 'user10', 'Quick Silver');


-- 502 page �Խñ� ��ۿ� ���� Ʈ������ó��
alter table tbl_board add column replycnt int default 0;


----÷������
create table tbl_attach (
  fullName varchar(150) not null, 
  bno int not null,
  regdate timestamp default now(),
  primary key(fullName)
);

alter table tbl_attach add constraint fk_board_attach 
foreign key (bno) references tbl_board (bno);

-- 628 page, ���ͼ��͸� Ȱ���� �α���ó��
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



select bno, title, content, writer, regdate, viewcnt , replycnt from tbl_board where bno = 9; 

--663 page �ڵ��α��ΰ� ��Ű autologin and cookie 
alter table tbl_user add column 
sessionkey varchar(50) not null default 'none';

alter table tbl_user 
add column sessionlimit timestamp;


