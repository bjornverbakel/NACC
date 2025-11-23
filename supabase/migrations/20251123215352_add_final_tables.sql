create table "public"."archives" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "type" text not null,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."archives" enable row level security;
create table "public"."enemies" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "variant" text,
  "type" text not null,
  "acquisition" text,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."enemies" enable row level security;
create table "public"."fish" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "location" text [] not null,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."fish" enable row level security;
create table "public"."novels" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "acquisition" text not null,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."novels" enable row level security;
create table "public"."pod_programs" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "acquisition" text not null,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."pod_programs" enable row level security;
create table "public"."user_archives" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "archive_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_archives" enable row level security;
create table "public"."user_enemies" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "enemy_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_enemies" enable row level security;
create table "public"."user_fish" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "fish_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_fish" enable row level security;
create table "public"."user_novels" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "novel_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_novels" enable row level security;
create table "public"."user_pod_programs" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "pod_program_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_pod_programs" enable row level security;
create table "public"."user_weapons" (
  "id" uuid not null default gen_random_uuid(),
  "user_id" uuid not null,
  "weapon_id" uuid not null,
  "completed" boolean default false,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone default now(),
  "updated_at" timestamp with time zone default now()
);
alter table "public"."user_weapons" enable row level security;
create table "public"."weapons" (
  "id" uuid not null default gen_random_uuid(),
  "name" text not null,
  "type" text not null,
  "acquisition" text not null,
  "guide_url" text,
  "created_at" timestamp with time zone default now(),
  "sort_order" integer not null
);
alter table "public"."weapons" enable row level security;
CREATE UNIQUE INDEX archives_pkey ON public.archives USING btree (id);
CREATE UNIQUE INDEX enemies_pkey ON public.enemies USING btree (id);
CREATE UNIQUE INDEX fish_pkey ON public.fish USING btree (id);
CREATE UNIQUE INDEX novels_pkey ON public.novels USING btree (id);
CREATE UNIQUE INDEX pod_programs_pkey ON public.pod_programs USING btree (id);
CREATE UNIQUE INDEX user_archives_pkey ON public.user_archives USING btree (id);
CREATE UNIQUE INDEX user_archives_user_id_ending_id_key ON public.user_archives USING btree (user_id, archive_id);
CREATE INDEX user_archives_user_id_idx ON public.user_archives USING btree (user_id);
CREATE UNIQUE INDEX user_enemies_pkey ON public.user_enemies USING btree (id);
CREATE UNIQUE INDEX user_enemies_user_id_ending_id_key ON public.user_enemies USING btree (user_id, enemy_id);
CREATE INDEX user_enemies_user_id_idx ON public.user_enemies USING btree (user_id);
CREATE UNIQUE INDEX user_fish_pkey ON public.user_fish USING btree (id);
CREATE UNIQUE INDEX user_fish_user_id_ending_id_key ON public.user_fish USING btree (user_id, fish_id);
CREATE INDEX user_fish_user_id_idx ON public.user_fish USING btree (user_id);
CREATE UNIQUE INDEX user_novels_pkey ON public.user_novels USING btree (id);
CREATE UNIQUE INDEX user_novels_user_id_ending_id_key ON public.user_novels USING btree (user_id, novel_id);
CREATE INDEX user_novels_user_id_idx ON public.user_novels USING btree (user_id);
CREATE UNIQUE INDEX user_pod_programs_pkey ON public.user_pod_programs USING btree (id);
CREATE UNIQUE INDEX user_pod_programs_user_id_ending_id_key ON public.user_pod_programs USING btree (user_id, pod_program_id);
CREATE INDEX user_pod_programs_user_id_idx ON public.user_pod_programs USING btree (user_id);
CREATE UNIQUE INDEX user_weapons_pkey ON public.user_weapons USING btree (id);
CREATE UNIQUE INDEX user_weapons_user_id_ending_id_key ON public.user_weapons USING btree (user_id, weapon_id);
CREATE INDEX user_weapons_user_id_idx ON public.user_weapons USING btree (user_id);
CREATE UNIQUE INDEX weapons_pkey ON public.weapons USING btree (id);
alter table "public"."archives"
add constraint "archives_pkey" PRIMARY KEY using index "archives_pkey";
alter table "public"."enemies"
add constraint "enemies_pkey" PRIMARY KEY using index "enemies_pkey";
alter table "public"."fish"
add constraint "fish_pkey" PRIMARY KEY using index "fish_pkey";
alter table "public"."novels"
add constraint "novels_pkey" PRIMARY KEY using index "novels_pkey";
alter table "public"."pod_programs"
add constraint "pod_programs_pkey" PRIMARY KEY using index "pod_programs_pkey";
alter table "public"."user_archives"
add constraint "user_archives_pkey" PRIMARY KEY using index "user_archives_pkey";
alter table "public"."user_enemies"
add constraint "user_enemies_pkey" PRIMARY KEY using index "user_enemies_pkey";
alter table "public"."user_fish"
add constraint "user_fish_pkey" PRIMARY KEY using index "user_fish_pkey";
alter table "public"."user_novels"
add constraint "user_novels_pkey" PRIMARY KEY using index "user_novels_pkey";
alter table "public"."user_pod_programs"
add constraint "user_pod_programs_pkey" PRIMARY KEY using index "user_pod_programs_pkey";
alter table "public"."user_weapons"
add constraint "user_weapons_pkey" PRIMARY KEY using index "user_weapons_pkey";
alter table "public"."weapons"
add constraint "weapons_pkey" PRIMARY KEY using index "weapons_pkey";
alter table "public"."user_archives"
add constraint "user_archives_archive_id_fkey" FOREIGN KEY (archive_id) REFERENCES public.archives(id) not valid;
alter table "public"."user_archives" validate constraint "user_archives_archive_id_fkey";
alter table "public"."user_archives"
add constraint "user_archives_user_id_ending_id_key" UNIQUE using index "user_archives_user_id_ending_id_key";
alter table "public"."user_archives"
add constraint "user_archives_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_archives" validate constraint "user_archives_user_id_fkey";
alter table "public"."user_enemies"
add constraint "user_enemies_user_id_ending_id_key" UNIQUE using index "user_enemies_user_id_ending_id_key";
alter table "public"."user_enemies"
add constraint "user_enemies_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_enemies" validate constraint "user_enemies_user_id_fkey";
alter table "public"."user_enemies"
add constraint "user_enemies_weapon_id_fkey1" FOREIGN KEY (enemy_id) REFERENCES public.enemies(id) not valid;
alter table "public"."user_enemies" validate constraint "user_enemies_weapon_id_fkey1";
alter table "public"."user_fish"
add constraint "user_fish_fish_id_fkey" FOREIGN KEY (fish_id) REFERENCES public.fish(id) not valid;
alter table "public"."user_fish" validate constraint "user_fish_fish_id_fkey";
alter table "public"."user_fish"
add constraint "user_fish_user_id_ending_id_key" UNIQUE using index "user_fish_user_id_ending_id_key";
alter table "public"."user_fish"
add constraint "user_fish_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_fish" validate constraint "user_fish_user_id_fkey";
alter table "public"."user_novels"
add constraint "user_novels_novel_id_fkey" FOREIGN KEY (novel_id) REFERENCES public.novels(id) not valid;
alter table "public"."user_novels" validate constraint "user_novels_novel_id_fkey";
alter table "public"."user_novels"
add constraint "user_novels_user_id_ending_id_key" UNIQUE using index "user_novels_user_id_ending_id_key";
alter table "public"."user_novels"
add constraint "user_novels_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_novels" validate constraint "user_novels_user_id_fkey";
alter table "public"."user_pod_programs"
add constraint "user_pod_programs_pod_program_id_fkey" FOREIGN KEY (pod_program_id) REFERENCES public.pod_programs(id) not valid;
alter table "public"."user_pod_programs" validate constraint "user_pod_programs_pod_program_id_fkey";
alter table "public"."user_pod_programs"
add constraint "user_pod_programs_user_id_ending_id_key" UNIQUE using index "user_pod_programs_user_id_ending_id_key";
alter table "public"."user_pod_programs"
add constraint "user_pod_programs_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_pod_programs" validate constraint "user_pod_programs_user_id_fkey";
alter table "public"."user_weapons"
add constraint "user_weapons_user_id_ending_id_key" UNIQUE using index "user_weapons_user_id_ending_id_key";
alter table "public"."user_weapons"
add constraint "user_weapons_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."user_weapons" validate constraint "user_weapons_user_id_fkey";
alter table "public"."user_weapons"
add constraint "user_weapons_weapon_id_fkey" FOREIGN KEY (weapon_id) REFERENCES public.weapons(id) not valid;
alter table "public"."user_weapons" validate constraint "user_weapons_weapon_id_fkey";
set check_function_bodies = off;
CREATE OR REPLACE FUNCTION public.get_user_id() RETURNS uuid LANGUAGE sql STABLE SECURITY DEFINER
SET search_path TO 'public',
  'pg_temp' AS $function$
SELECT auth.uid();
$function$;
CREATE OR REPLACE FUNCTION public.handle_new_user() RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER
SET search_path TO 'public' AS $function$ BEGIN
INSERT INTO public.profiles (id, username)
VALUES (new.id, new.raw_user_meta_data->>'username');
RETURN new;
END;
$function$;
CREATE OR REPLACE FUNCTION public.profiles_updated_at() RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER
SET search_path TO 'public',
  'pg_catalog' AS $function$ BEGIN NEW.updated_at = now();
RETURN NEW;
END;
$function$;
CREATE OR REPLACE FUNCTION public.set_search_path_public() RETURNS void LANGUAGE sql
SET search_path TO 'public',
  'pg_catalog' AS $function$ -- intentionally minimal: ensure search_path is public,pg_catalog within session
SELECT set_config('search_path', 'public, pg_catalog', true);
$function$;
grant delete on table "public"."archives" to "anon";
grant insert on table "public"."archives" to "anon";
grant references on table "public"."archives" to "anon";
grant select on table "public"."archives" to "anon";
grant trigger on table "public"."archives" to "anon";
grant truncate on table "public"."archives" to "anon";
grant update on table "public"."archives" to "anon";
grant delete on table "public"."archives" to "authenticated";
grant insert on table "public"."archives" to "authenticated";
grant references on table "public"."archives" to "authenticated";
grant select on table "public"."archives" to "authenticated";
grant trigger on table "public"."archives" to "authenticated";
grant truncate on table "public"."archives" to "authenticated";
grant update on table "public"."archives" to "authenticated";
grant delete on table "public"."archives" to "postgres";
grant insert on table "public"."archives" to "postgres";
grant references on table "public"."archives" to "postgres";
grant select on table "public"."archives" to "postgres";
grant trigger on table "public"."archives" to "postgres";
grant truncate on table "public"."archives" to "postgres";
grant update on table "public"."archives" to "postgres";
grant delete on table "public"."archives" to "service_role";
grant insert on table "public"."archives" to "service_role";
grant references on table "public"."archives" to "service_role";
grant select on table "public"."archives" to "service_role";
grant trigger on table "public"."archives" to "service_role";
grant truncate on table "public"."archives" to "service_role";
grant update on table "public"."archives" to "service_role";
grant delete on table "public"."enemies" to "anon";
grant insert on table "public"."enemies" to "anon";
grant references on table "public"."enemies" to "anon";
grant select on table "public"."enemies" to "anon";
grant trigger on table "public"."enemies" to "anon";
grant truncate on table "public"."enemies" to "anon";
grant update on table "public"."enemies" to "anon";
grant delete on table "public"."enemies" to "authenticated";
grant insert on table "public"."enemies" to "authenticated";
grant references on table "public"."enemies" to "authenticated";
grant select on table "public"."enemies" to "authenticated";
grant trigger on table "public"."enemies" to "authenticated";
grant truncate on table "public"."enemies" to "authenticated";
grant update on table "public"."enemies" to "authenticated";
grant delete on table "public"."enemies" to "postgres";
grant insert on table "public"."enemies" to "postgres";
grant references on table "public"."enemies" to "postgres";
grant select on table "public"."enemies" to "postgres";
grant trigger on table "public"."enemies" to "postgres";
grant truncate on table "public"."enemies" to "postgres";
grant update on table "public"."enemies" to "postgres";
grant delete on table "public"."enemies" to "service_role";
grant insert on table "public"."enemies" to "service_role";
grant references on table "public"."enemies" to "service_role";
grant select on table "public"."enemies" to "service_role";
grant trigger on table "public"."enemies" to "service_role";
grant truncate on table "public"."enemies" to "service_role";
grant update on table "public"."enemies" to "service_role";
grant delete on table "public"."fish" to "anon";
grant insert on table "public"."fish" to "anon";
grant references on table "public"."fish" to "anon";
grant select on table "public"."fish" to "anon";
grant trigger on table "public"."fish" to "anon";
grant truncate on table "public"."fish" to "anon";
grant update on table "public"."fish" to "anon";
grant delete on table "public"."fish" to "authenticated";
grant insert on table "public"."fish" to "authenticated";
grant references on table "public"."fish" to "authenticated";
grant select on table "public"."fish" to "authenticated";
grant trigger on table "public"."fish" to "authenticated";
grant truncate on table "public"."fish" to "authenticated";
grant update on table "public"."fish" to "authenticated";
grant delete on table "public"."fish" to "postgres";
grant insert on table "public"."fish" to "postgres";
grant references on table "public"."fish" to "postgres";
grant select on table "public"."fish" to "postgres";
grant trigger on table "public"."fish" to "postgres";
grant truncate on table "public"."fish" to "postgres";
grant update on table "public"."fish" to "postgres";
grant delete on table "public"."fish" to "service_role";
grant insert on table "public"."fish" to "service_role";
grant references on table "public"."fish" to "service_role";
grant select on table "public"."fish" to "service_role";
grant trigger on table "public"."fish" to "service_role";
grant truncate on table "public"."fish" to "service_role";
grant update on table "public"."fish" to "service_role";
grant delete on table "public"."novels" to "anon";
grant insert on table "public"."novels" to "anon";
grant references on table "public"."novels" to "anon";
grant select on table "public"."novels" to "anon";
grant trigger on table "public"."novels" to "anon";
grant truncate on table "public"."novels" to "anon";
grant update on table "public"."novels" to "anon";
grant delete on table "public"."novels" to "authenticated";
grant insert on table "public"."novels" to "authenticated";
grant references on table "public"."novels" to "authenticated";
grant select on table "public"."novels" to "authenticated";
grant trigger on table "public"."novels" to "authenticated";
grant truncate on table "public"."novels" to "authenticated";
grant update on table "public"."novels" to "authenticated";
grant delete on table "public"."novels" to "postgres";
grant insert on table "public"."novels" to "postgres";
grant references on table "public"."novels" to "postgres";
grant select on table "public"."novels" to "postgres";
grant trigger on table "public"."novels" to "postgres";
grant truncate on table "public"."novels" to "postgres";
grant update on table "public"."novels" to "postgres";
grant delete on table "public"."novels" to "service_role";
grant insert on table "public"."novels" to "service_role";
grant references on table "public"."novels" to "service_role";
grant select on table "public"."novels" to "service_role";
grant trigger on table "public"."novels" to "service_role";
grant truncate on table "public"."novels" to "service_role";
grant update on table "public"."novels" to "service_role";
grant delete on table "public"."pod_programs" to "anon";
grant insert on table "public"."pod_programs" to "anon";
grant references on table "public"."pod_programs" to "anon";
grant select on table "public"."pod_programs" to "anon";
grant trigger on table "public"."pod_programs" to "anon";
grant truncate on table "public"."pod_programs" to "anon";
grant update on table "public"."pod_programs" to "anon";
grant delete on table "public"."pod_programs" to "authenticated";
grant insert on table "public"."pod_programs" to "authenticated";
grant references on table "public"."pod_programs" to "authenticated";
grant select on table "public"."pod_programs" to "authenticated";
grant trigger on table "public"."pod_programs" to "authenticated";
grant truncate on table "public"."pod_programs" to "authenticated";
grant update on table "public"."pod_programs" to "authenticated";
grant delete on table "public"."pod_programs" to "postgres";
grant insert on table "public"."pod_programs" to "postgres";
grant references on table "public"."pod_programs" to "postgres";
grant select on table "public"."pod_programs" to "postgres";
grant trigger on table "public"."pod_programs" to "postgres";
grant truncate on table "public"."pod_programs" to "postgres";
grant update on table "public"."pod_programs" to "postgres";
grant delete on table "public"."pod_programs" to "service_role";
grant insert on table "public"."pod_programs" to "service_role";
grant references on table "public"."pod_programs" to "service_role";
grant select on table "public"."pod_programs" to "service_role";
grant trigger on table "public"."pod_programs" to "service_role";
grant truncate on table "public"."pod_programs" to "service_role";
grant update on table "public"."pod_programs" to "service_role";
grant delete on table "public"."user_archives" to "anon";
grant insert on table "public"."user_archives" to "anon";
grant references on table "public"."user_archives" to "anon";
grant select on table "public"."user_archives" to "anon";
grant trigger on table "public"."user_archives" to "anon";
grant truncate on table "public"."user_archives" to "anon";
grant update on table "public"."user_archives" to "anon";
grant delete on table "public"."user_archives" to "authenticated";
grant insert on table "public"."user_archives" to "authenticated";
grant references on table "public"."user_archives" to "authenticated";
grant select on table "public"."user_archives" to "authenticated";
grant trigger on table "public"."user_archives" to "authenticated";
grant truncate on table "public"."user_archives" to "authenticated";
grant update on table "public"."user_archives" to "authenticated";
grant delete on table "public"."user_archives" to "postgres";
grant insert on table "public"."user_archives" to "postgres";
grant references on table "public"."user_archives" to "postgres";
grant select on table "public"."user_archives" to "postgres";
grant trigger on table "public"."user_archives" to "postgres";
grant truncate on table "public"."user_archives" to "postgres";
grant update on table "public"."user_archives" to "postgres";
grant delete on table "public"."user_archives" to "service_role";
grant insert on table "public"."user_archives" to "service_role";
grant references on table "public"."user_archives" to "service_role";
grant select on table "public"."user_archives" to "service_role";
grant trigger on table "public"."user_archives" to "service_role";
grant truncate on table "public"."user_archives" to "service_role";
grant update on table "public"."user_archives" to "service_role";
grant delete on table "public"."user_enemies" to "anon";
grant insert on table "public"."user_enemies" to "anon";
grant references on table "public"."user_enemies" to "anon";
grant select on table "public"."user_enemies" to "anon";
grant trigger on table "public"."user_enemies" to "anon";
grant truncate on table "public"."user_enemies" to "anon";
grant update on table "public"."user_enemies" to "anon";
grant delete on table "public"."user_enemies" to "authenticated";
grant insert on table "public"."user_enemies" to "authenticated";
grant references on table "public"."user_enemies" to "authenticated";
grant select on table "public"."user_enemies" to "authenticated";
grant trigger on table "public"."user_enemies" to "authenticated";
grant truncate on table "public"."user_enemies" to "authenticated";
grant update on table "public"."user_enemies" to "authenticated";
grant delete on table "public"."user_enemies" to "postgres";
grant insert on table "public"."user_enemies" to "postgres";
grant references on table "public"."user_enemies" to "postgres";
grant select on table "public"."user_enemies" to "postgres";
grant trigger on table "public"."user_enemies" to "postgres";
grant truncate on table "public"."user_enemies" to "postgres";
grant update on table "public"."user_enemies" to "postgres";
grant delete on table "public"."user_enemies" to "service_role";
grant insert on table "public"."user_enemies" to "service_role";
grant references on table "public"."user_enemies" to "service_role";
grant select on table "public"."user_enemies" to "service_role";
grant trigger on table "public"."user_enemies" to "service_role";
grant truncate on table "public"."user_enemies" to "service_role";
grant update on table "public"."user_enemies" to "service_role";
grant delete on table "public"."user_fish" to "anon";
grant insert on table "public"."user_fish" to "anon";
grant references on table "public"."user_fish" to "anon";
grant select on table "public"."user_fish" to "anon";
grant trigger on table "public"."user_fish" to "anon";
grant truncate on table "public"."user_fish" to "anon";
grant update on table "public"."user_fish" to "anon";
grant delete on table "public"."user_fish" to "authenticated";
grant insert on table "public"."user_fish" to "authenticated";
grant references on table "public"."user_fish" to "authenticated";
grant select on table "public"."user_fish" to "authenticated";
grant trigger on table "public"."user_fish" to "authenticated";
grant truncate on table "public"."user_fish" to "authenticated";
grant update on table "public"."user_fish" to "authenticated";
grant delete on table "public"."user_fish" to "postgres";
grant insert on table "public"."user_fish" to "postgres";
grant references on table "public"."user_fish" to "postgres";
grant select on table "public"."user_fish" to "postgres";
grant trigger on table "public"."user_fish" to "postgres";
grant truncate on table "public"."user_fish" to "postgres";
grant update on table "public"."user_fish" to "postgres";
grant delete on table "public"."user_fish" to "service_role";
grant insert on table "public"."user_fish" to "service_role";
grant references on table "public"."user_fish" to "service_role";
grant select on table "public"."user_fish" to "service_role";
grant trigger on table "public"."user_fish" to "service_role";
grant truncate on table "public"."user_fish" to "service_role";
grant update on table "public"."user_fish" to "service_role";
grant delete on table "public"."user_novels" to "anon";
grant insert on table "public"."user_novels" to "anon";
grant references on table "public"."user_novels" to "anon";
grant select on table "public"."user_novels" to "anon";
grant trigger on table "public"."user_novels" to "anon";
grant truncate on table "public"."user_novels" to "anon";
grant update on table "public"."user_novels" to "anon";
grant delete on table "public"."user_novels" to "authenticated";
grant insert on table "public"."user_novels" to "authenticated";
grant references on table "public"."user_novels" to "authenticated";
grant select on table "public"."user_novels" to "authenticated";
grant trigger on table "public"."user_novels" to "authenticated";
grant truncate on table "public"."user_novels" to "authenticated";
grant update on table "public"."user_novels" to "authenticated";
grant delete on table "public"."user_novels" to "postgres";
grant insert on table "public"."user_novels" to "postgres";
grant references on table "public"."user_novels" to "postgres";
grant select on table "public"."user_novels" to "postgres";
grant trigger on table "public"."user_novels" to "postgres";
grant truncate on table "public"."user_novels" to "postgres";
grant update on table "public"."user_novels" to "postgres";
grant delete on table "public"."user_novels" to "service_role";
grant insert on table "public"."user_novels" to "service_role";
grant references on table "public"."user_novels" to "service_role";
grant select on table "public"."user_novels" to "service_role";
grant trigger on table "public"."user_novels" to "service_role";
grant truncate on table "public"."user_novels" to "service_role";
grant update on table "public"."user_novels" to "service_role";
grant delete on table "public"."user_pod_programs" to "anon";
grant insert on table "public"."user_pod_programs" to "anon";
grant references on table "public"."user_pod_programs" to "anon";
grant select on table "public"."user_pod_programs" to "anon";
grant trigger on table "public"."user_pod_programs" to "anon";
grant truncate on table "public"."user_pod_programs" to "anon";
grant update on table "public"."user_pod_programs" to "anon";
grant delete on table "public"."user_pod_programs" to "authenticated";
grant insert on table "public"."user_pod_programs" to "authenticated";
grant references on table "public"."user_pod_programs" to "authenticated";
grant select on table "public"."user_pod_programs" to "authenticated";
grant trigger on table "public"."user_pod_programs" to "authenticated";
grant truncate on table "public"."user_pod_programs" to "authenticated";
grant update on table "public"."user_pod_programs" to "authenticated";
grant delete on table "public"."user_pod_programs" to "postgres";
grant insert on table "public"."user_pod_programs" to "postgres";
grant references on table "public"."user_pod_programs" to "postgres";
grant select on table "public"."user_pod_programs" to "postgres";
grant trigger on table "public"."user_pod_programs" to "postgres";
grant truncate on table "public"."user_pod_programs" to "postgres";
grant update on table "public"."user_pod_programs" to "postgres";
grant delete on table "public"."user_pod_programs" to "service_role";
grant insert on table "public"."user_pod_programs" to "service_role";
grant references on table "public"."user_pod_programs" to "service_role";
grant select on table "public"."user_pod_programs" to "service_role";
grant trigger on table "public"."user_pod_programs" to "service_role";
grant truncate on table "public"."user_pod_programs" to "service_role";
grant update on table "public"."user_pod_programs" to "service_role";
grant delete on table "public"."user_weapons" to "anon";
grant insert on table "public"."user_weapons" to "anon";
grant references on table "public"."user_weapons" to "anon";
grant select on table "public"."user_weapons" to "anon";
grant trigger on table "public"."user_weapons" to "anon";
grant truncate on table "public"."user_weapons" to "anon";
grant update on table "public"."user_weapons" to "anon";
grant delete on table "public"."user_weapons" to "authenticated";
grant insert on table "public"."user_weapons" to "authenticated";
grant references on table "public"."user_weapons" to "authenticated";
grant select on table "public"."user_weapons" to "authenticated";
grant trigger on table "public"."user_weapons" to "authenticated";
grant truncate on table "public"."user_weapons" to "authenticated";
grant update on table "public"."user_weapons" to "authenticated";
grant delete on table "public"."user_weapons" to "postgres";
grant insert on table "public"."user_weapons" to "postgres";
grant references on table "public"."user_weapons" to "postgres";
grant select on table "public"."user_weapons" to "postgres";
grant trigger on table "public"."user_weapons" to "postgres";
grant truncate on table "public"."user_weapons" to "postgres";
grant update on table "public"."user_weapons" to "postgres";
grant delete on table "public"."user_weapons" to "service_role";
grant insert on table "public"."user_weapons" to "service_role";
grant references on table "public"."user_weapons" to "service_role";
grant select on table "public"."user_weapons" to "service_role";
grant trigger on table "public"."user_weapons" to "service_role";
grant truncate on table "public"."user_weapons" to "service_role";
grant update on table "public"."user_weapons" to "service_role";
grant delete on table "public"."weapons" to "anon";
grant insert on table "public"."weapons" to "anon";
grant references on table "public"."weapons" to "anon";
grant select on table "public"."weapons" to "anon";
grant trigger on table "public"."weapons" to "anon";
grant truncate on table "public"."weapons" to "anon";
grant update on table "public"."weapons" to "anon";
grant delete on table "public"."weapons" to "authenticated";
grant insert on table "public"."weapons" to "authenticated";
grant references on table "public"."weapons" to "authenticated";
grant select on table "public"."weapons" to "authenticated";
grant trigger on table "public"."weapons" to "authenticated";
grant truncate on table "public"."weapons" to "authenticated";
grant update on table "public"."weapons" to "authenticated";
grant delete on table "public"."weapons" to "postgres";
grant insert on table "public"."weapons" to "postgres";
grant references on table "public"."weapons" to "postgres";
grant select on table "public"."weapons" to "postgres";
grant trigger on table "public"."weapons" to "postgres";
grant truncate on table "public"."weapons" to "postgres";
grant update on table "public"."weapons" to "postgres";
grant delete on table "public"."weapons" to "service_role";
grant insert on table "public"."weapons" to "service_role";
grant references on table "public"."weapons" to "service_role";
grant select on table "public"."weapons" to "service_role";
grant trigger on table "public"."weapons" to "service_role";
grant truncate on table "public"."weapons" to "service_role";
grant update on table "public"."weapons" to "service_role";
create policy "Enable read access for all users" on "public"."archives" as permissive for
select to public using (true);
create policy "Enable read access for all users" on "public"."enemies" as permissive for
select to public using (true);
create policy "Enable read access for all users" on "public"."fish" as permissive for
select to public using (true);
create policy "Enable read access for all users" on "public"."novels" as permissive for
select to public using (true);
create policy "Enable read access for all users" on "public"."pod_programs" as permissive for
select to public using (true);
create policy "Enable delete for users based on user_id" on "public"."user_archives" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_archives" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_archives" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_archives" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable delete for users based on user_id" on "public"."user_enemies" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_enemies" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_enemies" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_enemies" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable delete for users based on user_id" on "public"."user_fish" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_fish" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_fish" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_fish" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable delete for users based on user_id" on "public"."user_novels" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_novels" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_novels" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_novels" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable delete for users based on user_id" on "public"."user_pod_programs" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_pod_programs" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_pod_programs" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_pod_programs" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable delete for users based on user_id" on "public"."user_weapons" as permissive for delete to authenticated using (
  (
    (
      SELECT auth.uid() AS uid
    ) = user_id
  )
);
create policy "Enable insert for users based on user_id" on "public"."user_weapons" as permissive for
insert to authenticated with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to update their own data only" on "public"."user_weapons" as permissive for
update to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  ) with check (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable users to view their own data only" on "public"."user_weapons" as permissive for
select to authenticated using (
    (
      (
        SELECT auth.uid() AS uid
      ) = user_id
    )
  );
create policy "Enable read access for all users" on "public"."weapons" as permissive for
select to public using (true);