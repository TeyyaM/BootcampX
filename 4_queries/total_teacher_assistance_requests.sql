SELECT 
count(assistance_requests.*) as total_assistances,
teachers.name as name
FROM assistance_requests
LEFT JOIN teachers ON teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;