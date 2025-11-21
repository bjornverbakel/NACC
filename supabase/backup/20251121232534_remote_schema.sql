drop extension if exists "pg_net";

drop policy "Enable read access for all users" on "public"."endings";

drop policy "Authenticated can insert own profile" on "public"."profiles";

drop policy "Users can read their own profile" on "public"."profiles";

drop policy "Users can update their own profile" on "public"."profiles";

drop policy "Enable read access for all users" on "public"."sidequests";

drop policy "Users can delete their own user_endings" on "public"."user_endings";

drop policy "Users can insert their own user_endings" on "public"."user_endings";

drop policy "Users can read their own user_endings" on "public"."user_endings";

drop policy "Users can update their own user_endings" on "public"."user_endings";

drop policy "Users can delete their own user_sidequests" on "public"."user_sidequests";

drop policy "Users can insert their own user_sidequests" on "public"."user_sidequests";

drop policy "Users can read their own user_sidequests" on "public"."user_sidequests";

drop policy "Users can update their own user_sidequests" on "public"."user_sidequests";

revoke delete on table "public"."endings" from "anon";

revoke insert on table "public"."endings" from "anon";

revoke references on table "public"."endings" from "anon";

revoke select on table "public"."endings" from "anon";

revoke trigger on table "public"."endings" from "anon";

revoke truncate on table "public"."endings" from "anon";

revoke update on table "public"."endings" from "anon";

revoke delete on table "public"."endings" from "authenticated";

revoke insert on table "public"."endings" from "authenticated";

revoke references on table "public"."endings" from "authenticated";

revoke select on table "public"."endings" from "authenticated";

revoke trigger on table "public"."endings" from "authenticated";

revoke truncate on table "public"."endings" from "authenticated";

revoke update on table "public"."endings" from "authenticated";

revoke delete on table "public"."endings" from "service_role";

revoke insert on table "public"."endings" from "service_role";

revoke references on table "public"."endings" from "service_role";

revoke select on table "public"."endings" from "service_role";

revoke trigger on table "public"."endings" from "service_role";

revoke truncate on table "public"."endings" from "service_role";

revoke update on table "public"."endings" from "service_role";

revoke delete on table "public"."profiles" from "anon";

revoke insert on table "public"."profiles" from "anon";

revoke references on table "public"."profiles" from "anon";

revoke select on table "public"."profiles" from "anon";

revoke trigger on table "public"."profiles" from "anon";

revoke truncate on table "public"."profiles" from "anon";

revoke update on table "public"."profiles" from "anon";

revoke delete on table "public"."profiles" from "authenticated";

revoke insert on table "public"."profiles" from "authenticated";

revoke references on table "public"."profiles" from "authenticated";

revoke select on table "public"."profiles" from "authenticated";

revoke trigger on table "public"."profiles" from "authenticated";

revoke truncate on table "public"."profiles" from "authenticated";

revoke update on table "public"."profiles" from "authenticated";

revoke delete on table "public"."profiles" from "service_role";

revoke insert on table "public"."profiles" from "service_role";

revoke references on table "public"."profiles" from "service_role";

revoke select on table "public"."profiles" from "service_role";

revoke trigger on table "public"."profiles" from "service_role";

revoke truncate on table "public"."profiles" from "service_role";

revoke update on table "public"."profiles" from "service_role";

revoke delete on table "public"."sidequests" from "anon";

revoke insert on table "public"."sidequests" from "anon";

revoke references on table "public"."sidequests" from "anon";

revoke select on table "public"."sidequests" from "anon";

revoke trigger on table "public"."sidequests" from "anon";

revoke truncate on table "public"."sidequests" from "anon";

revoke update on table "public"."sidequests" from "anon";

revoke delete on table "public"."sidequests" from "authenticated";

revoke insert on table "public"."sidequests" from "authenticated";

revoke references on table "public"."sidequests" from "authenticated";

revoke select on table "public"."sidequests" from "authenticated";

revoke trigger on table "public"."sidequests" from "authenticated";

revoke truncate on table "public"."sidequests" from "authenticated";

revoke update on table "public"."sidequests" from "authenticated";

revoke delete on table "public"."sidequests" from "service_role";

revoke insert on table "public"."sidequests" from "service_role";

revoke references on table "public"."sidequests" from "service_role";

revoke select on table "public"."sidequests" from "service_role";

revoke trigger on table "public"."sidequests" from "service_role";

revoke truncate on table "public"."sidequests" from "service_role";

revoke update on table "public"."sidequests" from "service_role";

revoke delete on table "public"."user_endings" from "anon";

revoke insert on table "public"."user_endings" from "anon";

revoke references on table "public"."user_endings" from "anon";

revoke select on table "public"."user_endings" from "anon";

revoke trigger on table "public"."user_endings" from "anon";

revoke truncate on table "public"."user_endings" from "anon";

revoke update on table "public"."user_endings" from "anon";

revoke delete on table "public"."user_endings" from "authenticated";

revoke insert on table "public"."user_endings" from "authenticated";

revoke references on table "public"."user_endings" from "authenticated";

revoke select on table "public"."user_endings" from "authenticated";

revoke trigger on table "public"."user_endings" from "authenticated";

revoke truncate on table "public"."user_endings" from "authenticated";

revoke update on table "public"."user_endings" from "authenticated";

revoke delete on table "public"."user_endings" from "service_role";

revoke insert on table "public"."user_endings" from "service_role";

revoke references on table "public"."user_endings" from "service_role";

revoke select on table "public"."user_endings" from "service_role";

revoke trigger on table "public"."user_endings" from "service_role";

revoke truncate on table "public"."user_endings" from "service_role";

revoke update on table "public"."user_endings" from "service_role";

revoke delete on table "public"."user_sidequests" from "anon";

revoke insert on table "public"."user_sidequests" from "anon";

revoke references on table "public"."user_sidequests" from "anon";

revoke select on table "public"."user_sidequests" from "anon";

revoke trigger on table "public"."user_sidequests" from "anon";

revoke truncate on table "public"."user_sidequests" from "anon";

revoke update on table "public"."user_sidequests" from "anon";

revoke delete on table "public"."user_sidequests" from "authenticated";

revoke insert on table "public"."user_sidequests" from "authenticated";

revoke references on table "public"."user_sidequests" from "authenticated";

revoke select on table "public"."user_sidequests" from "authenticated";

revoke trigger on table "public"."user_sidequests" from "authenticated";

revoke truncate on table "public"."user_sidequests" from "authenticated";

revoke update on table "public"."user_sidequests" from "authenticated";

revoke delete on table "public"."user_sidequests" from "service_role";

revoke insert on table "public"."user_sidequests" from "service_role";

revoke references on table "public"."user_sidequests" from "service_role";

revoke select on table "public"."user_sidequests" from "service_role";

revoke trigger on table "public"."user_sidequests" from "service_role";

revoke truncate on table "public"."user_sidequests" from "service_role";

revoke update on table "public"."user_sidequests" from "service_role";

alter table "public"."profiles" drop constraint "profiles_id_fkey";

alter table "public"."profiles" drop constraint "profiles_username_key";

alter table "public"."user_endings" drop constraint "user_endings_ending_id_fkey";

alter table "public"."user_endings" drop constraint "user_endings_user_id_ending_id_key";

alter table "public"."user_endings" drop constraint "user_endings_user_id_fkey";

alter table "public"."user_sidequests" drop constraint "user_sidequests_sidequest_id_fkey";

alter table "public"."user_sidequests" drop constraint "user_sidequests_user_id_ending_id_key";

alter table "public"."user_sidequests" drop constraint "user_sidequests_user_id_fkey";

alter table "public"."endings" drop constraint "endings_pkey";

alter table "public"."profiles" drop constraint "profiles_pkey";

alter table "public"."sidequests" drop constraint "sidequests_pkey";

alter table "public"."user_endings" drop constraint "user_endings_pkey";

alter table "public"."user_sidequests" drop constraint "user_sidequests_pkey";

drop index if exists "public"."endings_pkey";

drop index if exists "public"."idx_profiles_id";

drop index if exists "public"."idx_user_endings_user_id";

drop index if exists "public"."profiles_pkey";

drop index if exists "public"."profiles_username_key";

drop index if exists "public"."sidequests_pkey";

drop index if exists "public"."user_endings_pkey";

drop index if exists "public"."user_endings_user_id_ending_id_key";

drop index if exists "public"."user_sidequests_pkey";

drop index if exists "public"."user_sidequests_user_id_ending_id_key";

drop index if exists "public"."user_sidequests_user_id_idx";

drop table "public"."endings";

drop table "public"."profiles";

drop table "public"."sidequests";

drop table "public"."user_endings";

drop table "public"."user_sidequests";

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


