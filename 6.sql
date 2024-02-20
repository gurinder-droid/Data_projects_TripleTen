SELECT
    start_ts,
    T.weather_conditions,
    duration_seconds
FROM
    trips
    INNER JOIN (
    SELECT ts,
        CASE
            WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
        FROM weather_records)
        T ON T.ts = trips.start_ts
WHERE
    pickup_location_id = 50 AND dropoff_location_id = 63 AND EXTRACT (DOW FROM trips.start_ts) = 6
ORDER BY
    trips.trip_id