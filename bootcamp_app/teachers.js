const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT teachers.name as teacher, 
cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = $1
ORDER BY teacher;`;


const value = [process.argv[2]];

pool.query(queryString, value)
  .then(res => {
    res.rows.forEach(assist => {
      console.log(`${assist.cohort}: ${assist.teacher}`)
    });
  })
  .catch(err => {
    console.error('query error', err.stack);
  });