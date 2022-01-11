CREATE TABLE IF NOT EXISTS public.users_settings
(
    user_id uuid NOT NULL,
    theme varchar(256) NOT NULL,

    PRIMARY KEY (user_id)
);
