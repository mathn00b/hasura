CREATE TABLE IF NOT EXISTS public.orgform
(
        id SERIAL,
        title VARCHAR(256) NOT NULL,

        PRIMARY KEY (id)
);

INSERT INTO public.orgform (title) VALUES
       ('Юридическое лицо'),
       ('Индивидуальный предприниматель'),
       ('Самозанятый'),
       ('Физ.лицо');

CREATE TABLE IF NOT EXISTS public.vendorinfo
(
        user_id uuid UNIQUE NOT NULL,
        title VARCHAR(256) NOT NULL,
        orgform_id INTEGER NOT NULL,
        tin CHAR(12) NOT NULL,
        shop_id VARCHAR(256),

        FOREIGN KEY (orgform_id) REFERENCES public.orgform (id)
);
