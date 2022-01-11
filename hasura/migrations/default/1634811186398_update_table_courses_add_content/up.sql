ALTER TABLE public.courses
    ADD COLUMN content jsonb default null;

COMMENT ON COLUMN public.courses.content is 'Упорядоченное содержимое курса';