SELECT Title FROM
(SELECT * FROM Counties WHERE Code LIKE"?%")
ORDER BY Population DESC LIMIT 10;