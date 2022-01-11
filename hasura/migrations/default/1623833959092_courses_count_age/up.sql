CREATE VIEW courses_count_age AS
    SELECT age, count(id)
        FROM courses
        GROUP BY age;