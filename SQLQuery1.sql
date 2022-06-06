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


---------------- 2nd assign --------------------

--1. Retrieve a list of MANAGERS.
Select ename,job
FROM EMP
WHERE job='MANAGER'

--2. Find out salary of both MILLER and SMITH. 
select ename,sal
from EMP
where ename IN('MILLER','SMITH')

--3. Find out the names and salaries of all employees earning more than 1000 per month.
select ename,sal
from EMP
WHERE SAL > 1000

--4. Display the names and salaries of all employees except JAMES.
select ename,sal
from EMP
where   ename <> 'JAMES'

--5. Find out the details of employees whose names begin with ‘S’
select *
from EMP
where ename LIKE 'A%'

--6. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename
from EMP
where ename like '%a%'

--7. Find out the names of all employees that have ‘L’ as their third character in their name.
select ename from EMP where ename like '__L%'

--8. Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select ename
from EMP
where ename LIKE 'A%' OR ename LIKE 'M%'

--9. Compute yearly salary of SMITH. 
select ename,sal*12 as "YEAR SAL"
from EMP
where ename='SMITH'

--10. Compute daily salary of JONES. 
SELECT ename, sal/30 as "dailysalary"
from EMP
WHERE ename = 'JONES'

--11. Calculate the total monthly salary of all employees. 
select ename, sum(sal) as "total_salary"
from EMP
group by ename,job

--12. Print the average annual salary. 
select ename, avg(sal*12) as "average salary"
from EMP
group by ename,job

--13. Select the name, job, salary, department number of all employees except 
select ename,job ,sal,DEPTNO
from EMP
group by  ename,job ,sal,DEPTNO


--14. SALESMAN from department number 30. 
select ename,job,deptno
from EMP
where job = 'SALESMAN' AND deptno = 30

--15. List unique departments of the EMP table.
SELECT DISTINCT(deptname) 
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

 --16.List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
  select ename as'employee name', sal as'Mounthly salary' from emp 
 where sal>1500 and deptno in(10,30)

-------------- assignment -3 -----------------------

--1. List the name and salary for all employees whose salary is not in the range of 1500 and 2850
select ename, sal from emp where sal not between 1500 and 2850
. 
--2. Display the name and job of all employees who do not have a MANAGER. 
select ename, job from emp where mngr is null


--3. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000.
select ename,job,sal from emp where job in('MANAGER','ANALYST') and sal not in(1000,3000,5000)
                                                                                    
--4. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%.

select ename,sal,commsn from emp where commsn > sal+sal*.10
 
--5. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
 select ename,job from emp where ename like '%LL%' and deptno in (30) or mngr =7782


--6. Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees. 
 update emp set hiredate='28-SEP-10' where empno in(7654,7900)

  SELECT COUNT(hiredate) AS no_of_employees ,ename
 FROM EMP
 WHERE CONVERT(varchar(3),DATEDIFF(YEAR, HIREDATE, GETDATE()))>10
 AND CONVERT(varchar(3),DATEDIFF(YEAR, HIREDATE, GETDATE()))<20
 GROUP BY ename
  
--7. Retrieve the names of departments in ascending order and their employees in descending order. 
 select deptname,ename from DEPT join emp on dept.DeptNo = emp.deptno
 order by deptname asc , ename desc


--8. Find out experience of MILLER. 
select convert(varchar(5),datediff(year,hiredate,getdate())) as'Experience'
from emp where ename='MILLER'

--9. How many different departments are there in the employee table.
select deptname,count(*) as 'no of departments' from emp join dept on
 dept.deptno= emp.deptno
 group by deptname 


--10. Find out which employee either work in SALES or RESEARCH department. 

 select ename, deptname from emp join dept on emp.deptno=dept.DeptNo 
 where DeptName in('SALES','RESEARCH')

--11. Print the name and average salary of each department. 
 select deptname, avg(sal) as AverageSalary from emp join dept on emp.deptno=dept.DeptNo
 group by DeptName

--12. Select the minimum and maximum salary from employee table.
select min(sal) as minimumsalary, max(sal) as maximumsalary from emp 

--13. Select the minimum and maximum salaries from each department in employee table. 
 select deptname,min(sal) as minimum_salary,max(sal) as maximum_salary from emp join dept
 on emp.deptno=dept.DeptNo 
 group by deptname 

--14. Select the details of employees whose salary is below 1000 and job is CLERK. 
select * from emp where sal<1000 and job = 'CLERK'


-------------------- assignment-4 -------------------

begin
declare @salary float = 50000;
declare @SAL float,@HRA float,@DA float,@PF float,@IT float
declare @Deductions float, @GrossSAlary float, @NetSalary float

--a)HRA  as 10% Of sal

set @HRA = ((@salary)*10/100)
print 'HRA salary is : '+''+cast(@HRA as varchar(15))

--b)DA as  20% of sal

set @DA =((@salary)*20/100)
print 'DA salary is : '+''+cast(@DA as varchar(15))

--c)PF as 8% of sal

set @PF =((@salary)*8/100)
print 'PF salary is : '+''+cast(@PF as varchar(15))



--d)IT as 5% of sal

set @IT =((@salary)*5/100)
print 'IT salary is : '+''+cast(@IT as varchar(15))


--e)Deductions as sum of PF and IT

set @Deductions = @PF+@IT
print 'Deductions is : '+''+cast(@Deductions as varchar(15))


--f)Gross Salary as sum of SAL,HRA,DA and Deductions

set @SAL = @salary -(@HRA+@DA+@Deductions)
set @GrossSAlary = @SAL+(@HRA+@DA+@Deductions)
print 'Gross Salary is : '+''+cast(@GrossSAlary as varchar(15))


--g)Net salary as  Gross salary- Deduction

set @NetSalary = @GrossSAlary-@Deductions
print 'Net Salary is : '+''+cast(@NetSalary as varchar(15))
end

--2.Write a T-SQL Program to find the factorial of a given number.

begin
	declare @num int
	declare @factorial int
	set @num=13
	set @factorial=1
while @num>0
	begin
		set @factorial=@factorial*@num
		set @num=@num-1
	end
	print 'Factorial of a given number is : '+cast(@factorial as varchar)
	
end

--3.Create a stored procedure to generate multiplication tables up to a given number.

create or alter proc Multiplication_Table (@num1 int)
as
begin
 declare @num2 int = 1, @result int
  
  while(@num2<=10)
  begin
    set @result = @num1 * @num2
	print @result

  set @num2 = @num2+1
  end
  end


exec Multiplication_Table @num1=9
