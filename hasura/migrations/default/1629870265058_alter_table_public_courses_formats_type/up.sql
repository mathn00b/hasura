CREATE TYPE formats_type AS ENUM ('Онлайн-курсы', 'Вебинары', 'Подборки');
ALTER TABLE public.courses ADD COLUMN formats formats_type;
