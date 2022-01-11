CREATE TABLE IF NOT EXISTS public.courses_users_views
(
    user_id uuid NOT NULL,
    lesson_id uuid NOT NULL,
    duration int,

    PRIMARY KEY (user_id, lesson_id),

    CONSTRAINT fk_courses_users_views_lesson
    FOREIGN KEY (lesson_id)
    REFERENCES lessons (id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS i_courses_users_views_user_id on courses_users_views (user_id);