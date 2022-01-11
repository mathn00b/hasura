ALTER TABLE "public"."course_accesses"
    ADD COLUMN "id" uuid NOT NULL,
    ADD COLUMN "creator_id" uuid NOT NULL,
    ADD COLUMN "reason" text NOT NULL,
    ADD COLUMN "expired_at" timestamp not null,
    ADD COLUMN "created_at" timestamp default now() not null,
    ADD COLUMN "updated_at" timestamp default now() not null;

ALTER TABLE "public"."course_accesses"
DROP CONSTRAINT "course_accesses_pkey";

ALTER TABLE "public"."course_accesses"
DROP CONSTRAINT "course_accesses_user_id_fkey";