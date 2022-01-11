ALTER TABLE public.users
ADD COLUMN middle_name varchar,
ADD COLUMN email varchar,
ADD COLUMN phone varchar,
ADD COLUMN created_at date NOT NULL DEFAULT now(),
ADD COLUMN updated_at date NOT NULL DEFAULT now(),
ADD COLUMN birth_date date;
