CREATE TABLE IF NOT EXISTS public.topics_favorites
(
    user_id uuid NOT NULL,
    topic_id uuid NOT NULL,

    PRIMARY KEY (user_id, topic_id),

    CONSTRAINT fk_topics_favorites_topic
    FOREIGN KEY (topic_id)
    REFERENCES topics (id)
    ON DELETE CASCADE
);
