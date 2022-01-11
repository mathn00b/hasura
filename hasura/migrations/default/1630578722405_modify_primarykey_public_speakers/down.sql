alter table "public"."speakers"
    add constraint "speakers_pkey"
    primary key ("user_id", "course_id");
