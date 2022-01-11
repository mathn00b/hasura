CREATE TABLE IF NOT EXISTS "public"."document_preview"
(
    "id"          uuid NOT NULL,
    "document_id" uuid NOT NULL,
    "image_url"   varchar(250) NOT NULL,
    "sort_order"  smallserial NOT NULL,

    FOREIGN KEY ("document_id") REFERENCES "public"."course_additional_files" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY ("id")
);