CREATE TABLE "public"."section" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "course_id" uuid NOT NULL DEFAULT gen_random_uuid(), "sort_order" smallserial NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("sort_order"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
