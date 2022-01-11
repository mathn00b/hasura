CREATE TABLE IF NOT EXISTS public.payments
(
    id         uuid                    NOT NULL,
    user_id    uuid                    NOT NULL,
    price      int                     NOT NULL,

    created_at timestamp default now() not null,

    PRIMARY KEY (id)
);