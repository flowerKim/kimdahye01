insert into tbl_reply (bno, replytext, replyer)
 values (3, '¾È³ç2', 'user01');
 
insert into tbl_reply (bno, replytext, replyer)
    values (#{bno},#{replytext},#{replyer})

select rno, replytext, replyer
from tbl_reply left join tbl_board
on tbl_reply.bno = tbl_board.bno;


select b.bno, b.title, b.content, b.writer, r.bno, r.rno, r.replytext, r.replyer
from tbl_board b left join tbl_reply r
on b.bno = r.bno;
