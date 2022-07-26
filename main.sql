-- EXERCÍCIO 1

SELECT users.id, users.name, cities.name AS city
FROM users
JOIN cities
ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- EXERCÍCIO 2

SELECT testimonials.id, writer.name AS writer, recipient.name AS recipient, testimonials.message
FROM testimonials
JOIN users AS writer
ON testimonials."writerId" = writer.id
JOIN users AS recipient
ON testimonials."recipientId" = recipient.id;

-- EXERCÍCIO 3

SELECT users.id, users.name, courses.name AS course, schools.name AS school, educations."endDate"
FROM educations
JOIN users
ON users.id = educations."userId"
JOIN courses
ON courses.id = educations."courseId"
JOIN schools
ON schools.id = educations."schoolId"
WHERE educations."userId" = 30 AND educations.status = 'finished';


-- EXERCÍCIO 4

SELECT users.id, users.name, roles.name AS "role", companies.name AS company, experiences."startDate"
FROM experiences
JOIN companies
ON companies.id = experiences."companyId"
JOIN roles
ON roles.id = experiences."roleId"
JOIN users
ON users.id = experiences."userId"
WHERE experiences."userId" = 50 AND experiences."endDate" IS NULL;

-- BONUS

SELECT schools.id, schools.name AS school, courses.name AS course, companies.name AS company, roles.name AS "role"
FROM educations
JOIN schools
ON schools.id = educations."schoolId"
JOIN courses
ON courses.id = educations."courseId"
JOIN applicants
ON applicants."userId" = educations."userId"
JOIN jobs
ON jobs.id = applicants."jobId"
JOIN companies
ON companies.id = jobs."companyId"
JOIN roles
ON roles.id = jobs."roleId"
WHERE applicants."jobId" IN (
  SELECT id FROM jobs WHERE "roleId" = (
    SELECT id FROM roles WHERE "name" = 'Software Engineer'
  )
)
AND jobs.active = TRUE
AND companies.id = 10;
