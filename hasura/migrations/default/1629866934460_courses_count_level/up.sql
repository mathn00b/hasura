CREATE OR REPLACE VIEW "public"."courses_count_level" AS
 SELECT courses.level,
    count(courses.id) AS count
   FROM courses
  GROUP BY courses.level;
