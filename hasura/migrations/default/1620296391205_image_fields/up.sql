ALTER TABLE public.courses
    ADD COLUMN image varchar(256);

ALTER TABLE public.lessons
    ADD COLUMN image varchar(256);

ALTER TABLE public.edutainments
    ADD COLUMN image varchar(256);