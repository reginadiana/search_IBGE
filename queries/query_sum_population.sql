SELECT Population FROM (SELECT * FROM Counties WHERE Code LIKE'?%' OR Title LIKE '%?%')
