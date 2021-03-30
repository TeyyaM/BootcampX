SELECT 
count(assistance_requests.*) as total_assistances,
students.name as name
FROM assistance_requests
LEFT JOIN students ON student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;