ALTER TABLE public.target
      ADD COLUMN picture VARCHAR(2083);

ALTER TABLE public.course_accesses
      DROP COLUMN expire_date;

ALTER TABLE public.lessons
      DROP COLUMN section_id;

ALTER TABLE "public"."section"
      DROP COLUMN title;

ALTER TABLE public.courses
      DROP CONSTRAINT course_status_id_fkey,

      DROP COLUMN intensity,
      DROP COLUMN intensity_personal,
      DROP COLUMN start_date,
      DROP COLUMN end_date,
      DROP COLUMN course_status_id,
      DROP COLUMN price_old;

DROP TABLE public.course_status;
