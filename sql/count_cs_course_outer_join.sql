-- outer join using aggregation to count 
-- the number of CS courses each student took, 
-- including the students 
-- who took no CS courses (with count = 0 for those students)

USE course_small;
SELECT
	t.ID, COUNT(t.course_id)
FROM
	takes AS t
LEFT JOIN
	course AS c ON (t.course_id = c.course_id)
WHERE
	dept_name = 'Comp. Sci.'
GROUP BY
	t.ID
;

SELECT
	t.ID, c.course_id
--     COUNT(c.course_id)
FROM
	takes AS t
LEFT JOIN
	course AS c ON 
		(t.course_id = c.course_id AND dept_name = 'Comp. Sci.')
-- GROUP BY
--  	t.ID
;

SELECT
	t.ID, -- c.course_id
    COUNT(c.course_id)
FROM
	takes AS t
LEFT JOIN
	course AS c ON 
		(t.course_id = c.course_id AND dept_name = 'Comp. Sci.')
-- WHERE
-- 	dept_name = 'Comp. Sci.'
GROUP BY
 	t.ID
;

select count(distinct ID) from takes;