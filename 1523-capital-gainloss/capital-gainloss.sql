
SELECT stock_name,
SUM(CASE WHEN operation='Sell' Then price ELSE - price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name
