CREATE TABLE IF NOT EXISTS "public"."pre_order"
(
    "course_id" uuid NOT NULL,
    "user_id" uuid NOT NULL,

    FOREIGN KEY ("course_id") REFERENCES "public"."courses" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE CASCADE ON DELETE CASCADE,

    PRIMARY KEY ("course_id", "user_id")
);

