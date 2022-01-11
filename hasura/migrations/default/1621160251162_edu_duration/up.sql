ALTER TABLE public.edutainments
    ADD COLUMN duration INT NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS public.edutainments_favorites
(
    user_id   uuid NOT NULL,
    edutainment_id uuid NOT NULL,

    PRIMARY KEY (user_id, edutainment_id),

    CONSTRAINT fk_favorites_edutainment
    FOREIGN KEY (edutainment_id)
    REFERENCES edutainments (id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS i_edutainments_favorites_user_id on edutainments_favorites (user_id);