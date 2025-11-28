-- Clean up existing data to satisfy constraints
-- 1. Truncate to 32 characters
UPDATE "public"."profiles"
SET "username" = substring(
        "username"
        from 1 for 32
    )
WHERE "username" IS NOT NULL
    AND char_length("username") > 32;
-- 2. Lowercase and replace invalid characters with underscores
UPDATE "public"."profiles"
SET "username" = lower(
        regexp_replace("username", '[^a-zA-Z0-9_-]', '_', 'g')
    )
WHERE "username" IS NOT NULL
    AND "username" !~ '^[a-z0-9_-]+$';
-- 3. Add constraints
ALTER TABLE "public"."profiles"
ADD CONSTRAINT "username_length_check" CHECK (char_length(username) <= 32);
ALTER TABLE "public"."profiles"
ADD CONSTRAINT "username_chars_check" CHECK (username ~ '^[a-z0-9_-]+$');