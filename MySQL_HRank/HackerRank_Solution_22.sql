-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

select N,
CASE
    WHEN P IS NULL then 'Root'
    WHEN NOT EXISTS (SELECT N FROM BST child WHERE child.P = BST.N) THEN 'Leaf'
    ELSE 'Inner'
END
from BST order by N;