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
