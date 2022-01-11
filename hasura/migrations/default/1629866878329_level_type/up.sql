CREATE TYPE level_type AS ENUM ('начальный', 'средний', 'продвинутый');
ALTER TABLE public.courses ALTER COLUMN level TYPE level_type USING level::level_type;
