CREATE TABLE "public"."rating_comment" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "course_id" UUID NOT NULL DEFAULT gen_random_uuid(), "rating" Numeric(2, 1) NOT NULL, "comment" varchar(2500), PRIMARY KEY ("id") , FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON UPDATE restrict ON DELETE restrict);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
