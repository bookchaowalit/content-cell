-- Roles for the content database. Locally a superuser runs this; on Neon
-- `content-db provision` creates the same roles through the migrator.
--
-- content_migrator  owns the schema and runs migrations only.
-- content_api       the API at runtime: no superuser, no BYPASSRLS, owns nothing.
-- content_publisher sweeps and marks the outbox across workspaces; nothing else.

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'content_migrator') THEN
        CREATE ROLE content_migrator LOGIN NOSUPERUSER NOCREATEROLE NOBYPASSRLS;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'content_api') THEN
        CREATE ROLE content_api LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOBYPASSRLS NOINHERIT;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'content_publisher') THEN
        CREATE ROLE content_publisher LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOBYPASSRLS NOINHERIT;
    END IF;
END
$$;
