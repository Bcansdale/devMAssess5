-- id | customer_id | cupcake_id | num_cupcakes | processed
-- ----+-------------+------------+--------------+-----------
--   1 |           1 |          1 |           10 | t
--   2 |           2 |          4 |            2 | t
--   3 |           1 |          3 |           10 | t
--   4 |           1 |          4 |          200 | t
--   5 |           3 |          5 |            5 | t
--   6 |           1 |          6 |           25 | t
--   7 |           2 |          1 |           10 | f
--   8 |           1 |          1 |           20 | f
--   9 |           3 |          1 |          100 | f
--  10 |           3 |          1 |           75 | f
--  11 |           2 |          5 |            4 | f
--  12 |           3 |          5 |            4 | t
-- (12 rows)

-- id |    name
-- ----+-------------
--   1 | red velvet
--   2 | chocolate
--   3 | carrot cake
--   4 | vanilla
--   5 | funfetti
--   6 | raspberry
-- (6 rows)

-- id |   fname   |   lname   |         email
-- ----+-----------+-----------+------------------------
--   1 | Elizabeth | Crocker   | ecrocker@gmail.com
--   2 | Marie     | Callender | mcallender@hotmail.com
--   3 | Hector    | Boyardee  | hboyardee@yahoo.com
-- (3 rows)



-- PART 1
-- PROBLEM 1
SELECT email FROM customers;
-- email
-- ------------------------
--  ecrocker@gmail.com
--  mcallender@hotmail.com
--  hboyardee@yahoo.com
-- (3 rows)

-- PROBLEM 2
SELECT id
FROM orders
WHERE customer_id IN (
    SELECT id
    FROM customers
    WHERE fname = 'Elizabeth'
    AND lname = 'Crocker');
-- id
-- ----
--   1
--   3
--   4
--   6
--   8
-- (5 rows)

-- PROBLEM 3
SELECT SUM(num_cupcakes)
FROM orders
WHERE processed = FALSE;
-- sum
-- -----
--  209
-- (1 row)


-- PROBLEM 4
SELECT c.name, SUM(o.num_cupcakes) AS total_ordered
FROM cupcakes AS c
    LEFT JOIN orders AS o ON c.id = o.cupcake_id                     GROUP BY c.name
    ORDER BY c.name;
-- name     | total_ordered
-- -------------+---------------
--  carrot cake |            10
--  chocolate   |
--  funfetti    |            13
--  raspberry   |            25
--  red velvet  |           215
--  vanilla     |           202
-- (6 rows)

-- PROBLEM 5
SELECT c.email, SUM(o.num_cupcakes) AS total_ordered
FROM customers AS c
    LEFT JOIN orders AS o ON c.id = o.customer_id
    GROUP BY c.email
    ORDER BY total_ordered DESC;
-- email          | total_ordered
-- ------------------------+---------------
--  ecrocker@gmail.com     |           265
--  hboyardee@yahoo.com    |           184
--  mcallender@hotmail.com |            16
-- (3 rows)

-- PROBLEM 6
SELECT fname, lname, email
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    WHERE cupcake_id = 5 AND processed = true);
-- fname  |  lname   |        email
-- --------+----------+---------------------
--  Hector | Boyardee | hboyardee@yahoo.com
-- (1 row)
----------------------------------------------------------------------------
-- PART 2
-- animal_id | human_id |   name    | species | birth_year
-- -----------+----------+-----------+---------+------------
--          1 |        1 | Fluffy    | cat     |       2010
--          2 |        2 | Squiggles | snake   |       2016
--          3 |        3 | Fido      | dog     |       2015
--          4 |        2 | Birdy     | bird    |       2017
--          5 |        4 | Bubbles   | fish    |
--          6 |        2 | Mr. Hops  | rabbit  |
--          7 |        5 | Bugs      | rabbit  |       2016
--          8 |        1 | Cuddles   | cat     |
--          9 |        5 | Buster    | dog     |       2011
--         10 |        5 | Twinkie   | dog     |       2014
--         11 |        4 | Fluffster | dog     |       2019
--         12 |        1 | Twinkles  | cat     |       2014
-- (12 rows)

-- human_id |  fname  |  lname   |        email
-- ----------+---------+----------+---------------------
--         1 | Bob     | Personne | bpersonne@yahoo.com
--         2 | Jane    | Doe      | jdoe@gmail.com
--         3 | Jasmine | Debugger | jdebugs@hotmail.com
--         4 | John    | Doe      | john_doe@gmail.com
--         5 | Jane    | Hacks    | jhacks@gmail.com
-- (5 rows)

-- STEP 1

-- STEP 2

-- STEP 3