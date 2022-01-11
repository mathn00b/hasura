CREATE TABLE IF NOT EXISTS "public"."school_speakers"
(
    "school_id" UUID NOT NULL,
    "speaker_id" UUID NOT NULL,

    PRIMARY KEY ("school_id", "speaker_id"),

    FOREIGN KEY ("school_id") REFERENCES "public"."schools" ("id") ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY ("speaker_id") REFERENCES "public"."speakers" ("id") ON UPDATE cascade ON DELETE cascade
);