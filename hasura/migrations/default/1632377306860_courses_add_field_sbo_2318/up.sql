CREATE TABLE IF NOT EXISTS public.course_status
(
        id INTEGER NOT NULL,
        name varchar(32) NOT NULL,

        PRIMARY KEY (id)
);

INSERT INTO public.course_status VALUES
       (1, 'MVP'),
       (2, 'Archived'),
       (3, 'Moderation'),
       (4, 'Published'),
       (5, 'Improve'),
       (6, 'Out_Of_Sale'),
       (7, 'Draft');

ALTER TABLE public.courses
      ADD COLUMN intensity NUMERIC(3,1),
      ADD COLUMN intensity_personal BOOLEAN,
      ADD COLUMN start_date TIMESTAMP WITH TIME ZONE,
      ADD COLUMN end_date TIMESTAMP WITH TIME ZONE,
      ADD COLUMN course_status_id INTEGER,
      ADD COLUMN price_old INTEGER,

      ADD CONSTRAINT course_status_id_fkey
          FOREIGN KEY (course_status_id)
          REFERENCES public.course_status (id);

ALTER TABLE "public"."section"
      ADD COLUMN title VARCHAR(256);

ALTER TABLE public.lessons
      ADD COLUMN section_id uuid;

ALTER TABLE public.course_accesses
      ADD COLUMN expire_date TIMESTAMP WITH TIME ZONE;

ALTER TABLE public.target
      DROP COLUMN picture;
