ALTER TABLE public.edutainments
    ADD COLUMN video_url varchar(256);

ALTER TABLE public.lessons
    ADD COLUMN video_url varchar(256);