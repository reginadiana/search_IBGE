-- Return sun of population of same UF

SELECT  Population FROM
(SELECT * FROM Counties WHERE Code LIKE'?%')
