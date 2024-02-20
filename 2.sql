SELECT
    company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    trips
    INNER JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    (CAST(start_ts AS date) BETWEEN'2017-11-01' AND '2017-11-07') AND
    (company_name LIKE '%Yellow%' OR company_name LIKE '%Blue%')
GROUP BY
    company_name