SELECT teacher, cohort, count(*) as total_assistances
FROM 
  (SELECT 
    teachers.name as teacher, 
    cohorts.name as cohort
  FROM assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name = 'JUL02') 
  as name_of_teachers_that_assisted
GROUP BY teacher, cohort
ORDER BY teacher;