select * from Tbl_User where Status=0 and UserType='professor'; --# account register is professor but not get acceptance.

select * from Tbl_User where Status=1 and UserType='professor'; --# account register is professor and get acceptance.

select * from Tbl_User where UserType='student';				--# account register is student.

select top(1000) * from Tbl_User order by NEWID() ;				--# this way to retriva random data.

select top(1000) QuestionDesc,AnswerA,AnswerB,AnswerC,AnswerD,CorrectAnswer from 
Tbl_Question inner join Tbl_Answer on Tbl_Question.QuestionID =Tbl_Answer.QuestionID order by NEWID();
--# this way to retrival random Question with answer.

update Tbl_User set Status='1' where UserType='professor' and Username='username'; --#to make acceptance to professor


