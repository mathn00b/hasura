CREATE TABLE IF NOT EXISTS public.schools
(
    id          uuid                    NOT NULL,
    title       varchar(256)            NOT NULL,
    description text                    NOT NULL,

    created_at  timestamp default now() not null,
    updated_at  timestamp default now() not null,
    deleted_at  timestamp default null,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.edutainments
(
    id         uuid                    NOT NULL,
    name       varchar(256)            NOT NULL,
    about      text                    NOT NULL,
    type       varchar(256)            NOT NULL,
    attachment varchar(32)             NOT NULL,

    school_id  uuid REFERENCES schools NOT NULL,

    created_at timestamp default now() not null,
    updated_at timestamp default now() not null,
    deleted_at timestamp default null,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.courses
(
    id              uuid                    NOT NULL,
    title           varchar(256)            NOT NULL,
    description     text                    NOT NULL,
    about           text                    NOT NULL,
    price           INT                     NOT NULL,
    level           varchar(256)            NOT NULL,
    age             varchar(256)            NOT NULL,

    school_id       uuid REFERENCES schools NOT NULL,

    created_at      timestamp                        default now() not null,
    updated_at      timestamp                        default now() not null,
    deleted_at      timestamp                        default null,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.lessons
(
    id          uuid                    NOT NULL,
    title       varchar(256)            NOT NULL,
    url         varchar(512)            NOT NULL,
    description text                    NOT NULL,
    about       text                    NOT NULL,
    duration    INT                     NOT NULL,
    questions   jsonb                   not null,

    course_id   uuid REFERENCES courses NOT NULL,

    created_at  timestamp default now() not null,
    updated_at  timestamp default now() not null,
    deleted_at  timestamp default null,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.lesson_results
(
    id         uuid                    NOT NULL,
    user_id    uuid                    NOT NULL,
    results    jsonb                   not null,

    lesson_id  uuid REFERENCES lessons NOT NULL,

    created_at timestamp default now() not null,
    updated_at timestamp default now() not null,

    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS i_lesson_results_user_id on lesson_results (user_id, lesson_id);

CREATE TABLE IF NOT EXISTS public.topics
(
    id   uuid NOT NULL,
    name text NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.edutainment_topic
(
    edutainment_id uuid NOT NULL,
    topic_id       uuid NOT NULL,

    PRIMARY KEY (edutainment_id, topic_id),

    CONSTRAINT fk_edutainment_topic_topic
        FOREIGN KEY (topic_id)
            REFERENCES topics (id)
            ON DELETE CASCADE,

    CONSTRAINT fk_edutainment_topic_edutainment
        FOREIGN KEY (edutainment_id)
            REFERENCES edutainments (id)
            ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS public.course_topic
(
    course_id uuid NOT NULL,
    topic_id  uuid NOT NULL,

    PRIMARY KEY (course_id, topic_id),

    CONSTRAINT fk_course_topic_topic
        FOREIGN KEY (topic_id)
            REFERENCES topics (id)
            ON DELETE CASCADE,

    CONSTRAINT fk_course_topic_course
        FOREIGN KEY (course_id)
            REFERENCES courses (id)
            ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.speakers
(
    user_id     uuid         NOT NULL,
    course_id   uuid         NOT NULL,
    user_title  varchar(256) not null,
    description text         NOT NULL,

    PRIMARY KEY (user_id, course_id),

    CONSTRAINT fk_favorites_course
        FOREIGN KEY (course_id)
            REFERENCES courses (id)
            ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.favorites
(
    user_id   uuid NOT NULL,
    course_id uuid NOT NULL,

    PRIMARY KEY (user_id, course_id),

    CONSTRAINT fk_favorites_course
        FOREIGN KEY (course_id)
            REFERENCES courses (id)
            ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS i_speakers_user_id on speakers (user_id);
CREATE INDEX IF NOT EXISTS i_favorites_user_id on favorites (user_id);

CREATE TABLE IF NOT EXISTS public.course_accesses
(
    id         uuid                    NOT NULL,
    user_id    uuid                    NOT NULL,
    creator_id uuid                    NOT NULL,
    course_id  uuid REFERENCES courses NOT NULL,

    reason     text                    NOT NULL,
    expired_at timestamp               not null,

    created_at timestamp default now() not null,
    updated_at timestamp default now() not null,

    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS i_course_accesses_user_id on speakers (user_id, course_id);

CREATE TABLE IF NOT EXISTS public.payments
(
    id         uuid                    NOT NULL,
    user_id    uuid                    NOT NULL,
    price      int                     NOT NULL,

    created_at timestamp default now() not null,

    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS i_payments_user_id on speakers (user_id, course_id);