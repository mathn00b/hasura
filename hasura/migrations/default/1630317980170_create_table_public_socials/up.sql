CREATE TABLE "public"."socials" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "type" social_types NOT NULL, "url" varchar NOT NULL, PRIMARY KEY ("id") );
CREATE EXTENSION IF NOT EXISTS pgcrypto;
