CREATE TABLE IF NOT EXISTS public.courses_additional_files
(
    id   uuid NOT NULL,
    course_id uuid NOT NULL,
    url varchar(256) NOT NULL,
    title varchar(256) NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_courses_additional_files
        FOREIGN KEY (course_id)
            REFERENCES courses (id)
            ON DELETE CASCADE
);
