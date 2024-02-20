SELECT
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    trips
    INNER JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    CAST(start_ts AS date) = '2017-11-15' OR CAST(start_ts AS date) = '2017-11-16'
GROUP BY
    company_name
ORDER BY
   trips_amount DESC;