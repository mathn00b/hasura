ALTER TABLE public.courses
    ADD COLUMN has_mentor BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE public.courses
    ADD COLUMN has_certificate BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE public.courses
    ADD COLUMN has_diploma BOOLEAN NOT NULL DEFAULT FALSE;