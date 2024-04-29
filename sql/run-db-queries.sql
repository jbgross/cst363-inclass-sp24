use rundb;
WITH fastest_time AS
	(SELECT
		min(run.run_time), race.raceid
	FROM
		run
	JOIN
		race ON (run.raceid = race.raceid)
	GROUP BY
		race.raceid)
SELECT
	runner.runnername,
	runner.runnerid, 
	run.run_time, 
	race.race_name,
	race.distance
FROM
	runner
JOIN
	run ON (runner.runnerid = run.runnerid)
JOIN
race ON (run.raceid = race.raceid) 
WHERE
	EXISTS (SELECT * from fastest_time 
    WHERE raceid = run.raceid AND run_time = run.run_time)
;


SELECT
    count(DISTINCT run.runnerid) AS count,
    race.race_name,
    race.distance
FROM
    run
JOIN
    race ON (run.raceid = race.raceid)
GROUP BY
    race.raceid
ORDER BY
   count DESC;

SELECT
    count(run.runnerid) AS count,
    race.race_name,
    race.distance,
    run.rundate
FROM
    run
JOIN
    race ON (run.raceid = race.raceid)
WHERE
    run.run_time IS NULL
GROUP BY
   run.raceid,
   run.rundate
HAVING
  count >= 1;

