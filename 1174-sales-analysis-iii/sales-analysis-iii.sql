/* Write your PL/SQL query statement below */
SELECT
    DISTINCT p.product_id, p.product_name
FROM
    Product p INNER JOIN Sales s ON p.product_id = s.product_id
WHERE
    sale_date BETWEEN '2019-01-01' AND '2019-03-31' AND p.product_id NOT IN (
        SELECT
            p.product_id
        FROM
            Product p INNER JOIN Sales s ON p.product_id = s.product_id 
        WHERE
            sale_date < '2019-01-01' or sale_date > '2019-03-31'
    )