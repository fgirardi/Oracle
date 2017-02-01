/*
LISTAGG Analytic Function in 11g Release 2

The LISTAGG analytic function was introduced in Oracle 11g Release 2, making it very easy to aggregate strings. 
The nice thing about this function is it also allows us to order the elements in the concatenated list. 
If you are using 11g Release 2 you should use this function for string aggregation.

COLUMN employees FORMAT A50
*/

SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) AS employees
FROM   emp
GROUP BY deptno;