ALTER TABLE public.edutainments
    ADD COLUMN exclusive BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE public.courses
    ADD COLUMN video_url varchar(256);