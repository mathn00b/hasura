CREATE VIEW courses_count_level AS
    SELECT level, count(id)
        FROM courses
        GROUP BY level;