
  create table "public"."endings" (
    "id" uuid not null default gen_random_uuid(),
    "letter" text not null,
    "name" text not null,
    "chapter" text not null,
    "type" text not null,
    "guide_url" text,
    "created_at" timestamp with time zone default now(),
    "sort_order" integer not null
      );


alter table "public"."endings" enable row level security;


  create table "public"."profiles" (
    "id" uuid not null,
    "username" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
      );


alter table "public"."profiles" enable row level security;


  create table "public"."sidequests" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null,
    "chapter" text,
    "guide_url" text,
    "created_at" timestamp with time zone default now(),
    "sort_order" integer not null,
    "client" text not null,
    "location" text not null,
    "clearable_by" text[] not null
      );


alter table "public"."sidequests" enable row level security;


  create table "public"."user_endings" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "ending_id" uuid not null,
    "completed" boolean default false,
    "completed_at" timestamp with time zone,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
      );


alter table "public"."user_endings" enable row level security;


  create table "public"."user_sidequests" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "sidequest_id" uuid not null,
    "completed" boolean default false,
    "completed_at" timestamp with time zone,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
      );


alter table "public"."user_sidequests" enable row level security;

CREATE UNIQUE INDEX endings_pkey ON public.endings USING btree (id);

CREATE INDEX idx_profiles_id ON public.profiles USING btree (id);

CREATE INDEX idx_user_endings_user_id ON public.user_endings USING btree (user_id);

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX profiles_username_key ON public.profiles USING btree (username);

CREATE UNIQUE INDEX sidequests_pkey ON public.sidequests USING btree (id);

CREATE UNIQUE INDEX user_endings_pkey ON public.user_endings USING btree (id);

CREATE UNIQUE INDEX user_endings_user_id_ending_id_key ON public.user_endings USING btree (user_id, ending_id);

CREATE UNIQUE INDEX user_sidequests_pkey ON public.user_sidequests USING btree (id);

CREATE UNIQUE INDEX user_sidequests_user_id_ending_id_key ON public.user_sidequests USING btree (user_id, sidequest_id);

CREATE INDEX user_sidequests_user_id_idx ON public.user_sidequests USING btree (user_id);

alter table "public"."endings" add constraint "endings_pkey" PRIMARY KEY using index "endings_pkey";

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."sidequests" add constraint "sidequests_pkey" PRIMARY KEY using index "sidequests_pkey";

alter table "public"."user_endings" add constraint "user_endings_pkey" PRIMARY KEY using index "user_endings_pkey";

alter table "public"."user_sidequests" add constraint "user_sidequests_pkey" PRIMARY KEY using index "user_sidequests_pkey";

alter table "public"."profiles" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_id_fkey";

alter table "public"."profiles" add constraint "profiles_username_key" UNIQUE using index "profiles_username_key";

alter table "public"."user_endings" add constraint "user_endings_ending_id_fkey" FOREIGN KEY (ending_id) REFERENCES public.endings(id) ON DELETE CASCADE not valid;

alter table "public"."user_endings" validate constraint "user_endings_ending_id_fkey";

alter table "public"."user_endings" add constraint "user_endings_user_id_ending_id_key" UNIQUE using index "user_endings_user_id_ending_id_key";

alter table "public"."user_endings" add constraint "user_endings_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."user_endings" validate constraint "user_endings_user_id_fkey";

alter table "public"."user_sidequests" add constraint "user_sidequests_sidequest_id_fkey" FOREIGN KEY (sidequest_id) REFERENCES public.sidequests(id) not valid;

alter table "public"."user_sidequests" validate constraint "user_sidequests_sidequest_id_fkey";

alter table "public"."user_sidequests" add constraint "user_sidequests_user_id_ending_id_key" UNIQUE using index "user_sidequests_user_id_ending_id_key";

alter table "public"."user_sidequests" add constraint "user_sidequests_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."user_sidequests" validate constraint "user_sidequests_user_id_fkey";

grant delete on table "public"."endings" to "anon";

grant insert on table "public"."endings" to "anon";

grant references on table "public"."endings" to "anon";

grant select on table "public"."endings" to "anon";

grant trigger on table "public"."endings" to "anon";

grant truncate on table "public"."endings" to "anon";

grant update on table "public"."endings" to "anon";

grant delete on table "public"."endings" to "authenticated";

grant insert on table "public"."endings" to "authenticated";

grant references on table "public"."endings" to "authenticated";

grant select on table "public"."endings" to "authenticated";

grant trigger on table "public"."endings" to "authenticated";

grant truncate on table "public"."endings" to "authenticated";

grant update on table "public"."endings" to "authenticated";

grant delete on table "public"."endings" to "service_role";

grant insert on table "public"."endings" to "service_role";

grant references on table "public"."endings" to "service_role";

grant select on table "public"."endings" to "service_role";

grant trigger on table "public"."endings" to "service_role";

grant truncate on table "public"."endings" to "service_role";

grant update on table "public"."endings" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."sidequests" to "anon";

grant insert on table "public"."sidequests" to "anon";

grant references on table "public"."sidequests" to "anon";

grant select on table "public"."sidequests" to "anon";

grant trigger on table "public"."sidequests" to "anon";

grant truncate on table "public"."sidequests" to "anon";

grant update on table "public"."sidequests" to "anon";

grant delete on table "public"."sidequests" to "authenticated";

grant insert on table "public"."sidequests" to "authenticated";

grant references on table "public"."sidequests" to "authenticated";

grant select on table "public"."sidequests" to "authenticated";

grant trigger on table "public"."sidequests" to "authenticated";

grant truncate on table "public"."sidequests" to "authenticated";

grant update on table "public"."sidequests" to "authenticated";

grant delete on table "public"."sidequests" to "postgres";

grant insert on table "public"."sidequests" to "postgres";

grant references on table "public"."sidequests" to "postgres";

grant select on table "public"."sidequests" to "postgres";

grant trigger on table "public"."sidequests" to "postgres";

grant truncate on table "public"."sidequests" to "postgres";

grant update on table "public"."sidequests" to "postgres";

grant delete on table "public"."sidequests" to "service_role";

grant insert on table "public"."sidequests" to "service_role";

grant references on table "public"."sidequests" to "service_role";

grant select on table "public"."sidequests" to "service_role";

grant trigger on table "public"."sidequests" to "service_role";

grant truncate on table "public"."sidequests" to "service_role";

grant update on table "public"."sidequests" to "service_role";

grant delete on table "public"."user_endings" to "anon";

grant insert on table "public"."user_endings" to "anon";

grant references on table "public"."user_endings" to "anon";

grant select on table "public"."user_endings" to "anon";

grant trigger on table "public"."user_endings" to "anon";

grant truncate on table "public"."user_endings" to "anon";

grant update on table "public"."user_endings" to "anon";

grant delete on table "public"."user_endings" to "authenticated";

grant insert on table "public"."user_endings" to "authenticated";

grant references on table "public"."user_endings" to "authenticated";

grant select on table "public"."user_endings" to "authenticated";

grant trigger on table "public"."user_endings" to "authenticated";

grant truncate on table "public"."user_endings" to "authenticated";

grant update on table "public"."user_endings" to "authenticated";

grant delete on table "public"."user_endings" to "service_role";

grant insert on table "public"."user_endings" to "service_role";

grant references on table "public"."user_endings" to "service_role";

grant select on table "public"."user_endings" to "service_role";

grant trigger on table "public"."user_endings" to "service_role";

grant truncate on table "public"."user_endings" to "service_role";

grant update on table "public"."user_endings" to "service_role";

grant delete on table "public"."user_sidequests" to "anon";

grant insert on table "public"."user_sidequests" to "anon";

grant references on table "public"."user_sidequests" to "anon";

grant select on table "public"."user_sidequests" to "anon";

grant trigger on table "public"."user_sidequests" to "anon";

grant truncate on table "public"."user_sidequests" to "anon";

grant update on table "public"."user_sidequests" to "anon";

grant delete on table "public"."user_sidequests" to "authenticated";

grant insert on table "public"."user_sidequests" to "authenticated";

grant references on table "public"."user_sidequests" to "authenticated";

grant select on table "public"."user_sidequests" to "authenticated";

grant trigger on table "public"."user_sidequests" to "authenticated";

grant truncate on table "public"."user_sidequests" to "authenticated";

grant update on table "public"."user_sidequests" to "authenticated";

grant delete on table "public"."user_sidequests" to "postgres";

grant insert on table "public"."user_sidequests" to "postgres";

grant references on table "public"."user_sidequests" to "postgres";

grant select on table "public"."user_sidequests" to "postgres";

grant trigger on table "public"."user_sidequests" to "postgres";

grant truncate on table "public"."user_sidequests" to "postgres";

grant update on table "public"."user_sidequests" to "postgres";

grant delete on table "public"."user_sidequests" to "service_role";

grant insert on table "public"."user_sidequests" to "service_role";

grant references on table "public"."user_sidequests" to "service_role";

grant select on table "public"."user_sidequests" to "service_role";

grant trigger on table "public"."user_sidequests" to "service_role";

grant truncate on table "public"."user_sidequests" to "service_role";

grant update on table "public"."user_sidequests" to "service_role";


  create policy "Enable read access for all users"
  on "public"."endings"
  as permissive
  for select
  to public
using (true);



  create policy "Authenticated can insert own profile"
  on "public"."profiles"
  as permissive
  for insert
  to authenticated
with check ((auth.uid() = id));



  create policy "Users can read their own profile"
  on "public"."profiles"
  as permissive
  for select
  to authenticated
using ((auth.uid() = id));



  create policy "Users can update their own profile"
  on "public"."profiles"
  as permissive
  for update
  to authenticated
using ((auth.uid() = id))
with check ((auth.uid() = id));



  create policy "Enable read access for all users"
  on "public"."sidequests"
  as permissive
  for select
  to public
using (true);



  create policy "Users can delete their own user_endings"
  on "public"."user_endings"
  as permissive
  for delete
  to authenticated
using ((auth.uid() = user_id));



  create policy "Users can insert their own user_endings"
  on "public"."user_endings"
  as permissive
  for insert
  to authenticated
with check ((auth.uid() = user_id));



  create policy "Users can read their own user_endings"
  on "public"."user_endings"
  as permissive
  for select
  to authenticated
using ((auth.uid() = user_id));



  create policy "Users can update their own user_endings"
  on "public"."user_endings"
  as permissive
  for update
  to authenticated
using ((auth.uid() = user_id))
with check ((auth.uid() = user_id));



  create policy "Users can delete their own user_sidequests"
  on "public"."user_sidequests"
  as permissive
  for delete
  to authenticated
using ((auth.uid() = user_id));



  create policy "Users can insert their own user_sidequests"
  on "public"."user_sidequests"
  as permissive
  for insert
  to authenticated
with check ((auth.uid() = user_id));



  create policy "Users can read their own user_sidequests"
  on "public"."user_sidequests"
  as permissive
  for select
  to authenticated
using ((auth.uid() = user_id));



  create policy "Users can update their own user_sidequests"
  on "public"."user_sidequests"
  as permissive
  for update
  to authenticated
using ((auth.uid() = user_id))
with check ((auth.uid() = user_id));



