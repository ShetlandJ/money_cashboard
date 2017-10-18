SELECT tags.t_name, COUNT(transactions.tag_id)
FROM transactions
JOIN tags
ON tags.id = transactions.tag_id
WHERE EXTRACT(month FROM transaction_date) = $1
GROUP BY tags.t_name
ORDER BY COUNT(transactions.tag_id) DESC LIMIT 1;
