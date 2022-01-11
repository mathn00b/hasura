ALTER TABLE "public"."course_accesses"
    DROP COLUMN "id",
    DROP COLUMN "creator_id",
    DROP COLUMN "reason",
    DROP COLUMN "expired_at",
    DROP COLUMN "created_at",
    DROP COLUMN "updated_at";

ALTER TABLE "public"."course_accesses"
    ADD CONSTRAINT "course_accesses_pkey" PRIMARY KEY (user_id, course_id);

ALTER TABLE "public"."course_accesses"
    ADD CONSTRAINT "course_accesses_user_id_fkey"
        FOREIGN KEY (user_id) REFERENCES users (id);
