use course_small;
show tables;
SELECT
   i.name, i.dept_name, d.building, count(course_id)
FROM
   instructor AS i
JOIN
	teaches t USING(ID)
JOIN
	department d ON (i.dept_name = d.dept_name)
GROUP BY
	i.ID
;

SELECT
	DISTINCT s.ID, s.name, count(c.course_id) AS course_count -- , c.title, c.credits
FROM
	student AS s
JOIN
	takes AS t ON (s.ID = t.ID)
JOIN
	course AS c ON (t.course_id = c.course_id AND c.credits = 3)
-- WHERE
GROUP BY
	s.ID
HAVING
	course_count > 1
ORDER BY
    s.ID
;