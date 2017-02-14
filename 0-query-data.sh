#!/bin/bash

cat << EOF | mysql racently >marathon-data.tsv
SELECT athlete_id, A.name, gender, YEAR(date) AS year, time
FROM
        race A
JOIN
        race_distance B
ON
        A.distance_id = B.id
JOIN
        result C
ON
        A.id = C.race_id
JOIN
        license D
ON
        D.id = C.license_id
JOIN
	      athlete E
ON
	      E.id = D.athlete_id
WHERE
        B.magnitude = 42.2
        AND
        (A.name LIKE 'Maritzburg%' OR A.name LIKE 'Hillcrest%');
EOF