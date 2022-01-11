ALTER TABLE public.lessons
    ADD COLUMN number INT NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS i_lessons_number on lessons (number);