-- EXERCÍCIO 1

SELECT users.id, users.name, cities.name AS city
FROM users
JOIN cities
ON users."cityId" = cities.id;

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
