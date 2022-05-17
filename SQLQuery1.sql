create database wipro
create table EMP(empno int , ename varchar(30), job varchar(20),
  mngr varchar(15), hiredate varchar(10), sal INT, commsn int, deptno int) 
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values (7369,'SMITH','CLERK',7902, '17-DEC-80', 800, NULL ,20)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values (7499, 'ALLEN' ,'SALESMAN' ,7698,'20-FEB-81' ,1600, 300 ,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values  (7521,'WARD', 'SALESMAN', 7698, '22-FEB-81' ,1250 ,500,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values (7566,'JONES','MANAGER' ,7839,'02-APR-81' ,2975,NULL , 20)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values (7654,' MARTIN' ,'SALESMAN' ,7698,'28-SEP-81',1250 ,1400,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7698,'BLAKE' ,'MANAGER ',7839, '01-MAY-81', 2850, NULL,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7782 ,'CLARK', 'MANAGER', 7839 ,'09-JUN-81' ,2450, NULL,10)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7788 ,'SCOTT' ,'ANALYST'  ,7566 ,'19-APR-87',3000,NULL,20)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7839  ,'KING' ,'PRESIDENT',      null  ,'17-NOV-81',5000,NULL,10)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7844  ,'TURNER'  ,'SALESMAN' ,7698 ,'08-SEP-81' ,1500 , 0 ,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7876   ,'ADAMS'   ,'CLERK'    ,7788 ,'23-MAY-87' ,1100 ,NULL,20)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7900   ,'JAMES'   ,'CLERK '   ,7698  ,'03-DEC-81' , 950  ,NULL,30)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values(7902  , 'FORD'    ,'ANALYST'  ,7566  ,'03-DEC-81' ,3000 , NULL, 20)
insert into EMP (empno,ename,job,mngr,hiredate,sal,commsn,deptno) values( 7934    ,'MILLER'  ,'CLERK'   , 7782 , '23-JAN-82' ,1300  , NULL ,10)


create table DEPT(deptno int, deptname varchar(15), loct varchar(25))
insert into DEPT(deptno,deptname ,loct) VALUES (10,'ACCOUNTING','NEW YORK')
insert into DEPT(deptno,deptname ,loct) VALUES (20,'RESEARCH','DALLAS' )
insert into DEPT(deptno,deptname ,loct) VALUES (30,'SALES','CHICAGO' )
insert into DEPT(deptno,deptname ,loct) VALUES (40,'OPERATIONS','BOSTON')
select * from EMP
select * from DEPT
 
 ---------------  Tasks  --------------

 --1. List all employees whose name begins with 'A'. 
 select * from EMP where ename like'A%'

 --2.Select all those employees who don't have a manager.
 select * from EMP where mngr is null

 --3.List employee name, number and salary for those employees who earn in the range 1200 to 1400.
 select * from EMP where sal between 1200 and 1400

 --4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
select SAL+SAL*10/100 as "10% payrise"
from EMP
Where DEPTNO in (select DEPTNO 
from DEPT
 where DeptName='RESEARCH')

 --5. Find the number of CLERKS employed. Give it a descriptive heading. 
 Select job,Count(job) as NO_OF_CLERKS
FROM EMP
WHERE job='CLERK'
GROUP BY job

--6. Find the average salary for each job type and the number of people employed in each job.
select job,AVG(sal) as avgsalary ,count(job) as NO_OF_PEOPLE
FROM EMP
GROUP BY job

--7. List the employees with the lowest and highest salary.
select Max(sal) as "max_salary" ,min(sal) as "min_salary"
FROM EMP

--8. List full details of departments that don't have any employees.
select * from DEPT
where DEPTNO
not in (select DEPTNO from EMP)

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name.
select ENAME,SAL
from EMP
where job ='ANALYST' AND DeptNo=20
order by ename asc

--10. For each department, list its name and number together with the total salary paid to employees in that department.

select job ,DEPTNO, sum(sal) as "total_salary"
from EMP
group by job,deptno

--11. Find out salary of both MILLER and SMITH.
select ename,sal
from EMP
where ename IN('MILLER','SMITH')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select ename
from EMP
where ename LIKE 'A%' OR ename LIKE 'M%'

--13. Compute yearly salary of SMITH.
select ename,sal*12 as "YEAR SAL"
from EMP
where ename='SMITH'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850.
select ename ,sal
from EMP
where sal not between 1500 and 2850