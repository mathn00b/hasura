CREATE TABLE public.document_preview (
    id            uuid NOT NULL DEFAULT gen_random_uuid(),
    document_id   uuid NOT NULL,
    image_url     varchar(250),
    sort_order    smallint NOT NULL,

    PRIMARY KEY (id) ,
    UNIQUE ("sort_order"),
    FOREIGN KEY (document_id) REFERENCES public.courses_additional_files(id) ON UPDATE cascade ON DELETE cascade
);
