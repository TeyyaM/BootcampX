SELECT cohorts.name as cohort,
count(assignment_submissions.*) as total_submissions
FROM cohorts
LEFT JOIN students ON cohorts.id = students.cohort_id
LEFT JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohort
ORDER BY total_submissions DESC;