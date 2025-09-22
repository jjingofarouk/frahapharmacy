--
-- PostgreSQL database dump
--

\restrict f7pUuxFOT34JkMh0pfMRfj90OHinXQvAL5TnOesi7mKdehWErsyxsabOzBvoXQP

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_id text NOT NULL,
    client_secret_hash text NOT NULL,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: Category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Category_id_seq" OWNER TO postgres;

--
-- Name: Category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;


--
-- Name: InventoryLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryLog" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "userId" integer,
    "quantityChange" integer NOT NULL,
    reason text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InventoryLog" OWNER TO postgres;

--
-- Name: InventoryLog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."InventoryLog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InventoryLog_id_seq" OWNER TO postgres;

--
-- Name: InventoryLog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."InventoryLog_id_seq" OWNED BY public."InventoryLog".id;


--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    "userId" integer,
    total double precision NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    id integer NOT NULL,
    "orderId" integer NOT NULL,
    "productId" integer NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderItem_id_seq" OWNER TO postgres;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderItem_id_seq" OWNED BY public."OrderItem".id;


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Order_id_seq" OWNER TO postgres;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price double precision NOT NULL,
    stock integer NOT NULL,
    "imageUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductCategory" (
    "productId" integer NOT NULL,
    "categoryId" integer NOT NULL
);


ALTER TABLE public."ProductCategory" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Product_id_seq" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role text DEFAULT 'admin'::text NOT NULL,
    name text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);


--
-- Name: InventoryLog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLog" ALTER COLUMN id SET DEFAULT nextval('public."InventoryLog_id_seq"'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderItem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem" ALTER COLUMN id SET DEFAULT nextval('public."OrderItem_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (id, name, description, "createdAt", "updatedAt") FROM stdin;
1	General Wellbeing	Products in General Wellbeing category	2025-09-22 08:53:53.539	2025-09-22 09:15:59.85
2	Gut Health	Products in Gut Health category	2025-09-22 08:53:55.684	2025-09-22 09:16:00.452
3	Immunity Support	Products in Immunity Support category	2025-09-22 08:53:57.235	2025-09-22 09:16:00.757
4	Multivitamins & Wellness Supplements	Products in Multivitamins & Wellness Supplements category	2025-09-22 08:53:58.448	2025-09-22 09:16:00.984
5	Joint and Bone Supplements	Products in Joint and Bone Supplements category	2025-09-22 08:53:59.881	2025-09-22 09:16:01.272
6	Omega Supplements	Products in Omega Supplements category	2025-09-22 08:54:01.319	2025-09-22 09:16:01.576
7	Hair Care Products	Products in Hair Care Products category	2025-09-22 08:54:02.665	2025-09-22 09:16:01.802
8	Feminine Hygiene	Products in Feminine Hygiene category	2025-09-22 08:54:04.079	2025-09-22 09:16:02.088
9	Male Sexual Health	Products in Male Sexual Health category	2025-09-22 08:54:05.436	2025-09-22 09:16:02.403
10	Sanitation	Products in Sanitation category	2025-09-22 08:54:06.947	2025-09-22 09:16:02.702
11	Eye Care	Products in Eye Care category	2025-09-22 08:54:08.381	2025-09-22 09:16:03.008
12	Sexual & Reproductive Health	Products in Sexual & Reproductive Health category	2025-09-22 08:54:09.731	2025-09-22 09:16:03.234
13	Facial Skin Care Products	Products in Facial Skin Care Products category	2025-09-22 08:54:11.659	2025-09-22 09:16:03.522
14	Baby Multivitamins & Supplements	Products in Baby Multivitamins & Supplements category	2025-09-22 08:54:13.112	2025-09-22 09:16:03.749
15	Kids Supplements	Products in Kids Supplements category	2025-09-22 08:54:14.524	2025-09-22 09:16:03.975
16	Male Grooming products	Products in Male Grooming products category	2025-09-22 08:54:16.06	2025-09-22 09:16:04.202
17	Body Skin Care Products	Products in Body Skin Care Products category	2025-09-22 08:54:17.494	2025-09-22 09:16:04.428
18	First Aid & Sanitization	Products in First Aid & Sanitization category	2025-09-22 08:54:18.748	2025-09-22 09:16:04.655
19	Dental & Oral Care	Products in Dental & Oral Care category	2025-09-22 08:54:20.463	2025-09-22 09:16:04.885
20	Colds, Flu & Allergies	Products in Colds, Flu & Allergies category	2025-09-22 08:54:22.039	2025-09-22 09:16:05.112
21	Ear, Nose & Throat	Products in Ear, Nose & Throat category	2025-09-22 08:54:23.535	2025-09-22 09:16:05.364
22	Mom essentials	Products in Mom essentials category	2025-09-22 08:54:25.173	2025-09-22 09:16:05.594
23	Topical Applications	Products in Topical Applications category	2025-09-22 08:54:27.221	2025-09-22 09:16:05.821
24	Shower Essentials	Products in Shower Essentials category	2025-09-22 08:54:28.78	2025-09-22 09:16:06.051
25	Fragrances	Products in Fragrances category	2025-09-22 08:54:30.159	2025-09-22 09:16:06.279
26	Home Health Care	Products in Home Health Care category	2025-09-22 08:54:31.278	2025-09-22 09:16:06.509
27	Pain & Inflammation	Products in Pain & Inflammation category	2025-09-22 08:54:32.409	2025-09-22 09:16:06.796
28	Weight Control & Detox	Products in Weight Control & Detox category	2025-09-22 08:54:33.525	2025-09-22 09:16:07.023
29	Infant formula & Anti-Colics	Products in Infant formula & Anti-Colics category	2025-09-22 08:54:34.654	2025-09-22 09:16:07.266
30	Mother & Baby	Products in Mother & Baby category	2025-09-22 08:54:35.813	2025-09-22 09:16:07.522
31	Baby Cold, Flu, Allergies & Fever	Products in Baby Cold, Flu, Allergies & Fever category	2025-09-22 08:54:36.934	2025-09-22 09:16:07.749
32	Health and Medicine	Products in Health and Medicine category	2025-09-22 08:54:38.059	2025-09-22 09:16:07.978
33	Beauty & Personal Care	Products in Beauty & Personal Care category	2025-09-22 08:54:39.223	2025-09-22 09:16:08.206
34	Protein Powder	Products in Protein Powder category	2025-09-22 08:54:40.347	2025-09-22 09:16:08.433
35	Baby care products	Products in Baby care products category	2025-09-22 08:54:41.532	2025-09-22 09:16:08.66
36	Pure Oils	Products in Pure Oils category	2025-09-22 08:54:42.931	2025-09-22 09:16:08.886
37	Condoms, Lubricants & Emergency Contraception	Products in Condoms, Lubricants & Emergency Contraception category	2025-09-22 08:54:44.628	2025-09-22 09:16:09.153
38	Test Kits	Products in Test Kits category	2025-09-22 08:54:46.164	2025-09-22 09:16:09.46
39	Hands, Nails And Lipcare Products	Products in Hands, Nails And Lipcare Products category	2025-09-22 08:54:47.398	2025-09-22 09:16:09.767
40	Prenatal & Post-Natal Vitamins	Products in Prenatal & Post-Natal Vitamins category	2025-09-22 08:54:48.745	2025-09-22 09:16:09.994
41	Migraine & Headache	Products in Migraine & Headache category	2025-09-22 08:54:50.26	2025-09-22 09:16:10.22
42	Other Medical Devices	Products in Other Medical Devices category	2025-09-22 08:54:51.715	2025-09-22 09:16:10.484
43	Sports & Nutrition	Products in Sports & Nutrition category	2025-09-22 08:54:53.231	2025-09-22 09:16:10.789
44	Blood Pressure Machines	Products in Blood Pressure Machines category	2025-09-22 08:54:54.767	2025-09-22 09:16:11.098
45	Uncategorized	Products in Uncategorized category	2025-09-22 08:54:55.893	2025-09-22 09:16:11.405
46	Orthopedic Products	Products in Orthopedic Products category	2025-09-22 08:54:57.235	2025-09-22 09:16:11.713
47	Glucometers & Strips	Products in Glucometers & Strips category	2025-09-22 08:54:58.76	2025-09-22 09:16:12.02
\.


--
-- Data for Name: InventoryLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InventoryLog" (id, "productId", "userId", "quantityChange", reason, "createdAt") FROM stdin;
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, "userId", total, status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, name, description, price, stock, "imageUrl", "createdAt", "updatedAt") FROM stdin;
22	21st Century Advanced Probiotic Capsules	21st Century Advanced Probiotic Capsules are dietary supplements designed to support digestive and immune health. Formulated with a potent blend…	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536427/pharmacy-app/pharmacy/21st_Century_Advanced_Probiotic_Capsules_22_1758536426818.jpg	2025-09-22 09:04:39.315	2025-09-22 10:20:28.113
21	21st Century Ashwagandha Extract Capsules 60’s	Ashwagandha extract helps support a healthy stress response and mood when feeling overwhelmed and out of balance, helps relax, unwind,…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536432/pharmacy-app/pharmacy/21st_Century_Ashwagandha_Extract_Capsule_21_1758536431182.png	2025-09-22 09:04:39.317	2025-09-22 10:20:32.622
27	21st Century Chromium Picolinate 200mcg Tablets 100’s	Chromium Picolinate supports healthy metabolism and aids in the processing of carbohydrates, fats, and proteins. It also helps regulate insulin…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536435/pharmacy-app/pharmacy/21st_Century_Chromium_Picolinate_200mcg__27_1758536435202.jpg	2025-09-22 09:04:45.319	2025-09-22 10:20:36.251
28	21st Century Cranberry Extra Capsules 60’s	Cranberries are used to support urinary tract health, and this helps to prevent Urinary Tract Infections.	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536437/pharmacy-app/pharmacy/21st_Century_Cranberry_Extra_Capsules_60_28_1758536437002.jpg	2025-09-22 09:04:45.32	2025-09-22 10:20:37.754
6	Abri-let Maternity Pads 20’s (20X44 cm)	Abri-Let is an absorbing rectangular or anatomically shaped pad with a soft core. It is a multipurpose pad used as…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/l9qzufw3xfrghpx9plfn.jpg	2025-09-22 08:55:02.145	2025-09-22 09:17:06.804
1129	La Fresh Cucumber Face & Body Scrub 500ml	Skin appears softer, smoother, revived and more radiant.	14500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538813/pharmacy-app/pharmacy/La_Fresh_Cucumber_Face___Body_Scrub_500m_1129_1758538812998.jpg	2025-09-22 09:41:21.018	2025-09-22 11:00:14.122
25	21st Century Evening Primrose Oil 500mg 60’s	21st Century Evening Primrose Oil is a dietary supplement designed to support overall health and wellness, particularly focusing on women's…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536442/pharmacy-app/pharmacy/21st_Century_Evening_Primrose_Oil_500mg__25_1758536441470.jpg	2025-09-22 09:04:45.321	2025-09-22 10:20:42.651
26	21st Century Flaxseed Oil 1000mg Omega 3,6,9 Capsules 60’s	Flaxseed oil supports healthy estrogen, triglyceride & cholesterol levels, it also provides essential support for heart health.	83000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536444/pharmacy-app/pharmacy/21st_Century_Flaxseed_Oil_1000mg_Omega_3_26_1758536443485.jpg	2025-09-22 09:04:45.322	2025-09-22 10:20:44.491
32	21st Century Ginkgo Biloba Extract	Ginkgo biloba extract is a natural supplement derived from the leaves of the Ginkgo biloba tree, It is Well known…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536447/pharmacy-app/pharmacy/21st_Century_Ginkgo_Biloba_Extract_32_1758536447126.jpg	2025-09-22 09:04:51.324	2025-09-22 10:20:47.942
33	21st Century Melatonin 10 mg	Melatonin works in harmony with your natural sleep cycle and promotes relaxation and sleep	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536452/pharmacy-app/pharmacy/21st_Century_Melatonin_10_mg_33_1758536451418.jpg	2025-09-22 09:04:51.326	2025-09-22 10:20:52.275
29	21st Century Melatonin 3mg Tablets 90’s	Melatonin works in harmony with your natural sleep cycle and promotes relaxation and sleep.	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536453/pharmacy-app/pharmacy/21st_Century_Melatonin_3mg_Tablets_90_s_29_1758536453118.jpg	2025-09-22 09:04:51.327	2025-09-22 10:20:54.013
49	21st Century Melatonin 5 mg Tablets120’s	Melatonin works in harmony with your natural sleep cycle and promotes relaxation and sleep	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536455/pharmacy-app/pharmacy/21st_Century_Melatonin_5_mg_Tablets120_s_49_1758536454957.jpg	2025-09-22 09:16:36.07	2025-09-22 10:20:55.749
1	A & E Plasters 20’S Wash Proof		10000	100	\N	2025-09-22 08:55:00.033	2025-09-22 09:16:57.69
11	Actifed Multi-Action Tablets 12’s	Actifed Multi-Action Tablets are used to relieve the symptoms of colds, flu and allergies including sneezing, runny nose, watery eyes,…	38400	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/ttzj9wltv5jvdm6mjspe.webp	2025-09-22 08:55:02.367	2025-09-22 09:17:22.471
13	Activated Charcoal 250mg tabs 100’s		20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/nbvyxbsuqpv0rwwtwzrh.jpg	2025-09-22 08:55:02.374	2025-09-22 09:17:25.297
12	Activated Charcoal Chewable Tablets 100’s	Helps treat flatulence, abdominal discomfort, abdominal fullness and whitens teeth	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/qvqdmxcglqykqeqlalri.jpg	2025-09-22 08:55:02.371	2025-09-22 09:17:28.307
8	Adacin Gel 15gm Adapalene and Clindamycin	Used to treat acne. It may decrease the number and severity of acne pimples and promote quick healing of pimples…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/tur9v3iwbdwh3re5uc8m.jpg	2025-09-22 08:55:02.191	2025-09-22 09:17:29.597
10	Adidas Climacool Shower Gel 400ml	With activated fresh capsules that bursts upon movement be ready for a boost of freshness, it ensures freshness throughout the…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/mqv9cvc4hiazdxqy6nen.jpg	2025-09-22 08:55:02.367	2025-09-22 09:17:33.79
7	Adidas Victory League Deodorant Body Spray 150ml	Vibrant and spicy fragrance enhanced with guarana. Notes of bergamot, cinnamon, cedarwood and vanilla. Designed for the men who believe…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/zlqkokifxqbwwvwoqj0v.jpg	2025-09-22 08:55:02.239	2025-09-22 09:17:49.922
2	ALCOHOL SWABS 100’S		10000	100	\N	2025-09-22 08:55:00.033	2025-09-22 09:18:00.053
4	Alex Aspire Fine Fragrance Perfume Mist 120ml	Fresh and cool scent for confidence and elegance.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/ajlpkjdad543k0fpanmo.jpg	2025-09-22 08:55:02.31	2025-09-22 09:18:03.061
3	Aloe Pura Organic Aloe Vera Body Wash 200ml	Made with Bio Active Aloe Vera Juice. Soothing and Refreshing body wash. Dermatologically Tested. Suitable for Vegetarians and Vegans.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/t23pjz4csy1ols7q5gkg.webp	2025-09-22 08:55:02.309	2025-09-22 09:18:11.624
9	Aloe Pura Organic Aloe Vera Face Mask 150ml	Restores hydration and soothes tired dull skin.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/vxufbebd9calhyyhooef.webp	2025-09-22 08:55:02.352	2025-09-22 09:18:13.055
1130	La Fresh Face & Body Lemon Scrub 500ml	100%Nautral exfoliators. Face and body scrub with lemon extracts. Blend of natural herbs and minerals.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538815/pharmacy-app/pharmacy/La_Fresh_Face___Body_Lemon_Scrub_500ml_1130_1758538814870.jpg	2025-09-22 09:41:22.663	2025-09-22 11:00:15.674
5	55H+ Paris Harmonie Reparateur Multi-Vitamin Lightening Lotion 500ml	Skin Lightening. Skin Bleaching. Dark Spot Remover. Even Skin Tone.	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758531302/pharmacy-app/cqelcprcxk8rdhip4pgx.jpg	2025-09-22 08:55:02.326	2025-09-22 09:16:56.14
53	21st Century Saw Palmetto 450 mg	21st Century Saw Palmetto, a premium-quality supplement crafted to support men's health and promote prostate wellness.	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536463/pharmacy-app/pharmacy/21st_Century_Saw_Palmetto_450_mg_53_1758536462339.jpg	2025-09-22 09:16:41.846	2025-09-22 10:21:03.334
55	21st Century Super Collagen Plus Vitamin C	21st Century Super Collagen Plus Vitamin C is a premium dietary supplement designed to support healthy skin, hair, nails, and…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536467/pharmacy-app/pharmacy/21st_Century_Super_Collagen_Plus_Vitamin_55_1758536466210.png	2025-09-22 09:16:44.583	2025-09-22 10:21:07.225
56	21st Century Turmeric Complex 500mg 60’s	21st Century Turmeric Complex 500mg is an antioxidant that helps eliminate free radicals and, in turn, Improves liver function and…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536469/pharmacy-app/pharmacy/21st_Century_Turmeric_Complex_500mg_60_s_56_1758536468254.png	2025-09-22 09:16:46.017	2025-09-22 10:21:09.786
58	21st Century Zoo Friend’s Probiotic Chewable Tablets 30’s	21ST Century Zoo Friends Probiotic chewable tablets are a fantastic choice for parents seeking to support their children's digestive health and…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536473/pharmacy-app/pharmacy/21st_Century_Zoo_Friend_s_Probiotic_Chew_58_1758536472689.jpg	2025-09-22 09:16:49.294	2025-09-22 10:21:13.794
59	21st Century ZOO Friends Multigummies 60s	21st Century Zoo Friends Multi Gummies are delicious, chewable vitamins designed to support the nutritional needs of children. Packed with…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536479/pharmacy-app/pharmacy/21st_Century_ZOO_Friends_Multigummies_60_59_1758536478283.png	2025-09-22 09:16:50.646	2025-09-22 10:21:19.719
61	55H+ Paris Cristaline Strong-Lightening Fine Glycerin 500ml	Formulated specifically for Black & Dark Complexion Women for a Radiant & Flawless Looking Skin.	200000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536482/pharmacy-app/pharmacy/55H__Paris_Cristaline_Strong_Lightening__61_1758536482138.jpg	2025-09-22 09:16:53.492	2025-09-22 10:21:23.097
65	A’mrij 3D White Charcoal Toothpaste 100ml	Helps whiten and brighten your teeth without stripping away any of the protective enamel. Kills off the oral bacteria that…	16500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536487/pharmacy-app/pharmacy/A_mrij_3D_White_Charcoal_Toothpaste_100m_65_1758536486400.jpg	2025-09-22 09:16:59.247	2025-09-22 10:21:27.375
66	A’mrij Charcoal Peppermint Whitening Toothpaste 100ml	Helps whiten and brighten your teeth without stripping away any of the protective enamel. Kills off the oral bacteria that…	16500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536488/pharmacy-app/pharmacy/A_mrij_Charcoal_Peppermint_Whitening_Too_66_1758536487976.jpg	2025-09-22 09:17:00.66	2025-09-22 10:21:29.241
68	Abidec Multivitamin Drops 25ml	Abidec Multivitamin Drops are full of natural flavour and aroma and contains 7 essential vitamins to help prevent against vitamin…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536492/pharmacy-app/pharmacy/Abidec_Multivitamin_Drops_25ml_68_1758536492255.jpg	2025-09-22 09:17:03.842	2025-09-22 10:21:33.075
71	Acnes Creamy Wash (Trio formula) 100g	Anti-acne. Cleanses out excess sebum, dead skin cells & dirt deep in skin pores. Prevent scars , dark spots and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536496/pharmacy-app/pharmacy/Acnes_Creamy_Wash__Trio_formula__100g_71_1758536496107.jpg	2025-09-22 09:17:08.033	2025-09-22 10:21:37.114
72	Acnes Creamy Wash (Trio formula) 50g	Anti-acne. Cleanses out excess sebum, dead skin cells & dirt deep in skin pores. Prevent scars , dark spots and…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536498/pharmacy-app/pharmacy/Acnes_Creamy_Wash__Trio_formula__50g_72_1758536497715.jpg	2025-09-22 09:17:09.467	2025-09-22 10:21:38.506
74	Acnes Scar Care Gel 12g	Reduces the appearance of fresh acne scars and dark spots, preventing acne recurrence.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536502/pharmacy-app/pharmacy/Acnes_Scar_Care_Gel_12g_74_1758536501427.jpg	2025-09-22 09:17:12.085	2025-09-22 10:21:43.173
75	Acnes Sealing Gel 9g	Treats acne & prevents new breakouts.	19500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536504/pharmacy-app/pharmacy/Acnes_Sealing_Gel_9g_75_1758536504051.jpg	2025-09-22 09:17:13.461	2025-09-22 10:21:45.158
77	Acnesol Cream Tretinoin 0.05%	Used to treat acne and reduce appearance of wrinkles.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536508/pharmacy-app/pharmacy/Acnesol_Cream_Tretinoin_0_05__77_1758536507608.jpg	2025-09-22 09:17:16.533	2025-09-22 10:21:48.837
78	Acretin Tretinoin 0.025% Cream 30g	Helps to treat the symptoms of acne vulgaris. Treats acne and prevents new acne from forming. Contains - tretinoin 0.025%,…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536510/pharmacy-app/pharmacy/Acretin_Tretinoin_0_025__Cream_30g_78_1758536509433.jpg	2025-09-22 09:17:17.966	2025-09-22 10:21:50.441
80	Actifed Multi Action Dry Cough Liquid 100ml	Actifed Dry Cough Relief liquid has a multi action formulation. Dries Runny Noses. Unblocks Stuffy Noses. Clears Catarrh. Relieves Dry…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536513/pharmacy-app/pharmacy/Actifed_Multi_Action_Dry_Cough_Liquid_10_80_1758536512839.jpg	2025-09-22 09:17:21.031	2025-09-22 10:21:54.027
84	Activated Charcoal Capsules 10’s	Aids in the treatment of flatulence. Absorb excess gas in the gastrointestinal tract. Helps provide relief from bloating, fullness and…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536519/pharmacy-app/pharmacy/Activated_Charcoal_Capsules_10_s_84_1758536518206.jpg	2025-09-22 09:17:26.773	2025-09-22 10:21:59.268
87	Adidas AdiPower Shower Gel 400ml	This shower gel is ideal for men who live their life in the fast lane and have a spirit of…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536524/pharmacy-app/pharmacy/Adidas_AdiPower_Shower_Gel_400ml_87_1758536523746.jpg	2025-09-22 09:17:31.073	2025-09-22 10:22:04.807
90	Adidas Dynamic Pulse Deodorant Body Spray 150ml	A masculine scent you can wear all day. Base notes of woods and musk anchor its invigorating fragrance, while spicy…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536528/pharmacy-app/pharmacy/Adidas_Dynamic_Pulse_Deodorant_Body_Spra_90_1758536527505.jpg	2025-09-22 09:17:35.501	2025-09-22 10:22:08.385
94	Adidas Ice Dive Shower Gel 400ml	Multi-benefit 3in1 formula: body, hair, face. Long-lasting tonic fragrance with aromatic accords of sandalwood, patchouli, cistus leaves and tonka beans.…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536535/pharmacy-app/pharmacy/Adidas_Ice_Dive_Shower_Gel_400ml_94_1758536535051.jpg	2025-09-22 09:17:41.313	2025-09-22 10:22:16.125
96	Adidas Pure Game Deodorant Body Spray 150ml	Gives you up to 24 hours of fresh power. Developed with athletes in mind, it has a woody, spicy fragrance…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536538/pharmacy-app/pharmacy/Adidas_Pure_Game_Deodorant_Body_Spray_15_96_1758536538249.jpg	2025-09-22 09:17:44.146	2025-09-22 10:22:19.154
97	Adidas Pure Game Relaxing Shower Gel 400ml	Whether you're headed for the golf course, the soccer field, gym or the basketball court, Adidas will keep you feeling…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536540/pharmacy-app/pharmacy/Adidas_Pure_Game_Relaxing_Shower_Gel_400_97_1758536539780.jpg	2025-09-22 09:17:45.534	2025-09-22 10:22:20.572
99	Adidas Team Force Shower Gel 400ml	Energising shower gel with orange extracts and woody fragrance. 3-in-1 multi-benefit shower gel: moisturizes the body, respects the face, nourishes…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536543/pharmacy-app/pharmacy/Adidas_Team_Force_Shower_Gel_400ml_99_1758536542557.jpg	2025-09-22 09:17:48.418	2025-09-22 10:22:23.453
102	Aerius Desloratadine 5mg Tablets 20’s	AERIUS is indicated for the rapid relief of symptoms associated with allergic rhinitis, such as sneezing, nasal discharge and itching,…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536546/pharmacy-app/pharmacy/Aerius_Desloratadine_5mg_Tablets_20_s_102_1758536546141.jpg	2025-09-22 09:17:52.528	2025-09-22 10:22:27.143
103	Aerius Desloratadine Syrup 60ml	Contains an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536548/pharmacy-app/pharmacy/Aerius_Desloratadine_Syrup_60ml_103_1758536547764.jpg	2025-09-22 09:17:53.691	2025-09-22 10:22:28.514
105	Age Care Adult Diapers Large 10s	Leak proof. Double refastenable strips. Absorbent core. Wetness indicator. Elastic between legs. For urine and stool incontinence, bed ridden adult…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536552/pharmacy-app/pharmacy/Age_Care_Adult_Diapers_Large_10s_105_1758536551513.jpg	2025-09-22 09:17:56.087	2025-09-22 10:22:32.514
106	Age Care Adult Diapers Medium 10s	Leak proof. Double refastenable strips. Absorbent core. Wetness indicator. Elastic between legs. For urine and stool incontinence, bed ridden adult…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536554/pharmacy-app/pharmacy/Age_Care_Adult_Diapers_Medium_10s_106_1758536553263.png	2025-09-22 09:17:57.278	2025-09-22 10:22:34.534
109	Alerten Q 100 Coenzyme Q10 Capsules 30’s	Natural Coenzyme Q10 levels in your body decrease with age, affecting your heart health adversely. That’s why experts recommend a…	102000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536557/pharmacy-app/pharmacy/Alerten_Q_100_Coenzyme_Q10_Capsules_30_s_109_1758536556674.jpg	2025-09-22 09:18:01.589	2025-09-22 10:22:37.698
111	Alka-Seltzer Original Aspirin Tabs 20’s		40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536562/pharmacy-app/pharmacy/Alka_Seltzer_Original_Aspirin_Tabs_20_s_111_1758536561994.jpg	2025-09-22 09:18:04.495	2025-09-22 10:22:42.917
113	Aloe Pura Aloe Vera After Sun Lotion 200ml	Helps rehydrate, moisturise, cool and protect the skin after exposure to the sun.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536566/pharmacy-app/pharmacy/Aloe_Pura_Aloe_Vera_After_Sun_Lotion_200_113_1758536565490.jpg	2025-09-22 09:18:07.65	2025-09-22 10:22:46.595
115	Aloe Pura Aloe Vera Gel with Tea Tree 200ml	Aloe Pura Aloe Vera Gel with Tea Tree Oil is produced from Aloe Vera Juice, capturing the maximum nutritional activity…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536569/pharmacy-app/pharmacy/Aloe_Pura_Aloe_Vera_Gel_with_Tea_Tree_20_115_1758536568737.jpg	2025-09-22 09:18:10.395	2025-09-22 10:22:49.933
119	Alpecin Dandruff Killer Shampoo 250ml	The first Alpecin shampoo with 4 active ingredients. Together they remove dandruff, relieve scalp irritation and form a powerful anti-dandruff…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536574/pharmacy-app/pharmacy/Alpecin_Dandruff_Killer_Shampoo_250ml_119_1758536573215.jpg	2025-09-22 09:18:15.555	2025-09-22 10:22:54.111
120	Alpecin Double Effect Shampoo 200ml	Fights against dandruff and hair loss hereditary with caffeine complex.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536575/pharmacy-app/pharmacy/Alpecin_Double_Effect_Shampoo_200ml_120_1758536575050.png	2025-09-22 09:18:17.036	2025-09-22 10:22:56.023
123	Alula Gold 2[6-12Months] 400g Infant Formula	Alula Gold Formula is a premium follow-on formula specially tailored to meet the changing nutritional needs. Ideal for those who…	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536582/pharmacy-app/pharmacy/Alula_Gold_2_6_12Months__400g_Infant_For_123_1758536581397.jpg	2025-09-22 09:18:21.147	2025-09-22 10:23:02.569
124	Alula Gold 3[1 YEAR+] 400g Toddler Formula	16 nutrients for toddlers’ growth and development   Added plant-based Omega-3 DHA and Lutein   8 nutrients for immune support	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536584/pharmacy-app/pharmacy/Alula_Gold_3_1_YEAR___400g_Toddler_Formu_124_1758536583321.jpg	2025-09-22 09:18:22.887	2025-09-22 10:23:04.458
126	Always Maxi Thick Extra Long Pads 7’s	The pads feature 2x larger pads with a significantly larger back, providing that much needed step up in size for…	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536588/pharmacy-app/pharmacy/Always_Maxi_Thick_Extra_Long_Pads_7_s_126_1758536587802.jpg	2025-09-22 09:18:25.779	2025-09-22 10:23:08.783
127	Always Maxi Thick Long Pads 7’s	ALWAYS Maxi Thick Sanitary Pads offer upto 100% comfortable protection. Innovatively designed with a clean and dry top sheet, they…	3600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536590/pharmacy-app/pharmacy/Always_Maxi_Thick_Long_Pads_7_s_127_1758536589863.jpg	2025-09-22 09:18:26.982	2025-09-22 10:23:10.754
129	Always Ultra Thin Long Sanitary Pads 8’s	Absorbs in seconds. Clean, dry, fresh during the day. Up to 8-hour absorbency for your busiest days.	4200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536595/pharmacy-app/pharmacy/Always_Ultra_Thin_Long_Sanitary_Pads_8_s_129_1758536594715.jpg	2025-09-22 09:18:29.749	2025-09-22 10:23:15.663
130	ALZENTAL  Albendazole 20mg/ml Syrup 20ml	For routine deworming or treatment of worm infestation.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536597/pharmacy-app/pharmacy/ALZENTAL__Albendazole_20mg_ml_Syrup_20ml_130_1758536596629.jpg	2025-09-22 09:18:31.08	2025-09-22 10:23:17.787
1131	La Fresh Face & Body Scrub Apricot 500ml	La Fresh Apricot Exfoliating Face & Body Scrub with Apricot & Leaf Extracts gently exfoliates your skin to break up…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538817/pharmacy-app/pharmacy/La_Fresh_Face___Body_Scrub_Apricot_500ml_1131_1758538816438.jpg	2025-09-22 09:41:23.987	2025-09-22 11:00:17.548
132	Amara Hydrating Glycerine Lotion 200ml	It helps improves skin elasticity and protect against irritation.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536601/pharmacy-app/pharmacy/Amara_Hydrating_Glycerine_Lotion_200ml_132_1758536600772.png	2025-09-22 09:18:33.864	2025-09-22 10:23:22.203
135	Amara Moisturizing Body Lotion For Men 400ml	For a simple body care lotion, you can set, forget, and never have to worry about itchy or dry skin,…	9600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536607/pharmacy-app/pharmacy/Amara_Moisturizing_Body_Lotion_For_Men_4_135_1758536606393.jpg	2025-09-22 09:18:38.404	2025-09-22 10:23:27.305
136	Amara Unscented Glycerine 100ml	It is applied daily for moisturized, soft and smooth skin.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536612/pharmacy-app/pharmacy/Amara_Unscented_Glycerine_100ml_136_1758536611385.jpg	2025-09-22 09:18:39.79	2025-09-22 10:23:32.577
138	Ambrodil Drops 15ml	Treatment of Cough with mucus, Acute Sore throat and Respiratory tract disorders associated with viscid mucus.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536616/pharmacy-app/pharmacy/Ambrodil_Drops_15ml_138_1758536615205.jpg	2025-09-22 09:18:42.71	2025-09-22 10:23:36.687
139	Ambrodil Syrup 100ml	AMBRODIL SYRUP relieves cough. It promotes mucus clearance, facilitates expectoration and eases productive cough, allowing patients to breathe freely and…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536618/pharmacy-app/pharmacy/Ambrodil_Syrup_100ml_139_1758536617606.jpg	2025-09-22 09:18:43.942	2025-09-22 10:23:38.952
140	Ambrox SR 75mg Capsules 30’s	Ambroxol SR relieves cough. Each pack contains 30 capsules.	25500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536620/pharmacy-app/pharmacy/Ambrox_SR_75mg_Capsules_30_s_140_1758536619564.jpg	2025-09-22 09:18:45.211	2025-09-22 10:23:40.399
143	Amocomb Cream 15g	For treatment of skin rash, bacterial skin infections, fungal skin infections and mixed skin infections. Relieves itchiness.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536625/pharmacy-app/pharmacy/Amocomb_Cream_15g_143_1758536624470.jpg	2025-09-22 09:18:49.719	2025-09-22 10:23:45.435
144	AMS Fertilimax Tablets	Benefits:  Supports Women Prior to Pregnancy. Supports Prenatal Development.	340000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536627/pharmacy-app/pharmacy/AMS_Fertilimax_Tablets_144_1758536626960.png	2025-09-22 09:18:51.093	2025-09-22 10:23:49.812
146	AMS Ova-Max Capsules	AMS Ova-Max Capsules are a blend of vitamins, minerals, and antioxidants that work together to improve women's egg and embryo…	328000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536637/pharmacy-app/pharmacy/AMS_Ova_Max_Capsules_146_1758536636641.jpg	2025-09-22 09:18:54.164	2025-09-22 10:23:58.179
147	AMS Pearly Capsules	Benefits:  Supports skin Health and Appearance Helps Enhance Skin's Freshness Helps Prevent Skin Darkening	195000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536639/pharmacy-app/pharmacy/AMS_Pearly_Capsules_147_1758536638906.jpg	2025-09-22 09:18:55.472	2025-09-22 10:24:00.067
149	AMS Preconception Plus Capsules	BENEFITS: Supports Women's Reproductive Health. Maintains Egg & Embryo Quality. Rich with Antioxidants.	275000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536643/pharmacy-app/pharmacy/AMS_Preconception_Plus_Capsules_149_1758536643002.png	2025-09-22 09:18:58.319	2025-09-22 10:24:04.174
150	ANTEPSIN 1G Sucralfate 1g 10 Tablet		8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536645/pharmacy-app/pharmacy/ANTEPSIN_1G_Sucralfate_1g_10_Tablet_150_1758536644945.jpg	2025-09-22 09:18:59.65	2025-09-22 10:24:06.089
152	ANTHISAN BITE AND STING CREAM (Mepyramine maleate 2% w/w) 20 gm		36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536649/pharmacy-app/pharmacy/ANTHISAN_BITE_AND_STING_CREAM__Mepyramin_152_1758536648912.jpg	2025-09-22 09:19:02.414	2025-09-22 10:24:10.092
154	Anusol Ointment Hemorrhoid Treatment 25g	Relieves internal and external piles, anal itching and fissures (fissures refer to a split or crack in your skin). Apply…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536654/pharmacy-app/pharmacy/Anusol_Ointment_Hemorrhoid_Treatment_25g_154_1758536652491.jpg	2025-09-22 09:19:04.975	2025-09-22 10:24:14.823
156	ANUSOL SUPP 24PKT UK Bismuth sugallate, bismuth oxide, zinc oxide 1s		2500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536659/pharmacy-app/pharmacy/ANUSOL_SUPP_24PKT_UK_Bismuth_sugallate___156_1758536658801.jpg	2025-09-22 09:19:07.784	2025-09-22 10:24:20.044
158	Apdyl-H Cough Syrup 100ml	This combination medication is used to relieve coughs caused by the common cold and bronchitis.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536663/pharmacy-app/pharmacy/Apdyl_H_Cough_Syrup_100ml_158_1758536663184.jpg	2025-09-22 09:19:10.852	2025-09-22 10:24:24.219
159	Apdyl-H Cough Syrup 200ml	This combination medication is used to relieve coughs caused by the common cold and bronchitis.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536665/pharmacy-app/pharmacy/Apdyl_H_Cough_Syrup_200ml_159_1758536665097.jpg	2025-09-22 09:19:12.183	2025-09-22 10:24:26.028
160	Apflu Syrup 100ml	For relief of flu symptoms and allergic reactions in children above 6months of age.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536667/pharmacy-app/pharmacy/Apflu_Syrup_100ml_160_1758536666622.jpg	2025-09-22 09:19:13.679	2025-09-22 10:24:27.745
162	Apisal Stuffy Nose Kit	Natural, Safe, and drug free and can be used as often as needed. Portable 15 ml bottle and small nasal…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536679/pharmacy-app/pharmacy/Apisal_Stuffy_Nose_Kit_162_1758536678992.png	2025-09-22 09:19:16.443	2025-09-22 10:24:39.995
164	Appeton Multivitamin Lysine 60’s	Appeton Multivitamin Lysine chewable tablets are a daily multivitamin dietary supplement fortified with lysine that is proven to greatly improve…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536683/pharmacy-app/pharmacy/Appeton_Multivitamin_Lysine_60_s_164_1758536682690.jpg	2025-09-22 09:19:19.31	2025-09-22 10:24:43.711
166	Appeton Vitamin C (Black currant) Chewable Tabs 100’s	Vitamin C is a potent antioxidant which protects our body cells from the damage, strengthens the immune system and promotes…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536687/pharmacy-app/pharmacy/Appeton_Vitamin_C__Black_currant__Chewab_166_1758536686070.jpg	2025-09-22 09:19:22.311	2025-09-22 10:24:47.591
167	Appeton Vitamin C (Orange) Chewable Tabs 100’S	Vitamin C is a potent antioxidant which protects our body cells from the damage, strengthens the immune system and promotes…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536689/pharmacy-app/pharmacy/Appeton_Vitamin_C__Orange__Chewable_Tabs_167_1758536688435.jpg	2025-09-22 09:19:23.815	2025-09-22 10:24:49.385
194	AVACARE VITAMIN C 1000 mg EFFERVERSCENT TABS 20’s		20000	100	\N	2025-09-22 09:20:02.524	2025-09-22 09:20:02.524
171	Aptamil 1 800g	Aptamil® First Infant Milk powder combines our blend of ingredients with a unique process.	128000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536698/pharmacy-app/pharmacy/Aptamil_1_800g_171_1758536697916.jpg	2025-09-22 09:19:29.551	2025-09-22 10:24:59.154
172	Aptamil 2 400g	Aptamil 2 is suitable from 6 months till 12 months . Breast milk is the best for babies as it…	51000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536700/pharmacy-app/pharmacy/Aptamil_2_400g_172_1758536699995.jpg	2025-09-22 09:19:30.984	2025-09-22 10:25:01.158
174	Aptamil 3 800g	Tailored to toddlers’ nutritional needs 1 Year +. Supports normal cognitive development, function of the immune system and growth. Contains…	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536705/pharmacy-app/pharmacy/Aptamil_3_800g_174_1758536705065.jpg	2025-09-22 09:19:33.749	2025-09-22 10:25:06.228
175	Aptamil 4 800g	Suitable from 2-3 years. Tailored to toddlers' nutritional needs. With Vitamins A, C, D and Iron. Enriched with iron to…	109500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536707/pharmacy-app/pharmacy/Aptamil_4_800g_175_1758536707037.jpg	2025-09-22 09:19:35.284	2025-09-22 10:25:08.276
177	Aptamil Pepti-Junior 400g	Formula for babies with lactose intolerances or food allergies, since birth.	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536711/pharmacy-app/pharmacy/Aptamil_Pepti_Junior_400g_177_1758536710972.jpg	2025-09-22 09:19:38.153	2025-09-22 10:25:12.046
179	Aquafresh Big Teeth Fruity Mouthwash 300ml 6+ years		20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536715/pharmacy-app/pharmacy/Aquafresh_Big_Teeth_Fruity_Mouthwash_300_179_1758536714879.jpg	2025-09-22 09:19:41.327	2025-09-22 10:25:16.615
180	Aquafresh Big Teeth Toothbrush 6-8 Years	Those new big teeth are starting to come in and their smiles need special care. Aquafresh Big Teeth Toothbrush 6-8…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536718/pharmacy-app/pharmacy/Aquafresh_Big_Teeth_Toothbrush_6_8_Years_180_1758536717536.jpg	2025-09-22 09:19:42.867	2025-09-22 10:25:18.39
182	Aquafresh Milk Teeth Toothbrush 0-2 Years	Dental experts designed your baby’s first toothbrush to help you clean all surfaces of those precious first teeth. The soft…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536721/pharmacy-app/pharmacy/Aquafresh_Milk_Teeth_Toothbrush_0_2_Year_182_1758536720954.jpg	2025-09-22 09:19:45.371	2025-09-22 10:25:22.1
183	Aqueous Cream 500g	Relieves and soothes dry skin. Non-greasy moisturiser ideal to use for treating dry skin, including eczema and dermatitis. Emulsifying ointment…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536726/pharmacy-app/pharmacy/Aqueous_Cream_500g_183_1758536725444.jpg	2025-09-22 09:19:46.856	2025-09-22 10:25:26.708
185	Armaf Club De Nuit Fragrance Body Mist for Women 250ml	This is a flowery oriental perfume with a refreshing sweet side. Perfect for those romantic evenings or getaways. Allow this…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536729/pharmacy-app/pharmacy/Armaf_Club_De_Nuit_Fragrance_Body_Mist_f_185_1758536729239.jpg	2025-09-22 09:19:49.927	2025-09-22 10:25:30.262
186	Armaf Club De Nuit Intense Men Fragrance Body Mist 250ml	A sophisticated woody-spicy masculine fragrance.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536735/pharmacy-app/pharmacy/Armaf_Club_De_Nuit_Intense_Men_Fragrance_186_1758536734431.jpg	2025-09-22 09:19:51.297	2025-09-22 10:25:35.507
189	Ascoril LS Expectorant 100ml	For treatment of cough with mucus.	8500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536740/pharmacy-app/pharmacy/Ascoril_LS_Expectorant_100ml_189_1758536740052.jpg	2025-09-22 09:19:55.478	2025-09-22 10:25:41.043
190	Ascoril SF Syrup 100ml	Ascoril SF Expectorant is used in the treatment of cough with mucus. It thins mucus in the nose, windpipe, and…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536742/pharmacy-app/pharmacy/Ascoril_SF_Syrup_100ml_190_1758536742082.jpg	2025-09-22 09:19:57.142	2025-09-22 10:25:43.576
191	Ascoril Syrup 100ml	Relief in the treatment of productive cough.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536745/pharmacy-app/pharmacy/Ascoril_Syrup_100ml_191_1758536744539.jpg	2025-09-22 09:19:58.428	2025-09-22 10:25:45.653
195	Avacare Vitamin C Effervescent Tablets 20’s	Avacare’s Vitamin C Effervescent supplement contains what you need: 1000mg of Vitamin C to give your immune system that super…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536750/pharmacy-app/pharmacy/Avacare_Vitamin_C_Effervescent_Tablets_2_195_1758536750037.jpg	2025-09-22 09:20:04.047	2025-09-22 10:25:51.247
197	Aveeno Daily Moisturising Body Cleansing Oil 300ml	Combines finely-milled oatmeal with softening oil. Gently cleanses while protecting from the drying effects of water. For skin that is…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536754/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Cleansing_197_1758536753595.jpg	2025-09-22 09:20:06.825	2025-09-22 10:25:54.5
198	Aveeno Daily Moisturising Body Lotion 200ml	Moisturising Cream Formulated With Naturally Active Colloidal Oatmeal Actively Moisturises Dry And Sensitive Skin Moisturises Dry Skin For 24 Hours…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536756/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Lotion_20_198_1758536755366.png	2025-09-22 09:20:08.278	2025-09-22 10:25:56.609
200	Aveeno Daily Moisturising Body Lotion 500ml	Moisturising Cream Formulated With Naturally Active Colloidal Oatmeal Actively Moisturises Dry And Sensitive Skin Moisturises Dry Skin For 24 Hours…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536759/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Lotion_50_200_1758536758864.jpg	2025-09-22 09:20:10.894	2025-09-22 10:25:59.781
201	Aveeno Daily Moisturising Body Wash 500ml	Gently cleanses skin without drying Comes in a 500ml bottle Relieves dry irritable skin, leaving skin soft, smooth and moisturised…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536761/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Wash_500m_201_1758536760583.jpg	2025-09-22 09:20:12.243	2025-09-22 10:26:02.138
203	Aveeno Daily Moisturising Yogurt Body Wash – Vanilla & Oat Scented 300ml	Inspired by centuries old Greek yogurt, our new AVEENO Daily Moisturising Body Yogurt range, enriched with naturally active oatmeal and…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536764/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Yogurt_Body_Wa_203_1758536763208.jpg	2025-09-22 09:20:14.506	2025-09-22 10:26:04.73
204	Aveeno Moisturising Cream 300ml	Aveeno Cream moisturises skin prone to eczema for 24 hours. Regular use helps prevent dryness and irritation caused by skin…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536766/pharmacy-app/pharmacy/Aveeno_Moisturising_Cream_300ml_204_1758536765360.jpg	2025-09-22 09:20:15.733	2025-09-22 10:26:06.578
1174	Liptomil Plus 2 400g	Liptomil Plus 2 is a premium high quality Swiss-Made follow on formula from 6 month until 1 year.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538933/pharmacy-app/pharmacy/Liptomil_Plus_2_400g_1174_1758538932712.jpg	2025-09-22 09:42:26.056	2025-09-22 11:02:13.745
207	Aveeno Skin Relief Moisturising Lotion 200ml	Formulated with shea butter and a unique triple oat complex Soothes on contact, providing immediate, long-lasting relief for extra dry,…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536772/pharmacy-app/pharmacy/Aveeno_Skin_Relief_Moisturising_Lotion_2_207_1758536771361.jpg	2025-09-22 09:20:19.538	2025-09-22 10:26:12.695
208	Aveeno Skin Relief Moisturising Lotion 300ml	Formulated with shea butter and a unique triple oat complex Soothes on contact, providing immediate, long-lasting relief for extra dry,…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536774/pharmacy-app/pharmacy/Aveeno_Skin_Relief_Moisturising_Lotion_3_208_1758536773392.jpg	2025-09-22 09:20:20.662	2025-09-22 10:26:14.385
210	Avent Baby Care Set F-Box	With this baby care set  you can give the best care to your little one. The compact set includes an…	186500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536777/pharmacy-app/pharmacy/Avent_Baby_Care_Set_F_Box_210_1758536776959.jpg	2025-09-22 09:20:23.41	2025-09-22 10:26:18.677
211	Avent Classic Medium Flow Teats (3months plus)	The Avent medium flow nipple is made of soft silicone and is ideal for bottle fed babies ages 3 months…	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536780/pharmacy-app/pharmacy/Avent_Classic_Medium_Flow_Teats__3months_211_1758536779523.jpg	2025-09-22 09:20:24.833	2025-09-22 10:26:20.847
213	Avent Disposable Breast Pads 24 Pcs	Extremely thin (about 2 mm) and invisible under clothing. Soft and gentle inner layer for the skin. Made of natural…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536788/pharmacy-app/pharmacy/Avent_Disposable_Breast_Pads_24_Pcs_213_1758536787647.jpg	2025-09-22 09:20:27.943	2025-09-22 10:26:28.662
215	Avent Manual Breast Pump	The Avent manual breast pump has a soft massage cushion with a warm feel and includes a Natural bottle and…	300000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536792/pharmacy-app/pharmacy/Avent_Manual_Breast_Pump_215_1758536791883.jpg	2025-09-22 09:20:31.092	2025-09-22 10:26:33.167
216	Avent Microwave Sterilizer Bags 5pcs	Avent microwave steam sterilizer bags are a quick, easy and effective way to ensure you always have sterile baby bottles…	49900	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536794/pharmacy-app/pharmacy/Avent_Microwave_Sterilizer_Bags_5pcs_216_1758536794093.jpg	2025-09-22 09:20:32.442	2025-09-22 10:26:35.149
218	Avent Natural Bottle 125ml Twin pack	Pack of 2 Avent baby Natural bottles. Easily combined with breastfeeding thanks to the wider breast-shaped shape and ultra soft…	82000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536798/pharmacy-app/pharmacy/Avent_Natural_Bottle_125ml_Twin_pack_218_1758536797905.jpg	2025-09-22 09:20:35.088	2025-09-22 10:26:39.207
219	Avent Natural Bottle 260ml	The new Avent Natural baby bottle helps to make bottle feeding more natural for your baby and you. The teat…	54500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536800/pharmacy-app/pharmacy/Avent_Natural_Bottle_260ml_219_1758536799827.jpg	2025-09-22 09:20:36.324	2025-09-22 10:26:40.863
221	Avent Washable Breast Pads 6’s	Philips Avent Washable Breast Pads SCF155/06 have a brushed cotton lining which is soft and gentle and features an absorbent…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536807/pharmacy-app/pharmacy/Avent_Washable_Breast_Pads_6_s_221_1758536806924.jpg	2025-09-22 09:20:39.081	2025-09-22 10:26:48.141
223	Avomine Promethazine 25mg Tabs 10’s	Avomine tablet is used for the treatment of allergic symptoms such as a runny nose, itching and rash. It is…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536811/pharmacy-app/pharmacy/Avomine_Promethazine_25mg_Tabs_10_s_223_1758536810770.jpg	2025-09-22 09:20:41.948	2025-09-22 10:26:51.59
224	AXE Africa Deodorant Body Spray 150ml	Provides all day long protection against perspiration and body odour. Quickly absorbs wetness and keeps you feeling fresh.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536812/pharmacy-app/pharmacy/AXE_Africa_Deodorant_Body_Spray_150ml_224_1758536812202.jpg	2025-09-22 09:20:43.74	2025-09-22 10:26:53.253
226	Axe Brand Universal Oil 14ml	Provides temporary relief of headaches, colds, blocked noses, muscular pain, joint pain, stomach discomfort, wind, giddiness, travel sickness and soothes…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536816/pharmacy-app/pharmacy/Axe_Brand_Universal_Oil_14ml_226_1758536816010.jpg	2025-09-22 09:20:46.564	2025-09-22 10:26:57.044
227	Axe Brand Universal Oil 3ml	Quick relief for joint pain relief/ muscular pain/stiff or sore muscles/sprain. Handy medicine for home. Once applied few drops it…	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536818/pharmacy-app/pharmacy/Axe_Brand_Universal_Oil_3ml_227_1758536817847.jpg	2025-09-22 09:20:48.014	2025-09-22 10:26:58.846
229	Axe Dark Temptation Deodorant & Body Spray 150ml	Axe deo is perfect for the young man. Smells goods, lasts long, and perfect for any occassion.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536822/pharmacy-app/pharmacy/Axe_Dark_Temptation_Deodorant___Body_Spr_229_1758536821760.jpg	2025-09-22 09:20:50.578	2025-09-22 10:27:02.964
231	Aziderm 10% Cream	Contains 10% Azelaic Acid Aziderm 10% Cream is used in the treatment of acne (pimples). It effectively relieves symptoms such…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536826/pharmacy-app/pharmacy/Aziderm_10__Cream_231_1758536825967.jpg	2025-09-22 09:20:53.11	2025-09-22 10:27:06.801
232	B.B.C Mouth and Throat Spray	Relieves pain and inflammation in dental disorders, gingivitis, pre and post dental surgery, sore throat, pharyngitis, tonsilitis, dyspectic ulcers, inflammatory…	27500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536828/pharmacy-app/pharmacy/B_B_C_Mouth_and_Throat_Spray_232_1758536828007.jpg	2025-09-22 09:20:54.543	2025-09-22 10:27:08.987
234	Bactafuz Cream 15g Fusidic Acid 2%	Used in the treatment of bacterial skin infections such as impetigo (crusty patchy skin), infected dermatitis (inflamed skin with spots),…	12500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536832/pharmacy-app/pharmacy/Bactafuz_Cream_15g_Fusidic_Acid_2__234_1758536831599.jpg	2025-09-22 09:20:57.625	2025-09-22 10:27:12.395
235	Bactroban Mupirocin 2% Ointment 15g	Contains the active ingredient Mupirocin, an antibiotic used to treat skin infections caused by Staphylococci, Streptococci and E. coli bacteria,…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536833/pharmacy-app/pharmacy/Bactroban_Mupirocin_2__Ointment_15g_235_1758536833005.jpg	2025-09-22 09:20:59.253	2025-09-22 10:27:14.041
237	Balance Niacinamide Blemish Recovery Serum	Balance Active Formula Niacinamide Blemish Recovery Serum is a water-based formulation with 15% Niacinamide, a hero skincare ingredient also known…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536841/pharmacy-app/pharmacy/Balance_Niacinamide_Blemish_Recovery_Ser_237_1758536840493.jpg	2025-09-22 09:21:04.043	2025-09-22 10:27:21.704
243	Ballet Baby Jelly 250g	Effective. Smoothing. Nourishing. The Ballet Original Baby Jelly soothes and protects your baby’s skin.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536850/pharmacy-app/pharmacy/Ballet_Baby_Jelly_250g_243_1758536849906.jpg	2025-09-22 09:21:12.566	2025-09-22 10:27:30.71
239	Ballet Aloe Vera Jelly 100g	Soothes. Heals. Moisturises.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536844/pharmacy-app/pharmacy/Ballet_Aloe_Vera_Jelly_100g_239_1758536844222.jpg	2025-09-22 09:21:06.855	2025-09-22 10:27:25.064
244	Ballet Butter Blend Jelly 250g	Moisturizing. Protects. Nourishes. Softens.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536852/pharmacy-app/pharmacy/Ballet_Butter_Blend_Jelly_250g_244_1758536851387.jpg	2025-09-22 09:21:13.999	2025-09-22 10:27:32.217
246	Bath & Body Work Sweet Pea Splash 236ml	It smells like a lush, cheery bouquet. Fragrance notes: sweet pea, watery pear, sheer freesia, luscious raspberry, and soft musk.	64000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536855/pharmacy-app/pharmacy/Bath___Body_Work_Sweet_Pea_Splash_236ml_246_1758536854965.jpg	2025-09-22 09:21:16.866	2025-09-22 10:27:35.808
248	Bath & Body Works Gingham Love Splash 236ml	Scents your skin with a mist that's super layerable. The truest way to fragrance Designed for great coverage Made without…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536859/pharmacy-app/pharmacy/Bath___Body_Works_Gingham_Love_Splash_23_248_1758536858834.jpg	2025-09-22 09:21:20.148	2025-09-22 10:27:39.809
250	Bath & Body Works Japanese Cherry Blossom Mist Splash 236ml	The fragrance equivalent of your little black dress-beautiful, timeless and undeniably feminine. Scents your skin with a light-as-air-mist that's super…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536862/pharmacy-app/pharmacy/Bath___Body_Works_Japanese_Cherry_Blosso_250_1758536862294.jpg	2025-09-22 09:21:23.033	2025-09-22 10:27:43.106
251	Bath & Body Works Mad About You Splash 236 ml	Mad About You Mist is an irresistible, long-lasting mist, Formulated with a love-struck pairing of soft peonies & black currant…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536864/pharmacy-app/pharmacy/Bath___Body_Works_Mad_About_You_Splash_2_251_1758536863851.jpg	2025-09-22 09:21:24.443	2025-09-22 10:27:44.749
253	Bazuka Gel Salicylic acid and Lactic acid 26% 5g	Treatment for warts, verrucas, corns and calluses.	49000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536868/pharmacy-app/pharmacy/Bazuka_Gel_Salicylic_acid_and_Lactic_aci_253_1758536867303.jpg	2025-09-22 09:21:27.209	2025-09-22 10:27:48.353
255	Beauty Formulas Aloe Vera Soothing Feminine Intimate Wash 250ml	Soothing intimate cleansing wash. Formulated with Aloe Vera. Soap Free non-irritating for ultimate feminine hygiene. pH balanced. Specially formulated to…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536873/pharmacy-app/pharmacy/Beauty_Formulas_Aloe_Vera_Soothing_Femin_255_1758536872618.jpg	2025-09-22 09:21:30.185	2025-09-22 10:27:53.53
256	Beauty Formulas Charcoal Clay Mask 100ml	Draws out deep rooted dirt. Simple but effective. Purifies pores.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536875/pharmacy-app/pharmacy/Beauty_Formulas_Charcoal_Clay_Mask_100ml_256_1758536874295.jpg	2025-09-22 09:21:31.743	2025-09-22 10:27:55.235
258	Beauty Formulas Charcoal Facial Scrub 150ml	Deep exfoliating formula. Helps removal of blackhead. Unblocks pores for clean skin.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536879/pharmacy-app/pharmacy/Beauty_Formulas_Charcoal_Facial_Scrub_15_258_1758536878372.jpg	2025-09-22 09:21:34.525	2025-09-22 10:27:59.798
260	Beauty Formulas Glowing Serum 2% Vitamin C	A powerful serum contains 2% Vitamin C, a pro-vitamin B5 blend that helps improve and refresh skin conditions. It provides…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536883/pharmacy-app/pharmacy/Beauty_Formulas_Glowing_Serum_2__Vitamin_260_1758536882469.jpg	2025-09-22 09:21:37.373	2025-09-22 10:28:03.747
261	Beauty Formulas Illuminating 10% Niacinamide Serum	This powerful 10% Niacinamide serum helps to reduce the appearance of blemishes and uneven skin tone and texture. It helps…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536885/pharmacy-app/pharmacy/Beauty_Formulas_Illuminating_10__Niacina_261_1758536884620.jpg	2025-09-22 09:21:38.78	2025-09-22 10:28:05.521
263	Beauty Formulas Retinol Anti-Ageing Cleanser 150ml	It's gentle, yet effective formulas harness the power of Retinol, helping your skin feel younger and healthier.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536892/pharmacy-app/pharmacy/Beauty_Formulas_Retinol_Anti_Ageing_Clea_263_1758536891731.jpg	2025-09-22 09:21:41.557	2025-09-22 10:28:12.719
264	Beauty Formulas Retinol Anti-Ageing Moisturiser 75ml	Combined with vitamins E and Pro B5 to enhance skin hydration improving elasticity	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536894/pharmacy-app/pharmacy/Beauty_Formulas_Retinol_Anti_Ageing_Mois_264_1758536893635.jpg	2025-09-22 09:21:42.976	2025-09-22 10:28:14.711
266	Beauty Formulas Vitamin E Foaming Facial Wash 150ml	This foaming vitamin E facial wash provides effective daily cleansing for clean, fresh skin.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536898/pharmacy-app/pharmacy/Beauty_Formulas_Vitamin_E_Foaming_Facial_266_1758536897369.jpg	2025-09-22 09:21:45.653	2025-09-22 10:28:18.118
267	Beechams All in One Cold and Flu Liquid 160ml	Provides effective relief of symptoms associated with colds and flu, including chesty coughs.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536899/pharmacy-app/pharmacy/Beechams_All_in_One_Cold_and_Flu_Liquid__267_1758536898891.jpg	2025-09-22 09:21:46.875	2025-09-22 10:28:19.828
269	Beechams Powders Aspirin & Caffeine Sachets 10’s	Beechams powder is specially formulated for fast and effective relief from cold and flu symptoms. The powders also provide relief…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536903/pharmacy-app/pharmacy/Beechams_Powders_Aspirin___Caffeine_Sach_269_1758536902664.jpg	2025-09-22 09:21:50.064	2025-09-22 10:28:23.77
270	Bell’s Castor Oil 70ml	Prevention of hair loss. Massage Oil.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536905/pharmacy-app/pharmacy/Bell_s_Castor_Oil_70ml_270_1758536904791.jpg	2025-09-22 09:21:51.488	2025-09-22 10:28:25.85
272	Bell’s Olive Oil 200ml	Use for skin softening and massage. Also for culinary use in dressings and salads.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536909/pharmacy-app/pharmacy/Bell_s_Olive_Oil_200ml_272_1758536908997.jpg	2025-09-22 09:21:54.165	2025-09-22 10:28:30.037
273	Bells Almond Oil 70ml	For Culinary, Cosmetic And Medicinal Use	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536911/pharmacy-app/pharmacy/Bells_Almond_Oil_70ml_273_1758536910939.jpg	2025-09-22 09:21:55.482	2025-09-22 10:28:32.188
275	Bells Calamine Lotion 200ml	For minor skin irritations and sunburn.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536915/pharmacy-app/pharmacy/Bells_Calamine_Lotion_200ml_275_1758536914508.jpg	2025-09-22 09:21:58.668	2025-09-22 10:28:35.483
1133	La Roche Posay Cicaplast Baume B5+ Balm 40ml	Cicaplast Baume B5+ is a multi-purpose hydrating balm for dry skin with a rich nourishing texture that can be used for multiple…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538821/pharmacy-app/pharmacy/La_Roche_Posay_Cicaplast_Baume_B5__Balm__1133_1758538820733.png	2025-09-22 09:41:26.852	2025-09-22 11:00:22.09
278	Bells Dry Tickly Cough Syrup 200ml	For relief of tickly coughs and sore throats.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536920/pharmacy-app/pharmacy/Bells_Dry_Tickly_Cough_Syrup_200ml_278_1758536919803.jpg	2025-09-22 09:22:02.844	2025-09-22 10:28:40.655
280	Bells Mentholated Bronchial Balsam 200ml	Bell’s Mentholated Bronchial Balsam is an expectorant that helps to relieve sore throats, coughs, colds and catarrh in adults and…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536924/pharmacy-app/pharmacy/Bells_Mentholated_Bronchial_Balsam_200ml_280_1758536923453.jpg	2025-09-22 09:22:05.822	2025-09-22 10:28:44.751
281	Bells Vapour Rub 50g	Bells vapour rub is a cooling ointment with an aroma of menthol and eucalyptus.	14500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536926/pharmacy-app/pharmacy/Bells_Vapour_Rub_50g_281_1758536925946.jpg	2025-09-22 09:22:07.258	2025-09-22 10:28:47.004
283	Bells Zinc & Castor Oil Cream 225g	Protective cream to waterproof and soothe the skin. Use when changing babies nappies.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536930/pharmacy-app/pharmacy/Bells_Zinc___Castor_Oil_Cream_225g_283_1758536929705.jpg	2025-09-22 09:22:09.562	2025-09-22 10:28:50.633
285	Bennetts Nipple Cream 50ml	Bennetts Nipple Cream eases soreness and cracking, contains D – Panthenol, Lanolin and Evening Primrose Oil which are known to…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536934/pharmacy-app/pharmacy/Bennetts_Nipple_Cream_50ml_285_1758536933180.png	2025-09-22 09:22:12.571	2025-09-22 10:28:54.274
286	Benylin 4 Flu Syrup 200ml	Benylin 4 flu Syrup provides symptomatic relief of colds and influenza during both day and night.	39500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536935/pharmacy-app/pharmacy/Benylin_4_Flu_Syrup_200ml_286_1758536935126.jpg	2025-09-22 09:22:14.006	2025-09-22 10:28:56.251
288	Benylin Chesty Coughs Non-Drowsy Syrup 150ml	Benylin chesty coughs non-drowsy syrup has been formulated to loosen phlegm, clear bronchial congestion, and make your cough more productive…	49000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536943/pharmacy-app/pharmacy/Benylin_Chesty_Coughs_Non_Drowsy_Syrup_1_288_1758536943005.jpg	2025-09-22 09:22:17.18	2025-09-22 10:29:04.208
290	Benylin Children’s Dry Cough & Sore Throat Syrup	Relieves Irritating, dry and tickly Coughs And Sore Throats	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536947/pharmacy-app/pharmacy/Benylin_Children_s_Dry_Cough___Sore_Thro_290_1758536947083.jpg	2025-09-22 09:22:19.639	2025-09-22 10:29:07.91
291	Benylin Cold & Flu Max Strength Caps 16’s	Benylin cold & flu max strength contain a combination of ingredients to help relieve the symptoms of colds and flu,…	30400	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536949/pharmacy-app/pharmacy/Benylin_Cold___Flu_Max_Strength_Caps_16__291_1758536949020.png	2025-09-22 09:22:21.385	2025-09-22 10:29:10.053
293	Benylin Dry Cough Syrup 150ml	Benylin Dry Coughs Syrup helps you to clear dry and stubborn coughs, providing relief from persistent coughing.	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536954/pharmacy-app/pharmacy/Benylin_Dry_Cough_Syrup_150ml_293_1758536953294.jpg	2025-09-22 09:22:24.222	2025-09-22 10:29:14.253
295	Benylin Paediatric Cough Syrup	Provides Effective Relief Of Cough, Hay Fever And Allergies In Children Above The Age Of 2 Years.	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536958/pharmacy-app/pharmacy/Benylin_Paediatric_Cough_Syrup_295_1758536957141.jpg	2025-09-22 09:22:26.702	2025-09-22 10:29:18.646
297	Benylin Wet Cough Mucus Relief Syrup 100ml	Benylin Wet Cough Mucus Relief thins and loosens mucus making it easier for you to get rid of thick stubborn…	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536962/pharmacy-app/pharmacy/Benylin_Wet_Cough_Mucus_Relief_Syrup_100_297_1758536961214.jpg	2025-09-22 09:22:29.398	2025-09-22 10:29:22.459
298	Benzox 5 Gel 20g Benzoyl Peroxide 5%	Used for the treatment of acne.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536964/pharmacy-app/pharmacy/Benzox_5_Gel_20g_Benzoyl_Peroxide_5__298_1758536963384.png	2025-09-22 09:22:30.615	2025-09-22 10:29:24.278
300	Berocca Boost Effervescent Acerola Cherry Tablets 20’s		90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536967/pharmacy-app/pharmacy/Berocca_Boost_Effervescent_Acerola_Cherr_300_1758536966616.jpg	2025-09-22 09:22:33.361	2025-09-22 10:29:27.658
302	Berocca Mixed Berries Effervescent Tablets 15’s	Just one tablet is packed full of 11 vitamins and minerals. Berocca contains all 8 B vitamins – the Vitamin…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536971/pharmacy-app/pharmacy/Berocca_Mixed_Berries_Effervescent_Table_302_1758536970456.jpg	2025-09-22 09:22:36.13	2025-09-22 10:29:31.369
303	Berocca Orange Effervescent Tablets 15’s	Just one tablet is packed full of 11 vitamins and minerals. Berocca contains all 8 B vitamins – the Vitamin…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536972/pharmacy-app/pharmacy/Berocca_Orange_Effervescent_Tablets_15_s_303_1758536972039.jpg	2025-09-22 09:22:37.558	2025-09-22 10:29:32.881
305	Betaderm Betamethasone Cream15g	Used to treat skin irritation and itch caused by skin conditions such as eczema, psoriasis, contact dermatitis, and seborrhea. It…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536976/pharmacy-app/pharmacy/Betaderm_Betamethasone_Cream15g_305_1758536975626.jpg	2025-09-22 09:22:40.436	2025-09-22 10:29:36.873
307	Betaderm-N Cream Betamethasone and Neomycin 15g	Treats a variety of skin conditions such as eczema, dermatitis, allergies, rash and treats or prevents infection of irritated skin	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536980/pharmacy-app/pharmacy/Betaderm_N_Cream_Betamethasone_and_Neomy_307_1758536979435.jpg	2025-09-22 09:22:43.293	2025-09-22 10:29:40.258
308	Betaderm-N Ointment Betamethasone and Neomycin 15g	Treats a variety of skin conditions such as eczema, dermatitis, allergies, rash and treats or prevents infection of irritated skin	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536981/pharmacy-app/pharmacy/Betaderm_N_Ointment_Betamethasone_and_Ne_308_1758536981134.jpg	2025-09-22 09:22:44.459	2025-09-22 10:29:42.124
310	Betadine Mouthwash & Gargle 250ml	The Betadine mouthwash provides soothing relief of dryness or minor irritation of the mouth and throat.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536986/pharmacy-app/pharmacy/Betadine_Mouthwash___Gargle_250ml_310_1758536985207.jpg	2025-09-22 09:22:47.099	2025-09-22 10:29:46.092
312	Betasalic Ointment Betamethasone and Salicylic Acid 15g	Used to treat dry, scaly skin conditions like eczema and psoriasis.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536992/pharmacy-app/pharmacy/Betasalic_Ointment_Betamethasone_and_Sal_312_1758536992041.jpg	2025-09-22 09:22:49.95	2025-09-22 10:29:53.463
1136	La Roche Posay Effaclar Purifying Foaming Gel 400ml	Effaclar Purifying Foaming Gel Face Wash Cleanser gently cleanses dirt and oil while respecting the skin’s pH balance.	117000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538829/pharmacy-app/pharmacy/La_Roche_Posay_Effaclar_Purifying_Foamin_1136_1758538828677.jpg	2025-09-22 09:41:30.98	2025-09-22 11:00:29.77
315	Betnovate Ointment 30g	Used to treat itching, redness, dryness, crusting, scaling, inflammation, and discomfort of various skin conditions including Psoriasis and Eczema.	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536999/pharmacy-app/pharmacy/Betnovate_Ointment_30g_315_1758536998222.jpg	2025-09-22 09:22:53.63	2025-09-22 10:29:59.23
316	Beverly Hills Polo Club Pour Femme Body Spray NO.1 150ML	Beverly Hills Polo Club No.1 Pour Femme body spray by Beverly Hills Polo Club is a Floral Fruity Gourmand fragrance…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537001/pharmacy-app/pharmacy/Beverly_Hills_Polo_Club_Pour_Femme_Body__316_1758537000247.jpg	2025-09-22 09:22:54.718	2025-09-22 10:30:01.245
318	Beverly Hills Polo Club Sport 8 Deodorant Body Spray 175ml	Tackle bad body odour with Beverly Hills Polo Club 8 Sport Deodorant Body Spray. This deodorant is your perfect companion…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537005/pharmacy-app/pharmacy/Beverly_Hills_Polo_Club_Sport_8_Deodoran_318_1758537004547.jpg	2025-09-22 09:22:57.031	2025-09-22 10:30:05.751
320	Beverlys Hills Polo Club Pour  Femme body spray NO.8 150ML	Beverly Hills Polo club No.8 pour femme is a floral fruity fragrance for women.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537008/pharmacy-app/pharmacy/Beverlys_Hills_Polo_Club_Pour__Femme_bod_320_1758537007863.jpg	2025-09-22 09:22:59.805	2025-09-22 10:30:08.913
321	Beverlys Hills Polo Club Pour  Femme Perfume NO.8 100ML	Beverly Hills Polo club No.8 pour femme is a floral fruity fragrance for women.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537010/pharmacy-app/pharmacy/Beverlys_Hills_Polo_Club_Pour__Femme_Per_321_1758537009961.jpg	2025-09-22 09:23:00.884	2025-09-22 10:30:10.922
323	Bio Oil 125ml	A specialist skin care product, formulated to help improve the appearance of scars, stretch marks and uneven skin tone. It…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537014/pharmacy-app/pharmacy/Bio_Oil_125ml_323_1758537014057.jpg	2025-09-22 09:23:03.261	2025-09-22 10:30:15.215
324	Bio Oil 25ml	A specialist skin care product, formulated to help improve the appearance of scars, stretch marks and uneven skin tone. It…	11500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537017/pharmacy-app/pharmacy/Bio_Oil_25ml_324_1758537016221.jpg	2025-09-22 09:23:04.387	2025-09-22 10:30:17.322
326	Bio-slim Active Capsules 60’s	Begin your weight loss journey with Bio–Slim Active Capsules. Bio–Slim Active is an innovatively formulated herbal and ayurvedic product made with 15 carefully…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537021/pharmacy-app/pharmacy/Bio_slim_Active_Capsules_60_s_326_1758537020262.jpg	2025-09-22 09:23:07.562	2025-09-22 10:30:21.368
328	Blistex Intensive Moisturiser Lip Balm With SPF 10	Instant moisturisation for your lips to keep them soft throughout the day. Blistex intensive moisturiser lip balm is infused with…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537027/pharmacy-app/pharmacy/Blistex_Intensive_Moisturiser_Lip_Balm_W_328_1758537026821.jpg	2025-09-22 09:23:10.14	2025-09-22 10:30:28.327
329	Bonjela Adult Gel 15g	Effective relief for pain, discomfort and inflammation of mouth ulcers. Treats mouth ulcers, cold sores and sore spots/ulcers due to…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537030/pharmacy-app/pharmacy/Bonjela_Adult_Gel_15g_329_1758537029288.jpg	2025-09-22 09:23:11.454	2025-09-22 10:30:30.441
331	Bonnisan Syrup 120ml	Bonnisan syrup combats common GI disorders in infants and children, such as infantile colic, poor appetite, etc. It relieves smooth…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537034/pharmacy-app/pharmacy/Bonnisan_Syrup_120ml_331_1758537033831.jpg	2025-09-22 09:23:14.231	2025-09-22 10:30:35.037
333	Bottle Teats 1’s	These nipple silicone bottle teats are suitable for bottles with a standard size. They are optimal for thick food: porridge,…	1500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537038/pharmacy-app/pharmacy/Bottle_Teats_1_s_333_1758537037814.jpg	2025-09-22 09:23:16.523	2025-09-22 10:30:38.724
334	Breathezy-L Montelukast/Levocetirizine Tablets 30’s	For relief of breathing difficulties caused by allergic reactions and their symptoms like runny nose, bronchial congestion, watery eyes and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537040/pharmacy-app/pharmacy/Breathezy_L_Montelukast_Levocetirizine_T_334_1758537040073.jpg	2025-09-22 09:23:17.802	2025-09-22 10:30:40.932
335	Bronchophane Syrup 125ml	Bronchophane is a syrup used to relieve itchy, watery, irritated eyes, running nose, minor throat irritation, common colds.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537043/pharmacy-app/pharmacy/Bronchophane_Syrup_125ml_335_1758537041960.jpg	2025-09-22 09:23:19.236	2025-09-22 10:30:44.151
337	Brown Orchid Body Spray For Men 150ml	The scent given off by this perfume ensures you never go unnoticed to any event or function. This luxurious and…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537051/pharmacy-app/pharmacy/Brown_Orchid_Body_Spray_For_Men_150ml_337_1758537050367.jpg	2025-09-22 09:23:21.796	2025-09-22 10:30:51.289
338	Brown Orchid Dark Brown Perfume for Men 80ml	The Dark Brown Orchid fragrance consists of magical notes that have a captivating effect on the senses.	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537053/pharmacy-app/pharmacy/Brown_Orchid_Dark_Brown_Perfume_for_Men__338_1758537052127.jpg	2025-09-22 09:23:23.535	2025-09-22 10:30:53.367
340	Brut Musk Deodorant Spray 200ml	Start your day in a fresh mood with Brut Musk Deodorant Spray. This deodorant offers you an instant sensation of…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537056/pharmacy-app/pharmacy/Brut_Musk_Deodorant_Spray_200ml_340_1758537055994.jpg	2025-09-22 09:23:26.199	2025-09-22 10:30:57.011
341	Brut Original Deodorant Spray 200ml	Long lasting efficacy. Authentic masculine fragrance. No marks.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537059/pharmacy-app/pharmacy/Brut_Original_Deodorant_Spray_200ml_341_1758537058439.jpg	2025-09-22 09:23:27.53	2025-09-22 10:30:59.437
344	Bump Patrol Original After Shave Treatment 57ml	Bump Patrol after shave intensive treatment helps prevent and treats razor bumps and irritation caused by shaving in just 7…	46000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537064/pharmacy-app/pharmacy/Bump_Patrol_Original_After_Shave_Treatme_344_1758537064146.jpg	2025-09-22 09:23:31.727	2025-09-22 10:31:05.17
345	Bump Patrol Sensitive Formula Aftershave 57ml	The "NO BURN" version of the miracle solution eliminating ingrown hair, razor bumps, and irritation since 1991. SENSITIVE FORMULA: as…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537067/pharmacy-app/pharmacy/Bump_Patrol_Sensitive_Formula_Aftershave_345_1758537066255.jpg	2025-09-22 09:23:33.102	2025-09-22 10:31:07.599
1138	La Roche Posay Hyalu B5 Anti-Wrinkle Serum 30ml	This Serum is specifically formulated for de-hydrated skin that is showing signs of aging - loss of volume and skin…	217000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538834/pharmacy-app/pharmacy/La_Roche_Posay_Hyalu_B5_Anti_Wrinkle_Ser_1138_1758538833529.jpg	2025-09-22 09:41:33.415	2025-09-22 11:00:35.022
348	Cadistin Expectorant Syrup 100ml	It is used for relieving symptoms of sinus pressure, sinus congestion, runny nose, itching of the throat and nose, watery…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537073/pharmacy-app/pharmacy/Cadistin_Expectorant_Syrup_100ml_348_1758537072359.jpg	2025-09-22 09:23:36.95	2025-09-22 10:31:13.437
349	Calamine Lotion 100ml	For minor skin irritations and sunburn.	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537075/pharmacy-app/pharmacy/Calamine_Lotion_100ml_349_1758537074484.jpg	2025-09-22 09:23:38.487	2025-09-22 10:31:15.691
351	Calcium Lactate 300mg Tablets 100’s	Calcium lactate is a mineral that is used to treat or prevent low blood calcium levels (hypocalcemia) in people who…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537078/pharmacy-app/pharmacy/Calcium_Lactate_300mg_Tablets_100_s_351_1758537078088.jpg	2025-09-22 09:23:41.365	2025-09-22 10:31:19.166
353	Calpol Nasal Saline Spray 15ml	When your little one has a stuffed up nose, CALPOL® Saline Nasal Spray helps wash away built up mucus, helping…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537082/pharmacy-app/pharmacy/Calpol_Nasal_Saline_Spray_15ml_353_1758537081408.jpg	2025-09-22 09:23:44.027	2025-09-22 10:31:22.244
355	Calpol Suspension 100ml	Calpol has a child-resistant cap, is alcohol free and suitable for infants and children from 1 month. Paracetamol is considered…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537085/pharmacy-app/pharmacy/Calpol_Suspension_100ml_355_1758537084478.jpg	2025-09-22 09:23:46.883	2025-09-22 10:31:25.5
356	Calpol Suspension 60ml	Calpol has a child-resistant cap, is alcohol free and suitable for infants and children from 1 month. Paracetamol is considered…	9500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537087/pharmacy-app/pharmacy/Calpol_Suspension_60ml_356_1758537086285.jpg	2025-09-22 09:23:48.541	2025-09-22 10:31:27.364
357	Camera Baby Bottles 140ml	The camera smooth neck feeder has an anti-colic air valve teat. It is ideal for liquid feeds like milk and…	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537089/pharmacy-app/pharmacy/Camera_Baby_Bottles_140ml_357_1758537088560.jpg	2025-09-22 09:23:49.955	2025-09-22 10:31:30.026
359	Candid B Lotion Beclometasone + Clotrimazole 15ml	Treats fungal skin infections like ringworm, jock itch and athletes foot	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537093/pharmacy-app/pharmacy/Candid_B_Lotion_Beclometasone___Clotrima_359_1758537093133.jpg	2025-09-22 09:23:52.413	2025-09-22 10:31:34.24
361	Candid Mouth Paint 15ml	Clotrimazole Mouth Paint uses include the treatment oropharyngeal candidiasis, a type of fungal infection in the throat and mouth.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537098/pharmacy-app/pharmacy/Candid_Mouth_Paint_15ml_361_1758537097519.jpg	2025-09-22 09:23:55.588	2025-09-22 10:31:38.724
362	Candid-V Gel Clotrimazole Vaginal Gel 30g	Candid V 2% Gel is an antifungal medicine used to treat fungal infections of your vagina.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537103/pharmacy-app/pharmacy/Candid_V_Gel_Clotrimazole_Vaginal_Gel_30_362_1758537102700.jpg	2025-09-22 09:23:56.725	2025-09-22 10:31:43.844
364	Canesten Cream 1% Clotrimazole 20g	For fungal infections including fungal nappy rash.	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537107/pharmacy-app/pharmacy/Canesten_Cream_1__Clotrimazole_20g_364_1758537106316.jpg	2025-09-22 09:23:59.389	2025-09-22 10:31:47.617
365	Canesten Cream 1% Clotrimazole 50g	For fungal infections including fungal nappy rash.	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537108/pharmacy-app/pharmacy/Canesten_Cream_1__Clotrimazole_50g_365_1758537108277.jpg	2025-09-22 09:24:00.731	2025-09-22 10:31:49.072
368	Cantu Care for Kids Curling Cream 227g	Softens & defines curls, coils and waves. Tames frizz.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537113/pharmacy-app/pharmacy/Cantu_Care_for_Kids_Curling_Cream_227g_368_1758537113183.png	2025-09-22 09:24:04.804	2025-09-22 10:31:54.134
369	Cantu Care for Kids Leave-In Conditioner 283g	Moisturizes fragile coils to stop breakage. Deeply conditions for increased manageability. Infused with shea butter, coconut oil & honey.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537116/pharmacy-app/pharmacy/Cantu_Care_for_Kids_Leave_In_Conditioner_369_1758537115412.jpg	2025-09-22 09:24:06.34	2025-09-22 10:31:56.493
370	Cantu Moisturizing Curl Activator Cream 355ml	Activates curls, delivers volume & shine. Reveals frizz-free, bouncy curls.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537117/pharmacy-app/pharmacy/Cantu_Moisturizing_Curl_Activator_Cream__370_1758537117207.jpg	2025-09-22 09:24:07.414	2025-09-22 10:31:58.302
373	Cantu Shea Butter Daily Oil Moisturizer 385ml	Replenishes moisture. Helps protect against breakage, tangles & frizz. Softens strands, adds shine.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537124/pharmacy-app/pharmacy/Cantu_Shea_Butter_Daily_Oil_Moisturizer__373_1758537123723.jpg	2025-09-22 09:24:10.894	2025-09-22 10:32:05.142
374	Cantu Shea Butter Grow Strong Strengthening Treatment 173g	Strengthens fragile, weak hair to help minimise breakage. Conditions dry, brittle hair. Protects hair against heat & styling damage.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537127/pharmacy-app/pharmacy/Cantu_Shea_Butter_Grow_Strong_Strengthen_374_1758537126337.jpg	2025-09-22 09:24:11.971	2025-09-22 10:32:07.537
375	Cantu Shea Butter Hydrating Cream Conditioner 400ml	Unique formula moisturises dry, brittle hair and helps protect against split ends.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537129/pharmacy-app/pharmacy/Cantu_Shea_Butter_Hydrating_Cream_Condit_375_1758537128515.jpg	2025-09-22 09:24:13.149	2025-09-22 10:32:09.497
377	Cantu Shea Butter Leave In Conditioning Repair Cream 340g	Helps repair hair breakage, leaves strands soft and conditioned.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537134/pharmacy-app/pharmacy/Cantu_Shea_Butter_Leave_In_Conditioning__377_1758537132614.jpg	2025-09-22 09:24:15.325	2025-09-22 10:32:15.146
379	Cantu Shea Butter with Tea Tree & Jojoba Hair & Scalp Oil 180ml	Conditions & soothes the scalp. Nourishes roots to help encourage healthy hair growth. Moisturises dry, brittle hair.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537138/pharmacy-app/pharmacy/Cantu_Shea_Butter_with_Tea_Tree___Jojoba_379_1758537138139.jpg	2025-09-22 09:24:17.492	2025-09-22 10:32:18.974
380	Cardioace Max 84’s	Formulated for your hard-working heart, Cardioace Max gives you the maximum nutritional care in the Cardioace range with plant sterols,…	200000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537141/pharmacy-app/pharmacy/Cardioace_Max_84_s_380_1758537140333.png	2025-09-22 09:24:18.754	2025-09-22 10:32:21.464
384	Carmex Cherry Lipbalm 7.5g SPF15	Carmex Cherry Flavored Lip Balm SPF15 repairs and protects dry, chapped lips, returning softness and comfort, a moisturizing care cherry flavored.…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537148/pharmacy-app/pharmacy/Carmex_Cherry_Lipbalm_7_5g_SPF15_384_1758537148231.jpg	2025-09-22 09:24:23.618	2025-09-22 10:32:29.14
386	Carmex Classic Moisturising Lip Balm 10g	Carmex Original is the iconic medicated lip balm that generations have relied on to soothe and protect dry, chapped lips.…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537152/pharmacy-app/pharmacy/Carmex_Classic_Moisturising_Lip_Balm_10g_386_1758537151715.jpg	2025-09-22 09:24:26.115	2025-09-22 10:32:32.552
387	Carmex Classic Moisturising Lip Balm 7.5g	Carmex Original is the iconic medicated lip balm that generations have relied on to soothe and protect dry, chapped lips.…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537157/pharmacy-app/pharmacy/Carmex_Classic_Moisturising_Lip_Balm_7_5_387_1758537156889.png	2025-09-22 09:24:27.449	2025-09-22 10:32:38.138
389	CARNATION CORN CAPS (Salicylic Acid) 5’s?		18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537161/pharmacy-app/pharmacy/CARNATION_CORN_CAPS__Salicylic_Acid__5_s_389_1758537160713.jpg	2025-09-22 09:24:30.202	2025-09-22 10:32:41.881
390	Carnation Corn Caps 5s Salicylic Acid	Carnation Corn Caps Combine A Measured Dose Of Salicylic Acid Ointment With A Soft Felt Corn Ring To Relieve Pressure…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537163/pharmacy-app/pharmacy/Carnation_Corn_Caps_5s_Salicylic_Acid_390_1758537162643.jpg	2025-09-22 09:24:31.459	2025-09-22 10:32:43.805
392	Centrum Advance 30’s	Centrum Advance contains essential vitamins to help fill nutritional gaps if dietary intake is inadequate , supporting multiple health benefits.…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537166/pharmacy-app/pharmacy/Centrum_Advance_30_s_392_1758537166304.jpg	2025-09-22 09:24:33.831	2025-09-22 10:32:47.094
394	Centrum Advance 50+ 30’s	Centrum Advance 50+ is specially formulated for adults 50+. Has adjusted levels of key vitamins and minerals. Helps support your…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537169/pharmacy-app/pharmacy/Centrum_Advance_50__30_s_394_1758537169420.jpg	2025-09-22 09:24:36.239	2025-09-22 10:32:50.202
395	Centrum Advance 50+ 60’s	Centrum Advance 50+ is specially formulated for adults 50+. Has adjusted levels of key vitamins and minerals. Helps support your…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537171/pharmacy-app/pharmacy/Centrum_Advance_50__60_s_395_1758537171011.jpg	2025-09-22 09:24:37.571	2025-09-22 10:32:52.037
397	Centrum Fruity Chewables 30’s	Centrum Fruity Chewables is a well balanced multivitamin with a delicious citrus berry flavour.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537176/pharmacy-app/pharmacy/Centrum_Fruity_Chewables_30_s_397_1758537175878.jpg	2025-09-22 09:24:40.366	2025-09-22 10:32:57.052
398	Centrum Kids Tabs 30’s (4+ years)	Centrum Kids contains a combination of essential vitamins and minerals to support children's nutritional needs.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537178/pharmacy-app/pharmacy/Centrum_Kids_Tabs_30_s__4__years__398_1758537177849.jpg	2025-09-22 09:24:41.668	2025-09-22 10:32:59.072
400	Centrum Men 50+ 30’s	Specially formulated for men over 50 years old, Centrum Men 50+ multivitamins contain lutein, B vitamins, and vitamin D to…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537183/pharmacy-app/pharmacy/Centrum_Men_50__30_s_400_1758537182251.jpg	2025-09-22 09:24:43.948	2025-09-22 10:33:03.993
402	Centrum Performance Tablets 30’s	Unique daily multivitamin specifically formulated for sports people and active lifestyles.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537187/pharmacy-app/pharmacy/Centrum_Performance_Tablets_30_s_402_1758537187018.png	2025-09-22 09:24:46.404	2025-09-22 10:33:08.657
403	Centrum Women 30’s	Women have different nutritional needs to men so Centrum has used its expertise to develop the Centrum Women formula which…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537190/pharmacy-app/pharmacy/Centrum_Women_30_s_403_1758537189644.png	2025-09-22 09:24:47.606	2025-09-22 10:33:11.154
405	CeraVe Acne Control Cleanser 237ml	With 2% salicylic acid is formulated to clear acne, reduce blackheads and improve the appearance of pores, while purifying clay…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537194/pharmacy-app/pharmacy/CeraVe_Acne_Control_Cleanser_237ml_405_1758537193839.jpg	2025-09-22 09:24:50.3	2025-09-22 10:33:14.951
407	Cerave Advanced Repair Ointment 88ml	A lightweight, multi-purpose ointment that helps to restore the skin barrier, locking in moisture for lasting hydration and instant relief…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537198/pharmacy-app/pharmacy/Cerave_Advanced_Repair_Ointment_88ml_407_1758537197890.jpg	2025-09-22 09:24:52.603	2025-09-22 10:33:19.346
409	Cerave Blemish Control Gel 40ml	Cerave Blemish Control Gel is a lightweight, hydrating full-face AHA/BHA gel that helps target blemishes and helps prevent future breakouts,…	122000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537202/pharmacy-app/pharmacy/Cerave_Blemish_Control_Gel_40ml_409_1758537202118.jpg	2025-09-22 09:24:55.402	2025-09-22 10:33:23.342
410	Cerave Eye Repair Cream 14ml	Cerave Eye Repair Cream 14ml is a lightweight formula that moisturises the delicate eye area, improving the appearance of puffiness…	88000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537205/pharmacy-app/pharmacy/Cerave_Eye_Repair_Cream_14ml_410_1758537204478.jpg	2025-09-22 09:24:56.724	2025-09-22 10:33:25.497
412	CeraVe Foaming Facial Cleanser 355ml	Contains 3 Essential Ceramides to respect the skin's natural barrier. With Niacinamide and Hyaluronic Acid, the foaming gel formula cleanses…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537213/pharmacy-app/pharmacy/CeraVe_Foaming_Facial_Cleanser_355ml_412_1758537212432.png	2025-09-22 09:24:59.517	2025-09-22 10:33:33.49
413	CeraVe Foaming Facial Cleanser 473ml	Contains 3 Essential Ceramides to respect the skin's natural barrier. With Niacinamide and Hyaluronic Acid, the foaming gel formula cleanses…	102000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537215/pharmacy-app/pharmacy/CeraVe_Foaming_Facial_Cleanser_473ml_413_1758537214328.jpg	2025-09-22 09:25:00.802	2025-09-22 10:33:35.542
415	CeraVe Hydrating Cleanser 437ml	Cleanses and hydrates without disrupting the protective skin moisture barrier.	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537218/pharmacy-app/pharmacy/CeraVe_Hydrating_Cleanser_437ml_415_1758537218047.jpg	2025-09-22 09:25:03.477	2025-09-22 10:33:39.11
560	Cow & Gate 3 800g	From first steps to full throttle, first words to small talk – it’s a joy to see your toddler’s personality shining…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537543/pharmacy-app/pharmacy/Cow___Gate_3_800g_560_1758537542630.png	2025-09-22 09:28:19.912	2025-09-22 10:39:04.951
1428	Nurofen Cold & Flu Relief Tabs 24’s	Fever, congestion, sore throat, head + body aches. Each pack contains 24 tablets.	52800	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539551/pharmacy-app/pharmacy/Nurofen_Cold___Flu_Relief_Tabs_24_s_1428_1758539550145.jpg	2025-09-22 09:48:34.49	2025-09-22 11:12:31.337
427	CeraVe Moisturising Lotion 236mls	For Dry to Very Skin. With ceramides 1, 3 and 6-II to help protect the skin's natural barrier. Hyaluronic Acid…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537242/pharmacy-app/pharmacy/CeraVe_Moisturising_Lotion_236mls_427_1758537242020.jpg	2025-09-22 09:25:17.532	2025-09-22 10:34:03.018
418	Cerave Hydrating Foaming Oil Cleanser 473ml	It gently yet effectively cleanses the skin’s surface and removes excess oil without leaving your skin feeling tight or dry.	94000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537225/pharmacy-app/pharmacy/Cerave_Hydrating_Foaming_Oil_Cleanser_47_418_1758537224717.jpg	2025-09-22 09:25:07.092	2025-09-22 10:33:45.971
420	CeraVe Hydrating Mineral Sunscreen SPF 50+	CeraVe Hydrating Mineral Sunscreen Face Lotion with Broad Spectrum SPF 50 is a 100%-mineral, oil-free sunscreen with titanium dioxide and…	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537229/pharmacy-app/pharmacy/CeraVe_Hydrating_Mineral_Sunscreen_SPF_5_420_1758537228863.jpg	2025-09-22 09:25:09.274	2025-09-22 10:33:49.964
421	CeraVe Hydrating Toner	CeraVe Hydrating Toner, with ceramides, hyaluronic acid, and niacinamide, helps restore the skin’s natural protective barrier for improved hydration and…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537231/pharmacy-app/pharmacy/CeraVe_Hydrating_Toner_421_1758537230865.jpg	2025-09-22 09:25:10.562	2025-09-22 10:33:51.691
423	Cerave Micellar Cleansing Water 295ml	A micellar water cleanser is a gentle way to remove excess oil, dirt and makeup that doesn’t require rinsing. CeraVe…	87000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537235/pharmacy-app/pharmacy/Cerave_Micellar_Cleansing_Water_295ml_423_1758537234703.jpg	2025-09-22 09:25:12.966	2025-09-22 10:33:56.143
425	CeraVe Moisturising Cream 454g	Developed with dermatologists, the rich formula of the CeraVe Moisturising Cream protects the skin barrier with three essential ceramides and…	148000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537240/pharmacy-app/pharmacy/CeraVe_Moisturising_Cream_454g_425_1758537239417.jpg	2025-09-22 09:25:15.245	2025-09-22 10:34:00.959
428	CeraVe Moisturising Lotion 473mls	For Dry to Very Skin. With ceramides 1, 3 and 6-II to help protect the skin's natural barrier. Hyaluronic Acid…	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537244/pharmacy-app/pharmacy/CeraVe_Moisturising_Lotion_473mls_428_1758537243821.jpg	2025-09-22 09:25:18.67	2025-09-22 10:34:04.765
430	CeraVe PM Facial Moisturizing Lotion 89ml	Lightweight night cream with niacinamide. Oil-free.	112000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537248/pharmacy-app/pharmacy/CeraVe_PM_Facial_Moisturizing_Lotion_89m_430_1758537247895.jpg	2025-09-22 09:25:20.956	2025-09-22 10:34:09.215
431	CeraVe Resurfacing Retinol Serum 30ml	CeraVe Resurfacing Retinol Serum helps smooth your skin's texture by reducing the appearance of post-acne marks, minimizing the look of…	142000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537251/pharmacy-app/pharmacy/CeraVe_Resurfacing_Retinol_Serum_30ml_431_1758537250235.jpg	2025-09-22 09:25:22.04	2025-09-22 10:34:11.571
433	CeraVe SA Rough & Bumpy Skin Lotion	With a lightweight, non-greasy formula containing salicylic acid, lactic acid, and hyaluronic acid, CeraVe SA Lotion for Rough & Bumpy…	98000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537256/pharmacy-app/pharmacy/CeraVe_SA_Rough___Bumpy_Skin_Lotion_433_1758537255444.jpg	2025-09-22 09:25:24.481	2025-09-22 10:34:16.486
435	CeraVe SA Smoothing Cream 340g	A salicylic acid cream gentle on Skin, fragrance-free and non-comedogenic. Suitable for Keratosis Pilaris and Psoriasis-Prone Skin	110500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537260/pharmacy-app/pharmacy/CeraVe_SA_Smoothing_Cream_340g_435_1758537260079.jpg	2025-09-22 09:25:27.225	2025-09-22 10:34:21.299
436	CeraVe Skin Renewing Vitamin C Serum 30ml	Skin-brightening antioxidant serum. Corrects hyperpigmentation, dark spots and acne scars. It also enhances collagen production to reduce wrinkles.	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537262/pharmacy-app/pharmacy/CeraVe_Skin_Renewing_Vitamin_C_Serum_30m_436_1758537262076.png	2025-09-22 09:25:28.306	2025-09-22 10:34:23.109
437	Cerumol Ear Drops 10ml	For lubrication and removal of excess ear wax.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537267/pharmacy-app/pharmacy/Cerumol_Ear_Drops_10ml_437_1758537267076.jpg	2025-09-22 09:25:29.416	2025-09-22 10:34:28.16
439	Cetaphil Gentle Skin Cleanser 473ml	Cetaphil Gentle Skin Cleanser cleanses, moisturises and gently removes what your skin doesn’t need, without stripping away the skin’s natural…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537271/pharmacy-app/pharmacy/Cetaphil_Gentle_Skin_Cleanser_473ml_439_1758537271108.jpg	2025-09-22 09:25:31.665	2025-09-22 10:34:32.024
441	Cetaphil Moisturising Lotion 473ml	Soothes and hydrates Fragrance-free and non-comedogenic Clinically proven to bind water to the skin and prevent moisture loss Quick absorption…	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537276/pharmacy-app/pharmacy/Cetaphil_Moisturising_Lotion_473ml_441_1758537276044.png	2025-09-22 09:25:33.827	2025-09-22 10:34:37.376
443	Cetirizine Hydrochloride 10mg (UK) 30’s	Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537281/pharmacy-app/pharmacy/Cetirizine_Hydrochloride_10mg__UK__30_s_443_1758537280900.jpg	2025-09-22 09:25:35.987	2025-09-22 10:34:41.923
444	Change De Canal Noir Perfume 100ml	An alluring, mysterious, and enchanting fragrance that will help you explore your secret desires and awaken your dormant senses. A…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537283/pharmacy-app/pharmacy/Change_De_Canal_Noir_Perfume_100ml_444_1758537282698.jpg	2025-09-22 09:25:37.083	2025-09-22 10:34:43.73
446	ChapStick Protect & Moisturise Classic Original Lip Balm	ChapStick Classic Original flavor is more than a lip balm, it's lip love and it has stood the test of…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537287/pharmacy-app/pharmacy/ChapStick_Protect___Moisturise_Classic_O_446_1758537286441.jpg	2025-09-22 09:25:39.353	2025-09-22 10:34:48.106
448	Chicco Baby Moments Bady Lotion[0m+] 200ml	Chicco Baby Moments Baby Lotion is a gentle, soothing lotion designed to keep your baby’s delicate skin soft and moisturized.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537292/pharmacy-app/pharmacy/Chicco_Baby_Moments_Bady_Lotion_0m___200_448_1758537291264.jpg	2025-09-22 09:25:41.508	2025-09-22 10:34:52.531
883	Gestid Chewable Antacid Tablets 20’s	Tasty chewable antacid tablets for relief of hyperacidity, heart burns and gas.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538269/pharmacy-app/pharmacy/Gestid_Chewable_Antacid_Tablets_20_s_883_1758538268773.jpg	2025-09-22 09:35:18.27	2025-09-22 10:51:09.943
451	Chicco Baby Moments Nappy Cream[0m+]	Formulated to protect the skin of babies and prevent irritation and diaper rash. Perfect for Nappy Changing	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537298/pharmacy-app/pharmacy/Chicco_Baby_Moments_Nappy_Cream_0m___451_1758537297675.jpg	2025-09-22 09:25:44.979	2025-09-22 10:34:58.983
453	Chicco Baby Moments No-Tears Shampoo[0m+] 750ml	with 92% naturally derived-ingredients Cleanses baby’s fine hair and delicate skin in a single step. No-tears formula contains calendula extract…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537303/pharmacy-app/pharmacy/Chicco_Baby_Moments_No_Tears_Shampoo_0m__453_1758537302379.jpg	2025-09-22 09:25:47.165	2025-09-22 10:35:03.291
454	Chicco Baby Moments Talco Talcum Powder[0m+]	Chicco Baby Moments Talco Talcum Powder is designed to keep your baby’s skin feeling fresh, dry, and comfortable. This gentle,…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537304/pharmacy-app/pharmacy/Chicco_Baby_Moments_Talco_Talcum_Powder__454_1758537304212.jpg	2025-09-22 09:25:48.339	2025-09-22 10:35:05.796
456	Chris Adams Active Man Deodorant Body Spray 200ml	Refreshing Aromatic Floral Woody Deodorant Spray. Premium Long Lasting Fragrance. Daily Use Deodorant For Men. Perfect Gift For Men.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537308/pharmacy-app/pharmacy/Chris_Adams_Active_Man_Deodorant_Body_Sp_456_1758537308394.jpg	2025-09-22 09:25:50.673	2025-09-22 10:35:09.494
458	Chris Adams Active Woman Deodorant Body Spray 200ml	24hour anti-perspirant benefits and a fresh scent that lasts all day!	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537313/pharmacy-app/pharmacy/Chris_Adams_Active_Woman_Deodorant_Body__458_1758537312519.jpg	2025-09-22 09:25:52.854	2025-09-22 10:35:13.548
459	Chris Adams Active Woman Perfume 80ml	Active Woman by Chris Adams is a Floral Woody Musk fragrance for women.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537314/pharmacy-app/pharmacy/Chris_Adams_Active_Woman_Perfume_80ml_459_1758537314311.jpg	2025-09-22 09:25:53.93	2025-09-22 10:35:15.469
461	Chris Adams Pure Red Pour Femme Perfume 100ml	Enchanting blend of modernity with audacious complex blend of lemon, fruits and herbs which has a sensual undertone of sweet…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537319/pharmacy-app/pharmacy/Chris_Adams_Pure_Red_Pour_Femme_Perfume__461_1758537318043.jpg	2025-09-22 09:25:56.088	2025-09-22 10:35:19.842
463	Cinnaron 25mg Tablets 50’s	Contains Cinnarizine 25mg for relief of motion sickness (nausea due to motion, especially while traveling in a moving vehicle), vertigo…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537326/pharmacy-app/pharmacy/Cinnaron_25mg_Tablets_50_s_463_1758537325884.jpg	2025-09-22 09:25:58.454	2025-09-22 10:35:27.047
464	Cipladon Effervercent Paracetamol 500mg Tablets 16s		16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537331/pharmacy-app/pharmacy/Cipladon_Effervercent_Paracetamol_500mg__464_1758537330547.png	2025-09-22 09:25:59.718	2025-09-22 10:35:31.751
465	Cipladon Efferverscent Paracetamol 1000mg Tablets 8s		14400	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537331/pharmacy-app/pharmacy/Cipladon_Effervercent_Paracetamol_500mg__464_1758537330547.png	2025-09-22 09:26:01.337	2025-09-22 10:35:32.365
467	Clabane Acne Cleanser 150ml	Clabane organics Acne cleanser is specially formulated using to help  control acne breakouts, moisturise your skin, unblock pores and sooth…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537335/pharmacy-app/pharmacy/Clabane_Acne_Cleanser_150ml_467_1758537335026.jpg	2025-09-22 09:26:06.967	2025-09-22 10:35:36.052
469	Clabane Baby Sensitive Skin Cream 300ml	The Clabane Baby Sensitive Skin cream gently soothes, protects and softens babies’ delicate skin. It helps the skin to retain…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537339/pharmacy-app/pharmacy/Clabane_Baby_Sensitive_Skin_Cream_300ml_469_1758537338866.jpg	2025-09-22 09:26:09.967	2025-09-22 10:35:39.704
471	Clabane Exfoliate and Refine Kojic Acid Cleansing Bar 140g	Clabane Exfoliate & Refine Kojic Acid Cleansing Bar, 140g contains Glutathione, Kojic acid, vitamin C, and tea tree oil.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537343/pharmacy-app/pharmacy/Clabane_Exfoliate_and_Refine_Kojic_Acid__471_1758537342631.jpg	2025-09-22 09:26:13.008	2025-09-22 10:35:43.732
472	Clabane Face Moisturizer with Sunscreen SPF 15 50ml	Clabane Face Moisturizer with Sunscreen SPF 15 has an anti-aging blend of super potent botanicals. It is oil free, fragrance…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537345/pharmacy-app/pharmacy/Clabane_Face_Moisturizer_with_Sunscreen__472_1758537344619.jpg	2025-09-22 09:26:14.385	2025-09-22 10:35:45.471
474	Clabane MD Cracked Skin Softening Cream 100g	Softens and moisturizes thick, dry, cracked skin on feet, elbows, knees, and hands.	49000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537348/pharmacy-app/pharmacy/Clabane_MD_Cracked_Skin_Softening_Cream__474_1758537347807.jpg	2025-09-22 09:26:17.641	2025-09-22 10:35:48.765
476	Clabane Protect & Refine Face Moisturizer with Sunscreen SPF 30 50ml	Clabane Protect & Refine Face Moisturizer with sunscreen SPF 30 50mls helps to refine pores and soften and soothe skin.…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537352/pharmacy-app/pharmacy/Clabane_Protect___Refine_Face_Moisturize_476_1758537351506.jpg	2025-09-22 09:26:20.431	2025-09-22 10:35:52.745
477	Clabane Pure Intense Moisture Lotion 300ml	Ideal for dry, irritated skin. Fragrance-free with 10% Urea for all-day moisture retention. Enhanced with Hyaluronic acid for deep hydration…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537354/pharmacy-app/pharmacy/Clabane_Pure_Intense_Moisture_Lotion_300_477_1758537353434.jpg	2025-09-22 09:26:22.302	2025-09-22 10:35:54.469
479	Clabane Refine and Glow Body Milk 300ml	Clabane Refine and Glow body milk is an anti-aging body milk that helps you achieve a smooth, soft, spot-clear body…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537358/pharmacy-app/pharmacy/Clabane_Refine_and_Glow_Body_Milk_300ml_479_1758537357216.jpg	2025-09-22 09:26:25.503	2025-09-22 10:35:58.991
481	Clarinase Tablets 14’s	Clarinase Tablets contain a combination of two medicines, an antihistamine, and a decongestant. For relief of nasal congestion and a…	49000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537362/pharmacy-app/pharmacy/Clarinase_Tablets_14_s_481_1758537361516.jpg	2025-09-22 09:26:28.369	2025-09-22 10:36:02.425
482	Clarityne Loratidine 10mg Tablets 10’s	Claritine is used in the treatment of allergies and the symptoms it can cause.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537364/pharmacy-app/pharmacy/Clarityne_Loratidine_10mg_Tablets_10_s_482_1758537364067.png	2025-09-22 09:26:29.496	2025-09-22 10:36:05.859
483	Classics Nail Polish Remover 150ml		10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537367/pharmacy-app/pharmacy/Classics_Nail_Polish_Remover_150ml_483_1758537366531.jpg	2025-09-22 09:26:30.745	2025-09-22 10:36:07.962
1141	La Roche Posay Lipikar Surgras Cleansing Bar Soap 150g	A lipid-enriched cleansing bar for dry skin that preserves the physiological balance of even the most sensitive skin.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538840/pharmacy-app/pharmacy/La_Roche_Posay_Lipikar_Surgras_Cleansing_1141_1758538840041.jpg	2025-09-22 09:41:37.322	2025-09-22 11:00:40.916
510	Coldcap Day & Night Time Capsules 24’s	Cold cap is used for common cold, flu, watery eyes caused by allergies, runny nose, watery eyes, rhinitis, hay fever…	9600	100	\N	2025-09-22 09:27:07.505	2025-09-22 09:27:07.505
486	Clean & Clear Deep Action Cream Wash 150ml	Clean & Clear's Deep Action Cream Wash deeply clean your skin to help prevent breakouts and spots. It cleanses deep…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537374/pharmacy-app/pharmacy/Clean___Clear_Deep_Action_Cream_Wash_150_486_1758537373770.jpg	2025-09-22 09:26:34.842	2025-09-22 10:36:14.862
487	Clean & Clear Deep Action Facial Wipes	Clean & Clear daily facial wipes clean deep down into the pores to remove the daily build-up of make-up, dirt…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537380/pharmacy-app/pharmacy/Clean___Clear_Deep_Action_Facial_Wipes_487_1758537379359.jpg	2025-09-22 09:26:36.05	2025-09-22 10:36:20.998
489	Clean & Clear Dual Action Oil-Free Moisturiser 100ml	Clean & Clear Dual Action Oil-Free Moisturiser moisturises without clogging pores, while helping to prevent spots and blemishes leaving skin…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537384/pharmacy-app/pharmacy/Clean___Clear_Dual_Action_Oil_Free_Moist_489_1758537383488.jpg	2025-09-22 09:26:39.038	2025-09-22 10:36:24.795
490	Clean & Clear Exfoliating Daily Wash 150ml	Clean & Clear daily exfoliating wash contains naturally derived exfoliators remove excess oil, dirt and dead skin cells that can…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537386/pharmacy-app/pharmacy/Clean___Clear_Exfoliating_Daily_Wash_150_490_1758537386163.jpg	2025-09-22 09:26:40.453	2025-09-22 10:36:27.014
492	Clear & Simple Ovulation Test Strips 5’s	The Clear & Simple ovulation test strips work by detecting the monthly surge in a key fertility hormone (Luteinising hormone…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537390/pharmacy-app/pharmacy/Clear___Simple_Ovulation_Test_Strips_5_s_492_1758537389767.jpg	2025-09-22 09:26:43.196	2025-09-22 10:36:30.941
494	Clearasil Multi Action 5 In 1 Cleansing Wash 150ml	Target 5 skin concerns in 1 simple step: 1. Deep cleans 2. Unblocks pores 3. Removes excess oil 4. Helps…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537395/pharmacy-app/pharmacy/Clearasil_Multi_Action_5_In_1_Cleansing__494_1758537394746.png	2025-09-22 09:26:45.778	2025-09-22 10:36:35.853
495	Clearasil Multi Action 5 In 1 Exfoliating Scrub 150ml	Unblocks pores and cleanses your skin deeply. Protects pimples from growing bigger and removes excess oil. Prevents pimples leaving marks.…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537397/pharmacy-app/pharmacy/Clearasil_Multi_Action_5_In_1_Exfoliatin_495_1758537397227.png	2025-09-22 09:26:47.212	2025-09-22 10:36:38.21
497	Clearasil Rapid Action Gel Wash 150ml	Clearasil® Rapid Action Gel Wash gives you visibly clearer skin in as fast as 12 hours. Works fast to open…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537402/pharmacy-app/pharmacy/Clearasil_Rapid_Action_Gel_Wash_150ml_497_1758537401468.png	2025-09-22 09:26:50.181	2025-09-22 10:36:42.687
498	Clearasil Ultra Rapid Action Treatment Cream 25ml	Opens up blocked pores and delivers active spot fighting ingredients deep into the skin to help clear spots fast.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537404/pharmacy-app/pharmacy/Clearasil_Ultra_Rapid_Action_Treatment_C_498_1758537403498.jpg	2025-09-22 09:26:51.634	2025-09-22 10:36:44.466
500	Cleocin T Lotion Clindamycin 1% 30ml	Used to treat mild to moderate acne.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537408/pharmacy-app/pharmacy/Cleocin_T_Lotion_Clindamycin_1__30ml_500_1758537407695.png	2025-09-22 09:26:54.164	2025-09-22 10:36:48.757
501	Clindamycin & Tretinoin CLEAR-T Gel	It is used to treat acne.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537410/pharmacy-app/pharmacy/Clindamycin___Tretinoin_CLEAR_T_Gel_501_1758537409604.png	2025-09-22 09:26:55.373	2025-09-22 10:36:50.6
503	Clinviva N Gel Clindamycin Niacinamide	Clinviva N Gel is a combination of two medicines: Clindamycin and Nicotinamide, which treats pimples (acne)	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537413/pharmacy-app/pharmacy/Clinviva_N_Gel_Clindamycin_Niacinamide_503_1758537413136.jpg	2025-09-22 09:26:57.759	2025-09-22 10:36:53.987
505	Clotrimazole Cream 1% 20g	Used to treat a range of skin infections caused by yeasts, including infections in the breast fold, vaginal thrush or…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537417/pharmacy-app/pharmacy/Clotrimazole_Cream_1__20g_505_1758537416766.jpg	2025-09-22 09:27:00.523	2025-09-22 10:36:57.677
506	Clycin-T Topical lotion 1% 30ml	Clycin-T lotion is used in management of acne since it helps to control the symptoms of bacteria.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537421/pharmacy-app/pharmacy/Clycin_T_Topical_lotion_1__30ml_506_1758537420426.png	2025-09-22 09:27:01.825	2025-09-22 10:37:01.558
507	Coferb Plus Sugar Free 120ml	For the treatment of cough and to improve breathing.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537425/pharmacy-app/pharmacy/Coferb_Plus_Sugar_Free_120ml_507_1758537424951.png	2025-09-22 09:27:03	2025-09-22 10:37:06.744
509	Coldafex Flu Tablets 4’s	For Cold , Flu and Catarrh, Fever ,Headache , Rhinitis , Nasal Congestion and Common Cold.	600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537430/pharmacy-app/pharmacy/Coldafex_Flu_Tablets_4_s_509_1758537429930.jpg	2025-09-22 09:27:06.054	2025-09-22 10:37:10.783
512	Coldcap Original Capsules 96’s	Cold cap is used for common cold, flu, watery eyes caused by allergies, runny nose, watery eyes, rhinitis, hay fever…	28800	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537434/pharmacy-app/pharmacy/Coldcap_Original_Capsules_96_s_512_1758537434166.jpg	2025-09-22 09:27:10.867	2025-09-22 10:37:14.964
513	Coldcap Syrup 100ml	Cold cap is used for common cold, flu, watery eyes caused by allergies, runny nose, watery eyes, rhinitis, hay fever…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537440/pharmacy-app/pharmacy/Coldcap_Syrup_100ml_513_1758537439260.jpg	2025-09-22 09:27:12.299	2025-09-22 10:37:20.241
515	Coldease Syrup 100ml	For relief of running nose, headache, fever and other symptoms associated with a flu.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537443/pharmacy-app/pharmacy/Coldease_Syrup_100ml_515_1758537442926.jpg	2025-09-22 09:27:15.371	2025-09-22 10:37:24.161
517	Colgate Double Action Medium Toothbrush – 2 Pack	V-shaped bristles gently penetrate deeper and clean between teeth.	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537447/pharmacy-app/pharmacy/Colgate_Double_Action_Medium_Toothbrush__517_1758537446737.jpg	2025-09-22 09:27:18.341	2025-09-22 10:37:27.499
521	Colgate Kid’s Strawberry Toothpaste 0-2 Yrs	A cavity-fighting formula to leave kids’ teeth sparkling clean and strong.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537454/pharmacy-app/pharmacy/Colgate_Kid_s_Strawberry_Toothpaste_0_2__521_1758537453309.jpg	2025-09-22 09:27:24.588	2025-09-22 10:37:34.474
523	Colgate Maximum Cavity Protection Regular Toothpaste 100ml	For stronger, whiter teeth and fresh breath.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537458/pharmacy-app/pharmacy/Colgate_Maximum_Cavity_Protection_Regula_523_1758537457197.jpg	2025-09-22 09:27:27.558	2025-09-22 10:37:39.21
524	Colgate Maximum Cavity Protection Toothpaste 230g	With calcium and active fluoride formula clinically proven to strengthen teeth and repair weak spots in the enamel.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537460/pharmacy-app/pharmacy/Colgate_Maximum_Cavity_Protection_Toothp_524_1758537460082.jpg	2025-09-22 09:27:28.936	2025-09-22 10:37:41.185
526	Colgate Toothpaste Triple Action 100ml	Provides triple benefits with proven cavity protection.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537464/pharmacy-app/pharmacy/Colgate_Toothpaste_Triple_Action_100ml_526_1758537464164.jpg	2025-09-22 09:27:31.756	2025-09-22 10:37:45.282
527	Colgate Zigzag Plus Toothbrush 3’s	Designed to remove plaque that is between teeth.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537467/pharmacy-app/pharmacy/Colgate_Zigzag_Plus_Toothbrush_3_s_527_1758537466316.jpg	2025-09-22 09:27:33.126	2025-09-22 10:37:47.624
529	COMPEED ANTI BLISTER STICK?		30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537470/pharmacy-app/pharmacy/COMPEED_ANTI_BLISTER_STICK__529_1758537470121.jpg	2025-09-22 09:27:35.434	2025-09-22 10:37:51.154
531	Contus 650 Tablets 10’s	Relieves nasal and sinus congestion, allergic symptoms of the nose or throat due to upper respiratory tract, sinus pain and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537474/pharmacy-app/pharmacy/Contus_650_Tablets_10_s_531_1758537474023.jpg	2025-09-22 09:27:37.724	2025-09-22 10:37:55.244
533	Corsodyl  Mint Mouthwash 300ml	For bleeding gums, irritated gums and mouth ulcers. Fresh minty flavour. Alcohol free.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537478/pharmacy-app/pharmacy/Corsodyl__Mint_Mouthwash_300ml_533_1758537477534.jpg	2025-09-22 09:27:40.59	2025-09-22 10:37:58.335
534	Corsodyl Fresh Mint Mouthwash 500ml	Promotes gum healing. Kills bacteria between teeth. Alcohol free.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537479/pharmacy-app/pharmacy/Corsodyl_Fresh_Mint_Mouthwash_500ml_534_1758537479115.jpg	2025-09-22 09:27:42.024	2025-09-22 10:38:00.233
536	Coscopin Syrup 100ml	For quick relief of cough and flu symptoms.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537483/pharmacy-app/pharmacy/Coscopin_Syrup_100ml_536_1758537482966.png	2025-09-22 09:27:44.993	2025-09-22 10:38:03.932
538	Cotton Balls 100’s	Ideal for skincare, makeup removal and first aid.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537490/pharmacy-app/pharmacy/Cotton_Balls_100_s_538_1758537490118.jpg	2025-09-22 09:27:47.882	2025-09-22 10:38:11.292
539	COTTON BALLS?(SEA PEARLS) APPROX 100BALLS		6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537492/pharmacy-app/pharmacy/COTTON_BALLS__SEA_PEARLS__APPROX_100BALL_539_1758537492133.jpg	2025-09-22 09:27:49.294	2025-09-22 10:38:13.769
540	COTTON ROLL 500GMS		10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537495/pharmacy-app/pharmacy/COTTON_ROLL_500GMS_540_1758537494434.jpg	2025-09-22 09:27:50.721	2025-09-22 10:38:15.549
542	Cottons Maternity Pads 10’s	Just like the rest of the Cottons range, Cottons Maternity Pads are highly effective and made with a special 100%…	23500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537499/pharmacy-app/pharmacy/Cottons_Maternity_Pads_10_s_542_1758537498746.jpg	2025-09-22 09:27:52.973	2025-09-22 10:38:20.304
544	Cottons Regular Tampons 16’s	Cottons Regular tampons are soft and absorbent, made totally out of natural cotton. With no hidden nasties, the regular tampons…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537505/pharmacy-app/pharmacy/Cottons_Regular_Tampons_16_s_544_1758537504173.jpg	2025-09-22 09:27:55.444	2025-09-22 10:38:25.322
546	Cottons Super Tampons 16’s	Most tampons contain synthetic materials. Cottons don't. Cottons are only made of 100% natural cotton and are chemical free. They…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537509/pharmacy-app/pharmacy/Cottons_Super_Tampons_16_s_546_1758537508609.jpg	2025-09-22 09:27:58.509	2025-09-22 10:38:29.621
548	Cottons Ultra Thin Regular Pads With Wings 14’s	Featuring a unique 100% cotton cover sheet, Cottons Ultra Thin Regular Pads with Wings are slim, highly effective, discrete and…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537512/pharmacy-app/pharmacy/Cottons_Ultra_Thin_Regular_Pads_With_Win_548_1758537512408.jpg	2025-09-22 09:28:01.479	2025-09-22 10:38:33.719
549	Cough Linctus Syrup 1litre	For dry and irritating coughs.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537515/pharmacy-app/pharmacy/Cough_Linctus_Syrup_1litre_549_1758537514507.jpg	2025-09-22 09:28:03.118	2025-09-22 10:38:35.664
550	Cough Linctus Syrup 200ml	For dry irritating coughs.	2500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537517/pharmacy-app/pharmacy/Cough_Linctus_Syrup_200ml_550_1758537516442.jpg	2025-09-22 09:28:04.654	2025-09-22 10:38:37.508
552	Covonia Catarrh Relief Formula 150ml	Covonia Catarrh Relief Formula, effective relief for nasal and throat catarrh, non drowsy.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537520/pharmacy-app/pharmacy/Covonia_Catarrh_Relief_Formula_150ml_552_1758537519930.jpg	2025-09-22 09:28:07.557	2025-09-22 10:38:40.813
554	Covonia Chesty Cough Sugar Free Syrup 150ml	Covonia Chesty Cough Syrup is a non-drowsy, sugar free syrup used to help clear chesty coughs.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537525/pharmacy-app/pharmacy/Covonia_Chesty_Cough_Sugar_Free_Syrup_15_554_1758537524487.jpg	2025-09-22 09:28:10.798	2025-09-22 10:38:46.095
556	Covonia Sore Throat Spray 30ml	Covonia Sore Throat Spray relieves the symptoms of painful, irritated sore throats.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537529/pharmacy-app/pharmacy/Covonia_Sore_Throat_Spray_30ml_556_1758537528690.jpg	2025-09-22 09:28:13.972	2025-09-22 10:38:49.9
557	Cow & Gate 1 900g	Cow & Gate first infant milk is a nutritionally complete breastmilk substitute suitable from birth. It can be used for…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537532/pharmacy-app/pharmacy/Cow___Gate_1_900g_557_1758537531509.png	2025-09-22 09:28:15.346	2025-09-22 10:38:53.996
919	Haliborange Adult Multi Vitamin Gummies 30’s	For Energy Release & Immune Support.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538356/pharmacy-app/pharmacy/Haliborange_Adult_Multi_Vitamin_Gummies__919_1758538355172.jpg	2025-09-22 09:36:13.224	2025-09-22 10:52:36.267
1784	Sinarest Forte Tablets 4’s	For relief of allergic rhinitis symptoms like watery eyes, runny nose, nasal congestion, fever and headache.	600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540377/pharmacy-app/pharmacy/Sinarest_Forte_Tablets_4_s_1784_1758540377201.jpg	2025-09-22 09:56:05.58	2025-09-22 11:26:17.948
569	CREPE BANDAGE 10CM		2500	100	\N	2025-09-22 09:28:32.672	2025-09-22 09:28:32.672
570	CREPE BANDAGE 5CM		1500	100	\N	2025-09-22 09:28:33.812	2025-09-22 09:28:33.812
563	Cow & Gate Cereal Rice Maize & Milk 200g	Good source of energy due to its high carbohydrate content.	13500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537554/pharmacy-app/pharmacy/Cow___Gate_Cereal_Rice_Maize___Milk_200g_563_1758537553664.jpg	2025-09-22 09:28:24.521	2025-09-22 10:39:14.631
564	Cow & Gate Comfort 800g	As little ones' digestive systems develop, they may experience colic or constipation. Cow & Gate Comfort is nutritionally complete, suitable…	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537556/pharmacy-app/pharmacy/Cow___Gate_Comfort_800g_564_1758537555409.png	2025-09-22 09:28:26.362	2025-09-22 10:39:16.83
565	Cow & Gate Nutriprem 400g	For Preterm, low birth weight and lactose intolerant babies.	59500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537558/pharmacy-app/pharmacy/Cow___Gate_Nutriprem_400g_565_1758537557603.jpg	2025-09-22 09:28:27.841	2025-09-22 10:39:18.669
567	Cranmax Aqua Syrup 120ml	Cran-Max Aqua is a 120ml syrup formulated to support urinary tract health.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537560/pharmacy-app/pharmacy/Cranmax_Aqua_Syrup_120ml_567_1758537560060.jpg	2025-09-22 09:28:30.139	2025-09-22 10:39:21.336
571	Cussons Baby Gift Pack(Blue)	The Cussons baby gift pack is a complete set of baby toiletries from the Mild & Gentle range, packed in…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537564/pharmacy-app/pharmacy/Cussons_Baby_Gift_Pack_Blue__571_1758537564311.jpg	2025-09-22 09:28:34.931	2025-09-22 10:39:25.326
573	Cussons Baby Oil Mild & Gentle Oil 100ml	Moisturizes baby’s delicates skin and hair. Used for infant massage & parent-baby bonding.	9500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537569/pharmacy-app/pharmacy/Cussons_Baby_Oil_Mild___Gentle_Oil_100ml_573_1758537569021.jpg	2025-09-22 09:28:37.178	2025-09-22 10:39:30.018
574	Cussons Baby Oil Mild & Gentle Oil 200ml	Moisturizes baby’s delicates skin and hair. Used for infant massage & parent-baby bonding.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537571/pharmacy-app/pharmacy/Cussons_Baby_Oil_Mild___Gentle_Oil_200ml_574_1758537570723.jpg	2025-09-22 09:28:38.396	2025-09-22 10:39:31.994
576	Cussons Baby Oil Soft & Smooth 200ml	Pure mineral oil with soft floral scent fragrance suitable for baby massage. Helps to remove cradle cap and maintain baby’s skin…	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537575/pharmacy-app/pharmacy/Cussons_Baby_Oil_Soft___Smooth_200ml_576_1758537574514.jpg	2025-09-22 09:28:40.969	2025-09-22 10:39:35.384
578	Cussons Baby Powder Soft & Smooth 200g	As soft as a mother's loving touch. Mild on skin. Clinically tested.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537578/pharmacy-app/pharmacy/Cussons_Baby_Powder_Soft___Smooth_200g_578_1758537577972.png	2025-09-22 09:28:43.268	2025-09-22 10:39:39.358
579	Cussons Baby Soap Mild & Gentle 100g	With a delicate baby scent, enriched with milk and chamomile. So gentle to clean baby's delicate skin.	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537581/pharmacy-app/pharmacy/Cussons_Baby_Soap_Mild___Gentle_100g_579_1758537580199.jpg	2025-09-22 09:28:44.396	2025-09-22 10:39:41.611
581	Cussons Baby Wipes Soft & Smooth	Cleanses and helps moisturize your baby’s skin and skin, making it feel smooth and soft. The tissue is thick and…	9500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537585/pharmacy-app/pharmacy/Cussons_Baby_Wipes_Soft___Smooth_581_1758537584552.jpg	2025-09-22 09:28:46.785	2025-09-22 10:39:45.911
583	Cussons Soft & Smooth Lotion 100ml	Moisturizing and easy absorbing body lotion with soft floral scent to leave baby's skin soft, smooth and supple. Enriched almond…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537589/pharmacy-app/pharmacy/Cussons_Soft___Smooth_Lotion_100ml_583_1758537588527.jpg	2025-09-22 09:28:49.108	2025-09-22 10:39:49.803
584	Cyclax Nature Pure Vitamin E Face & Body Cream 300ml	Cyclax Nature Pure Vitamin E Face & Body Cream A non-greasy all over moisturiser enriched with Vitamin E for soft,…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537591/pharmacy-app/pharmacy/Cyclax_Nature_Pure_Vitamin_E_Face___Body_584_1758537590495.jpg	2025-09-22 09:28:50.234	2025-09-22 10:39:51.569
586	Cyster Tablets 30’s	Helps to Improve fertility in women, help to replace essential trace elements in the body Helps the body to prepare…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537594/pharmacy-app/pharmacy/Cyster_Tablets_30_s_586_1758537594212.jpg	2025-09-22 09:28:52.737	2025-09-22 10:39:55.196
588	Daktarin Miconazole Oral Gel 40g	Daktarin oral gel is used when you have mouth and tongue ulcers due to fungal infection where white spots appear…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537598/pharmacy-app/pharmacy/Daktarin_Miconazole_Oral_Gel_40g_588_1758537597846.jpg	2025-09-22 09:28:54.976	2025-09-22 10:39:58.871
590	Danalac Goat Premium 2 400g	DANALAC infant goat milk formula is manufactured using specially formulated and developed combination of ingredients to suit to specific needs of…	53000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537606/pharmacy-app/pharmacy/Danalac_Goat_Premium_2_400g_590_1758537605354.jpg	2025-09-22 09:28:57.487	2025-09-22 10:40:06.801
591	Danalac Gold Pro+ 1 400g	DANALAC is the proud answer for all hungry babies. Second only to mother's own milk. For 0-6months babies.	38500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537608/pharmacy-app/pharmacy/Danalac_Gold_Pro__1_400g_591_1758537607968.jpg	2025-09-22 09:28:58.61	2025-09-22 10:40:09.464
593	Danalac Lactose Free 400g	DANALAC Lactose Free infant formula is used for babies who are lactose intolerant.	47000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537613/pharmacy-app/pharmacy/Danalac_Lactose_Free_400g_593_1758537612656.png	2025-09-22 09:29:00.855	2025-09-22 10:40:13.889
595	Day Nurse Cold and Flu Capsules 20’s	Day Nurse Capsules for colds and flu. Relieves tickly cough, shivers, aches & pains, blocked or runny nose, sore throat…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537617/pharmacy-app/pharmacy/Day_Nurse_Cold_and_Flu_Capsules_20_s_595_1758537616763.jpg	2025-09-22 09:29:03.241	2025-09-22 10:40:18.28
596	Day Nurse Liquid 240ml	Gives you a daytime treatment for the symptoms of cold and flu.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537619/pharmacy-app/pharmacy/Day_Nurse_Liquid_240ml_596_1758537619036.jpg	2025-09-22 09:29:04.355	2025-09-22 10:40:20.942
598	Daynee Collagen Gummies	Daynee Collagen Gummies are a delicious and convenient way to support your skin, hair, and nails. Packed with high-quality collagen,…	89000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537624/pharmacy-app/pharmacy/Daynee_Collagen_Gummies_598_1758537623728.jpg	2025-09-22 09:29:06.585	2025-09-22 10:40:24.826
1143	La Roche Posay Mela B3 Anti Dark Spot Serum 30ml	Mela B3 is a new anti-hyperpigmentation serum that combines Melasy& Niacinamide to reduce dark spots and wrinkles.	264500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538848/pharmacy-app/pharmacy/La_Roche_Posay_Mela_B3_Anti_Dark_Spot_Se_1143_1758538847386.jpg	2025-09-22 09:41:40.167	2025-09-22 11:00:48.496
620	Desloratadine 5mg UK Tablets 30’s	Desloratadine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching.	15000	100	\N	2025-09-22 09:29:33.566	2025-09-22 09:29:33.566
600	Daynee KETO + ACV Weight Loss Gummies	Are you tired of struggling with weight management and searching for an effective solution? Look no further. Daynee KETO +…	89000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537628/pharmacy-app/pharmacy/Daynee_KETO___ACV_Weight_Loss_Gummies_600_1758537627449.jpg	2025-09-22 09:29:08.828	2025-09-22 10:40:28.51
602	DC Wellness Detox Tea 125g	DC Wellness detox tea helps to remove unwanted toxins from the body, leaving you less bloated, boosting energy levels, and…	25500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537634/pharmacy-app/pharmacy/DC_Wellness_Detox_Tea_125g_602_1758537634165.jpg	2025-09-22 09:29:11.091	2025-09-22 10:40:35.124
604	De Costa Pour Femme Perfume 100ml	Perfume for women. Soft, sweet and seductive.	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537638/pharmacy-app/pharmacy/De_Costa_Pour_Femme_Perfume_100ml_604_1758537637418.jpg	2025-09-22 09:29:13.683	2025-09-22 10:40:38.542
605	Deep Heat Rub 100g	Deep heat rub provides clinically proven pain relief for everyday aches and pains such as rheumatic stiffness and muscle soreness.	29000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537640/pharmacy-app/pharmacy/Deep_Heat_Rub_100g_605_1758537639395.jpg	2025-09-22 09:29:14.926	2025-09-22 10:40:40.492
607	DEEP HEAT SPRAY 150ml		33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537643/pharmacy-app/pharmacy/DEEP_HEAT_SPRAY_150ml_607_1758537642925.jpg	2025-09-22 09:29:17.271	2025-09-22 10:40:43.937
608	Delased Chesty Cough Syrup 100ml	Delased Chesty Cough Syrup is an expectorant used to reduce secretions in respiratory infections. Relieves chesty cough.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537645/pharmacy-app/pharmacy/Delased_Chesty_Cough_Syrup_100ml_608_1758537644770.jpg	2025-09-22 09:29:18.408	2025-09-22 10:40:45.816
610	Delased Paediatric Cough Syrup 100ml	For quick relief of dry and irritating cough in children.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537649/pharmacy-app/pharmacy/Delased_Paediatric_Cough_Syrup_100ml_610_1758537649127.jpg	2025-09-22 09:29:20.785	2025-09-22 10:40:50.146
612	Denk-Air Junior Montelukast 4mg Tablets 28’s	For relief and prevention of bronchial constriction in mild asthma.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537654/pharmacy-app/pharmacy/Denk_Air_Junior_Montelukast_4mg_Tablets__612_1758537653928.png	2025-09-22 09:29:23.106	2025-09-22 10:40:55.34
614	Dental Floss Picks 30’s	For prevention of plaque build. Promotes fresh breath and healthier gums.	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537658/pharmacy-app/pharmacy/Dental_Floss_Picks_30_s_614_1758537657959.png	2025-09-22 09:29:25.55	2025-09-22 10:40:58.938
615	Dentinox Teething Gel 10g	Dentinox Teething Gel Is A Form Of Treatment That Helps To Reduce The Pain And Irritation In The Mouth Caused…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537664/pharmacy-app/pharmacy/Dentinox_Teething_Gel_10g_615_1758537663547.jpg	2025-09-22 09:29:26.799	2025-09-22 10:41:04.454
617	Deriva Aqueous Gel Adapalene 0.1%  15g	Adapalene is a retinoid-like compound for the treatment of acne.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537668/pharmacy-app/pharmacy/Deriva_Aqueous_Gel_Adapalene_0_1___15g_617_1758537667725.jpg	2025-09-22 09:29:29.506	2025-09-22 10:41:08.857
621	Dettol 2in1 Anti-Bacterial Wipes for Hands & Surfaces 15s	Ideal for use when: On-the-go outdoors, Travelling on public transport (buses, trains etc), Wiping down surfaces and objects (phones etc),…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537673/pharmacy-app/pharmacy/Dettol_2in1_Anti_Bacterial_Wipes_for_Han_621_1758537673009.jpg	2025-09-22 09:29:34.773	2025-09-22 10:41:13.731
622	Dettol Fresh Hygiene Soap 175g	Combines Dettol’s trusted germ protection with refreshing citrus fragrance to clean and give you assured odour protection with every wash…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537675/pharmacy-app/pharmacy/Dettol_Fresh_Hygiene_Soap_175g_622_1758537674665.jpg	2025-09-22 09:29:36.033	2025-09-22 10:41:15.654
624	Dettol Herbal Soap 175g	Formulated with nourishing moisturizers and Dettol’s trusted germ protection helps in making your skin softer, smoother and healthy every day.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537679/pharmacy-app/pharmacy/Dettol_Herbal_Soap_175g_624_1758537678839.jpg	2025-09-22 09:29:38.308	2025-09-22 10:41:20.121
625	Dettol Liquid 125ml	Use Dettol Antiseptic Liquid to kill germs on the skin, help protect against infection from cuts, scratches and insect bites.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537681/pharmacy-app/pharmacy/Dettol_Liquid_125ml_625_1758537680905.jpg	2025-09-22 09:29:39.527	2025-09-22 10:41:21.861
627	Dettol Liquid 500ml	Use Dettol Antiseptic Liquid to kill germs on the skin, help protect against infection from cuts, scratches and insect bites.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537684/pharmacy-app/pharmacy/Dettol_Liquid_500ml_627_1758537684110.jpg	2025-09-22 09:29:41.763	2025-09-22 10:41:25.053
628	Dettol Liquid 50ml	Use Dettol Antiseptic Liquid to kill germs on the skin, help protect against infection from cuts, scratches and insect bites.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537686/pharmacy-app/pharmacy/Dettol_Liquid_50ml_628_1758537685671.jpg	2025-09-22 09:29:43.265	2025-09-22 10:41:26.878
630	Devit 3 (Vitamin D3) Oral Damla 50000IU/15ml	Devit-3 50000IU contains Vitamin D which is a fat-soluble vitamin that is either taken by dietary sources or synthesized upon…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537690/pharmacy-app/pharmacy/Devit_3__Vitamin_D3__Oral_Damla_50000IU__630_1758537689982.png	2025-09-22 09:29:45.681	2025-09-22 10:41:30.836
631	Dexe Black Hair Shampoo	The Dexe black Hair shampoo is a kind of shampoo, which can dye your hair into black in 5 minutes…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537692/pharmacy-app/pharmacy/Dexe_Black_Hair_Shampoo_631_1758537691722.jpg	2025-09-22 09:29:46.81	2025-09-22 10:41:32.554
633	Diprosalic Ointment Betamethasone and Salicylic Acid 30g	Skin allergy , itching redness swelling, insect bites, dermatitis	34500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537697/pharmacy-app/pharmacy/Diprosalic_Ointment_Betamethasone_and_Sa_633_1758537696208.jpg	2025-09-22 09:29:49.324	2025-09-22 10:41:37.529
635	DISPOSABLE GLOVES 50PAIRS		25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537701/pharmacy-app/pharmacy/DISPOSABLE_GLOVES_50PAIRS_635_1758537700634.jpg	2025-09-22 09:29:52.07	2025-09-22 10:41:41.702
639	Doo Gro Hair Vitalizer Triple Strength for Severely Damaged Hair 113g	For severely damaged hair. Helps reduce breakage allowing hair to grow longer. Paraben Free Formula.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537709/pharmacy-app/pharmacy/Doo_Gro_Hair_Vitalizer_Triple_Strength_f_639_1758537708398.jpg	2025-09-22 09:29:57.515	2025-09-22 10:41:49.613
641	Doppelherz – Activ Pure 3 Capsules 30’s	Optimal combination of omega-3 fatty acids from fish with three B-vitamins. Healthy for the heart and the cardiovascular system. Tasteless…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537716/pharmacy-app/pharmacy/Doppelherz___Activ_Pure_3_Capsules_30_s_641_1758537715849.jpg	2025-09-22 09:30:00.555	2025-09-22 10:41:57.014
642	Doppelherz – Aktiv Joints 1200 Ultra 30’s	Clever combination of high-strength glucosamine and vitamins. Supports cartilage health and joint mobility.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537718/pharmacy-app/pharmacy/Doppelherz___Aktiv_Joints_1200_Ultra_30__642_1758537717787.jpg	2025-09-22 09:30:01.931	2025-09-22 10:41:58.556
644	Dove Avocado Oil Invigorating Ritual Body Lotion 250ml	Enriched with avocado oil and calendula extract for smooth skin. Replenishes the skin with long-lasting hydration. Provides intense softness, intensity…	14500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537721/pharmacy-app/pharmacy/Dove_Avocado_Oil_Invigorating_Ritual_Bod_644_1758537720686.jpg	2025-09-22 09:30:04.56	2025-09-22 10:42:01.513
646	Dove Beauty Finish Antiperspirant Deodorant Spray 150ml	Enriched with beauty minerals, Dove Beauty Finish Antiperspirant leaves skin soft, smooth and protected.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537724/pharmacy-app/pharmacy/Dove_Beauty_Finish_Antiperspirant_Deodor_646_1758537723595.jpg	2025-09-22 09:30:07.134	2025-09-22 10:42:04.457
647	Dove Beauty Finish Antiperspirant Stick 40ml	Up to 48 hours of antiperspirant protection. Proven to leave no white marks on 100 colors. With clean, floral fragrance.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537725/pharmacy-app/pharmacy/Dove_Beauty_Finish_Antiperspirant_Stick__647_1758537725155.jpg	2025-09-22 09:30:08.473	2025-09-22 10:42:06.501
649	Dove Body Love Restoring Care Body Lotion 250ml	Dove Body Love Restoring Care Body Lotion is a beautifully rich and creamy dry skin moisturiser for softer, smoother skin.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537730/pharmacy-app/pharmacy/Dove_Body_Love_Restoring_Care_Body_Lotio_649_1758537729434.png	2025-09-22 09:30:10.95	2025-09-22 10:42:10.954
650	Dove Body Love Restoring Care Body Lotion 400ml	Dove Body Love Restoring Care Body Lotion is a beautifully rich and creamy dry skin moisturiser for softer, smoother skin.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537732/pharmacy-app/pharmacy/Dove_Body_Love_Restoring_Care_Body_Lotio_650_1758537731582.jpg	2025-09-22 09:30:12.093	2025-09-22 10:42:12.586
652	Dove Coconut Milk and Jasmine Petals Body Wash 500ml	Delight your senses with the scent of coconut and jasmine petals every morning with this relaxing body wash.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537735/pharmacy-app/pharmacy/Dove_Coconut_Milk_and_Jasmine_Petals_Bod_652_1758537735094.jpg	2025-09-22 09:30:14.572	2025-09-22 10:42:16.088
654	Dove Cucumber & Green Tea Deodorant Spray 250ml	Dove Go Fresh Cucumber & Green Tea Antiperspirant Deodorant offers 48hr protection with a fresh scent whilst also providing great…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537738/pharmacy-app/pharmacy/Dove_Cucumber___Green_Tea_Deodorant_Spra_654_1758537738342.jpg	2025-09-22 09:30:16.883	2025-09-22 10:42:19.192
655	Dove Cucumber Roll On Antiperspirant Deodorant 50ml	Dove Go Fresh Roll-On Antiperspirant Deodorant Cucumber & Green Tea 50ml helps to start your day with a burst thanks…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537740/pharmacy-app/pharmacy/Dove_Cucumber_Roll_On_Antiperspirant_Deo_655_1758537739870.jpg	2025-09-22 09:30:18.138	2025-09-22 10:42:22.483
657	Dove Glowing Ritual Body Lotion 400ml	For radiant looking skin that feels silky soft.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537746/pharmacy-app/pharmacy/Dove_Glowing_Ritual_Body_Lotion_400ml_657_1758537745726.jpg	2025-09-22 09:30:20.448	2025-09-22 10:42:26.576
658	Dove Glowing Ritual Body Wash 500ml	Dove nourishing body wash leaves skin feeling silky-soft.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537747/pharmacy-app/pharmacy/Dove_Glowing_Ritual_Body_Wash_500ml_658_1758537747211.jpg	2025-09-22 09:30:21.575	2025-09-22 10:42:28.122
660	Dove Go Fresh Grapefruit And Lemongrass Antiperspirant Deodorant Spray 150ml	Formulated with a citrus scent, this Dove deodorant spray cares for underarms with ¼ moisturising cream and 0% alcohol.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537751/pharmacy-app/pharmacy/Dove_Go_Fresh_Grapefruit_And_Lemongrass__660_1758537750617.png	2025-09-22 09:30:23.957	2025-09-22 10:42:31.599
662	Dove Intensive Nourishing Body Lotion 400ml	Fast-absorbing Dove Body Love Intense Care Body Lotion helps to transform very dry skin into soft, radiant, moisturised skin. Formulated…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537754/pharmacy-app/pharmacy/Dove_Intensive_Nourishing_Body_Lotion_40_662_1758537754145.jpg	2025-09-22 09:30:26.284	2025-09-22 10:42:35.284
663	Dove Invisible Dry Deo Spray 250ml	Tested to leave no white marks, Dove Invisible Dry Antiperspirant teams underarm care with protection.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537756/pharmacy-app/pharmacy/Dove_Invisible_Dry_Deo_Spray_250ml_663_1758537756008.jpg	2025-09-22 09:30:27.772	2025-09-22 10:42:37.045
665	Dove Invisible Dry Roll On Deodorant	Dove Invisible Dry - proven to leave no white marks on 100 colours, whilst offering 48hr protection and underarm care.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537760/pharmacy-app/pharmacy/Dove_Invisible_Dry_Roll_On_Deodorant_665_1758537760084.png	2025-09-22 09:30:30.422	2025-09-22 10:42:41.53
667	Dove Men+ Care Clean Comfort Deo Spray	This strong antiperspirant spray with a subtle scent helps fight sweat and odour for up to 48 hours.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537768/pharmacy-app/pharmacy/Dove_Men__Care_Clean_Comfort_Deo_Spray_667_1758537767903.jpg	2025-09-22 09:30:32.791	2025-09-22 10:42:48.792
668	Dove Men+ Care Sensitive Shield Deo Spray	Dove Men+Care Sensitive Shield Deo Spray is a powerful yet gentle deodorant designed to protect your skin while keeping you…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537770/pharmacy-app/pharmacy/Dove_Men__Care_Sensitive_Shield_Deo_Spra_668_1758537769769.jpg	2025-09-22 09:30:33.952	2025-09-22 10:42:51.209
670	Dove Original Antiperspirant Deodorant Spray 250ml	Stay dry all day without compromising on smooth underarm skin – choose Dove Original Antiperspirant.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537774/pharmacy-app/pharmacy/Dove_Original_Antiperspirant_Deodorant_S_670_1758537773534.png	2025-09-22 09:30:36.654	2025-09-22 10:42:54.478
690	Drez Throat Spray Solution 50ml	Drez Throat Spray is designed for treating throat infections. It provides relief from symptoms such as sore throat, irritation, and…	12000	100	\N	2025-09-22 09:31:02.204	2025-09-22 09:31:02.204
673	Dove Original Roll On Deodorant	Dove Original Antiperspirant Deodorant Roll-on, with ¼ moisturising cream for underarm care, gives up to 48-hour antiperspirant protection.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537779/pharmacy-app/pharmacy/Dove_Original_Roll_On_Deodorant_673_1758537779016.png	2025-09-22 09:30:40.955	2025-09-22 10:43:00.269
674	Dove Pampering Shea Butter and Warm Vanilla Lotion 250ml	Dove Purely Pampering Shea Butter and Warm Vanilla Nourishing Lotion is a rich moisturiser that nourishes your skin.	14500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537781/pharmacy-app/pharmacy/Dove_Pampering_Shea_Butter_and_Warm_Vani_674_1758537780970.png	2025-09-22 09:30:42.078	2025-09-22 10:43:01.973
676	Dove Pink/Rosa Beauty Bathing Bar Soap 135g	Dove Pink/Rosa Beauty Bathing Bar combines a gentle cleansing formula with our signature ¼ moisturising cream with a delicate pink…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537785/pharmacy-app/pharmacy/Dove_Pink_Rosa_Beauty_Bathing_Bar_Soap_1_676_1758537784392.jpg	2025-09-22 09:30:44.551	2025-09-22 10:43:05.492
677	Dove Pomegranate & Lemon Verbena Deodorant Spray 250ml		21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537786/pharmacy-app/pharmacy/Dove_Pomegranate___Lemon_Verbena_Deodora_677_1758537786306.jpg	2025-09-22 09:30:45.973	2025-09-22 10:43:07.23
679	Dove Refreshing Cucumber & Green Tea Scent Body Wash 750ml	A refreshing shower is a great way to start your day off right, and a hydrating body wash can help…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537791/pharmacy-app/pharmacy/Dove_Refreshing_Cucumber___Green_Tea_Sce_679_1758537790838.jpg	2025-09-22 09:30:48.339	2025-09-22 10:43:11.843
681	Dove Sensitive Anti-Perspirant Deodorant Spray	Perfect for sensitive skin, Dove Sensitive Anti-Perspirant Deodorant’s mild formula is dermatologically tested.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537795/pharmacy-app/pharmacy/Dove_Sensitive_Anti_Perspirant_Deodorant_681_1758537794835.png	2025-09-22 09:30:50.87	2025-09-22 10:43:16.143
682	Dr Organic Rose Otto Skin Lotion 200ml	Intensive, aromatic skin lotion for mature skin	62000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537797/pharmacy-app/pharmacy/Dr_Organic_Rose_Otto_Skin_Lotion_200ml_682_1758537797026.jpg	2025-09-22 09:30:52.008	2025-09-22 10:43:18
684	Dr. Organic Rose Otto Face Scrub 125ml	Deep Cleansing, Healthy Ageing, Exfoliating Best for: Healthy-ageing Replenshing	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537803/pharmacy-app/pharmacy/Dr__Organic_Rose_Otto_Face_Scrub_125ml_684_1758537802543.jpg	2025-09-22 09:30:54.455	2025-09-22 10:43:23.924
685	Dr. Organic Rose Otto Hand & Nail Cream 125ml	Intensive, healthy-ageing hand and nail cream.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537805/pharmacy-app/pharmacy/Dr__Organic_Rose_Otto_Hand___Nail_Cream__685_1758537804873.jpg	2025-09-22 09:30:55.735	2025-09-22 10:43:26.381
687	Dr. Organic Tea Tree Skin Lotion 200ml	Purifying Tea Tree Skin Lotion Key Benefits: Invigorating, Purifying, Moisturising	57000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537810/pharmacy-app/pharmacy/Dr__Organic_Tea_Tree_Skin_Lotion_200ml_687_1758537809670.jpg	2025-09-22 09:30:58.396	2025-09-22 10:43:31.193
689	Drez Gargle 100ml	Treatment of Mouth infection, Sore throat, Dry mouth, and prevention of Wound infection.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537815/pharmacy-app/pharmacy/Drez_Gargle_100ml_689_1758537814435.png	2025-09-22 09:31:00.952	2025-09-22 10:43:35.662
692	Durex Extra Safe Condoms 3’s	Durex Extra Safe condoms are extra lubricated and slightly thicker for greater comfort and peace of mind. They are shaped…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537822/pharmacy-app/pharmacy/Durex_Extra_Safe_Condoms_3_s_692_1758537821602.jpg	2025-09-22 09:31:04.568	2025-09-22 10:43:42.474
694	Durex Feels Condoms 3’s	Durex Feels is a thin condom with additional lubrication for a smoother, more pleasurable experience. Feels provides protection and helps…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537828/pharmacy-app/pharmacy/Durex_Feels_Condoms_3_s_694_1758537827851.png	2025-09-22 09:31:09.69	2025-09-22 10:43:49.765
695	Durex Feels Lubricant 50ml	Durex Play Feel, is a light smooth pleasure gel and lube to help give you and your partner a sensual…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537831/pharmacy-app/pharmacy/Durex_Feels_Lubricant_50ml_695_1758537830514.jpg	2025-09-22 09:31:10.878	2025-09-22 10:43:51.678
697	Durex Pleasure Me Condoms 3’s	Durex Pleasure Me Condoms have a distinct texture combination, giving you that extra something for enhanced sensuality. These transparent condoms…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537836/pharmacy-app/pharmacy/Durex_Pleasure_Me_Condoms_3_s_697_1758537835193.jpg	2025-09-22 09:31:13.042	2025-09-22 10:43:56.384
699	Durex Thin Feel Classic Condoms 12’s	For a deep connection and an intimate contact, Durex Thin Feel condoms help maximize sensitivity for you and your partner…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537840/pharmacy-app/pharmacy/Durex_Thin_Feel_Classic_Condoms_12_s_699_1758537839607.jpg	2025-09-22 09:31:15.209	2025-09-22 10:44:00.686
700	Durex Thin Feel Classic Condoms 6’s	Durex Thin Feel condoms offer increased sensitivity compared to standard condoms, increasing the feeling of closeness to your partner without…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537842/pharmacy-app/pharmacy/Durex_Thin_Feel_Classic_Condoms_6_s_700_1758537841632.jpg	2025-09-22 09:31:16.321	2025-09-22 10:44:02.849
702	Dynamogen Oral Solution 10ml (Pack of 20s)	Dynamogen oral solution contains cyproheptadine a first generation antihistamine that can provide relief from allergy symptoms such as watery eyes,…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537847/pharmacy-app/pharmacy/Dynamogen_Oral_Solution_10ml__Pack_of_20_702_1758537846313.jpg	2025-09-22 09:31:18.496	2025-09-22 10:44:07.448
703	E45 Cream 125g	Treatment for dry skin conditions including: Dry/flaky skin, Eczema, Itchy skin, Dry psoriasis, and  Sunburn.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537849/pharmacy-app/pharmacy/E45_Cream_125g_703_1758537848228.jpg	2025-09-22 09:31:19.606	2025-09-22 10:44:09.493
705	E45 Cream 50g	Treatment for dry skin conditions including: Dry/flaky skin, Eczema, Itchy skin, Dry psoriasis, and  Sunburn.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537853/pharmacy-app/pharmacy/E45_Cream_50g_705_1758537852361.jpg	2025-09-22 09:31:22.181	2025-09-22 10:44:13.487
706	E45 Cream Pump 500ml	Treatment for dry skin conditions including: Dry/flaky skin, Eczema, Itchy skin, Dry psoriasis, and  Sunburn.	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537855/pharmacy-app/pharmacy/E45_Cream_Pump_500ml_706_1758537854706.jpg	2025-09-22 09:31:23.646	2025-09-22 10:44:15.842
709	E45 Moisturising Lotion Pump 500ml	Is ideal for soothing, softening and relieving dry and sensitive skin to visibly reduce redness in just 2 weeks.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537861/pharmacy-app/pharmacy/E45_Moisturising_Lotion_Pump_500ml_709_1758537860602.jpg	2025-09-22 09:31:27.328	2025-09-22 10:44:21.575
711	EAD Kids Sunscreen SPF50 88ml	With Medium to high protection for kids from UVA and UVB sun rays.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537865/pharmacy-app/pharmacy/EAD_Kids_Sunscreen_SPF50_88ml_711_1758537864785.jpg	2025-09-22 09:31:29.783	2025-09-22 10:44:25.877
712	EAD Sunscreen SPF30 95ml	SPF30 Sunscreen Lotion specially formulated with advanced sunscreen complex, enriched with an anti-oxidant blend of vitamins E and C. Deep…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537868/pharmacy-app/pharmacy/EAD_Sunscreen_SPF30_95ml_712_1758537867155.jpg	2025-09-22 09:31:30.988	2025-09-22 10:44:28.335
714	Eden Apricot Face and Body Scrub 227g	A deep cleansing natural fiber body and facial scrub that quickly removes blackheads and impurities, unclogs pores and removes dry,…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537871/pharmacy-app/pharmacy/Eden_Apricot_Face_and_Body_Scrub_227g_714_1758537871131.jpg	2025-09-22 09:31:33.683	2025-09-22 10:44:32.223
715	Eden Body Milk Lotion 500ml	Eden Body Milk Lotion With Vitamin E Moisturises The Skin, Leaves Skin Feeling Soft And Smooth.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537873/pharmacy-app/pharmacy/Eden_Body_Milk_Lotion_500ml_715_1758537873078.jpg	2025-09-22 09:31:35.092	2025-09-22 10:44:34.227
717	ELASTOPLAST WATER RESISTANT PLASTERS?(First aid plasters) 10’S		12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537882/pharmacy-app/pharmacy/ELASTOPLAST_WATER_RESISTANT_PLASTERS__Fi_717_1758537882052.jpg	2025-09-22 09:31:37.465	2025-09-22 10:44:43.045
718	Elektro Genesis Blood Pressure Machine	Elektro Genesis Blood Pressure is a digital monitor intended for use in measuring blood pressure and pulse rate in adult.	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537884/pharmacy-app/pharmacy/Elektro_Genesis_Blood_Pressure_Machine_718_1758537883756.jpg	2025-09-22 09:31:38.907	2025-09-22 10:44:44.628
720	Ella One Emergency Contraceptive Pill	Ella (Ulipristal) is used by women to prevent pregnancy after birth control failure (such as a broken condom) or unprotected…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537889/pharmacy-app/pharmacy/Ella_One_Emergency_Contraceptive_Pill_720_1758537888486.jpg	2025-09-22 09:31:41.137	2025-09-22 10:44:49.529
722	Enat 400 Natural Vitamin E Softgel Capsules 30’s	Natural vitamin E for stronger immunity and better health. It has an antioxidant effect in protecting cells from damage caused…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537893/pharmacy-app/pharmacy/Enat_400_Natural_Vitamin_E_Softgel_Capsu_722_1758537892305.jpg	2025-09-22 09:31:43.905	2025-09-22 10:44:53.22
723	Enat Vitamin E Cream 50g	Enat Cream is a all natural cream that brings the purity and goodness of 6 beauty extracts along with the…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537894/pharmacy-app/pharmacy/Enat_Vitamin_E_Cream_50g_723_1758537893993.jpg	2025-09-22 09:31:45.12	2025-09-22 10:44:55.267
725	Eno Lemon Sachets 48’s	Eno Gives Fast Relief From Acidity and Gets To Work In 6 Seconds.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537898/pharmacy-app/pharmacy/Eno_Lemon_Sachets_48_s_725_1758537897992.jpg	2025-09-22 09:31:47.885	2025-09-22 10:44:58.972
727	Ensure Original Nutritional Shake 273ml	Each bottle of Ensure Original provides complete, balanced nutrition. Every ready-to-drink shake has 9 grams of high-quality protein, 27 essential…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537902/pharmacy-app/pharmacy/Ensure_Original_Nutritional_Shake_273ml_727_1758537902036.jpg	2025-09-22 09:31:50.274	2025-09-22 10:45:02.874
728	Ensure Plus Powder 1kg	Ensure Plus Powder is complete, balanced nutrition with extra proteins to help support recovery. The Ensure Plus Powder has balanced…	170000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537905/pharmacy-app/pharmacy/Ensure_Plus_Powder_1kg_728_1758537904318.jpg	2025-09-22 09:31:51.98	2025-09-22 10:45:05.302
730	Ensure Powder 400g	Ensure Powder is a source of complete and balanced nutrition for supplemental use with or between meals. It is useful…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537909/pharmacy-app/pharmacy/Ensure_Powder_400g_730_1758537908590.jpg	2025-09-22 09:31:54.674	2025-09-22 10:45:09.808
731	Ensure Powder 850g	Ensure Powder is a source of complete and balanced nutrition for supplemental use with or between meals. It is useful…	165000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537911/pharmacy-app/pharmacy/Ensure_Powder_850g_731_1758537910826.jpg	2025-09-22 09:31:55.872	2025-09-22 10:45:11.886
733	Epimax Baby & Junior Cream 400g	Epimax baby and junior cream is a moisturizing cream that soothes and protects dry and sensitive skin. It’s enriched with…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537915/pharmacy-app/pharmacy/Epimax_Baby___Junior_Cream_400g_733_1758537914487.png	2025-09-22 09:31:58.042	2025-09-22 10:45:15.632
734	Epimax Lotion Pump 450ml	A pure cetomacrogol and glycerine emollient lotion for all skin types and dry skin conditions, including eczema and psoriasis.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537916/pharmacy-app/pharmacy/Epimax_Lotion_Pump_450ml_734_1758537916246.jpg	2025-09-22 09:31:59.365	2025-09-22 10:45:17.187
736	Epimax Original Cream 125g	Epimax Original Cream is an emollient that is gentle enough to use throughout the day for the light relief of…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537921/pharmacy-app/pharmacy/Epimax_Original_Cream_125g_736_1758537920919.jpg	2025-09-22 09:32:01.927	2025-09-22 10:45:22.095
738	Epsom Salts 300g	For the relief of occasional constipation. For the relief of pain from sprains, bruises and boils. Can also be used…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537925/pharmacy-app/pharmacy/Epsom_Salts_300g_738_1758537924992.jpg	2025-09-22 09:32:04.593	2025-09-22 10:45:26.295
740	Eros Spray 14ml	Eros spray contains a local anaesthetic, lidocaine, that works by reducing the sensitivity to touch of the penis just before intercourse (sex). …	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537930/pharmacy-app/pharmacy/Eros_Spray_14ml_740_1758537929428.jpg	2025-09-22 09:32:07.451	2025-09-22 10:45:30.302
741	Erostin Ebastine 10mg Tablets 10’s	For relief of allergy symptoms runny nose, watery eyes and itchiness. Each pack contains 10tablets.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537931/pharmacy-app/pharmacy/Erostin_Ebastine_10mg_Tablets_10_s_741_1758537931126.jpg	2025-09-22 09:32:08.708	2025-09-22 10:45:31.942
920	Haliborange Adult Vegan Vitamin D3 Gummies 45’s	For immune support and strong bones.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538358/pharmacy-app/pharmacy/Haliborange_Adult_Vegan_Vitamin_D3_Gummi_920_1758538357197.jpg	2025-09-22 09:36:14.535	2025-09-22 10:52:38.234
1146	La Roche Posay Toleriane Dermallergo Cream 40ml	Toleriane Dermallergo cream provides 24-hour hydration for sensitive, reactive skin prone to dryness, tightness, redness or itchiness. This formula is…	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538859/pharmacy-app/pharmacy/La_Roche_Posay_Toleriane_Dermallergo_Cre_1146_1758538858430.jpg	2025-09-22 09:41:45.082	2025-09-22 11:00:59.671
744	Estiara Passion Cherry Blossom Body Mist 250ml	It contains aloe vera extracts and cherry blossom scent. Long-Lasting Perfume. It gives you a refreshing smell and feel of…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537946/pharmacy-app/pharmacy/Estiara_Passion_Cherry_Blossom_Body_Mist_744_1758537945607.jpg	2025-09-22 09:32:12.87	2025-09-22 10:45:46.671
745	Estiara Passion Raspberry Fragrance Mist 250ml	Refresh your senses and have fun with the scent of raspberry.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537948/pharmacy-app/pharmacy/Estiara_Passion_Raspberry_Fragrance_Mist_745_1758537947449.jpg	2025-09-22 09:32:14.406	2025-09-22 10:45:48.822
747	Estiara Passion Vanilla Fragrance Mist 250ml	Get inspired by the great aroma of the vanilla.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537952/pharmacy-app/pharmacy/Estiara_Passion_Vanilla_Fragrance_Mist_2_747_1758537951287.jpg	2025-09-22 09:32:16.964	2025-09-22 10:45:52.307
749	Eucryl Freshmint Powerful Stain Removal Toothpaste 50ml	Powerful stain removal. Fresh mint flavour.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537955/pharmacy-app/pharmacy/Eucryl_Freshmint_Powerful_Stain_Removal__749_1758537954925.jpg	2025-09-22 09:32:19.449	2025-09-22 10:45:55.942
751	Eucryl Toothpowder Original Powerful Stain Removal 50g		15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537959/pharmacy-app/pharmacy/Eucryl_Toothpowder_Original_Powerful_Sta_751_1758537958488.jpg	2025-09-22 09:32:22.057	2025-09-22 10:45:59.779
752	Eugica Herbal Mouth Spray 10ml	Quick acting, natural and safe solution for sore throat and cough.	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537961/pharmacy-app/pharmacy/Eugica_Herbal_Mouth_Spray_10ml_752_1758537960712.jpg	2025-09-22 09:32:23.417	2025-09-22 10:46:01.773
753	Eugica Ivy Syrup 100ml	A tasty natural remedy for cough and stuffy nose.	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537963/pharmacy-app/pharmacy/Eugica_Ivy_Syrup_100ml_753_1758537962501.jpg	2025-09-22 09:32:24.977	2025-09-22 10:46:03.671
755	Exfoliating Bath Gloves (Pair)	Exfoliates skin for softer, smoother feeling and better blood circulation.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537967/pharmacy-app/pharmacy/Exfoliating_Bath_Gloves__Pair__755_1758537966465.jpg	2025-09-22 09:32:27.641	2025-09-22 10:46:07.861
757	Ezamol-C Tablets 20’s	Relieves aches and pains, lowers temperature. Clears stuffy nose and replaces the lost Vitamin C.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537971/pharmacy-app/pharmacy/Ezamol_C_Tablets_20_s_757_1758537970653.png	2025-09-22 09:32:30.034	2025-09-22 10:46:11.603
759	FA Caribbean Lemon Roll On Deodorant 50ml	Natural & Fresh Lemon, with white mark protection, which effective protection against sweat and body odour. Long lasting freshness with…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537974/pharmacy-app/pharmacy/FA_Caribbean_Lemon_Roll_On_Deodorant_50m_759_1758537973960.png	2025-09-22 09:32:32.4	2025-09-22 10:46:15.344
761	Face Facts Barrier Repair Ceramide Serum	Barrier Repair Ceramide Facial Serum, Soothes, Protects and Hydrates the skin	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537979/pharmacy-app/pharmacy/Face_Facts_Barrier_Repair_Ceramide_Serum_761_1758537978327.jpg	2025-09-22 09:32:34.886	2025-09-22 10:46:19.292
762	Face Facts Ceramide Hydrating Gentle Cleanser 200mL	Face Facts Ceramide Hydrating Gentle Cleanser helps to repair the skin’s barrier function, soothing stressed complexions, locking in moisture and…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537980/pharmacy-app/pharmacy/Face_Facts_Ceramide_Hydrating_Gentle_Cle_762_1758537980013.jpg	2025-09-22 09:32:36.218	2025-09-22 10:46:20.829
764	Face Facts Ceramide Repairing Serum Cream	Ceramide Repairing Serum Cream, Hydrates dry, sensitive skin and helps restore your natural moisture barrier	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537984/pharmacy-app/pharmacy/Face_Facts_Ceramide_Repairing_Serum_Crea_764_1758537983904.jpg	2025-09-22 09:32:38.798	2025-09-22 10:46:25.054
765	Face Facts Collagen Facial Serum with Q10	Collagen & Q10 Replenishing Facial Serum, Helps Energize the skin & Improve skin Elasticity.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537986/pharmacy-app/pharmacy/Face_Facts_Collagen_Facial_Serum_with_Q1_765_1758537986014.jpg	2025-09-22 09:32:40.437	2025-09-22 10:46:27.325
767	Face Facts Hyaluronic Facial Serum 30mL	Face Facts Hyaluronic Serum is a hydrating facial serum designed to reduce fine lines and wrinkles while delivering intense moisture…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537996/pharmacy-app/pharmacy/Face_Facts_Hyaluronic_Facial_Serum_30mL_767_1758537994774.jpg	2025-09-22 09:32:42.616	2025-09-22 10:46:36.951
769	Face Facts Hydrating Facial Scrub	Formulated with soothing Aloe Vera to smooth, soften & glow the skin. Vegan friendly.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538002/pharmacy-app/pharmacy/Face_Facts_Hydrating_Facial_Scrub_769_1758538001724.jpg	2025-09-22 09:32:44.793	2025-09-22 10:46:42.692
770	Face Facts Niacinamide Cleanser 200mL	This Cleanser is formulated with Niacinamide to gently dissolve makeup, oil, and impurities while improving the skin's appearance.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538004/pharmacy-app/pharmacy/Face_Facts_Niacinamide_Cleanser_200mL_770_1758538003526.jpg	2025-09-22 09:32:46.149	2025-09-22 10:46:44.25
772	Face Facts Vitamin C Face Cream	Vitamin C Brightening Face Cream	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538007/pharmacy-app/pharmacy/Face_Facts_Vitamin_C_Face_Cream_772_1758538006997.jpg	2025-09-22 09:32:48.812	2025-09-22 10:46:48.113
773	Face Facts Vitamin C Facial Serum	Vitamin C Brightening Facial Serum	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538010/pharmacy-app/pharmacy/Face_Facts_Vitamin_C_Facial_Serum_773_1758538009124.jpg	2025-09-22 09:32:50.181	2025-09-22 10:46:50.741
775	Fair & White Gold 1 Ultimate AHA Brightening Lotion 350ml	Skin is revitalized. Treats acne prone skin due to the presence of glycolic acid. Helps in treatment of pigmentation. Prevents…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538014/pharmacy-app/pharmacy/Fair___White_Gold_1_Ultimate_AHA_Brighte_775_1758538013429.jpg	2025-09-22 09:32:52.445	2025-09-22 10:46:54.359
777	Fair & White Gold 3 Protect Rejuvenating Moisture Lotion 500ml	With Glyecrin and sweet almond oil this body lotion quenches dry/dehydrated skin, restoring skin's texture back to its soft, silky…	92000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538017/pharmacy-app/pharmacy/Fair___White_Gold_3_Protect_Rejuvenating_777_1758538016773.jpg	2025-09-22 09:32:54.68	2025-09-22 10:46:57.652
1165	Lemsip Cold & Flu Sachets 10’s	Lemsip Cold & Flu Sachets provide fast and powerful relief from cold and flu symptoms, including aches, pains, congestion and…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538908/pharmacy-app/pharmacy/Lemsip_Cold___Flu_Sachets_10_s_1165_1758538907993.jpg	2025-09-22 09:42:12.423	2025-09-22 11:01:49.029
781	FAIR & WHITE Original Exfoliating Soap 200g	Cleansing Bar, Formulated to Fade Dark Spots: Face, Knees, Body, Elbows & Armpits.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538024/pharmacy-app/pharmacy/FAIR___WHITE_Original_Exfoliating_Soap_2_781_1758538023695.jpg	2025-09-22 09:33:00.077	2025-09-22 10:47:04.497
782	Fair & White So White 24h Deo Spray 200ml	Fair & White So White 24h Deo Spray is a deodorant for women and especially Fair & White lovers. Keeps…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538025/pharmacy-app/pharmacy/Fair___White_So_White_24h_Deo_Spray_200m_782_1758538025209.png	2025-09-22 09:33:01.51	2025-09-22 10:47:06.225
784	Fair And White Miss White Lightening Soap 200g	It keeps your skin smooth. it moisturizes your skin giving you a glowing tone. it protects your skin from sun…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538029/pharmacy-app/pharmacy/Fair_And_White_Miss_White_Lightening_Soa_784_1758538028856.jpg	2025-09-22 09:33:03.968	2025-09-22 10:47:10.137
786	Fair and White So White Skin Perfector Serum 30ml	Skin lightening serum that is enriched with a clarifying agent that softens, smoothes and unifies your complexion.	62000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538033/pharmacy-app/pharmacy/Fair_and_White_So_White_Skin_Perfector_S_786_1758538033077.jpg	2025-09-22 09:33:06.503	2025-09-22 10:47:13.996
787	Fatnile Capsules 60’s	Fatnile is a unique blend of nutritional ingredients designed to help you lose weight safely and naturally. Fatnile's special combination…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538035/pharmacy-app/pharmacy/Fatnile_Capsules_60_s_787_1758538034954.jpg	2025-09-22 09:33:07.77	2025-09-22 10:47:15.864
788	Febricol Tablets 20’s	Relieves symptoms of headache and nasal congestion in influenza and common cold. Each pack contains 20 tablets.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538037/pharmacy-app/pharmacy/Febricol_Tablets_20_s_788_1758538036797.jpg	2025-09-22 09:33:09.012	2025-09-22 10:47:17.911
790	Femfresh Intimate Daily Wash 250mL	This gentle daily wash has been specially formulated to cleanse intimate skin whilst helping maintain a healthy pH-balance. The low…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538042/pharmacy-app/pharmacy/Femfresh_Intimate_Daily_Wash_250mL_790_1758538041487.jpg	2025-09-22 09:33:11.755	2025-09-22 10:47:22.622
792	Feroglobin B12 Capsules 30’s	Convenient and gentle on your stomach, whilst providing sustained iron which contributes to the reduction of tiredness and fatigue, immune…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538050/pharmacy-app/pharmacy/Feroglobin_B12_Capsules_30_s_792_1758538050185.png	2025-09-22 09:33:14.118	2025-09-22 10:47:31.13
793	Feroglobin B12 Liquid 200ml	Feroglobin Liquid is a delicious honey and orange flavor liquid iron formula with nutrients to help maintain health and vitality,…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538052/pharmacy-app/pharmacy/Feroglobin_B12_Liquid_200ml_793_1758538052085.png	2025-09-22 09:33:15.249	2025-09-22 10:47:33.389
795	Feroglobin Plus Syrup 200ml	Support your overall health with Feroglobin Liquid Plus – a source of iron and folate which contribute to the reduction…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538057/pharmacy-app/pharmacy/Feroglobin_Plus_Syrup_200ml_795_1758538056345.png	2025-09-22 09:33:18.099	2025-09-22 10:47:37.476
796	Ferro B Complex Syrup 60ml	Ferro-B Syrup is used for Iron deficiency due to poor absorption and chronic blood loss, Treatment of megaloblastic anaemias due…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538059/pharmacy-app/pharmacy/Ferro_B_Complex_Syrup_60ml_796_1758538058418.jpg	2025-09-22 09:33:19.397	2025-09-22 10:47:39.416
798	Ferrotone Capsules 50’s	Iron, Folic acid and Vitamin B 12 Formula for anaemia. Each pack contains 50 capsules.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538064/pharmacy-app/pharmacy/Ferrotone_Capsules_50_s_798_1758538063206.jpg	2025-09-22 09:33:22.195	2025-09-22 10:47:44.239
799	Ferrous Sulphate 200mg	Ferrous sulphate is a medicine used to treat and prevent iron deficiency anaemia. Each pack contains 100 tablets.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538065/pharmacy-app/pharmacy/Ferrous_Sulphate_200mg_799_1758538065174.jpg	2025-09-22 09:33:23.554	2025-09-22 10:47:46.169
801	FertilAid Multivitamin For Men Capsules 90’s	FertilAid for Men is a supplement that is designed to improve sperm count, motility, and morphology that is needed for successful…	240000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538071/pharmacy-app/pharmacy/FertilAid_Multivitamin_For_Men_Capsules__801_1758538070702.jpg	2025-09-22 09:33:26.2	2025-09-22 10:47:52.343
803	Fexofen-120 Fexofenadine 120mg Tablets 60’s	For relief of allergic reactions and their symptoms like runny and itchy nose, watery and red eyes, allergic cough and…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538075/pharmacy-app/pharmacy/Fexofen_120_Fexofenadine_120mg_Tablets_6_803_1758538075170.jpg	2025-09-22 09:33:29.02	2025-09-22 10:47:56.304
805	Fexofenadine 120mg UK Tablets 30’s	For relief of allergic reactions and their symptoms like runny and itchy nose, watery and red eyes, allergic cough and…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538080/pharmacy-app/pharmacy/Fexofenadine_120mg_UK_Tablets_30_s_805_1758538079645.jpg	2025-09-22 09:33:31.512	2025-09-22 10:48:00.918
806	Fibo Jar 175g	Fibo, is a source of soluble fiber. It also contains benefits of green tea extract. Fibo helps to prevent constipation,…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538083/pharmacy-app/pharmacy/Fibo_Jar_175g_806_1758538083159.png	2025-09-22 09:33:32.857	2025-09-22 10:48:04.397
807	Fibo Sachets 10’s	Fibo, is a source of soluble fiber. It also contains benefits of green tea extract. Fibo helps to prevent constipation,…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538086/pharmacy-app/pharmacy/Fibo_Sachets_10_s_807_1758538085430.jpg	2025-09-22 09:33:33.996	2025-09-22 10:48:06.735
809	Finallerg 100ml	For relief of allergies and related symptoms like runny nose, itching and hay fever.	12500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538090/pharmacy-app/pharmacy/Finallerg_100ml_809_1758538089471.jpg	2025-09-22 09:33:36.642	2025-09-22 10:48:10.393
810	FIRST AID KIT BIG (VEERAM/ ST. JOHN’S) – RED Pack		165000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538092/pharmacy-app/pharmacy/FIRST_AID_KIT_BIG__VEERAM__ST__JOHN_S____810_1758538091449.jpg	2025-09-22 09:33:37.81	2025-09-22 10:48:12.89
812	Fishermans Friend Honey & Lemon Lozenges 25g	A firm favourite for generations, Fisherman's Friend Honey & Lemon lozenges help to relieve congestion. Strong lozenges!	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538100/pharmacy-app/pharmacy/Fishermans_Friend_Honey___Lemon_Lozenges_812_1758538099456.png	2025-09-22 09:33:40.169	2025-09-22 10:48:20.465
1148	La Roche-Posay Anthelios Dermo-Pediatrics Baby Lotion SPF 50+ 50ml	This is a baby dermatologist-tested sunscreen providing very high broad-spectrum protection for delicate or atopic-prone baby skin. Adapted to babies'…	98500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538865/pharmacy-app/pharmacy/La_Roche_Posay_Anthelios_Dermo_Pediatric_1148_1758538864564.png	2025-09-22 09:41:48.154	2025-09-22 11:01:07.59
819	Flufed Syrup 60ml	For relief of cold and flu symptoms like congestion, runny nose and headaches.	4000	100	\N	2025-09-22 09:33:49.741	2025-09-22 09:33:49.741
816	Flintstones Extra Vitamin C Gummies 150’s	Flintstones Extra Vitamin C Gummies are specially formulated with Vitamins A, E, Zinc, and extra Vitamin C to support kids'…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538108/pharmacy-app/pharmacy/Flintstones_Extra_Vitamin_C_Gummies_150__816_1758538107608.jpg	2025-09-22 09:33:45.886	2025-09-22 10:48:28.554
817	Flintstones Kids Multivitamin Gummies 70’s	Flintstones Complete Multivitamin Gummies are original, easy to chew and help support overall wellness, inside and out. Your kids will…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538113/pharmacy-app/pharmacy/Flintstones_Kids_Multivitamin_Gummies_70_817_1758538113040.jpg	2025-09-22 09:33:47.101	2025-09-22 10:48:34.04
820	Flufed Tablets 100’s	For relief of flu symptoms like congestion, runny nose and watery eyes.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538118/pharmacy-app/pharmacy/Flufed_Tablets_100_s_820_1758538117907.jpg	2025-09-22 09:33:51.072	2025-09-22 10:48:39.134
823	Fogg Dynamic Fragrance Body Spray for Men 120ml	Gives you fresh bursts of energy and keeps you feeling refreshed and confident all day long.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538124/pharmacy-app/pharmacy/Fogg_Dynamic_Fragrance_Body_Spray_for_Me_823_1758538123372.jpg	2025-09-22 09:33:54.989	2025-09-22 10:48:44.328
824	Fogg Extreme Fragrance Body Spray for Men 120ml	Fogg's Extreme is a masculine perfumed body spray with a spicy, intense and calming scent that lasts through the day…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538125/pharmacy-app/pharmacy/Fogg_Extreme_Fragrance_Body_Spray_for_Me_824_1758538125029.jpg	2025-09-22 09:33:56.121	2025-09-22 10:48:45.888
826	Fogg Paradise Fragrance Body Spray for Women 120ml	Will give you a fresh and pleasant sensation with its beautiful aroma and body odor neutralization that can last throughout…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538129/pharmacy-app/pharmacy/Fogg_Paradise_Fragrance_Body_Spray_for_W_826_1758538128330.jpg	2025-09-22 09:33:59.161	2025-09-22 10:48:49.448
827	Folic Acid 5mg (Ug/India) Tablets 100’s	Folic acid is the synthetic form of folate, which is a naturally occurring B vitamin. Folate helps make DNA and…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538131/pharmacy-app/pharmacy/Folic_Acid_5mg__Ug_India__Tablets_100_s_827_1758538130374.jpg	2025-09-22 09:34:00.331	2025-09-22 10:48:51.428
829	Forever Aloe Lips Lip Balm 4.25g	Forever Aloe Lips is a lip balm that soothes and moisturizes dry and chapped lips. This premium Aloe lip balm…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538135/pharmacy-app/pharmacy/Forever_Aloe_Lips_Lip_Balm_4_25g_829_1758538135021.png	2025-09-22 09:34:02.627	2025-09-22 10:48:56.208
831	Forever Artic Sea Omega 3 Capsules 120’s	Forever Arctic Sea features a blend of oils to provide you with a perfectly balanced omega-3 supplement. Fish, calamari and…	139000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538138/pharmacy-app/pharmacy/Forever_Artic_Sea_Omega_3_Capsules_120_s_831_1758538138279.jpg	2025-09-22 09:34:05.306	2025-09-22 10:48:59.176
832	Forever Bright Sparkling Aloe Vera Toothgel 130g	Forever Bright Aloe Vera tooth gel is used for effective cleaning of your teeth, it leaves your mouth feeling fresh…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538141/pharmacy-app/pharmacy/Forever_Bright_Sparkling_Aloe_Vera_Tooth_832_1758538140386.jpg	2025-09-22 09:34:06.494	2025-09-22 10:49:01.735
834	France Lait 1 900g	France Lait 1 is the Initial infant formula from birth to 6 months of age.	108000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538146/pharmacy-app/pharmacy/France_Lait_1_900g_834_1758538146157.jpg	2025-09-22 09:34:09.026	2025-09-22 10:49:07.471
835	France Lait 2 900g	France Lait baby formula has a gentle taste and texture and contains added iron and vitamin C to help support…	108000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538152/pharmacy-app/pharmacy/France_Lait_2_900g_835_1758538151466.jpg	2025-09-22 09:34:10.527	2025-09-22 10:49:12.63
837	France Lait 3 900g	France Lait “Baby formula” No. 3 is an infant formula based on cow’s milk, enriched with iron, and developed by…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538156/pharmacy-app/pharmacy/France_Lait_3_900g_837_1758538155423.jpg	2025-09-22 09:34:13.11	2025-09-22 10:49:16.312
839	France Lait LF 400g	France Lait LF milk is designed for children aged 0-5 years who suffer from diarrhea and lactose intolerance.	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538163/pharmacy-app/pharmacy/France_Lait_LF_400g_839_1758538162512.jpg	2025-09-22 09:34:16.16	2025-09-22 10:49:23.548
840	France Lait Pre Formula 400g	France Lait Pre is a specialized infant formula designed to meet the nutritional needs of premature and low birth weight…	78500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538172/pharmacy-app/pharmacy/France_Lait_Pre_Formula_400g_840_1758538169894.jpg	2025-09-22 09:34:17.468	2025-09-22 10:49:32.764
842	France shGrace Whitening Skin 36600mg Glutathione Capsules 60’s	Get radiant, beautiful skin by taking skin whitening pills regularly – premium beauty supplement nourishes your skin, lightens tone, and…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538176/pharmacy-app/pharmacy/France_shGrace_Whitening_Skin_36600mg_Gl_842_1758538176376.jpg	2025-09-22 09:34:20.062	2025-09-22 10:49:37.174
844	Fricks Cough Syrup 100ml	Effective cough mixture.	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538184/pharmacy-app/pharmacy/Fricks_Cough_Syrup_100ml_844_1758538183584.png	2025-09-22 09:34:23.133	2025-09-22 10:49:44.521
845	Fricks Menthol Lozenges 24’s	Effective relief from sore throat. Each pack contains 24 lozenges.	4800	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538186/pharmacy-app/pharmacy/Fricks_Menthol_Lozenges_24_s_845_1758538185485.png	2025-09-22 09:34:24.559	2025-09-22 10:49:46.797
846	Fricks Orange Lozenges 24’s	Honey and Lemon flavored herbal lozenges. Each pack contains 24 lozenges.	4800	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538188/pharmacy-app/pharmacy/Fricks_Orange_Lozenges_24_s_846_1758538187498.png	2025-09-22 09:34:26.093	2025-09-22 10:49:48.581
848	Fruit Of The Earth Lotion Vitamin E 325ml	Fruit of the Earth Vitamin E Skin Care Lotion is a double rich formula that heals dry skin. Provides radiant…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538191/pharmacy-app/pharmacy/Fruit_Of_The_Earth_Lotion_Vitamin_E_325m_848_1758538191265.jpg	2025-09-22 09:34:28.756	2025-09-22 10:49:52.217
852	Fusidic Acid‐B Cream Betamethasone ad Fusidic Acid 15g	Used for the treatment of skin inflammation, eczema or dermatitis that is also infected with bacteria sensitive to fusidic acid	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538200/pharmacy-app/pharmacy/Fusidic_Acid_B_Cream_Betamethasone_ad_Fu_852_1758538199846.jpg	2025-09-22 09:34:34.855	2025-09-22 10:50:00.943
854	Fybogel Sachets 30’s	Fybogel is a laxative medicine that contains ispaghula husk and should be taken with water. It harnesses the power of…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538205/pharmacy-app/pharmacy/Fybogel_Sachets_30_s_854_1758538204606.jpg	2025-09-22 09:34:37.675	2025-09-22 10:50:05.736
855	Gabogola Syrup 200ml	For management of cough, colds and flu.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538207/pharmacy-app/pharmacy/Gabogola_Syrup_200ml_855_1758538206457.jpg	2025-09-22 09:34:39.096	2025-09-22 10:50:07.477
857	Garnier Intensive 7 Days Ultra-Replenishing Lotion 250ml	Moisture felt up to 7 days, rich, nourishing milk texture, fast absorbing, very dry skin, non-greasy, non-sticky, dermatologically tested.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538211/pharmacy-app/pharmacy/Garnier_Intensive_7_Days_Ultra_Replenish_857_1758538210535.jpg	2025-09-22 09:34:41.862	2025-09-22 10:50:11.479
858	Garnier Intensive 7 Days Ultra-Replenishing Lotion 400ml	Moisture felt up to 7 days, rich, nourishing milk texture, fast absorbing, very dry skin, non-greasy, non-sticky, dermatologically tested.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538213/pharmacy-app/pharmacy/Garnier_Intensive_7_Days_Ultra_Replenish_858_1758538212280.jpg	2025-09-22 09:34:43.148	2025-09-22 10:50:13.437
860	Garnier Mineral ActionControl 48h Anti-Perspirant Deo Roll On 50ml	48h Anti-Perspirant Deodorant Stick for women. Heat, Sport, Stress Protection. Enriched with Mineralite (naturally absorbent mineral).	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538217/pharmacy-app/pharmacy/Garnier_Mineral_ActionControl_48h_Anti_P_860_1758538216455.jpg	2025-09-22 09:34:45.958	2025-09-22 10:50:17.482
862	Garnier Mineral ActionControl+  96h Anti-Perspirant Deo Roll On 50ml	Up to 96 hours of effective protection against sweat and up to 72 hours of protection against odor. It is…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538221/pharmacy-app/pharmacy/Garnier_Mineral_ActionControl___96h_Anti_862_1758538220536.jpg	2025-09-22 09:34:49.057	2025-09-22 10:50:21.482
863	Garnier Mineral Invisible 48HR Roll On 50ml	Garnier Mineral Invisible 48HR Roll On will not only protect your skin from bacteria but will also ensure a better…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538222/pharmacy-app/pharmacy/Garnier_Mineral_Invisible_48HR_Roll_On_5_863_1758538222121.jpg	2025-09-22 09:34:50.672	2025-09-22 10:50:23.053
865	Garnier Mineral InvisiCool Anti-Perspirant Deodorant Roll On 50ml	Lasting freshness. 48hr non stop. Anti-white marks. Skin breathes. No alcohol- no parabens.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538226/pharmacy-app/pharmacy/Garnier_Mineral_InvisiCool_Anti_Perspira_865_1758538225703.jpg	2025-09-22 09:34:53.638	2025-09-22 10:50:26.654
866	Garnier Mineral Pure Active Anti-Perspirant Deodorant Roll On 50ml	Smoothes the skin and protects against irritation. Reduces perspiration and absorbs moisture. Absorbs unpleasant odors and refreshes. Does not stain…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538228/pharmacy-app/pharmacy/Garnier_Mineral_Pure_Active_Anti_Perspir_866_1758538227836.jpg	2025-09-22 09:34:55.176	2025-09-22 10:50:28.982
868	Garnier Mineral Women Deodorant InvisiCalm (After-Shaving) Roll-On 50ml	Quick-dry. Soft-touch. Dermatologically tested. Anti Mark Technology. Helps prevent redness after shaving.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538236/pharmacy-app/pharmacy/Garnier_Mineral_Women_Deodorant_InvisiCa_868_1758538235178.jpg	2025-09-22 09:34:58.073	2025-09-22 10:50:36.256
870	Garnier Pure Active 3in1 Charcoal Mask-Wash-Scrub For Blackheads and Spots 150ml	Garnier Pure Active Intensive Charcoal 3-in-1 Wash, Scrub and Mask 150ml will have your skin looking its best in just…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538242/pharmacy-app/pharmacy/Garnier_Pure_Active_3in1_Charcoal_Mask_W_870_1758538241433.jpg	2025-09-22 09:35:01.331	2025-09-22 10:50:42.545
871	Garnier Pure Active Micellar Cleansing Water 125ml	Micellar Cleansing Water is an easy way to remove make-up, cleanse and purify the skin, eye area and lips in…	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538243/pharmacy-app/pharmacy/Garnier_Pure_Active_Micellar_Cleansing_W_871_1758538243286.jpg	2025-09-22 09:35:02.657	2025-09-22 10:50:44.239
873	Garnier Skin Essentials Anti-Wrinkle Day Cream 50ml	Leaves your skin smooth and soft. Visibly improves your skins texture. Reduces the appearance of lines and wrinkles.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538247/pharmacy-app/pharmacy/Garnier_Skin_Essentials_Anti_Wrinkle_Day_873_1758538246596.jpg	2025-09-22 09:35:05.619	2025-09-22 10:50:47.721
874	Garnier Vitamin C Anti-Dark Spots & Brightening Serum 30ml	Face serum suitable for all skin types. Instantly combats a dull skin tone and reduces dark spots when used regularly.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538249/pharmacy-app/pharmacy/Garnier_Vitamin_C_Anti_Dark_Spots___Brig_874_1758538248498.jpg	2025-09-22 09:35:06.891	2025-09-22 10:50:49.553
876	Gas-X Simethicone 125mg Extra Strength Chewable Tablets 18’s	Gas-X Extra Strength Chewable Gas Relief Tablets with Simethicone 125 mg deliver fast relief of gas pressure, bloating and discomfort.…	43200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538253/pharmacy-app/pharmacy/Gas_X_Simethicone_125mg_Extra_Strength_C_876_1758538252444.jpg	2025-09-22 09:35:09.932	2025-09-22 10:50:53.866
878	Gatsby Moist Anti-Dandruff Treatment Hair Cream 250g	Hair cream with a dual care function helps control dandruff while firmly styling the hair. It helps firmly organize the…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538258/pharmacy-app/pharmacy/Gatsby_Moist_Anti_Dandruff_Treatment_Hai_878_1758538257176.jpg	2025-09-22 09:35:12.214	2025-09-22 10:50:58.887
879	GAUZE ROLL BIG 90CMX100M		46000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538260/pharmacy-app/pharmacy/GAUZE_ROLL_BIG_90CMX100M_879_1758538259735.jpg	2025-09-22 09:35:13.299	2025-09-22 10:51:00.931
881	GAVISCON DOUBLE ACTION tabs (sodium alginate, sodium hydrogen carbonate, calcium carbonate) 24’s		60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538265/pharmacy-app/pharmacy/GAVISCON_DOUBLE_ACTION_tabs__sodium_algi_881_1758538264259.png	2025-09-22 09:35:15.674	2025-09-22 10:51:05.334
882	Gaviscon Peppermint Suspension 200ml	Effectively relieve both heartburn and indigestion by neutralizing stomach acid and forming a raft over the stomach to prevent the…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538267/pharmacy-app/pharmacy/Gaviscon_Peppermint_Suspension_200ml_882_1758538266475.png	2025-09-22 09:35:17.191	2025-09-22 10:51:08.132
1151	La Roche-Posay Effaclar Purifying Foaming Gel Cleanser 200mL	The Effaclar Foaming Gel Cleanser has a clear formula with a lightweight gel texture which lathers into a white foam…	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538873/pharmacy-app/pharmacy/La_Roche_Posay_Effaclar_Purifying_Foamin_1151_1758538873156.jpg	2025-09-22 09:41:52.455	2025-09-22 11:01:14.169
896	Glycerin of Borax 15g	For treatment of ulcers in the mouth and throat.	2500	100	\N	2025-09-22 09:35:36.647	2025-09-22 09:35:36.647
886	Gillette Blue II Plus Disposable Razor Pair	This pack contains a pair of Blue II Plus disposable razors. A great shave is within your grasp with Gillette…	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538276/pharmacy-app/pharmacy/Gillette_Blue_II_Plus_Disposable_Razor_P_886_1758538275245.png	2025-09-22 09:35:21.914	2025-09-22 10:51:16.496
887	Gillette Clear Gel Cool Wave Anti-perspirant Deodorant 70ml	Ride a wave of freshness and stay confident with the #1 men’s clear gel antiperspirant/deodorant. Provides all-day protection from wetness…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538278/pharmacy-app/pharmacy/Gillette_Clear_Gel_Cool_Wave_Anti_perspi_887_1758538277434.jpg	2025-09-22 09:35:23.232	2025-09-22 10:51:18.545
888	Gillette MACH3 Base Razor 1s	Stronger-than-steel low cutting force blades which last. Closer shave with Zero Redness.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538280/pharmacy-app/pharmacy/Gillette_MACH3_Base_Razor_1s_888_1758538279477.jpg	2025-09-22 09:35:24.871	2025-09-22 10:51:20.497
890	Gillette Mach3 Turbo Razor Blades 4pcs	Gillette Mach 3 Turbo men’s razor blades delivers a close shave, without all the redness while still feeling like a…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538284/pharmacy-app/pharmacy/Gillette_Mach3_Turbo_Razor_Blades_4pcs_890_1758538283383.jpg	2025-09-22 09:35:27.765	2025-09-22 10:51:24.428
892	Gillette Sport Triumph Antiperspirant Clear Gel Deodorant 70ml	48 hours of freshness. Eliminates odor at the source. Arctic ice clear gel. Reduces underarm wetness. Easy to use. dries…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538288/pharmacy-app/pharmacy/Gillette_Sport_Triumph_Antiperspirant_Cl_892_1758538287557.jpg	2025-09-22 09:35:30.4	2025-09-22 10:51:28.372
894	Ginsomin Capsules 30’s	GINSOMIN is a unique formulation that combines Korean panax ginseng with a broad set of vitamins and minerals. The ginseng…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538295/pharmacy-app/pharmacy/Ginsomin_Capsules_30_s_894_1758538294710.jpg	2025-09-22 09:35:33.676	2025-09-22 10:51:35.953
895	Glemont-L (Montelukast 10mg/ Levocetirizine 5mg) Tablets 7’s	For management of airway congestion symptoms in asthma & allergic rhinitis. Each tin contains 7 tablets.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538297/pharmacy-app/pharmacy/Glemont_L__Montelukast_10mg__Levocetiriz_895_1758538296759.jpg	2025-09-22 09:35:35.212	2025-09-22 10:51:37.797
897	Glycerin Suppositories Adult 4g 12’s	For the relief of occasional constipation.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538299/pharmacy-app/pharmacy/Glycerin_Suppositories_Adult_4g_12_s_897_1758538298746.jpg	2025-09-22 09:35:38.285	2025-09-22 10:51:39.712
899	Glycerin Suppositories Infant 1g 12’s	For the relief of occasional constipation in infants.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538304/pharmacy-app/pharmacy/Glycerin_Suppositories_Infant_1g_12_s_899_1758538303796.jpg	2025-09-22 09:35:41.365	2025-09-22 10:51:44.808
901	Go Clean Anti Fungal Soap 75g	The soap is used to treat conditions such as ringworm, athlete's foot, jock itch, eczema, and dandruff, as well as…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538309/pharmacy-app/pharmacy/Go_Clean_Anti_Fungal_Soap_75g_901_1758538308777.jpg	2025-09-22 09:35:44.043	2025-09-22 10:51:50.258
903	Goli Ashwagandha Gummies 60’s	Ashwagandha is classified as an adaptogen. Adaptogens are a select group of plants that help the body cope with stress.…	155000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538314/pharmacy-app/pharmacy/Goli_Ashwagandha_Gummies_60_s_903_1758538313658.jpg	2025-09-22 09:35:46.886	2025-09-22 10:51:54.691
905	Goli Pre + Post + Probiotics Gummies 60’s	Goli Pre+Post+Probiotics Gummies are a delicious and convenient way to support your digestive health and overall well-being. Crafted with premium…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538319/pharmacy-app/pharmacy/Goli_Pre___Post___Probiotics_Gummies_60__905_1758538318652.jpg	2025-09-22 09:35:50.265	2025-09-22 10:52:00.205
906	Goli Sleep Gummies (Melatonin 10mg)	Goli Sleep Gummies are formulated with Melatonin 10 mg which supports sound sleep for those experiencing occasional sleeplessness and helps…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538321/pharmacy-app/pharmacy/Goli_Sleep_Gummies__Melatonin_10mg__906_1758538320899.jpg	2025-09-22 09:35:51.413	2025-09-22 10:52:01.998
908	Goli Women’s Complete Multi Gummies	Goli Women's Complete Multi Gummies are formulated to offer the COMPLETE spectrum of all 13 Essential Vitamins, as well as…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538326/pharmacy-app/pharmacy/Goli_Women_s_Complete_Multi_Gummies_908_1758538325654.jpg	2025-09-22 09:35:53.857	2025-09-22 10:52:06.674
909	Good Morning Lung Tonic Syrup 60ml	Good Morning Lung Tonic Syrup is a syrup used to provide relief from persistent cough.	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538329/pharmacy-app/pharmacy/Good_Morning_Lung_Tonic_Syrup_60ml_909_1758538328882.jpg	2025-09-22 09:35:55.181	2025-09-22 10:52:09.848
911	Grovit Multivitamin Chewable Tablets- Chocolate 30’s	Grovit is used to treat vitamin deficiency in the body. It contains vitamin D3 extract, Zinc extract, Iodine etc. which…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538334/pharmacy-app/pharmacy/Grovit_Multivitamin_Chewable_Tablets__Ch_911_1758538333666.jpg	2025-09-22 09:35:58.048	2025-09-22 10:52:14.659
913	Grovit Multivitamin Syrup 100ml	Grovit Syrup is composed of multivitamins. It works by completing the basic needs of the body.	6500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538338/pharmacy-app/pharmacy/Grovit_Multivitamin_Syrup_100ml_913_1758538337861.jpg	2025-09-22 09:36:01.12	2025-09-22 10:52:19.165
914	Gyno Formula Syrup	Gyno Formula contains a blend of herbal extracts from Africa's Tropical forests carefully selected & processed into liquid form to…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538341/pharmacy-app/pharmacy/Gyno_Formula_Syrup_914_1758538340117.jpg	2025-09-22 09:36:02.666	2025-09-22 10:52:21.995
916	Haliborange Adult Calm Gummies 30’s	Searching for a bit of calm during a hectic day? Take a break and chew on one of our Calm…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538345/pharmacy-app/pharmacy/Haliborange_Adult_Calm_Gummies_30_s_916_1758538345096.jpg	2025-09-22 09:36:06.059	2025-09-22 10:52:26.159
918	Haliborange Adult Immune Support Gummies 30’s	Come rain or shine, the selected vitamins and minerals in our gummies help support your immune system from one season…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538350/pharmacy-app/pharmacy/Haliborange_Adult_Immune_Support_Gummies_918_1758538350007.jpg	2025-09-22 09:36:11.564	2025-09-22 10:52:31.146
1154	La Roche-Posay Pure Vitamin C10 Serum 30ml	This anti-aging vitamin c face and neck serum leaves skin more radiant, softer, and hydrated. As a result, wrinkles look…	245000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538881/pharmacy-app/pharmacy/La_Roche_Posay_Pure_Vitamin_C10_Serum_30_1154_1758538880446.jpg	2025-09-22 09:41:56.449	2025-09-22 11:01:21.791
932	HAND SANITIZER SPRAY 60ML antiseptic solution 60ml		9000	100	\N	2025-09-22 09:36:32.659	2025-09-22 09:36:32.659
923	Haliborange Effervescent Vitamin C Orange Tablets 20’s	Haliborange effervescent Vitamin C 1000mg 20 tablets with sugar and sweeteners. For generations Haliborange tablets have been a delicious way…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538363/pharmacy-app/pharmacy/Haliborange_Effervescent_Vitamin_C_Orang_923_1758538362704.jpg	2025-09-22 09:36:18.733	2025-09-22 10:52:43.497
925	Haliborange Mr Happy Multivitamin Softies 30’s	Haliborange Multivitamin Softies help provide a balanced multivitamin for everyday support. Suitable for children ages 3-7years.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538367/pharmacy-app/pharmacy/Haliborange_Mr_Happy_Multivitamin_Softie_925_1758538366648.jpg	2025-09-22 09:36:21.906	2025-09-22 10:52:48.045
926	Haliborange Multivitamin Liquid 250ml	We all want our little ones to shine in life! Haliborange Multivitamin Liquid is a tasty way for your child…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538370/pharmacy-app/pharmacy/Haliborange_Multivitamin_Liquid_250ml_926_1758538369292.jpg	2025-09-22 09:36:23.28	2025-09-22 10:52:50.267
928	Haliborange Multivitamins Calcium & Iron Chewables 30’s	A multivitamin with minerals like calcium and iron for your little one.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538373/pharmacy-app/pharmacy/Haliborange_Multivitamins_Calcium___Iron_928_1758538372867.jpg	2025-09-22 09:36:26.72	2025-09-22 10:52:53.933
930	Haliborange Orange Flavour A, C & D Tablets 120’s	With Vitamin A: to support normal vision, Vitamin C: to support the immune system and Vitamin D: to support bones…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538377/pharmacy-app/pharmacy/Haliborange_Orange_Flavour_A__C___D_Tabl_930_1758538376788.jpg	2025-09-22 09:36:29.689	2025-09-22 10:52:57.873
931	Haliborange Orange Flavour A, C & D Tablets 60’s	With Vitamin A: to support normal vision, Vitamin C: to support the immune system and Vitamin D: to support bones…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538379/pharmacy-app/pharmacy/Haliborange_Orange_Flavour_A__C___D_Tabl_931_1758538378722.jpg	2025-09-22 09:36:31.123	2025-09-22 10:52:59.818
934	HCG Pregnancy Strip	Pregnancy tests work by checking your urine (pee) for a hormone called human chorionic gonadotropin (HCG). Your body makes this hormone…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538383/pharmacy-app/pharmacy/HCG_Pregnancy_Strip_934_1758538382930.jpg	2025-09-22 09:36:35.424	2025-09-22 10:53:03.878
936	Head & Shoulders Classic Clean Anti-Dandruff 2 in 1 Shampoo 400ml	Up to 72h dandruff dryness itch protection.  Targets dandruff root cause for up to 100% flake-free.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538387/pharmacy-app/pharmacy/Head___Shoulders_Classic_Clean_Anti_Dand_936_1758538386814.jpg	2025-09-22 09:36:38.498	2025-09-22 10:53:07.594
937	Head & Shoulders Itchy Scalp Shampoo 250ml	Relieves scalp itch. #1 dermatologist recommended dandruff brand. Up to 100% flake free.  Starts working faster to help calm itchy…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538389/pharmacy-app/pharmacy/Head___Shoulders_Itchy_Scalp_Shampoo_250_937_1758538388205.jpg	2025-09-22 09:36:40.032	2025-09-22 10:53:09.449
939	Head & Shoulders Smooth & Silky Anti-Dandruff Shampoo 480ml	Up to 72h dandruff dryness itch protection. Targets dandruff root cause for up to 100% flake-free, clinically proven (with regular…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538392/pharmacy-app/pharmacy/Head___Shoulders_Smooth___Silky_Anti_Dan_939_1758538391775.jpg	2025-09-22 09:36:43.219	2025-09-22 10:53:12.571
941	Head &Shoulders Daily Clean Anti-Dandruff Shampoo 400mL	This Shampoo fights dry scalp, calms itchy scalp, relieves irritation, reduces redness, great scent, controls flaky scalp and leaves hair…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538395/pharmacy-app/pharmacy/Head__Shoulders_Daily_Clean_Anti_Dandruf_941_1758538395206.jpg	2025-09-22 09:36:45.576	2025-09-22 10:53:16.15
942	Health Aid 2-Day Detox Plan Liquid 100ml	Everyone can benefit from a de-tox especially after those heavy weekends of drinking, smoking and eating out, de-tox is the…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538397/pharmacy-app/pharmacy/Health_Aid_2_Day_Detox_Plan_Liquid_100ml_942_1758538397027.jpg	2025-09-22 09:36:47.098	2025-09-22 10:53:18.43
944	Health Aid Acidophilus Plus 4Billion Probitic 30s	Helps to supplement your diet by replenishing the ‘friendly’ bacteria, support the immune system and assist in the absorption of…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538402/pharmacy-app/pharmacy/Health_Aid_Acidophilus_Plus_4Billion_Pro_944_1758538401547.jpg	2025-09-22 09:36:50.08	2025-09-22 10:53:22.45
946	Health Aid Biotin 5000mcg Caps 60’s	Biotin is a member of the B-vitamins that is used by the body for the production of various enzymes which…	76000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538410/pharmacy-app/pharmacy/Health_Aid_Biotin_5000mcg_Caps_60_s_946_1758538409240.jpg	2025-09-22 09:36:53.256	2025-09-22 10:53:30.641
947	Health Aid Biotin 800mcg Tabs 30’s	Biotin is a member of the B vitamins that is used by the body for the production of various enzymes…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538412/pharmacy-app/pharmacy/Health_Aid_Biotin_800mcg_Tabs_30_s_947_1758538411574.jpg	2025-09-22 09:36:54.777	2025-09-22 10:53:32.461
949	Health Aid Calmagzinc Tabs 90’s	Calmagzinc Tablets provide three important minerals that have been specially formulated to work synergistically for better absorption and efficiency. Calcium,…	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538416/pharmacy-app/pharmacy/Health_Aid_Calmagzinc_Tabs_90_s_949_1758538415387.jpg	2025-09-22 09:36:57.952	2025-09-22 10:53:36.478
950	Health Aid Cider Trim Capsules 90’s	Cider Trim Capsules contain a synergistic blend of ingredients specially formulated for those trying to slim or maintain a healthy…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538418/pharmacy-app/pharmacy/Health_Aid_Cider_Trim_Capsules_90_s_950_1758538417688.png	2025-09-22 09:36:59.294	2025-09-22 10:53:38.829
951	Health Aid Cranberry 5000Mg Tabs 60’s		75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538420/pharmacy-app/pharmacy/Health_Aid_Cranberry_5000Mg_Tabs_60_s_951_1758538419603.jpg	2025-09-22 09:37:00.717	2025-09-22 10:53:40.504
954	Health Aid Flax Seed Oil 1000mg Caps 60’s	Flax Seed Oil 1000mg Capsules may be of benefit to; Those with joint pain or stiffness, and  Those with cardiovascular…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538425/pharmacy-app/pharmacy/Health_Aid_Flax_Seed_Oil_1000mg_Caps_60__954_1758538424927.jpg	2025-09-22 09:37:05.456	2025-09-22 10:53:46.002
1157	Lactonatal +DHA Denk 30’s	For the nutrient requirements while breastfeeding. Selected nutrient combination for mother and child. With folic acid, omega-3 fatty acids and…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538889/pharmacy-app/pharmacy/Lactonatal__DHA_Denk_30_s_1157_1758538888815.jpg	2025-09-22 09:42:00.77	2025-09-22 11:01:29.822
957	HEALTH AID GASTONE CAPS Charcoal 260mg 60 Capsule		54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538431/pharmacy-app/pharmacy/HEALTH_AID_GASTONE_CAPS_Charcoal_260mg_6_957_1758538430518.jpg	2025-09-22 09:37:10.047	2025-09-22 10:53:51.634
959	Health Aid KidzProBio Chewable 30’s	KidzProbio Chewable Tablets is a unique formulation containing special viable strains of Lactobacillus and Bifidobacterium designed with your child’s wellbeing…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538435/pharmacy-app/pharmacy/Health_Aid_KidzProBio_Chewable_30_s_959_1758538434323.jpg	2025-09-22 09:37:13.081	2025-09-22 10:53:55.731
960	Health Aid Koregin 3000 Korean Ginseng 30’s	Health Aid Koregin 3000 Capsules are highly concentrated Korean Ginseng root extract Capsules mainly used to provide a feeling of physical…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538437/pharmacy-app/pharmacy/Health_Aid_Koregin_3000_Korean_Ginseng_3_960_1758538436613.jpg	2025-09-22 09:37:14.457	2025-09-22 10:53:57.574
961	Health Aid Lavender Oil 10ml	Soothing and relaxing. Helps to restore balance and encourage sleep.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538439/pharmacy-app/pharmacy/Health_Aid_Lavender_Oil_10ml_961_1758538438477.jpg	2025-09-22 09:37:15.77	2025-09-22 10:54:00.085
963	Health Aid Omegazon Caps 60’s	Omegazon contains omega 3 which has anti-inflammatory and anti-coagulant properties as well as many other important health benefits.	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538443/pharmacy-app/pharmacy/Health_Aid_Omegazon_Caps_60_s_963_1758538443042.jpg	2025-09-22 09:37:18.125	2025-09-22 10:54:04.232
965	Health Aid Osteoflex Plus Tablets 30’s	Osteoflex Plus formulation provides nutritional support for healthy joints and cartilage. A unique combination of high grade Glucosamine, Chondroitin Sulphate…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538448/pharmacy-app/pharmacy/Health_Aid_Osteoflex_Plus_Tablets_30_s_965_1758538447270.png	2025-09-22 09:37:21.4	2025-09-22 10:54:08.427
967	Health Aid Peppermint Oil ( Mentha piperita ) 10ml	Peppermint Oil (Mentha piperita) 10ml is a cooling, stimulating, restorative and uplifting oil. It can used against tired sweaty feet…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538451/pharmacy-app/pharmacy/Health_Aid_Peppermint_Oil___Mentha_piper_967_1758538451030.jpg	2025-09-22 09:37:24.474	2025-09-22 10:54:12.441
968	Health Aid Pregnazon 30’s	Health Aid's Pregnazon is a balanced formula with folic acid and 20 more ingredients that offer maximum nutritional support during periods of conception, during…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538454/pharmacy-app/pharmacy/Health_Aid_Pregnazon_30_s_968_1758538453534.png	2025-09-22 09:37:26.01	2025-09-22 10:54:14.878
970	Health Aid Prostavital Capsules 30’s	Health Aid ProstaVital is a dietary supplement with vitamins, minerals and herbal extracts for all round health and wellbeing, and…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538462/pharmacy-app/pharmacy/Health_Aid_Prostavital_Capsules_30_s_970_1758538462172.png	2025-09-22 09:37:29.287	2025-09-22 10:54:23.135
971	Health Aid Sexovit Forte Tablets 30s	Health Aid Sexovit Forte is a dietary supplement with 10 ingredients to stimulate and support the male and female reproductive…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538465/pharmacy-app/pharmacy/Health_Aid_Sexovit_Forte_Tablets_30s_971_1758538464260.jpg	2025-09-22 09:37:30.925	2025-09-22 10:54:25.734
973	Health Aid Tea Tree Oil Soap 100g	Beneficial for the dry, damaged and skin with acne. Used for skin problems caused by fungal infections. Helpful for People…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538469/pharmacy-app/pharmacy/Health_Aid_Tea_Tree_Oil_Soap_100g_973_1758538468931.jpg	2025-09-22 09:37:33.69	2025-09-22 10:54:30.342
974	Health Aid Vitamin B12 1000mcg Tabs 50’s	Health Aid Vitamin B12 Tablets contain Vitamin B12 which is one of the most essential B vitamins and contributes to…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538473/pharmacy-app/pharmacy/Health_Aid_Vitamin_B12_1000mcg_Tabs_50_s_974_1758538472779.png	2025-09-22 09:37:34.816	2025-09-22 10:54:33.67
976	Health Aid Vitamin E 1000iu Capsules 30’s	Vitamin E functions as a natural powerful antioxidant and contributes to the protection of cells from oxidative stress. Oxidation of…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538481/pharmacy-app/pharmacy/Health_Aid_Vitamin_E_1000iu_Capsules_30__976_1758538480831.jpg	2025-09-22 09:37:37.991	2025-09-22 10:54:42.124
977	Health Aid Vitamin E Oil 50ml	Health Aid has formulated this oil using high quality natural Vitamin E, which is readily absorbed and helps keep the…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538484/pharmacy-app/pharmacy/Health_Aid_Vitamin_E_Oil_50ml_977_1758538483211.jpg	2025-09-22 09:37:39.527	2025-09-22 10:54:44.191
979	Health Aid Zinc Sulphate 200mg Tablets 90’s	Zinc contributes to normal DNA synthesis, acid-base and carbohydrate metabolism, normal cognitive function, fertility and reproduction, micronutrient and fatty acids…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538488/pharmacy-app/pharmacy/Health_Aid_Zinc_Sulphate_200mg_Tablets_9_979_1758538487349.jpg	2025-09-22 09:37:42.7	2025-09-22 10:54:48.671
980	Health Aid Zinc Sulphate 200Mg Tabs (45mg elemental Zinc) 90’s		52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538490/pharmacy-app/pharmacy/Health_Aid_Zinc_Sulphate_200Mg_Tabs__45m_980_1758538489799.jpg	2025-09-22 09:37:44.092	2025-09-22 10:54:51.025
982	Hedrin Once Spray Gel 100ml	Clinically proven to kill head lice and eggs in one 15 minute treatment.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538494/pharmacy-app/pharmacy/Hedrin_Once_Spray_Gel_100ml_982_1758538493507.jpg	2025-09-22 09:37:47.001	2025-09-22 10:54:54.72
984	Hemani Blackseed Oil 30ml	Hemani Blackseed Oil is a premium, natural oil derived from the seeds of the Nigella sativa plant, known for its…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538499/pharmacy-app/pharmacy/Hemani_Blackseed_Oil_30ml_984_1758538498590.jpg	2025-09-22 09:37:49.983	2025-09-22 10:54:59.627
986	Hemani Neem Oil 30ml	Hemani neem oil is derived from the seeds of the Indian neem tree, an effective natural remedy to protect the…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538503/pharmacy-app/pharmacy/Hemani_Neem_Oil_30ml_986_1758538502995.jpg	2025-09-22 09:37:52.337	2025-09-22 10:55:04.236
987	Hemani Rosehip Oil 30ml	Experience in the luxurious benefits of Hemani Rosehip Oil, extracted from the seeds of wild rose bushes.  Rosehip oil is…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538506/pharmacy-app/pharmacy/Hemani_Rosehip_Oil_30ml_987_1758538505349.jpg	2025-09-22 09:37:53.429	2025-09-22 10:55:06.591
1160	Lavender Oil ( Lavendula angustifolia ) 10ml	Promoting relaxation. Decreasing feelings of stress. Stimulating sleep. Promoting a full night of restorative sleep.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538896/pharmacy-app/pharmacy/Lavender_Oil___Lavendula_angustifolia____1160_1758538896175.jpg	2025-09-22 09:42:04.856	2025-09-22 11:01:37.662
1020	Iris Desloratadine 5mg Tablets 30’s	For relief of allergic symptoms like runny nose, itchiness, watery eyes and hives.	30000	100	\N	2025-09-22 09:38:39.84	2025-09-22 09:38:39.84
991	Hepaticum Silyamarin Capsules 30’s	Hepaticum Capsule is used for Improved liver function, High blood sugar, Gall bladder disorders, Alcohol abuse, Jaundice, Menstrual disorders and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538514/pharmacy-app/pharmacy/Hepaticum_Silyamarin_Capsules_30_s_991_1758538513869.jpg	2025-09-22 09:37:58.002	2025-09-22 10:55:14.988
993	Heptovit Capsules 30’s	Heptovit  is an ayurvedic herbal medicine. A blend of potent herbs which are hepatoprotective and anti-viral in nature. The ingredients…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538518/pharmacy-app/pharmacy/Heptovit_Capsules_30_s_993_1758538517692.jpg	2025-09-22 09:38:01.032	2025-09-22 10:55:18.641
994	Herbalxpress Gray Hair Formula Capsules 60’s	Several potential health benefits are associated with using Herbalxpress Gray Hair Formula to support getting rid of gray hair. Some…	84000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538521/pharmacy-app/pharmacy/Herbalxpress_Gray_Hair_Formula_Capsules__994_1758538520595.jpg	2025-09-22 09:38:02.464	2025-09-22 10:55:22.054
996	Hi Dee Capsules 10,000IU 30’s	Used in vitamin D deficiency. Supports immunity. Each pack contains 30 capsules.	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538530/pharmacy-app/pharmacy/Hi_Dee_Capsules_10_000IU_30_s_996_1758538528592.jpg	2025-09-22 09:38:05.447	2025-09-22 10:55:30.347
998	Hi Dee Drops 2000IU 10ml	For Vitamin D deficiency in infants and children. Each 5drops contain 2000IU.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538533/pharmacy-app/pharmacy/Hi_Dee_Drops_2000IU_10ml_998_1758538533000.jpg	2025-09-22 09:38:08.154	2025-09-22 10:55:33.932
999	Honey Baby Breast Pump	Honey baby portable manual breast pump is easy to use, easy to clean and available in colors: pink and blue.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538535/pharmacy-app/pharmacy/Honey_Baby_Breast_Pump_999_1758538534701.jpg	2025-09-22 09:38:09.338	2025-09-22 10:55:35.878
1001	Huggies Dry Comfort S4 (8-14Kg) 18’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	19500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538541/pharmacy-app/pharmacy/Huggies_Dry_Comfort_S4__8_14Kg__18_s_1001_1758538541134.jpg	2025-09-22 09:38:12.5	2025-09-22 10:55:42.329
1003	Huggies Dry Comfort Size 3 (5-9Kg) 20’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	19500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538546/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_3__5_9Kg__20_s_1003_1758538545311.jpg	2025-09-22 09:38:15.571	2025-09-22 10:55:46.366
1004	Huggies Dry Comfort Size 3 (5-9Kg) 9’s	Huggies Dry pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538547/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_3__5_9Kg__9_s_1004_1758538547121.jpg	2025-09-22 09:38:17.108	2025-09-22 10:55:47.958
1006	Huggies Dry Comfort Size 5 (12-22Kg) 7’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538550/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_5__12_22Kg__7_s_1006_1758538550270.jpg	2025-09-22 09:38:19.77	2025-09-22 10:55:51.036
1007	Huggies Dry Comfort Size 5 16’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	20500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538552/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_5_16_s_1007_1758538551889.jpg	2025-09-22 09:38:21.408	2025-09-22 10:55:53.083
1009	Huggies New Born Size 2 (5-7Kg) 32’s	Huggies Dry Comfort comes with break through nappy technology and super absorbent lock dry core technology keeping your baby dry…	30500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538556/pharmacy-app/pharmacy/Huggies_New_Born_Size_2__5_7Kg__32_s_1009_1758538555988.jpg	2025-09-22 09:38:24.276	2025-09-22 10:55:57.381
1011	Huggies Pants Size 4 (9-14Kg) 32’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	34500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538560/pharmacy-app/pharmacy/Huggies_Pants_Size_4__9_14Kg__32_s_1011_1758538560002.jpg	2025-09-22 09:38:27.257	2025-09-22 10:56:01.069
1012	Huggies Pants Size 5 (12-17Kg) 28’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538563/pharmacy-app/pharmacy/Huggies_Pants_Size_5__12_17Kg__28_s_1012_1758538562323.png	2025-09-22 09:38:28.691	2025-09-22 10:56:03.525
1014	Huggies Pure Baby Wipes 56’s	Huggies Pure Baby Wipes is made with natural absorbent fibers that gently cleans and protects the baby delicate skin. They…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538566/pharmacy-app/pharmacy/Huggies_Pure_Baby_Wipes_56_s_1014_1758538565881.jpg	2025-09-22 09:38:31.457	2025-09-22 10:56:06.935
1015	HUMARUB HAND SANITIZER SOLUTION 500MLS		35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538568/pharmacy-app/pharmacy/HUMARUB_HAND_SANITIZER_SOLUTION_500MLS_1015_1758538567525.jpg	2025-09-22 09:38:33.082	2025-09-22 10:56:08.651
1017	Immunace Extra Protection 30’s	Intelligently formulated for your immune system, Immunace Extra Protection gives you Immunace's highest level of nutritional support in a single…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538572/pharmacy-app/pharmacy/Immunace_Extra_Protection_30_s_1017_1758538571317.png	2025-09-22 09:38:35.673	2025-09-22 10:56:13.128
1019	Infacol Infant Suspension 55ml	Infacol is an antiflatulent which means that it helps to bring up wind or air trapped in the tummy. Infacol…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538577/pharmacy-app/pharmacy/Infacol_Infant_Suspension_55ml_1019_1758538576456.jpg	2025-09-22 09:38:38.612	2025-09-22 10:56:17.694
1021	Iron Folate Tablets 100’s	Contains Ferrous Sulfate and Folic Acid for iron deficiency and during pregnancy. Each pack contains 100tablets.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538582/pharmacy-app/pharmacy/Iron_Folate_Tablets_100_s_1021_1758538581838.jpg	2025-09-22 09:38:41.376	2025-09-22 10:56:23.069
1162	Lavender Oil 10ml		23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538901/pharmacy-app/pharmacy/Lavender_Oil_10ml_1162_1758538901092.jpg	2025-09-22 09:42:08.03	2025-09-22 11:01:42.169
1025	Itoto Body Butter 175g	Itoto body butter is made out of cow ghee to deliver skin benefits like 24hour moisture lock in, anti ageing,…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538590/pharmacy-app/pharmacy/Itoto_Body_Butter_175g_1025_1758538589953.jpg	2025-09-22 09:38:47.418	2025-09-22 10:56:30.868
1026	Itoto Body Cream 200g	Effective for dry and normal skin types. Has skin rejuvenating properties that deeply moisturize the skin making the body soft…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538592/pharmacy-app/pharmacy/Itoto_Body_Cream_200g_1026_1758538592050.jpg	2025-09-22 09:38:48.954	2025-09-22 10:56:33.325
1028	Itoto Glare Oil 50ml	A blend of organic oils rich in skin oil balancing, glowing, peeling, rejuvenating, stores radiance.	19500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538596/pharmacy-app/pharmacy/Itoto_Glare_Oil_50ml_1028_1758538595989.jpg	2025-09-22 09:38:52.026	2025-09-22 10:56:36.734
1030	Jena Beet 100g	Contains Beta vulgaris Supports liver, kidney and blood function.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538600/pharmacy-app/pharmacy/Jena_Beet_100g_1030_1758538599693.jpg	2025-09-22 09:38:55.099	2025-09-22 10:56:40.9
1031	Jena Dent 20ML	Supports oral and dental health, and relief of toothache	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538602/pharmacy-app/pharmacy/Jena_Dent_20ML_1031_1758538601688.jpg	2025-09-22 09:38:56.658	2025-09-22 10:56:42.951
1033	Jena HT 100g	Helps maintain balanced healthy blood preasure levels and supports heart and blood vessel health.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538606/pharmacy-app/pharmacy/Jena_HT_100g_1033_1758538606065.jpg	2025-09-22 09:38:59.808	2025-09-22 10:56:47.354
1034	Jenacid Syrup 1 Litre	A herbal remedy for peptic ulcers and heart burn.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538609/pharmacy-app/pharmacy/Jenacid_Syrup_1_Litre_1034_1758538608340.jpg	2025-09-22 09:39:01.453	2025-09-22 10:56:49.119
1036	Jenacof DS Syrup 200ml	For quick relief of dry cough and allergic cough.	6300	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538612/pharmacy-app/pharmacy/Jenacof_DS_Syrup_200ml_1036_1758538611742.jpg	2025-09-22 09:39:04.561	2025-09-22 10:56:52.914
1038	Jenaflu Syrup 200ml	For quick relief of rhinitis, itchy eyes, hay fever and other allergic reactions.	6300	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538616/pharmacy-app/pharmacy/Jenaflu_Syrup_200ml_1038_1758538615358.jpg	2025-09-22 09:39:07.079	2025-09-22 10:56:56.369
1041	Jergens Enriching Shea Butter Lotion 621ml	With pure African shea butter. Oil-infused. For visibly radiant skin. 24-hour moisturizer.	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538621/pharmacy-app/pharmacy/Jergens_Enriching_Shea_Butter_Lotion_621_1041_1758538620836.jpg	2025-09-22 09:39:12.097	2025-09-22 10:57:02.169
1043	Jergens Ultra Extra Healing Dry Skin Lotion 621ml	Best for: Extra dry skin, including heels, elbows, and knees. Improves skin‘s tone, texture, and luminosity. Contains a unique illuminating…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538625/pharmacy-app/pharmacy/Jergens_Ultra_Extra_Healing_Dry_Skin_Lot_1043_1758538624524.jpg	2025-09-22 09:39:14.861	2025-09-22 10:57:05.584
1044	Johnshons Baby Oil 200ml	Your baby’s skin loses moisture 2 times faster & is more prone to dryness. Johnson’s Baby Oil is specially formulated…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538626/pharmacy-app/pharmacy/Johnshons_Baby_Oil_200ml_1044_1758538626195.jpg	2025-09-22 09:39:16.5	2025-09-22 10:57:06.994
1045	Johnson’s Baby Cotton Buds 200’s	For cleaning delicate areas around eyes & outer ear.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538628/pharmacy-app/pharmacy/Johnson_s_Baby_Cotton_Buds_200_s_1045_1758538627824.jpg	2025-09-22 09:39:18.14	2025-09-22 10:57:08.97
1047	Johnsons Baby Aqueous Cream Lightly Fragranced 350ml	Gently cleanses and leaves delicate skin feeling healthy. 24hour  moisture to protect delicate skin from dryness. Lightly fragranced.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538636/pharmacy-app/pharmacy/Johnsons_Baby_Aqueous_Cream_Lightly_Frag_1047_1758538635345.jpg	2025-09-22 09:39:21.313	2025-09-22 10:57:16.574
1049	Johnsons Baby Gel Shea &Cocoa Butter 192ml	Locks up to 10 times more moisture. Clinically proven mild and gentle formula. Dermatologist and allergy-tested. Enriched with natural, nourishing…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538639/pharmacy-app/pharmacy/Johnsons_Baby_Gel_Shea__Cocoa_Butter_192_1049_1758538638743.jpg	2025-09-22 09:39:24.384	2025-09-22 10:57:19.624
1051	Johnsons Baby Jelly Fragrance Free 250ml	Helps prevent against the causes of nappy rash by creating a barrier against wetness. It provides moisture protection and is…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538642/pharmacy-app/pharmacy/Johnsons_Baby_Jelly_Fragrance_Free_250ml_1051_1758538642206.jpg	2025-09-22 09:39:26.945	2025-09-22 10:57:23.455
1052	Johnsons Baby Jelly Lightly Fragranced 100ml	Johnson’s Baby Lightly Fragranced Jelly has a clinically proven mild formula that forms an effective barrier against wetness to help…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538645/pharmacy-app/pharmacy/Johnsons_Baby_Jelly_Lightly_Fragranced_1_1052_1758538644262.jpg	2025-09-22 09:39:28.378	2025-09-22 10:57:25.652
1054	Johnsons Baby Lotion 100ml	Johnson's baby lotion moisturizes and protects baby's skin for up to 24 hours. Johnson's baby has taken care of babies…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538649/pharmacy-app/pharmacy/Johnsons_Baby_Lotion_100ml_1054_1758538648423.jpg	2025-09-22 09:39:30.709	2025-09-22 10:57:29.151
1055	Johnsons Baby Lotion 500ml	Prevent moisture loss from the gentle skin of your little one with Johnson & Johnson Baby Lotion that is a…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538650/pharmacy-app/pharmacy/Johnsons_Baby_Lotion_500ml_1055_1758538649982.jpg	2025-09-22 09:39:32.474	2025-09-22 10:57:30.977
1057	Johnsons Baby Oil 125ml	Johnson's baby oil gives your baby a healthy, soft skin, with empowerment to fight irritants. The gentleness, softness and moisturizing…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538654/pharmacy-app/pharmacy/Johnsons_Baby_Oil_125ml_1057_1758538654290.jpg	2025-09-22 09:39:34.665	2025-09-22 10:57:35.284
1058	Johnsons Baby Oil 200ml	Your baby’s skin loses moisture 2 times faster & is more prone to dryness. Johnson’s Baby Oil 500ml is specially…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538656/pharmacy-app/pharmacy/Johnsons_Baby_Oil_200ml_1058_1758538656231.jpg	2025-09-22 09:39:35.744	2025-09-22 10:57:37.328
1060	Johnsons Baby Oil 500ml	Your baby’s skin loses moisture 2 times faster & is more prone to dryness. Johnson’s Baby Oil 500ml is specially…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538660/pharmacy-app/pharmacy/Johnsons_Baby_Oil_500ml_1060_1758538659738.jpg	2025-09-22 09:39:38.017	2025-09-22 10:57:40.52
1163	Laxolac Lactulose Syrup 120ml	Laxative. For the stool to pass softer and easier.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538904/pharmacy-app/pharmacy/Laxolac_Lactulose_Syrup_120ml_1163_1758538903978.jpg	2025-09-22 09:42:09.351	2025-09-22 11:01:44.871
1063	Johnsons Baby Powder 50g	Specially formulated talcum powder for babies. Eliminates friction on the baby’s skin. Keeps their skin clean and fresh smelling. A…	2500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538665/pharmacy-app/pharmacy/Johnsons_Baby_Powder_50g_1063_1758538664931.jpg	2025-09-22 09:39:42.611	2025-09-22 10:57:45.637
1064	Johnsons Baby Shampoo 500ml	Pure & gentle daily care. The mildest formula. As gentle to eyes as pure water. Free from parabens, sulphates and…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538667/pharmacy-app/pharmacy/Johnsons_Baby_Shampoo_500ml_1064_1758538666464.jpg	2025-09-22 09:39:43.952	2025-09-22 10:57:47.413
1066	Johnsons Oil Gel Aloe Vera &Vit E 192ML	Johnson's Baby Oil Gel with (Aloe Vera & Vitamin E) provides all the benefits of Johnson s Baby Oil in…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538671/pharmacy-app/pharmacy/Johnsons_Oil_Gel_Aloe_Vera__Vit_E_192ML_1066_1758538670503.jpg	2025-09-22 09:39:46.912	2025-09-22 10:57:51.459
1068	Jointace Omega 3 + Glucosamine Tablets 30’s	Includes pure-quality grade Omega 3 and Vitamin C contributes to normal collagen formation for the normal function of bones and…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538675/pharmacy-app/pharmacy/Jointace_Omega_3___Glucosamine_Tablets_3_1068_1758538675114.png	2025-09-22 09:39:50.319	2025-09-22 10:57:56.201
1070	K-Y GEL (KNECT) LUBRICANT 50ML	KY Gel Lubricant heightens sexual pleasure by complementing personal moisture to help ensure lubrication and comfort during sex.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538679/pharmacy-app/pharmacy/K_Y_GEL__KNECT__LUBRICANT_50ML_1070_1758538678876.jpg	2025-09-22 09:39:53.261	2025-09-22 10:57:59.916
1071	K-Y GEL (KNECT) LUBRICANT 75ML	KY Gel Lubricant heightens sexual pleasure by complementing personal moisture to help ensure lubrication and comfort during sex.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538685/pharmacy-app/pharmacy/K_Y_GEL__KNECT__LUBRICANT_75ML_1071_1758538684414.jpg	2025-09-22 09:39:54.5	2025-09-22 10:58:05.926
1073	Kabuuti Herbal Cough Syrup 100ml	For the temporary relief of cough, sneezing, or runny nose due to the common cold or other upper respiratory allergies.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538689/pharmacy-app/pharmacy/Kabuuti_Herbal_Cough_Syrup_100ml_1073_1758538688648.jpg	2025-09-22 09:39:57.28	2025-09-22 10:58:09.548
1074	Kamagra 100mg Tablets 4’S	Kamagra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	19200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538691/pharmacy-app/pharmacy/Kamagra_100mg_Tablets_4_S_1074_1758538690356.jpg	2025-09-22 09:39:58.791	2025-09-22 10:58:11.529
1076	Kenazole Shampoo 100ml	Anti-dandruff shampoo. Relieves scaling and pruritus.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538694/pharmacy-app/pharmacy/Kenazole_Shampoo_100ml_1076_1758538694006.jpg	2025-09-22 09:40:01.382	2025-09-22 10:58:14.699
1077	Kentaro 5 in 1 Cooling Braids Spray 250ml	KENTARO 5 in 1 cooling braid spray is essential for giving braids an extra shine and great for natural hair.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538696/pharmacy-app/pharmacy/Kentaro_5_in_1_Cooling_Braids_Spray_250m_1077_1758538695396.jpg	2025-09-22 09:40:02.886	2025-09-22 10:58:16.179
1079	Kentaro Anti-Dandruff Tea Tree Shampoo 500ml	Leaves scalp and hair feeling minty-fresh clean and tea tree oil provides protection against fungus and bacteria.	34000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538699/pharmacy-app/pharmacy/Kentaro_Anti_Dandruff_Tea_Tree_Shampoo_5_1079_1758538698863.jpg	2025-09-22 09:40:05.958	2025-09-22 10:58:19.884
1080	Kentaro Avoghee Hydration Mask 250g	Intense hydration for dry, damaged hair.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538701/pharmacy-app/pharmacy/Kentaro_Avoghee_Hydration_Mask_250g_1080_1758538700974.jpg	2025-09-22 09:40:07.392	2025-09-22 10:58:21.917
1082	Kentaro Beard Wash 100ml	Moisturising beard wash that keeps your beard fuller, skin calm and beard hair shiny.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538704/pharmacy-app/pharmacy/Kentaro_Beard_Wash_100ml_1082_1758538704280.jpg	2025-09-22 09:40:10.055	2025-09-22 10:58:25.165
1084	Kentaro Berry Smoothie Anti-Breakage Conditioner 250g	Kentaro Berry smoothie Anti- breakage conditioner is enriched with minerals for strong glowing hair.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538708/pharmacy-app/pharmacy/Kentaro_Berry_Smoothie_Anti_Breakage_Con_1084_1758538707981.jpg	2025-09-22 09:40:12.323	2025-09-22 10:58:29.074
1086	Kentaro Tea Tree Leave In Conditioner 300ml	Moisturising and nourishing tea tree leave in conditioner	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538712/pharmacy-app/pharmacy/Kentaro_Tea_Tree_Leave_In_Conditioner_30_1086_1758538711905.jpg	2025-09-22 09:40:14.626	2025-09-22 10:58:32.61
1088	Kerella Lotion 30ml Betamethasone + Salicylic Acid	Skin allergy , itching redness swelling, insect bites, dermatitis	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538716/pharmacy-app/pharmacy/Kerella_Lotion_30ml_Betamethasone___Sali_1088_1758538715412.jpg	2025-09-22 09:40:17.247	2025-09-22 10:58:36.408
1089	Keto Plus Ketoconazole Shampoo 60ml	Over-the-counter ketoconazole shampoo is used to control flaking, scaling, and itching of the scalp caused by dandruff.	29000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538724/pharmacy-app/pharmacy/Keto_Plus_Ketoconazole_Shampoo_60ml_1089_1758538722424.jpg	2025-09-22 09:40:18.367	2025-09-22 10:58:45.126
1091	Kidi Baby Lotion 200ml	Gives intense moisturization to the baby’s skin, helps reduce water loss, and also contains Ceramide III-cholesterols that mimic the skin’s…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538729/pharmacy-app/pharmacy/Kidi_Baby_Lotion_200ml_1091_1758538728459.jpg	2025-09-22 09:40:21.113	2025-09-22 10:58:49.621
1093	Kisa Kyamuzadde Cough Syrup 200ml	Herbal Cough syrup for children and adults.	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538733/pharmacy-app/pharmacy/Kisa_Kyamuzadde_Cough_Syrup_200ml_1093_1758538732719.jpg	2025-09-22 09:40:24.084	2025-09-22 10:58:54.271
1094	Kiss Chocolate Condoms 3’s	Kiss chocolate condoms are chocolate scented, coloured and dotted to pleasure your partner's senses and increase excitement. Brown coloured, dotted,…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538738/pharmacy-app/pharmacy/Kiss_Chocolate_Condoms_3_s_1094_1758538737301.jpg	2025-09-22 09:40:25.621	2025-09-22 10:58:58.307
1096	Kiss Strawberry Condoms 3’s	Kiss strawberry condoms are strawberry scented and coloured to pleasure your partner's senses. Red coloured, strawberry scented, teat-ended, natural rubber…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538744/pharmacy-app/pharmacy/Kiss_Strawberry_Condoms_3_s_1096_1758538744026.jpg	2025-09-22 09:40:28.692	2025-09-22 10:59:05.017
1199	MAALOX SUSPENSION PEPPERMINT FLAVOUR?(Aluminium Hydroxide / Magnesium Hydroxide) 250ml		48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538999/pharmacy-app/pharmacy/MAALOX_SUSPENSION_PEPPERMINT_FLAVOUR__Al_1199_1758538998922.jpg	2025-09-22 09:43:01.575	2025-09-22 11:03:20.12
1099	Koff-Go Cough Syrup 100ml	For stubborn and irritating coughs. Also treats allergic symptoms like runny nose and watery eyes.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538751/pharmacy-app/pharmacy/Koff_Go_Cough_Syrup_100ml_1099_1758538750485.jpg	2025-09-22 09:40:33.197	2025-09-22 10:59:11.505
1100	Kwesiima Cough Mixture 200ml	Herbal remedy for cough and congestion.	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538752/pharmacy-app/pharmacy/Kwesiima_Cough_Mixture_200ml_1100_1758538752112.jpg	2025-09-22 09:40:34.733	2025-09-22 10:59:13.071
1103	L’Oreal Men Expert Hydra Energetic Shower Gel 300ml	Hydra Energetic Shower Gel, our 1st men expert shower gel boosted with taurine. This ultimate ingredient, packed with vitamins, provides…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538758/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Hydra_Energetic_Showe_1103_1758538757187.jpg	2025-09-22 09:40:39.137	2025-09-22 10:59:18.192
1105	L’Oreal Men Expert Sensitive Control 48H Deo Roll On	Introducing Sensitive Control, L'Oréal Men Expert's new range of deodorants designed for men with sensitive skin.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538761/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Sensitive_Control_48H_1105_1758538760739.jpg	2025-09-22 09:40:42.106	2025-09-22 10:59:21.52
1106	L’Oréal Men Expert Shirt Protect Deo Roll On 50ml	L'Oreal Men Expert Shirt Protect 48hr Anti-Perspirant deodorant 50ml Roll On Shirt protect anti-perspirant 48h dry non-stop and does not…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538762/pharmacy-app/pharmacy/L_Or_al_Men_Expert_Shirt_Protect_Deo_Rol_1106_1758538762130.jpg	2025-09-22 09:40:43.543	2025-09-22 10:59:23.019
1107	L’Oreal Paris Hydra Fresh Ultra-Hydrating Gel Cream 50ml	Hydrates, Tones and Refreshes the skin improving the texture and skin tone.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538764/pharmacy-app/pharmacy/L_Oreal_Paris_Hydra_Fresh_Ultra_Hydratin_1107_1758538764011.jpg	2025-09-22 09:40:44.871	2025-09-22 10:59:25.052
1109	L’Oreal Paris Men Expert Cool Power Deo Roll On for Men 50ml	Combats bad odours and controls perspiration. 3. Anti-wetness micro-captors for dry non-stop protection. Ultra-fresh woody-mint fragrance.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538768/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Cool_Power_Deo__1109_1758538767861.jpg	2025-09-22 09:40:47.941	2025-09-22 10:59:28.747
1111	L’Oreal Paris Men Expert Fresh Extreme Deo Roll On 50ml	Regulates perspiration. Lasting drying effect. Scent lasts up to 48 hours.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538772/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Fresh_Extreme_D_1111_1758538771382.jpg	2025-09-22 09:40:51.22	2025-09-22 10:59:32.43
1113	L’Oreal Paris Men Expert Stress Resist Shower Gel 300ml	Discover the power of the Vine Extract shower gel that was 100% crafted for relaxation. Stressful day? This Stress Resist…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538775/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Stress_Resist_S_1113_1758538775195.jpg	2025-09-22 09:40:54.189	2025-09-22 10:59:36.162
1114	L’Oreal Paris Men Expert Total Clean Shower Gel 300ml	Our 1st Men Expert shower gel powered by Carbon for 5 in 1 total action! Face, Body, Hair, Shave, Moisturize.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538777/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Total_Clean_Sho_1114_1758538777048.jpg	2025-09-22 09:40:55.75	2025-09-22 10:59:38.57
1116	L’Oreal Paris Revitalift Anti Wrinkle Firming Day Cream SPF25	Smoother, firmer skin in 4 weeks. Contains Stimuplex™+ Pro-Retinol® Dermotologist tested.	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538782/pharmacy-app/pharmacy/L_Oreal_Paris_Revitalift_Anti_Wrinkle_Fi_1116_1758538781852.jpg	2025-09-22 09:40:58.593	2025-09-22 10:59:44.508
1117	L’Oreal Paris RevitaLift Anti-Wrinkle Firming Night Cream	Skin appears refreshed, radiant and younger-looking. Provides continuous action to help fight the signs of aging. Provides 24-hour hydration and…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538786/pharmacy-app/pharmacy/L_Oreal_Paris_RevitaLift_Anti_Wrinkle_Fi_1117_1758538785715.jpg	2025-09-22 09:41:00.128	2025-09-22 10:59:46.686
1119	L’Oreal Paris Revitalift Laser X3 Night Cream Mask 50ml	Instantly hydrates, refines the skin overnight, for a visibly smoother & wrinkle free look.	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538790/pharmacy-app/pharmacy/L_Oreal_Paris_Revitalift_Laser_X3_Night__1119_1758538789533.jpg	2025-09-22 09:41:02.484	2025-09-22 10:59:50.531
1120	L’Oreal Paris Wrinkle Expert 55 Plus Night Cream 50ml	Wrinkle Expert Anti Wrinkle Restoring Night Cream 55+ helps to replump wrinkles, redensify skin and restore contours.	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538792/pharmacy-app/pharmacy/L_Oreal_Paris_Wrinkle_Expert_55_Plus_Nig_1120_1758538791347.jpg	2025-09-22 09:41:03.917	2025-09-22 10:59:52.471
1122	L’Oréal Restoring Hand Serum Cream 100ml	This restoring hand cream-serum is the first aid for rough, dry and irritated hands. It perfectly nourishes and restores the…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538799/pharmacy-app/pharmacy/L_Or_al_Restoring_Hand_Serum_Cream_100ml_1122_1758538798506.jpg	2025-09-22 09:41:07.194	2025-09-22 10:59:59.334
1124	L’Oreal Shirt Protect 48H Anti-Perspirant Deo Spray 250ml	Shirt Protect deodorant helps protect against 100% of types of deodorant marks: Sweat patches, yellow stains, white marks, cardboard effect.…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538802/pharmacy-app/pharmacy/L_Oreal_Shirt_Protect_48H_Anti_Perspiran_1124_1758538802114.jpg	2025-09-22 09:41:12.724	2025-09-22 11:00:03.146
1125	L’Oreal Stress Resist Roll On Anti-Perspirant Deo 50ml	Introducing Men Expert's 1st anti-perspirant deodorant designed for men to resist stressful situations.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538804/pharmacy-app/pharmacy/L_Oreal_Stress_Resist_Roll_On_Anti_Persp_1125_1758538803986.jpg	2025-09-22 09:41:14.978	2025-09-22 11:00:05.296
1127	L’Oreal Men Expert Cool Power Anti-Perspirant Deo Spray 250ml	A 48H anti-perspirant formula designed for men with cooling agents which automatically reactivate when you most need it.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538809/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Cool_Power_Anti_Persp_1127_1758538808228.jpg	2025-09-22 09:41:18.047	2025-09-22 11:00:09.495
1128	L’Oreal Men Expert Invincible Sport Roll On Deo 50ml	Up to 96 hour dry feel. Enriched with magnesia. Dry and fresh woody fragrance.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538810/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Invincible_Sport_Roll_1128_1758538810188.jpg	2025-09-22 09:41:19.482	2025-09-22 11:00:12.041
1132	La Roche Posay Anthelios Invisible Spray SPF50+ 200ml	The La Roche-Posay Invisible SPF 50+ Spray Sunscreen is lightweight in texture, as well as on the skin, offering an…	177000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538818/pharmacy-app/pharmacy/La_Roche_Posay_Anthelios_Invisible_Spray_1132_1758538818140.jpg	2025-09-22 09:41:25.319	2025-09-22 11:00:19.737
1134	La Roche Posay Effaclar Duo Plus Moisturiser Spf30 40ml	The Effaclar Duo+  Anti Imperfections Moisturiser formula has a hydrating, lightweight, gel-cream texture which spreads evenly, and absorbs quickly without…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538823/pharmacy-app/pharmacy/La_Roche_Posay_Effaclar_Duo_Plus_Moistur_1134_1758538823055.png	2025-09-22 09:41:28.391	2025-09-22 11:00:24.589
1135	La Roche Posay Effaclar Micellar Water 400ml	A purifying micellar water for oily skin that removes makeup, dirt and cleanses the skin. Suitable for sensitive skin.	104000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538826/pharmacy-app/pharmacy/La_Roche_Posay_Effaclar_Micellar_Water_4_1135_1758538825860.png	2025-09-22 09:41:29.835	2025-09-22 11:00:27.3
1137	La Roche Posay Effaclar Serum Ultra Concentrated Serum 30ml	An ultra-concentrated serum that targets breakouts and reduces the appearance of blemishes, imperfections, reduces the appearance of fine lines &…	199500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538832/pharmacy-app/pharmacy/La_Roche_Posay_Effaclar_Serum_Ultra_Conc_1137_1758538831246.jpg	2025-09-22 09:41:32.179	2025-09-22 11:00:32.535
1139	La Roche Posay Lipikar Baume AP+M Tripple Action Balm 400ml	LIPIKAR Baume AP+M rebalances skin microbiome. It soothes skin immediately and reduces scratching. With its anti-relapse efficacy, it spaces out flare-ups. It…	150500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538836/pharmacy-app/pharmacy/La_Roche_Posay_Lipikar_Baume_AP_M_Trippl_1139_1758538835833.jpg	2025-09-22 09:41:34.739	2025-09-22 11:00:37.143
1140	La Roche Posay Lipikar Lait Urea Lotion 400ml	Lipikar Urea 10% Milk is a triple-action ultra-hydrating body lotion that relieves symptoms of very dry, rough, and flaky skin.…	175000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538838/pharmacy-app/pharmacy/La_Roche_Posay_Lipikar_Lait_Urea_Lotion__1140_1758538838076.jpg	2025-09-22 09:41:35.993	2025-09-22 11:00:39.188
1142	La Roche Posay Lipikar Syndet AP+ Soothing Wash Cream 400ml	Lipikar Syndet AP+ is a cream wash for newborns, babies, children and adults with atopic eczema-prone skin. Suitable for sensitive,…	104000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538845/pharmacy-app/pharmacy/La_Roche_Posay_Lipikar_Syndet_AP__Soothi_1142_1758538844902.png	2025-09-22 09:41:38.631	2025-09-22 11:00:46.358
1144	La Roche Posay Mela B3 Moisturizer SPF30 With Melasyl 40ml	La Roche-Posay Mela B3 Anti-Dark Spots Corrective Treatment 40ml targets dark spots and prevents hyperpigmentation with SPF 30 and UVA…	149700	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538850/pharmacy-app/pharmacy/La_Roche_Posay_Mela_B3_Moisturizer_SPF30_1144_1758538849385.jpg	2025-09-22 09:41:41.703	2025-09-22 11:00:50.512
1145	La Roche Posay Mela B3 Spf 30 Serum 40ml	La Roche-Posay Mela B3 SPF30 40ml is a depigmenting treatment that helps treat blemishes and prevent their appearance.	202500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538852/pharmacy-app/pharmacy/La_Roche_Posay_Mela_B3_Spf_30_Serum_40ml_1145_1758538851663.jpg	2025-09-22 09:41:43.657	2025-09-22 11:00:54.039
1147	La Roche Posay Toleriane Dermallergo Fluid 40ml	Toleriane Dermallergo Fluid provides 24-hour hydration for sensitive, reactive skin prone to dryness, tightness, redness or itchiness. Thanks to its…	123500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538862/pharmacy-app/pharmacy/La_Roche_Posay_Toleriane_Dermallergo_Flu_1147_1758538861019.jpg	2025-09-22 09:41:46.618	2025-09-22 11:01:02.576
1149	La Roche-Posay Anthelios Invisible Fluid Facial Sunscreen SPF 50+ 50ml	La Roche-Posay Anthelios Uvmune 400 invisible fluid SPF 50+ is  a lightweight, virtually invisible fluid that absorbs easily and is…	87500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538869/pharmacy-app/pharmacy/La_Roche_Posay_Anthelios_Invisible_Fluid_1149_1758538868688.jpg	2025-09-22 09:41:49.588	2025-09-22 11:01:09.91
1150	La Roche-Posay Anthelios Uvmune 400 Hydrating Cream sp50+ 50ml	For sensitive or reactive skin. Also suitable for sun-allergic skin. Can be applied around the eyes. Anti-eye stinging. Hypoallergenic. For…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538871/pharmacy-app/pharmacy/La_Roche_Posay_Anthelios_Uvmune_400_Hydr_1150_1758538871033.png	2025-09-22 09:41:51.124	2025-09-22 11:01:12.369
1152	La Roche-Posay Lipikar Lavant Shower Gel 750ml	Lipikar Gel Lavant gently cleanses both face and body. It provides daily soothing and protection for every sensitive and dry…	132500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538876/pharmacy-app/pharmacy/La_Roche_Posay_Lipikar_Lavant_Shower_Gel_1152_1758538875579.png	2025-09-22 09:41:53.706	2025-09-22 11:01:17.234
1153	La Roche-Posay Mela B3 Micro Peeling Gel Cleanser 200ml	This gentle micro-peeling facial cleanser exfoliates & cleanses skin to reveal a more even skin tone, while visibly reducing dark…	105500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538879/pharmacy-app/pharmacy/La_Roche_Posay_Mela_B3_Micro_Peeling_Gel_1153_1758538878592.jpg	2025-09-22 09:41:55.026	2025-09-22 11:01:19.742
1155	La Roche-Posay Retinol B3 Serum 30ml	This anti-aging pure retinol face and neck serum leaves skin feeling smoother, hydrated, and renewed. As a result, the look…	236000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538884/pharmacy-app/pharmacy/La_Roche_Posay_Retinol_B3_Serum_30ml_1155_1758538882940.jpg	2025-09-22 09:41:57.982	2025-09-22 11:01:25.069
1156	Labour suit kit	Brand new labour suit kit for pregnant ladies. Includes:  1- 1 cotton wool. 2- 3 rolls of gauze 3- 1…	44000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538887/pharmacy-app/pharmacy/Labour_suit_kit_1156_1758538886409.jpg	2025-09-22 09:41:59.486	2025-09-22 11:01:28.027
1158	Lakanto MonkFruit Golden Sweetener 235g	Are you looking for a sugar substitute that tastes exactly like sugar with no weird aftertaste and can satisfy your…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538892/pharmacy-app/pharmacy/Lakanto_MonkFruit_Golden_Sweetener_235g_1158_1758538892021.jpg	2025-09-22 09:42:01.866	2025-09-22 11:01:33.259
1159	Laropi Hair Oil 100ml	Laropi Hair Oil is a hair care product that aims to address various scalp and hair concerns. It is formulated to…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538894/pharmacy-app/pharmacy/Laropi_Hair_Oil_100ml_1159_1758538894189.jpg	2025-09-22 09:42:03.324	2025-09-22 11:01:35.288
1161	Lavender Oil ( Lavendula angustifolia ) 30ml	Promoting relaxation. Decreasing feelings of stress. Stimulating sleep. Promoting a full night of restorative sleep.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538899/pharmacy-app/pharmacy/Lavender_Oil___Lavendula_angustifolia____1161_1758538898612.jpg	2025-09-22 09:42:06.486	2025-09-22 11:01:40.12
1166	Levitra (Vardenafil) 20mg Tablet	Levitra(vardenafil) is used to treat male sexual function problems (impotence or erectile dysfunction-ED). Vardenafil belongs to a group of medicines…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538911/pharmacy-app/pharmacy/Levitra__Vardenafil__20mg_Tablet_1166_1758538910152.jpg	2025-09-22 09:42:13.857	2025-09-22 11:01:51.177
1167	Levocet-M Syrup 100ml	Levocet-M Syrup is a combination of two anti-allergic medicines: Levocetirizine and Montelukast, used in the treatment of allergic symptoms.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538913/pharmacy-app/pharmacy/Levocet_M_Syrup_100ml_1167_1758538911992.jpg	2025-09-22 09:42:15.495	2025-09-22 11:01:53.497
1169	Levocetirizine 5mg UK Tablets 30’s	Levocetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, and sneezing.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538916/pharmacy-app/pharmacy/Levocetirizine_5mg_UK_Tablets_30_s_1169_1758538916127.jpg	2025-09-22 09:42:18.259	2025-09-22 11:01:57.33
1170	Libido Lady Denk 30’s	Libido Lady Denk contains extracts of the Mexican shrub damiana (Turnera diffusa), which is used as a natural aphrodisiac in…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538919/pharmacy-app/pharmacy/Libido_Lady_Denk_30_s_1170_1758538918275.jpg	2025-09-22 09:42:19.796	2025-09-22 11:02:00.15
1172	Liptogrow Plus 3 Infant Milk Formula 400g	Liptogrow Plus 3 is a premium high quality Swiss-made toddler milk formula for children between 1 to 4years. Enriched with…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538928/pharmacy-app/pharmacy/Liptogrow_Plus_3_Infant_Milk_Formula_400_1172_1758538927777.jpg	2025-09-22 09:42:22.97	2025-09-22 11:02:08.727
1173	Liptomil Plus 1 400g	Liptomil Plus 1 is a premium high-quality Swiss-Made infant formula from after birth until 6 months.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538931/pharmacy-app/pharmacy/Liptomil_Plus_1_400g_1173_1758538930401.jpg	2025-09-22 09:42:24.609	2025-09-22 11:02:11.768
1175	Liptomil Plus HA 400g	Liptomil Plus HA is a Super-Premium hypoallergenic infant formula prescribed by pediatricians which helps to prevent cow milk protein allergy.	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538935/pharmacy-app/pharmacy/Liptomil_Plus_HA_400g_1175_1758538934727.jpg	2025-09-22 09:42:27.681	2025-09-22 11:02:16.263
1177	Listerine Advanced White Milder Taste 250ml	LISTERINE® Advanced White Milder Taste is a ZERO-ALCOHOL formula clinically proven to help give you whiter teeth.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538940/pharmacy-app/pharmacy/Listerine_Advanced_White_Milder_Taste_25_1177_1758538939366.jpg	2025-09-22 09:42:30.856	2025-09-22 11:02:20.284
1179	Listerine Cool Mint Mouthwash 500ml	For a cleaner fresher mouth than brushing alone. The formula removes up to 97% of bad breath and plaque causing…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538944/pharmacy-app/pharmacy/Listerine_Cool_Mint_Mouthwash_500ml_1179_1758538943842.jpg	2025-09-22 09:42:33.466	2025-09-22 11:02:24.871
1180	Listerine Fresh Burst Mouthwash 250ml	Listerine Mouthwash Fresh Burst 250ml is all you need for a whole-mouth clean. The antibacterial mouthwash kills the germs that…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538946/pharmacy-app/pharmacy/Listerine_Fresh_Burst_Mouthwash_250ml_1180_1758538945818.jpg	2025-09-22 09:42:34.586	2025-09-22 11:02:26.918
1182	Listerine Total Care Mouthwash 250ml	Listerine Total Care mouthwash, when used twice daily, kills up to 97% of germs that are left behind after brushing.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538950/pharmacy-app/pharmacy/Listerine_Total_Care_Mouthwash_250ml_1182_1758538949377.jpg	2025-09-22 09:42:37.408	2025-09-22 11:02:30.4
1184	Livliv Herbal Supplements 20’s	LivLiv Capsules are a natural hepato-protective unique formula containing natural ingredients with proven benefits. LivLiv contains Siliphos which is a…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538954/pharmacy-app/pharmacy/Livliv_Herbal_Supplements_20_s_1184_1758538954089.jpg	2025-09-22 09:42:40.392	2025-09-22 11:02:35.524
1185	Livolin Forte Capsules 30’s	The liver protector! Livolin Forte is a liver tonic that helps in regeneration and faster recovery of a damaged liver.…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538956/pharmacy-app/pharmacy/Livolin_Forte_Capsules_30_s_1185_1758538956304.jpg	2025-09-22 09:42:41.913	2025-09-22 11:02:37.11
1186	Livoluk Fibre Granules 90gm	Treats Chronic idiopathic constipation	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538958/pharmacy-app/pharmacy/Livoluk_Fibre_Granules_90gm_1186_1758538957797.jpg	2025-09-22 09:42:43.45	2025-09-22 11:02:38.817
1188	Lorafast Syrup 100ml	Lorafast syrup is an antihistamine used in the treatment of infections, allergic rhinitis, skin allergies, cold and flu treatment, and…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538963/pharmacy-app/pharmacy/Lorafast_Syrup_100ml_1188_1758538962150.jpg	2025-09-22 09:42:46.34	2025-09-22 11:02:43.924
1190	Loridin Loratidine 10mg 10’s	For relief of allergy symptoms like runny nose, itchiness, urticaria, watery eyes and hives.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538967/pharmacy-app/pharmacy/Loridin_Loratidine_10mg_10_s_1190_1758538966623.jpg	2025-09-22 09:42:49.389	2025-09-22 11:02:47.807
1191	Lozets Lozenges 24’s	They are orange flavored and contain vitamin C. Effective relief from sore throat. Each pack contains 24 lozenges.	7200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538977/pharmacy-app/pharmacy/Lozets_Lozenges_24_s_1191_1758538974908.jpg	2025-09-22 09:42:50.679	2025-09-22 11:02:57.85
1193	Lucky Bear Bottles 245ml 1’s	A well fed baby is a happy baby. Lucky bear 245ml feeding bottle gives your baby the most comfortable feeding…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538982/pharmacy-app/pharmacy/Lucky_Bear_Bottles_245ml_1_s_1193_1758538982127.jpg	2025-09-22 09:42:52.863	2025-09-22 11:03:03.583
1195	Lynx Dark Temptation Body Spray 150ml	Be ready to give in to any temptation with a sensual blast of sweetness and spice. With dark chocolate notes.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538987/pharmacy-app/pharmacy/Lynx_Dark_Temptation_Body_Spray_150ml_1195_1758538987028.jpg	2025-09-22 09:42:55.137	2025-09-22 11:03:07.908
1196	Lynx Gold Antiperspirant Deodorant Roll On	Bust odor and smell fresh for 48 hours with our first dual-action antiperspirant roll on. Our anti-sweat formula keeps underarms…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538992/pharmacy-app/pharmacy/Lynx_Gold_Antiperspirant_Deodorant_Roll__1196_1758538991949.png	2025-09-22 09:42:56.66	2025-09-22 11:03:13.209
1198	Maalox Oral Suspension Peppermint Flavour 250ml	Fast effective relief from indigestion, heartburn, and acidity.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538997/pharmacy-app/pharmacy/Maalox_Oral_Suspension_Peppermint_Flavou_1198_1758538996444.jpg	2025-09-22 09:42:59.655	2025-09-22 11:03:17.925
1202	Magnesium Trisilicate Chewable Tablets 100s	It works by reducing the amount of acid in the stomach. It belongs to a group of medications called antacids.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539007/pharmacy-app/pharmacy/Magnesium_Trisilicate_Chewable_Tablets_1_1202_1758539006286.jpg	2025-09-22 09:43:05.774	2025-09-22 11:03:27.446
1203	Magnesium Trisilicate Magnesium Syrup 200ml	Used as an antacid in the treatment of peptic ulcers and heartburn.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539009/pharmacy-app/pharmacy/Magnesium_Trisilicate_Magnesium_Syrup_20_1203_1758539008451.jpg	2025-09-22 09:43:07.309	2025-09-22 11:03:29.38
1205	Mama Kit	Mama Kit is a set of materials given to a mother to be utilized during the delivery process. The contents…	15500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539013/pharmacy-app/pharmacy/Mama_Kit_1205_1758539013001.jpg	2025-09-22 09:43:10.482	2025-09-22 11:03:34.357
1207	Manix Capsules 20s	Manix is a supplement for men's reproductive health that increases sexual desire and libido, reduces stress, depression and elevates moods.…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539018/pharmacy-app/pharmacy/Manix_Capsules_20s_1207_1758539017218.jpg	2025-09-22 09:43:13.556	2025-09-22 11:03:38.647
1208	Maxcal (Calcium/Vitamin D3) Tablets 30’s	Maxcal is used for treatment of vitamin D and calcium deficiency, for treatment of osteoporosis, in special populations like elderly,…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539020/pharmacy-app/pharmacy/Maxcal__Calcium_Vitamin_D3__Tablets_30_s_1208_1758539019762.jpg	2025-09-22 09:43:15.092	2025-09-22 11:03:40.9
1210	Mebendazole Tablet 100mg 100’s	Used in the treatment of worm infections.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539024/pharmacy-app/pharmacy/Mebendazole_Tablet_100mg_100_s_1210_1758539023828.jpg	2025-09-22 09:43:18.062	2025-09-22 11:03:45.581
1211	Medijel Mouth Ulcers Gel 15g	For treatment of mouth ulcers and gum irritation.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539027/pharmacy-app/pharmacy/Medijel_Mouth_Ulcers_Gel_15g_1211_1758539026699.jpg	2025-09-22 09:43:19.597	2025-09-22 11:03:48.068
1213	Mediven Cream 15g Betamethasone Cream	Used to treat skin irritation and itch caused by skin conditions such as eczema, psoriasis, contact dermatitis, and seborrhea. It…	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539032/pharmacy-app/pharmacy/Mediven_Cream_15g_Betamethasone_Cream_1213_1758539031738.jpg	2025-09-22 09:43:22.669	2025-09-22 11:03:52.892
1215	Mediven S Ointment 15g Betamethasone + Salicylic Acid	Skin allergy , itching redness swelling, insect bites, dermatitis	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539036/pharmacy-app/pharmacy/Mediven_S_Ointment_15g_Betamethasone___S_1215_1758539035658.jpg	2025-09-22 09:43:25.544	2025-09-22 11:03:58.48
1216	Mega 3 Salmon Oil Capsules 100’s	Mega 3 natural salmon oil capsules contains 1000g of natural fish oil containing EPA 180mg & DHA 120mg. Each pack…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539040/pharmacy-app/pharmacy/Mega_3_Salmon_Oil_Capsules_100_s_1216_1758539039423.jpg	2025-09-22 09:43:27.071	2025-09-22 11:04:00.865
1218	Melatex Lightening Cleanser 200ml	Melatex Lightening Cleanser removes the dead cells and deeply cleanses the skin therefore it can be used to remove blackheads,…	84000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539045/pharmacy-app/pharmacy/Melatex_Lightening_Cleanser_200ml_1218_1758539044274.jpg	2025-09-22 09:43:29.838	2025-09-22 11:04:05.579
1220	Menopace Multivitamin Tabs 30’s	There’s no time to pause, life is for living. Specially formulated to provide 22 key nutrients, to be taken during…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539049/pharmacy-app/pharmacy/Menopace_Multivitamin_Tabs_30_s_1220_1758539048366.png	2025-09-22 09:43:33.3	2025-09-22 11:04:09.269
1221	Menthodex Lozenges Honey & Lemon 50g	Helps to sooth a sore throat. Sugar-free. Each pack contains 24 lozenges.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539054/pharmacy-app/pharmacy/Menthodex_Lozenges_Honey___Lemon_50g_1221_1758539053377.jpg	2025-09-22 09:43:34.446	2025-09-22 11:04:14.693
1222	Menthodex Menthol & Eucalpyptus Lozenges 50g		6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539056/pharmacy-app/pharmacy/Menthodex_Menthol___Eucalpyptus_Lozenges_1222_1758539055501.jpg	2025-09-22 09:43:36.085	2025-09-22 11:04:16.741
1225	Menthodex Triple Impact Lozenges 36’s	Helps to sooth a sore throat. Each pack contains 24 lozenges.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539063/pharmacy-app/pharmacy/Menthodex_Triple_Impact_Lozenges_36_s_1225_1758539062201.jpg	2025-09-22 09:43:40.183	2025-09-22 11:04:23.295
1227	Metrogyl Denta Gel 20g	For treatment of bacterial mouth infections.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539067/pharmacy-app/pharmacy/Metrogyl_Denta_Gel_20g_1227_1758539066494.jpg	2025-09-22 09:43:43.358	2025-09-22 11:04:27.595
1228	Milical Calcium Citrate/Vitamin D3 Tablets 30’s	Milical tablet is used for treating conditions in which calcium metabolism is disturbed. It is also used in disorders associated…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539069/pharmacy-app/pharmacy/Milical_Calcium_Citrate_Vitamin_D3_Table_1228_1758539068425.jpg	2025-09-22 09:43:44.585	2025-09-22 11:04:29.474
1230	Milton Sterilising Fluid 500ml	Expertly developed to sterilise baby items in only 15 minutes. Used by parents and midwives for over 70 years. Kill…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539072/pharmacy-app/pharmacy/Milton_Sterilising_Fluid_500ml_1230_1758539071806.jpg	2025-09-22 09:43:47.562	2025-09-22 11:04:32.695
1231	Minoxil 2% (Minoxidil) Spray for Women 60ml	Topical treatment for hair thinning and hair loss in women.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539074/pharmacy-app/pharmacy/Minoxil_2___Minoxidil__Spray_for_Women_6_1231_1758539073687.jpg	2025-09-22 09:43:49.201	2025-09-22 11:04:34.796
1234	Minoxin (Minoxidil) Plus Topical Solution 5% 60ML With Derma Roller	Minoxin plus stimulates hair regrowth and slow or even stops further loss. It helps in the management of hereditary hair…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539081/pharmacy-app/pharmacy/Minoxin__Minoxidil__Plus_Topical_Solutio_1234_1758539080845.jpg	2025-09-22 09:43:53.715	2025-09-22 11:04:42.341
1235	Mintex Drops 5ml	For relief from sore throat, sneezing, cough, flue.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539084/pharmacy-app/pharmacy/Mintex_Drops_5ml_1235_1758539083290.jpg	2025-09-22 09:43:55.342	2025-09-22 11:04:44.354
1237	Moderma Acne Control Cleanser	The Moderma acne control cleanser is an expert blend of clinically proven natural ingredients that help clear the dead surface…	63000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539088/pharmacy-app/pharmacy/Moderma_Acne_Control_Cleanser_1237_1758539087165.jpg	2025-09-22 09:43:57.827	2025-09-22 11:04:48.22
1240	Moderma Baby Cream 300ml	Moderma Baby Cream is formulated for delicate baby skin, it prevents and heals nappy rash also softens and protects baby's…	44000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539093/pharmacy-app/pharmacy/Moderma_Baby_Cream_300ml_1240_1758539093160.jpg	2025-09-22 09:44:01.364	2025-09-22 11:04:54.322
1241	Moderma Body Butter SPF30 300ml	Moderma body butter spf30 brightens and evens skin tone, it also fades dark spots as well as hydrate the skin.…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539096/pharmacy-app/pharmacy/Moderma_Body_Butter_SPF30_300ml_1241_1758539095405.jpg	2025-09-22 09:44:02.475	2025-09-22 11:04:56.371
1243	Moderma Even Skintone Pigment Serum 30ml	Moderma Even Skintone pigment serum reverses signs of skin aging, brightens and evens out skin tone, fades dark spots and hyperpigmentation, refines pores…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539100/pharmacy-app/pharmacy/Moderma_Even_Skintone_Pigment_Serum_30ml_1243_1758539099559.jpg	2025-09-22 09:44:04.905	2025-09-22 11:05:00.558
1245	Moderma Sensitive Skin Bar	Moderma sensitive skin bar soap gives a truly gentle cleansing that leaves sensitive skin feeling moisturized, soft, and smooth. The…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539107/pharmacy-app/pharmacy/Moderma_Sensitive_Skin_Bar_1245_1758539105998.jpg	2025-09-22 09:44:07.198	2025-09-22 11:05:07.531
1246	Moderma Ultra Defence Face Moisturiser Sunscreen SPF 50+	This lightweight, broad-spectrum sunscreen is infused with a blend of premium natural actives like vitamin C, aloe Vera, Licorice, Gotu…	77000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539112/pharmacy-app/pharmacy/Moderma_Ultra_Defence_Face_Moisturiser_S_1246_1758539111738.jpg	2025-09-22 09:44:08.286	2025-09-22 11:05:12.836
1248	Moderma Xtra Hydration Body Oil 150ml	Moderma Xtra Hydration Oil deeply hydrates and locks in moisture, fades stretch marks and dark spots, evens out skin tone for…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539116/pharmacy-app/pharmacy/Moderma_Xtra_Hydration_Body_Oil_150ml_1248_1758539115502.jpg	2025-09-22 09:44:10.471	2025-09-22 11:05:16.892
1250	Moderma Xtra Hydration Snail Mucin Serum 30ml	This serum deeply hydrates & regenerates the skin, enhances skin elasticity for a firmer, youthful look, it brightens & evens…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539120/pharmacy-app/pharmacy/Moderma_Xtra_Hydration_Snail_Mucin_Serum_1250_1758539119969.jpg	2025-09-22 09:44:12.695	2025-09-22 11:05:20.922
1251	Momeasy Disposable Breast Pads	With the Momeasy disposable breast pads, breastfeeding mums can stay dry all day. These pads are comfortable and mums can…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539123/pharmacy-app/pharmacy/Momeasy_Disposable_Breast_Pads_1251_1758539122403.jpg	2025-09-22 09:44:13.809	2025-09-22 11:05:24.223
1253	Momeasy Manual Breast Pump	Comfortable and efficient. Soft massage cushion stimulate natural let-down like baby. Gentle vacuum mimics baby’s suckling for steady milk flow.	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539129/pharmacy-app/pharmacy/Momeasy_Manual_Breast_Pump_1253_1758539128230.jpg	2025-09-22 09:44:15.985	2025-09-22 11:05:29.371
1255	Mommy’s Lactation Tea Powder 200g	Mommy's Lactation Tea helps promote and support lactation through a blend of natural herbs. It increases nutrients in the breast milk.	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539133/pharmacy-app/pharmacy/Mommy_s_Lactation_Tea_Powder_200g_1255_1758539132549.jpg	2025-09-22 09:44:18.301	2025-09-22 11:05:33.764
1256	Mosedin Loratidine 10mg Tablets 20’s	For relief of allergy symptoms like runny nose, itchiness, hives and watery eyes.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539135/pharmacy-app/pharmacy/Mosedin_Loratidine_10mg_Tablets_20_s_1256_1758539134575.jpg	2025-09-22 09:44:19.618	2025-09-22 11:05:35.794
1258	Mosi-guard Lemon Eucalyptus Spray 75ml	Mosi-Guard Natural Insect Repellent is a DEET-free widely used natural mosquito repellent spray.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539140/pharmacy-app/pharmacy/Mosi_guard_Lemon_Eucalyptus_Spray_75ml_1258_1758539139560.png	2025-09-22 09:44:21.784	2025-09-22 11:05:41.017
1260	Mosi-guard® Lemon Eucalyptus Insect Repellent Stick 40ml	Handy pocket size, ideal for travel	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539148/pharmacy-app/pharmacy/Mosi_guard__Lemon_Eucalyptus_Insect_Repe_1260_1758539147479.jpg	2025-09-22 09:44:24.068	2025-09-22 11:05:48.464
1261	Mosq Free Insect Repellent Spray 100ml	INSECT AND BUG REPELLENT.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539150/pharmacy-app/pharmacy/Mosq_Free_Insect_Repellent_Spray_100ml_1261_1758539149536.png	2025-09-22 09:44:25.155	2025-09-22 11:05:50.578
1263	Mucolex Syrup 100ml	For relief of productive cough.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539154/pharmacy-app/pharmacy/Mucolex_Syrup_100ml_1263_1758539153960.jpg	2025-09-22 09:44:27.314	2025-09-22 11:05:55.249
1264	Mucosolvan Syrup 100ml	Mucosolvan Syrup is used in the treatment of cough with mucus.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539156/pharmacy-app/pharmacy/Mucosolvan_Syrup_100ml_1264_1758539155945.jpg	2025-09-22 09:44:28.74	2025-09-22 11:05:56.999
1266	Mumfer Iron Syrup 150ml	Mumfer Syrup works by works as a dietary supplement to fulfill the iron deficiencies and regulate oxygen in the blood.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539161/pharmacy-app/pharmacy/Mumfer_Iron_Syrup_150ml_1266_1758539160518.jpg	2025-09-22 09:44:31.207	2025-09-22 11:06:01.7
1268	My Little Star New Mum Nipple cream 75ML	My Little Star New Mum Nipple Cream moisturises and softens the nipples and is suitable for sensitive skin, fragrance free,…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539166/pharmacy-app/pharmacy/My_Little_Star_New_Mum_Nipple_cream_75ML_1268_1758539165559.jpg	2025-09-22 09:44:33.975	2025-09-22 11:06:06.661
1270	N’RGY Plus Capsules 30’s	Multivitamin, minerals and ginseng formula to maximise energy and vitality, along with brain nutrients for increased mental alertness. Each pack…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539171/pharmacy-app/pharmacy/N_RGY_Plus_Capsules_30_s_1270_1758539170777.jpg	2025-09-22 09:44:36.922	2025-09-22 11:06:11.792
1271	Nail Clippers (Big)		2500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539177/pharmacy-app/pharmacy/Nail_Clippers__Big__1271_1758539176309.jpg	2025-09-22 09:44:38.208	2025-09-22 11:06:17.48
1272	Nail Clippers (Small)		1500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539180/pharmacy-app/pharmacy/Nail_Clippers__Small__1272_1758539179200.jpg	2025-09-22 09:44:39.398	2025-09-22 11:06:20.068
1274	NAN 2 Infant Formula Milk 400g	During the first year of life, nutrition is critical for your baby. Nan Optipro 2 is tailored to ensure your…	47000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539185/pharmacy-app/pharmacy/NAN_2_Infant_Formula_Milk_400g_1274_1758539184959.jpg	2025-09-22 09:44:41.939	2025-09-22 11:06:26.175
1276	Natrol Melatonin 10mg Gummies	Natrol Melatonin 5mg Gummies help you fall asleep faster, stay asleep longer, and wake up refreshed. This strawberry flavored melatonin…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539190/pharmacy-app/pharmacy/Natrol_Melatonin_10mg_Gummies_1276_1758539189999.jpg	2025-09-22 09:44:44.578	2025-09-22 11:06:31.295
1278	Nature’s Bounty Adult Multivitamin Gummies 60’s	Balanced multivitamin and mineral formula for everyday wellbeing. 17 essential nutrients including vitamin D3, vitamin C and zinc. Convenient chewable…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539195/pharmacy-app/pharmacy/Nature_s_Bounty_Adult_Multivitamin_Gummi_1278_1758539194895.jpg	2025-09-22 09:44:46.867	2025-09-22 11:06:36.211
1280	Nature’s Bounty Probiotic Acidophilus Tablets120’s	Nature's Bounty Probiotic contains Lactobacillus acidophilus which is naturally found in the digestive system that helps keep the normal balance…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539202/pharmacy-app/pharmacy/Nature_s_Bounty_Probiotic_Acidophilus_Ta_1280_1758539201347.jpg	2025-09-22 09:44:49.187	2025-09-22 11:06:42.56
1281	Nature’s Truth Magnesium Glycinate capsules 60’s	Magnesium Glycinate is a highly absorbable form of magnesium, an essential mineral the body needs but cannot produce on its…	145000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539205/pharmacy-app/pharmacy/Nature_s_Truth_Magnesium_Glycinate_capsu_1281_1758539204414.jpg	2025-09-22 09:44:50.645	2025-09-22 11:06:45.639
1283	Natures Aid Calcium, Magnesium + Zinc 90’s	For the maintenance of normal bones, teeth and muscle function.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539209/pharmacy-app/pharmacy/Natures_Aid_Calcium__Magnesium___Zinc_90_1283_1758539208750.jpg	2025-09-22 09:44:54.02	2025-09-22 11:06:49.863
1284	Natures Aid CBD Oil 10% Spray 10ml	CBD oil spray is beneficial for pain and inflammation, anxiety and in skin care cases like eczema and psoriasis. Not…	147000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539211/pharmacy-app/pharmacy/Natures_Aid_CBD_Oil_10__Spray_10ml_1284_1758539210842.jpg	2025-09-22 09:44:55.469	2025-09-22 11:06:52.185
1286	Natures Aid Chromium Picolinate 200ug 90’s	Chromium supports the maintenance of normal blood-glucose levels.	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539216/pharmacy-app/pharmacy/Natures_Aid_Chromium_Picolinate_200ug_90_1286_1758539215156.jpg	2025-09-22 09:44:58.63	2025-09-22 11:06:56.384
1288	Natures Aid Complete Multi-Vitamins & Minerals 90’s	Comprehensive A-Z Multivitamin & Mineral for immune support, vision, energy release and general wellbeing.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539220/pharmacy-app/pharmacy/Natures_Aid_Complete_Multi_Vitamins___Mi_1288_1758539219937.png	2025-09-22 09:45:01.546	2025-09-22 11:07:01.472
1289	Natures Aid D-Mannose 60’s	For prevention of urinary tract infections.	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539223/pharmacy-app/pharmacy/Natures_Aid_D_Mannose_60_s_1289_1758539222348.jpg	2025-09-22 09:45:02.831	2025-09-22 11:07:04.17
1291	Natures Aid Fish Oil 1000mg 90’s	High in EPA and DHA essential fatty acids, to contribute to the normal function of the heart, brain and vision.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539228/pharmacy-app/pharmacy/Natures_Aid_Fish_Oil_1000mg_90_s_1291_1758539227645.jpg	2025-09-22 09:45:05.286	2025-09-22 11:07:08.615
1293	Natures Aid Folic Acid 90’s	Folic acid contributes to maternal tissue growth during pregnancy.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539232/pharmacy-app/pharmacy/Natures_Aid_Folic_Acid_90_s_1293_1758539231884.jpg	2025-09-22 09:45:08.562	2025-09-22 11:07:13.177
1294	Natures Aid Ginger Root 500mg 90’s		40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539234/pharmacy-app/pharmacy/Natures_Aid_Ginger_Root_500mg_90_s_1294_1758539234038.jpg	2025-09-22 09:45:10.102	2025-09-22 11:07:14.773
1297	Natures Aid Hair, Skin And Nails Formula 30’s	A unique blend of nutrients including Silica, Kelp, Manganese and Zinc to support healthy hair and skin.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539244/pharmacy-app/pharmacy/Natures_Aid_Hair__Skin_And_Nails_Formula_1297_1758539243370.jpg	2025-09-22 09:45:13.657	2025-09-22 11:07:24.441
1299	Natures Aid MSM Methylsulphonylmethane 1000mg 90’s	A natural source of Sulphur for healthy joints, healthy hair and strong nails.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539248/pharmacy-app/pharmacy/Natures_Aid_MSM_Methylsulphonylmethane_1_1299_1758539247645.jpg	2025-09-22 09:45:16.06	2025-09-22 11:07:28.608
1300	Natures Aid Organic Pumpkin Seed Oil 250ml	A versatile everyday cooking oil.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539250/pharmacy-app/pharmacy/Natures_Aid_Organic_Pumpkin_Seed_Oil_250_1300_1758539249906.png	2025-09-22 09:45:17.222	2025-09-22 11:07:31.098
1302	Natures Aid Witch Hazel (Distilled) 150ml	A natural skin tonic and cleansing lotion.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539255/pharmacy-app/pharmacy/Natures_Aid_Witch_Hazel__Distilled__150m_1302_1758539254494.png	2025-09-22 09:45:19.7	2025-09-22 11:07:35.603
1304	Natures Bounty B-Complex 100’s	Aids in the Conversion of Food into Energy. With Folic Acid Plus Vitamin C. Supports Immune Health.	79000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539260/pharmacy-app/pharmacy/Natures_Bounty_B_Complex_100_s_1304_1758539259319.jpg	2025-09-22 09:45:22.284	2025-09-22 11:07:40.519
1306	Natures Bounty Bedtime Balance Capsules 60’s	Nature's Bounty 5-HTP with Niacin & Vitamin B6 helps you switch off from the stresses of the day for an…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539264/pharmacy-app/pharmacy/Natures_Bounty_Bedtime_Balance_Capsules__1306_1758539263146.jpg	2025-09-22 09:45:25.356	2025-09-22 11:07:44.393
1307	Natures Bounty Calcium Magnesium Zinc 100’s	May Reduce the Risk of Osteoporosis. Supports a calm, relaxed mood. Helps with occasional anxiety.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539266/pharmacy-app/pharmacy/Natures_Bounty_Calcium_Magnesium_Zinc_10_1307_1758539265933.png	2025-09-22 09:45:27.097	2025-09-22 11:07:47.079
1309	Natures Bounty Hair, Skin & Nails Gummies with Collagen 60’s	Biotin to support good hair days and healthy nails. Vitamins C & E to support glowing skin.	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539270/pharmacy-app/pharmacy/Natures_Bounty_Hair__Skin___Nails_Gummie_1309_1758539270003.jpg	2025-09-22 09:45:30.169	2025-09-22 11:07:51.028
1311	Natures Bounty Vitamin D3 1000iu Tablets 100’s	High strength vitamin D. The ‘sunshine' vitamin. Provides bone & muscle support. Also supports immunity.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539274/pharmacy-app/pharmacy/Natures_Bounty_Vitamin_D3_1000iu_Tablets_1311_1758539273436.jpg	2025-09-22 09:45:33.142	2025-09-22 11:07:54.611
1314	Neoloridin Desloratadine 5mg Tablets 10’s	For relief of allergy symptoms like runny nose, watery eyes, itchiness and urticaria.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539280/pharmacy-app/pharmacy/Neoloridin_Desloratadine_5mg_Tablets_10__1314_1758539279726.jpg	2025-09-22 09:45:37.857	2025-09-22 11:08:01.599
1315	Neuromind Original Tablets 30’s	Neuromind Original helps you fuel your thinking by safeguarding your intake of the nutrients that support normal cognitive function.	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539283/pharmacy-app/pharmacy/Neuromind_Original_Tablets_30_s_1315_1758539282501.png	2025-09-22 09:45:39.487	2025-09-22 11:08:03.763
1317	Neutrogena Acne Stress Control Power Clear Scrub 125ml	Neutrogena Oil-Free Acne stress control Power -Clear Scrub instantly clears oil, fights breakouts, and exfoliates. With green tea, cucumber and…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539289/pharmacy-app/pharmacy/Neutrogena_Acne_Stress_Control_Power_Cle_1317_1758539288197.jpg	2025-09-22 09:45:42.36	2025-09-22 11:08:09.191
1319	Neutrogena Blackhead Eliminating Facial Scrub 150ml	Developed with dermatologists, the Neutrogena blackhead eliminating facial scrub is clinically proven to eliminate and prevent blackheads from first use.…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539294/pharmacy-app/pharmacy/Neutrogena_Blackhead_Eliminating_Facial__1319_1758539293131.jpg	2025-09-22 09:45:45.073	2025-09-22 11:08:16.436
1320	Neutrogena Clear & Defend 2 in 1 Wash-Mask 150ml	Developed with dermatologists, Neutrogena clear and defend wash mask is clinically proven to help treat and defend against breakouts. This…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539298/pharmacy-app/pharmacy/Neutrogena_Clear___Defend_2_in_1_Wash_Ma_1320_1758539297608.jpg	2025-09-22 09:45:46.348	2025-09-22 11:08:18.696
1322	Neutrogena Clear & Radiant Face Scrub 150ml	A daily face scrub with pink grapefruit and vitamin C, developed to cleanse the skin while preventing imperfections for a…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539306/pharmacy-app/pharmacy/Neutrogena_Clear___Radiant_Face_Scrub_15_1322_1758539304914.jpg	2025-09-22 09:45:49.318	2025-09-22 11:08:26.33
1323	Neutrogena Clear & Radiant Moisturizer 50ml	Formulated for blemish-prone skin, Neutrogena Refreshingly Clear Oil-Free Moisturiser gives 24-hour hydration without clogging pores. It contains salicylic acid that…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539308/pharmacy-app/pharmacy/Neutrogena_Clear___Radiant_Moisturizer_5_1323_1758539307633.jpg	2025-09-22 09:45:50.758	2025-09-22 11:08:28.815
1325	Neutrogena Clear and Radiant Facial Wash 200ml	Developed with dermatologists, Neutrogena Refreshingly Clear Facial Wash with pink grapefruit and vitamin C is an uplifting daily face cleanser.…	46000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539313/pharmacy-app/pharmacy/Neutrogena_Clear_and_Radiant_Facial_Wash_1325_1758539312413.jpg	2025-09-22 09:45:54.16	2025-09-22 11:08:33.397
1326	Neutrogena Clear Face Lotion SPF30 88ML	Forget the heavy, oily residue of other sun care products with the Clear Face Breakout Liquid Lotion Sunscreen. Formulated with…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539315/pharmacy-app/pharmacy/Neutrogena_Clear_Face_Lotion_SPF30_88ML_1326_1758539314835.jpg	2025-09-22 09:45:55.564	2025-09-22 11:08:36.121
1328	Neutrogena Clear Pore Oil Eliminating Astringent 236ml	This is a daily, oil-control astringent for acne-prone skin that helps treat acne and prevent future breakouts and blackheads. It’s also…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539319/pharmacy-app/pharmacy/Neutrogena_Clear_Pore_Oil_Eliminating_As_1328_1758539318542.jpg	2025-09-22 09:45:58.152	2025-09-22 11:08:39.396
1330	Neutrogena Deep Moisture Fast Absorbing Body Lotion 250mls	Developed with dermatologists, the Neutrogena® Norwegian Formula® Deep Moisture Fast Absorbing Body Lotion 250ml is enriched with moisturising glycerin, and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539340/pharmacy-app/pharmacy/Neutrogena_Deep_Moisture_Fast_Absorbing__1330_1758539338330.jpg	2025-09-22 09:46:00.889	2025-09-22 11:09:07.662
1331	Neutrogena Hand & Nail Cream 75ml	NEUTROGENA® Norwegian Formula Hand and Nail cream combines the richness of Norwegian Formula with panthenol for the unique care of…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539349/pharmacy-app/pharmacy/Neutrogena_Hand___Nail_Cream_75ml_1331_1758539348689.jpg	2025-09-22 09:46:02.221	2025-09-22 11:09:09.642
1333	NEUTROGENA Hydro Boost Gelée Milk Cleanser 200ml	Neutrogena Hydro Boost® Gelée Milk Cleanser is an innovative cleanser combining the lightness of a gel with the efficacy of…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539352/pharmacy-app/pharmacy/NEUTROGENA_Hydro_Boost_Gel_e_Milk_Cleans_1333_1758539351807.jpg	2025-09-22 09:46:04.485	2025-09-22 11:09:12.694
1334	Neutrogena Hydro Boost Lotion SPF 50 88ML	Delivers powerful broad-spectrum UVA/UVB protection with a water-light feel. This sunscreen lotion with SPF 50 quenches skin with vital hydration.	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539354/pharmacy-app/pharmacy/Neutrogena_Hydro_Boost_Lotion_SPF_50_88M_1334_1758539353578.jpg	2025-09-22 09:46:05.804	2025-09-22 11:09:14.663
1336	NEUTROGENA Norwegian Formula Deep Moisture Hypoallergenic Body Lotion 400ml	The most moisturizing lotion to keep your dry skin hydrated and smooth all year long. Body lotion for sensitive skin…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539357/pharmacy-app/pharmacy/NEUTROGENA_Norwegian_Formula_Deep_Moistu_1336_1758539357220.jpg	2025-09-22 09:46:09.493	2025-09-22 11:09:18.014
1338	Neutrogena Oil Balancing Daily Exfoliator 150ml	NEUTROGENA* Oil Balancing Daily Exfoliator with lime and aloe vera has been developed with dermatologists to tighten pores and mattify…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539361/pharmacy-app/pharmacy/Neutrogena_Oil_Balancing_Daily_Exfoliato_1338_1758539360828.jpg	2025-09-22 09:46:14.838	2025-09-22 11:09:21.896
1339	Neutrogena Oil Balancing Facial Wash 200ml	NEUTROGENA® Oil Balancing Facial Wash with lime and aloe vera is an uplifting daily facial cleanser that tightens pores and…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539363/pharmacy-app/pharmacy/Neutrogena_Oil_Balancing_Facial_Wash_200_1339_1758539362576.jpg	2025-09-22 09:46:17.07	2025-09-22 11:09:23.635
1341	Neutrogena Oil Free Acne Facial Wash 269ml	Neutrogena oil free acne facial wash combines a powerful acne treatment and cleanser in one formula to treat and help…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539366/pharmacy-app/pharmacy/Neutrogena_Oil_Free_Acne_Facial_Wash_269_1341_1758539365998.jpg	2025-09-22 09:46:20.14	2025-09-22 11:09:27.443
1407	No Sores Mouth Ulcers Gel 10g	For treatment of mouth ulcers and denture irritation.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539503/pharmacy-app/pharmacy/No_Sores_Mouth_Ulcers_Gel_10g_1407_1758539502232.jpg	2025-09-22 09:48:01.723	2025-09-22 11:11:43.926
1344	Neutrogena Rapid Clear 2-In-1 Fight & Fade Acne Toner	NEUTROGENA Rapid Clear 2-in-1 Fight & Fade Toner is the first acne toner designed to reduce breakouts in just hours,…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539372/pharmacy-app/pharmacy/Neutrogena_Rapid_Clear_2_In_1_Fight___Fa_1344_1758539371390.jpg	2025-09-22 09:46:24.753	2025-09-22 11:09:32.253
1345	Neutrogena Rapid Clear Acne Eliminating Spot Treatment Gel 15ml	This acne spot treatment for acne-prone skin helps get rid of breakouts fast and helps stop new ones from forming…	77000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539373/pharmacy-app/pharmacy/Neutrogena_Rapid_Clear_Acne_Eliminating__1345_1758539373000.jpg	2025-09-22 09:46:26.387	2025-09-22 11:09:34.171
1347	Neutrogena Skin Detox Cooling Scrub 150ml	This cooling gel formula specifically targets all types of known impurities and pollution. Formulated with gentle micro-exfoliators and enriched with…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539380/pharmacy-app/pharmacy/Neutrogena_Skin_Detox_Cooling_Scrub_150m_1347_1758539380127.jpg	2025-09-22 09:46:29.361	2025-09-22 11:09:41.056
1349	Neutrogena Transparent Facial Bar For Acne Prone Skin	Designed for daily cleansing for acne-prone skin, the Neutrogena transparent facial bar for acne prone skin cleanses away dirt, oil,…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539384/pharmacy-app/pharmacy/Neutrogena_Transparent_Facial_Bar_For_Ac_1349_1758539383909.jpg	2025-09-22 09:46:32.748	2025-09-22 11:09:45.17
1350	Neutrogena Ultra Sheer Dry Touch Sunscreen SPF70	Lightweight feel that glides on the skin with an invisible, non-greasy finish. Formulated to provide superior broad-spectrum protection. Oil-free and non-comedogenic…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539386/pharmacy-app/pharmacy/Neutrogena_Ultra_Sheer_Dry_Touch_Sunscre_1350_1758539385977.jpg	2025-09-22 09:46:34.272	2025-09-22 11:09:47.073
1352	Night Nurse Capsules 10’s	Night Nurse Capsules are used for night-time relief of the major symptoms of colds, chills and influenza. Each pack contains…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539390/pharmacy-app/pharmacy/Night_Nurse_Capsules_10_s_1352_1758539389865.jpg	2025-09-22 09:46:37.141	2025-09-22 11:09:50.771
1353	Night Nurse Liquid 100ml	A triple action night-time formula for the relief of cold and flu symptoms.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539392/pharmacy-app/pharmacy/Night_Nurse_Liquid_100ml_1353_1758539391522.jpg	2025-09-22 09:46:38.675	2025-09-22 11:09:52.718
1354	Night Nurse Liquid 160ml	A triple action night-time formula for the relief of cold and flu symptoms.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539394/pharmacy-app/pharmacy/Night_Nurse_Liquid_160ml_1354_1758539393500.jpg	2025-09-22 09:46:40.109	2025-09-22 11:09:54.562
1356	Nivea Black & White Invisible Deo Spray 150ml	White mark protection on black clothing & anti-yellow staining on white clothing. Reliable 48h anti-perspirant protection that cares for your…	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539397/pharmacy-app/pharmacy/Nivea_Black___White_Invisible_Deo_Spray__1356_1758539396772.png	2025-09-22 09:46:43.285	2025-09-22 11:09:57.681
1357	Nivea Creme 200ml	Dermatologically tested. Provides intensive moisture. Suitable for the whole family.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539398/pharmacy-app/pharmacy/Nivea_Creme_200ml_1357_1758539398331.jpg	2025-09-22 09:46:44.592	2025-09-22 11:09:59.112
1359	Nivea Dry Comfort Antiperspirant Deo Spray 150ml	Reliable 72h odour protection that cares for your skin. Dual Protect formula with two antibacterial actives and 0% alcohol. For…	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539403/pharmacy-app/pharmacy/Nivea_Dry_Comfort_Antiperspirant_Deo_Spr_1359_1758539402250.png	2025-09-22 09:46:48.3	2025-09-22 11:10:03.368
1361	Nivea Dry Impact Antiperspirant Deo Roll On 50ml	Powerful protection tested in real life situations. Dual Active formula with 2 anti-perspirant actives for a long-lasting dry feeling. 48h…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539406/pharmacy-app/pharmacy/Nivea_Dry_Impact_Antiperspirant_Deo_Roll_1361_1758539405682.png	2025-09-22 09:46:50.886	2025-09-22 11:10:06.636
1362	Nivea Express Hydration Lotion 125ml	5in1 Complete Care. 48h Deep Moisture. Fast absorbing care. Smooth skin feel. Non-greasy. Healthy-looking skin.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539407/pharmacy-app/pharmacy/Nivea_Express_Hydration_Lotion_125ml_1362_1758539407262.jpg	2025-09-22 09:46:52.294	2025-09-22 11:10:08.119
1364	Nivea Express Hydration Lotion 400ml	5in1 Complete Care. 48h Deep Moisture. Fast absorbing care. Smooth skin feel. Non-greasy. Healthy-looking skin.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539410/pharmacy-app/pharmacy/Nivea_Express_Hydration_Lotion_400ml_1364_1758539410298.png	2025-09-22 09:46:55.166	2025-09-22 11:10:11.196
1365	Nivea Fresh Natural Deodorant Spray 150ml	Softer spray on skin. Long lasting freshness. Day-long odour protection.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539412/pharmacy-app/pharmacy/Nivea_Fresh_Natural_Deodorant_Spray_150m_1365_1758539411789.png	2025-09-22 09:46:57.311	2025-09-22 11:10:12.699
1367	Nivea Kids Protect & Care SPF50+ Lotion 200ml	NIVEA SUN Kids Protect & Care Lotion provides children UV protection against sunburn and long-term skin damage. The formula absorbs…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539415/pharmacy-app/pharmacy/Nivea_Kids_Protect___Care_SPF50__Lotion__1367_1758539414884.png	2025-09-22 09:47:00.387	2025-09-22 11:10:16.363
1369	Nivea Men Black & White Invisible Deo Spray 150ml	White mark protection on black clothing & anti-yellow staining on white clothing. Reliable 48h anti-perspirant protection that cares for your…	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539419/pharmacy-app/pharmacy/Nivea_Men_Black___White_Invisible_Deo_Sp_1369_1758539419021.png	2025-09-22 09:47:03.911	2025-09-22 11:10:20.075
1371	Nivea Men Cool Kick Antiperspirant Deo Roll On 50ml	Kick of invigorating freshness with Cool-Care formula. 48h effective anti-perspirant protection that cares for your skin. Skin tolerance dermatologically approved.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539427/pharmacy-app/pharmacy/Nivea_Men_Cool_Kick_Antiperspirant_Deo_R_1371_1758539426142.png	2025-09-22 09:47:07.253	2025-09-22 11:10:27.62
1372	Nivea Men Cool Kick Antiperspirant Deo Spray 150ml	Kick of invigorating freshness with Cool-Care formula. Reliable 48h anti-perspirant protection that cares for your skin. Quick Dry.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539429/pharmacy-app/pharmacy/Nivea_Men_Cool_Kick_Antiperspirant_Deo_S_1372_1758539428230.png	2025-09-22 09:47:08.758	2025-09-22 11:10:29.48
1376	Nivea Men Max Hydration Body Lotion 250ml	Provides intensive 24h moisture care for your skin. Innovative formula enriched with aloe vera relieves the feeling of dryness in…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539436/pharmacy-app/pharmacy/Nivea_Men_Max_Hydration_Body_Lotion_250m_1376_1758539435865.jpg	2025-09-22 09:47:15.459	2025-09-22 11:10:36.786
1378	Nivea Men Revitalising Body Lotion 100ml	Revitalizes and refreshes your skin. Provides 24h+ moisturization. Absorbs in seconds, with no sticky feeling. Non-greasy formula, enriched with Vitamin…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539440/pharmacy-app/pharmacy/Nivea_Men_Revitalising_Body_Lotion_100ml_1378_1758539439727.png	2025-09-22 09:47:18.716	2025-09-22 11:10:40.734
1380	Nivea Men Revitalising Body Lotion 400ml	Revitalizes and refreshes your skin. Provides 24h+ moisturization. Absorbs in seconds, with no sticky feeling. Non-greasy formula, enriched with Vitamin…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539444/pharmacy-app/pharmacy/Nivea_Men_Revitalising_Body_Lotion_400ml_1380_1758539443223.png	2025-09-22 09:47:21.863	2025-09-22 11:10:44.364
1381	Nivea Men Sensitive 0% Alcohol Post Shave Balm 100ml	-Instantly relieves skin from 5 signs of skin irritation: burning, redness, dryness, tightness, itchiness.. -Provides skin with an intensive long-lasting…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539446/pharmacy-app/pharmacy/Nivea_Men_Sensitive_0__Alcohol_Post_Shav_1381_1758539445207.png	2025-09-22 09:47:23.554	2025-09-22 11:10:46.356
1383	Nivea Nourishing Cocoa Lotion 100ml	Noticeably smoother skin. Cocoa Butter & Vitamin E. 48h intensive & nourishing care. Glowing & healthy looking skin.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539451/pharmacy-app/pharmacy/Nivea_Nourishing_Cocoa_Lotion_100ml_1383_1758539451045.png	2025-09-22 09:47:26.925	2025-09-22 11:10:52.228
1384	Nivea Nourishing Cocoa Lotion 250ml	Noticeably smoother skin. Cocoa Butter & Vitamin E. 48h intensive & nourishing care. Glowing & healthy looking skin.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539451/pharmacy-app/pharmacy/Nivea_Nourishing_Cocoa_Lotion_100ml_1383_1758539451045.png	2025-09-22 09:47:28.14	2025-09-22 11:10:52.745
1386	Nivea Pearl & Beauty Anti-perspirant Deodorant Spray 150ml	Smooth & beautiful underarms, contains pearl extract. Reliable 48h anti-perspirant protection that cares for your skin. Quick Dry.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539456/pharmacy-app/pharmacy/Nivea_Pearl___Beauty_Anti_perspirant_Deo_1386_1758539455271.png	2025-09-22 09:47:31.205	2025-09-22 11:10:56.257
1387	Nivea Pearl & Beauty Roll On 50ml	24h gentle care. Pearl Extract. 0% Alcohol.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539457/pharmacy-app/pharmacy/Nivea_Pearl___Beauty_Roll_On_50ml_1387_1758539456891.png	2025-09-22 09:47:33.255	2025-09-22 11:10:57.947
1389	Nivea Perfect & Radiant 3-In-1 Cleanser For Normal To Oily Skin 50ml	Nivea Perfect & Radiant 3 in 1 Cleanser is enriched with natural White Clay  which works in harmony with your…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539461/pharmacy-app/pharmacy/Nivea_Perfect___Radiant_3_In_1_Cleanser__1389_1758539460547.jpg	2025-09-22 09:47:36.223	2025-09-22 11:11:01.329
1391	Nivea Protect & Care After Shave Lotion 100ml	Soothes and regenerates your skin immediately after shaving. Cools and refreshes your skin with modern fragrance. Non-greasy, absorbs quickly.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539465/pharmacy-app/pharmacy/Nivea_Protect___Care_After_Shave_Lotion__1391_1758539464142.png	2025-09-22 09:47:38.992	2025-09-22 11:11:05.627
1392	Nivea Q10 Anti-Wrinkle Power Firming SPF15 Day Cream 50ml	The improved formula ensures 24h anti-wrinkle protection against free radical damage and external aggressors.	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539467/pharmacy-app/pharmacy/Nivea_Q10_Anti_Wrinkle_Power_Firming_SPF_1392_1758539466421.png	2025-09-22 09:47:40.539	2025-09-22 11:11:07.675
1394	Nivea Refreshing Face Wash For Normal Skin – 150 ml	Deeply cleanses, hydrates, and strengthens with Vitamin E for a clean, refreshed skin feel. Dermatologically approved for skin compatibility.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539470/pharmacy-app/pharmacy/Nivea_Refreshing_Face_Wash_For_Normal_Sk_1394_1758539470100.jpg	2025-09-22 09:47:43.622	2025-09-22 11:11:11.359
1396	Nivea Rich Nourishing Body Lotion 250ml	5in1 Complete Care. 48h Deep Moisture. Dry-out protection. Smooth skin feel. Non-greasy. Healthy-looking skin.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539478/pharmacy-app/pharmacy/Nivea_Rich_Nourishing_Body_Lotion_250ml_1396_1758539477311.png	2025-09-22 09:47:46.749	2025-09-22 11:11:18.633
1397	Nivea Rich Nourishing Body Lotion 400ml	5in1 Complete Care. 48h Deep Moisture. Dry-out protection. Smooth skin feel. Non-greasy. Healthy-looking skin.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539480/pharmacy-app/pharmacy/Nivea_Rich_Nourishing_Body_Lotion_400ml_1397_1758539479557.png	2025-09-22 09:47:48.512	2025-09-22 11:11:20.895
1399	Nivea Shea Smooth Sensation Lotion 200ml	Indulging moisture care. Non-greasy softening formula with precious Shea Butter. For an irresistibly soft skin.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539484/pharmacy-app/pharmacy/Nivea_Shea_Smooth_Sensation_Lotion_200ml_1399_1758539483653.png	2025-09-22 09:47:51.091	2025-09-22 11:11:24.437
1401	Nivea Soft Moisturising Cream 200ml	NIVEA® Soft is a highly effective, intensive moisturizing cream for everyday use. The light formula with Vitamin E & Jojoba…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539489/pharmacy-app/pharmacy/Nivea_Soft_Moisturising_Cream_200ml_1401_1758539488314.png	2025-09-22 09:47:53.35	2025-09-22 11:11:29.59
1403	Nivea Sun Protect & Moisture SPF50 Lotion 200ml	NIVEA SUN Protect & Moisture Lotion protects healthy skin from inside & outside. It provides immediate UV protection and supports…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539493/pharmacy-app/pharmacy/Nivea_Sun_Protect___Moisture_SPF50_Lotio_1403_1758539492337.jpg	2025-09-22 09:47:55.786	2025-09-22 11:11:33.343
1404	Nizoral Anti-Dandruff Shampoo 60ml	Treats & prevents dandruff and its symptoms such as dry, flaky, red, itchy scalp.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539494/pharmacy-app/pharmacy/Nizoral_Anti_Dandruff_Shampoo_60ml_1404_1758539493978.jpg	2025-09-22 09:47:57.322	2025-09-22 11:11:35.017
1406	NO SCARS Cream 20g	Used in the treatment of melasma. It provides relief from redness, swelling, itching, dark spots and hyperpigmentation.	8500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539500/pharmacy-app/pharmacy/NO_SCARS_Cream_20g_1406_1758539500158.png	2025-09-22 09:48:00.238	2025-09-22 11:11:41.365
1408	NOSPA 40MG Drotaverine hydrochloride 40mg 10 Tablet		9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539505/pharmacy-app/pharmacy/NOSPA_40MG_Drotaverine_hydrochloride_40m_1408_1758539504634.png	2025-09-22 09:48:03.67	2025-09-22 11:11:45.502
1411	Now Better Stevia Organic Extract Powder 28g	Now Better Stevia is a zero-calorie, low glycemic, certified organic sweetener that makes a perfectly healthy substitute for table sugar…	69000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539510/pharmacy-app/pharmacy/Now_Better_Stevia_Organic_Extract_Powder_1411_1758539510305.jpg	2025-09-22 09:48:08.275	2025-09-22 11:11:51.274
1413	Now Collagen Powder 227g	Collagen peptides from types 1 and 3 bovine collagen are well-known for their roles in bone, joint and skin health.	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539514/pharmacy-app/pharmacy/Now_Collagen_Powder_227g_1413_1758539514112.jpg	2025-09-22 09:48:11.157	2025-09-22 11:11:55.084
1414	Now D-Mannose Powder 85g	Pure Powder! Cleanses the Urinary Bladder.	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539516/pharmacy-app/pharmacy/Now_D_Mannose_Powder_85g_1414_1758539516045.jpg	2025-09-22 09:48:12.682	2025-09-22 11:11:57.033
1415	Now Glutathione 250mg 60’s	Reduced Active Form. Detoxification Support. Each pack contains 60 capsules.	148000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539518/pharmacy-app/pharmacy/Now_Glutathione_250mg_60_s_1415_1758539517912.jpg	2025-09-22 09:48:14.072	2025-09-22 11:11:58.979
1417	Now Horny Goat Weed Extract 750mg Capsules 90s	Now Horny Goat Weed Extract with Maca Root is a combination of medicinal herbs that have been shown to improve…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539522/pharmacy-app/pharmacy/Now_Horny_Goat_Weed_Extract_750mg_Capsul_1417_1758539521796.jpg	2025-09-22 09:48:16.826	2025-09-22 11:12:02.839
1419	Now Lecithin 1200mg Caps 100’s	Naturally occurring Phosphatidyl Choline. Supports Brain & Nerve Function. Each pack contains 100 soft gel capsules.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539526/pharmacy-app/pharmacy/Now_Lecithin_1200mg_Caps_100_s_1419_1758539525766.jpg	2025-09-22 09:48:20.157	2025-09-22 11:12:06.864
1421	Now Magnesium Citrate 200mg Tablets 100’s	Magnesium Citrate supports energy production critical for enzyme function, magnesium is a mineral that is critical for energy production and…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539534/pharmacy-app/pharmacy/Now_Magnesium_Citrate_200mg_Tablets_100__1421_1758539533283.jpg	2025-09-22 09:48:22.827	2025-09-22 11:12:14.336
1422	Now Melatonin 3mg 60’s	Free Radical Scavenger. Healthy Sleep Cycle. Each pack contains 60 capsules.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539536/pharmacy-app/pharmacy/Now_Melatonin_3mg_60_s_1422_1758539535179.jpg	2025-09-22 09:48:24.274	2025-09-22 11:12:16.388
1424	Now Omega 3-6-9 1000mg Capsules 100’s	Omega 3-6-9 helps with cardiovascular health, brain function & skin health. It can help improve risk factors for heart disease, support…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539540/pharmacy-app/pharmacy/Now_Omega_3_6_9_1000mg_Capsules_100_s_1424_1758539539646.jpg	2025-09-22 09:48:27.427	2025-09-22 11:12:20.994
1426	Now Omega-3 Fish Oil Capsules 30’s	Omega-3 fish oil helps improve risk factors for heart disease, significantly reduces levels of triglycerides, it helps raise HDL (good)…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539546/pharmacy-app/pharmacy/Now_Omega_3_Fish_Oil_Capsules_30_s_1426_1758539545114.jpg	2025-09-22 09:48:31.011	2025-09-22 11:12:27.558
1427	Now Vitamin E Oil 30ml	Vitamin E Liquid is important for many different body processes that support general health and wellness, such as blood clotting,…	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539548/pharmacy-app/pharmacy/Now_Vitamin_E_Oil_30ml_1427_1758539548252.jpg	2025-09-22 09:48:32.749	2025-09-22 11:12:29.288
1429	Nurofen For Children Orange Suspension 100ml	Provides up to 8 hours fever and pain relief.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539553/pharmacy-app/pharmacy/Nurofen_For_Children_Orange_Suspension_1_1429_1758539552196.jpg	2025-09-22 09:48:36.029	2025-09-22 11:12:33.283
1431	Nutricost Boric Acid 600mg Vaginal Suppository 30’s	Boric acid 600mg vaginal suppository balances Vaginal pH, helps maintain feminine health, provides irritation relief support. Its a Vaginal Suppository,…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539556/pharmacy-app/pharmacy/Nutricost_Boric_Acid_600mg_Vaginal_Suppo_1431_1758539556049.jpg	2025-09-22 09:48:38.996	2025-09-22 11:12:37.377
1432	O Condoms 3’s	O condoms are black, contoured, studded, lubricated and strong to give you extra pleasure.	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539559/pharmacy-app/pharmacy/O_Condoms_3_s_1432_1758539558313.jpg	2025-09-22 09:48:40.535	2025-09-22 11:12:39.426
1434	OB Normal Tampons 8’s	O.B normal tampons are great for first-time non-applicator tampon users, or for women with light to moderate flow. These tampons…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539564/pharmacy-app/pharmacy/OB_Normal_Tampons_8_s_1434_1758539563375.png	2025-09-22 09:48:43.504	2025-09-22 11:12:44.547
1436	Odomos Mosquito Repellent Cream 50g	Be free from mosquito bite for the whole hours of sleep. Apply to The External part of the body. Create…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539567/pharmacy-app/pharmacy/Odomos_Mosquito_Repellent_Cream_50g_1436_1758539566655.jpg	2025-09-22 09:48:46.533	2025-09-22 11:12:47.619
1437	Oilatum Fragrance Free Cream Pump 500ml	Soothes, softens and re-hydrates. Relieves itching. Especially beneficial after washing. Fragrance free. Suitable for children, adults and the elderly.	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539569/pharmacy-app/pharmacy/Oilatum_Fragrance_Free_Cream_Pump_500ml_1437_1758539568398.jpg	2025-09-22 09:48:47.803	2025-09-22 11:12:49.416
1439	Oilatum Junior Bath Additive 150ml	Forms an emollient film on the skin surface to reduce moisture loss and hydrate the skin. It is ideal for…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539572/pharmacy-app/pharmacy/Oilatum_Junior_Bath_Additive_150ml_1439_1758539571693.jpg	2025-09-22 09:48:50.877	2025-09-22 11:12:52.974
1440	Oilatum Junior Emollient Cream 150g	Soothes away the discomfort of children’s itchy dry skin conditions. Rehydrates & protects. Suitable for eczema and dry skin in…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539574/pharmacy-app/pharmacy/Oilatum_Junior_Emollient_Cream_150g_1440_1758539573743.png	2025-09-22 09:48:52.222	2025-09-22 11:12:54.824
1442	Oilatum Soap 100g (UK)	Gentle on sensitive and dry skin. Suitable for daily use. Locks in moisture by leaving a protective barrier on the…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539578/pharmacy-app/pharmacy/Oilatum_Soap_100g__UK__1442_1758539577782.jpg	2025-09-22 09:48:54.769	2025-09-22 11:12:58.882
1475	Olbas Oil Inhalant Decongestant 12ml	Sinus Control. Cold and Flu Control. Soothing effect.	34000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539654/pharmacy-app/pharmacy/Olbas_Oil_Inhalant_Decongestant_12ml_1475_1758539653342.jpg	2025-09-22 09:49:38.39	2025-09-22 11:14:14.556
1445	Olay Anti Wrinkle Firm & Lift Night Cream 50ml	With results within just 14 days, firms and lifts in a number of ways: providing skin not only with hydration…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539584/pharmacy-app/pharmacy/Olay_Anti_Wrinkle_Firm___Lift_Night_Crea_1445_1758539583717.jpg	2025-09-22 09:48:58.861	2025-09-22 11:13:04.655
1447	Olay Anti-Wrinkle Firm And Lift Anti-Ageing Face Wash Cleanser 150ml	Laugh in the face of wrinkles with our face wash cleanser. This face cleanser is recommended for reveal softer and…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539592/pharmacy-app/pharmacy/Olay_Anti_Wrinkle_Firm_And_Lift_Anti_Age_1447_1758539591337.jpg	2025-09-22 09:49:01.217	2025-09-22 11:13:12.502
1449	Olay Beauty Fluid Moisturiser Normal, Dry & Combo Skin 100ml	Olay Essentials Beauty Day Fluid Normal, Dry and Combination Skin 100ml provides skin with the additional moisture it needs to…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539595/pharmacy-app/pharmacy/Olay_Beauty_Fluid_Moisturiser_Normal__Dr_1449_1758539594804.jpg	2025-09-22 09:49:03.658	2025-09-22 11:13:16.536
1450	Olay Beauty Fluid Moisturiser Normal, Dry & Combo Skin 200ml	Olay Essentials Beauty Day Fluid Normal, Dry and Combination Skin 200ml provides skin with the additional moisture it needs to…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539597/pharmacy-app/pharmacy/Olay_Beauty_Fluid_Moisturiser_Normal__Dr_1450_1758539597172.jpg	2025-09-22 09:49:05.108	2025-09-22 11:13:18.339
1452	Olay Cleanse Refresh & Glow Cleansing Toner 200ml	Cleanses, soothes & primes skin. Cleanser enriched with aloe vera extract & pro-vitamin B5. Cleanses & wipes away last traces…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539601/pharmacy-app/pharmacy/Olay_Cleanse_Refresh___Glow_Cleansing_To_1452_1758539600965.jpg	2025-09-22 09:49:07.484	2025-09-22 11:13:21.975
1454	Olay Complete Lightweight Moisturiser Spf15 for Sensitive Skin 100ml	A lightweight daily moisturiser for sensitive skin. With aloe vera and chamomile. For sensitive skin. With SPF 15 protection.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539605/pharmacy-app/pharmacy/Olay_Complete_Lightweight_Moisturiser_Sp_1454_1758539604528.jpg	2025-09-22 09:49:10.124	2025-09-22 11:13:25.712
1455	Olay Complete Lightweight SPF15 Day Lotion for Normal/Oily Skin 100ml	Beautiful healthy looking skin in 5 days. Lightweight daily facial moisturiser fluid for normal to oily skin. SolaSheerTM UVA/UVB protection with…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539607/pharmacy-app/pharmacy/Olay_Complete_Lightweight_SPF15_Day_Loti_1455_1758539606799.jpg	2025-09-22 09:49:11.426	2025-09-22 11:13:28.172
1457	Olay Double Action Facial Day Cream & Primer for Normal/Dry Skin 50ml	An iconic beauty classic giving skin timeless beauty with Olay's original moisturising formulas. For softer, smoother, more beautiful healthy looking…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539612/pharmacy-app/pharmacy/Olay_Double_Action_Facial_Day_Cream___Pr_1457_1758539611954.jpg	2025-09-22 09:49:13.688	2025-09-22 11:13:33.02
1458	Olay Regenerist Day Face Cream SPF30 50ml	Smooths the look of fine lines & wrinkles & renews skin’s youthful look. Exfoliates, Smooths, Brightens. Rich, non-greasy formula for…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539614/pharmacy-app/pharmacy/Olay_Regenerist_Day_Face_Cream_SPF30_50m_1458_1758539614137.jpg	2025-09-22 09:49:15.009	2025-09-22 11:13:35.245
1460	Olay Regenerist Regenerating Moisturiser Night Cream 50ml	Face Cream that smooths the look of fine lines & wrinkles and renews skin’s youthful look. Exfoliates, smooths, brightens. Formula…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539619/pharmacy-app/pharmacy/Olay_Regenerist_Regenerating_Moisturiser_1460_1758539618496.jpg	2025-09-22 09:49:17.808	2025-09-22 11:13:40.048
1461	Olay Regenerist Retinol24 Night Facial Serum 40ml	This night face serum will bring you visible improvements in fine lines & wrinkles, smoothness, brightness, firming, dark spots, and…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539621/pharmacy-app/pharmacy/Olay_Regenerist_Retinol24_Night_Facial_S_1461_1758539621156.jpg	2025-09-22 09:49:19.076	2025-09-22 11:13:41.994
1463	Olay Regenerist UV Lotion Advanced Anti-Ageing SPF15 Lotion 75ml	Formulated with Broad Spectrum SPF 15 to Help Protect Skin from UVA/UVB Rays. Daily Face Moisturizer with Sunscreen Regenerates Skin’s…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539626/pharmacy-app/pharmacy/Olay_Regenerist_UV_Lotion_Advanced_Anti__1463_1758539625293.jpg	2025-09-22 09:49:22.028	2025-09-22 11:13:46.47
1465	Olay Total Effects 7 In One Day Moisturiser Cream SPF15 15ml	It gives 7 skin benefits in one product: 1. Reduces the appearance of wrinkles 2. Moisturises 3. Evens skin tone…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539630/pharmacy-app/pharmacy/Olay_Total_Effects_7_In_One_Day_Moisturi_1465_1758539629781.jpg	2025-09-22 09:49:24.707	2025-09-22 11:13:51.229
1466	Olay Total Effects 7 In One Day Moisturiser Cream SPF15 50ml	It gives 7 skin benefits in one product: 1. Reduces the appearance of wrinkles 2. Moisturises 3. Evens skin tone…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539632/pharmacy-app/pharmacy/Olay_Total_Effects_7_In_One_Day_Moisturi_1466_1758539632040.jpg	2025-09-22 09:49:26	2025-09-22 11:13:53.057
1468	Olay Total Effects Anti-Ageing 7 in 1 Night Firming Moisturiser 50ml	Fights the seven signs of ageing for a glowing and fabulous skin every morning. Seven benefits in one help keep…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539636/pharmacy-app/pharmacy/Olay_Total_Effects_Anti_Ageing_7_in_1_Ni_1468_1758539635682.jpg	2025-09-22 09:49:28.597	2025-09-22 11:13:57.032
1469	Olay Total Effects Anti-Ageing 7in1 Day Moisturiser SPF15 50ml	Olay Total Effects 7-In-1 Day Moisturiser 50ml is formulated with SPF 15 for sun protection and helps fight the 7…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539638/pharmacy-app/pharmacy/Olay_Total_Effects_Anti_Ageing_7in1_Day__1469_1758539637651.jpg	2025-09-22 09:49:30.093	2025-09-22 11:13:58.541
1471	Olay Vitality Renewing Night Mask 50ml	OLAY Vitality is specifically designed to nourish and to help strengthen sensitive mature skin – reveal beautiful, younger looking skin,…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539645/pharmacy-app/pharmacy/Olay_Vitality_Renewing_Night_Mask_50ml_1471_1758539645032.jpg	2025-09-22 09:49:32.759	2025-09-22 11:14:06.033
1472	Olbas Inhaler Nasal Stick	Relief from catarrh, colds and blocked sinuses.	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539647/pharmacy-app/pharmacy/Olbas_Inhaler_Nasal_Stick_1472_1758539646997.jpg	2025-09-22 09:49:34.067	2025-09-22 11:14:08.208
1474	Olbas Oil Inhalant Decongestant 10ml	Sinus Control. Cold and Flu Control. Soothing effect.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539651/pharmacy-app/pharmacy/Olbas_Oil_Inhalant_Decongestant_10ml_1474_1758539651293.jpg	2025-09-22 09:49:36.808	2025-09-22 11:14:12.409
1478	Old Spice Citron with Sandalwood Scent 2in1 Shampoo & Shower Gel 400ml	Learn how to smell good and bring out a true manliness with Old Spice shower gel.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539660/pharmacy-app/pharmacy/Old_Spice_Citron_with_Sandalwood_Scent_2_1478_1758539659536.jpg	2025-09-22 09:49:41.759	2025-09-22 11:14:20.493
1479	Old Spice Fresh High Endurance Deodorant Stick 63g	Overpowers even the bluest stink. Keeps you fresh for over 24H. High Endurance. Long lasting.	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539662/pharmacy-app/pharmacy/Old_Spice_Fresh_High_Endurance_Deodorant_1479_1758539661430.jpg	2025-09-22 09:49:43.033	2025-09-22 11:14:22.671
1481	Old Spice Pure Sport High Endurance Deodorant Stick 63g	Free of Aluminum Old Spice Men's Deodorant overpowers stink with good-smellingness. So easy to use you might accidentally put it…	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539665/pharmacy-app/pharmacy/Old_Spice_Pure_Sport_High_Endurance_Deod_1481_1758539665189.jpg	2025-09-22 09:49:45.351	2025-09-22 11:14:26.231
1483	Old Spice Ultra Defence Deodorant Stick 50g	Designed to reduce sweat developed under situations of great pressure, this anti-odor stick is perfect to boost confidence/personal comfort. The…	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539669/pharmacy-app/pharmacy/Old_Spice_Ultra_Defence_Deodorant_Stick__1483_1758539668531.jpg	2025-09-22 09:49:48.017	2025-09-22 11:14:29.365
1485	Old Spice Whitewater Shower Gel 400ml	Old Spice Whitewater Shower Gel removes unpleasant odors as well as impurities due to a selection of fresh ingredients. In…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539672/pharmacy-app/pharmacy/Old_Spice_Whitewater_Shower_Gel_400ml_1485_1758539672189.jpg	2025-09-22 09:49:50.474	2025-09-22 11:14:33.193
1486	Old Spice Wolfthorn Deodorant Roll On 50ml	Wolfthorn Antiperspirant and Deodorant goes on invisible and keeps you feeling fresh, dry and manly.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539674/pharmacy-app/pharmacy/Old_Spice_Wolfthorn_Deodorant_Roll_On_50_1486_1758539673888.jpg	2025-09-22 09:49:52.045	2025-09-22 11:14:34.72
1488	Olive Oil Sheen Spray (Small)  85ml	ORS Olive Oil Nourishing Sheen Spray 472ml with a blend of Vitamin E, olive oil, and herbal extracts add a…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539677/pharmacy-app/pharmacy/Olive_Oil_Sheen_Spray__Small___85ml_1488_1758539677125.jpg	2025-09-22 09:49:54.524	2025-09-22 11:14:38.178
1489	Omeflex Glucosamine +Omega 3 Capsules 30’s	For relief from painful and swollen joints.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539679/pharmacy-app/pharmacy/Omeflex_Glucosamine__Omega_3_Capsules_30_1489_1758539679044.jpg	2025-09-22 09:49:55.754	2025-09-22 11:14:40.158
1491	Omron M1 Basic Blood Pressure Machine	Omron blood pressure machine is a fully automatic upper arm blood pressure monitor for checking blood pressure levels.	154000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539684/pharmacy-app/pharmacy/Omron_M1_Basic_Blood_Pressure_Machine_1491_1758539683225.jpg	2025-09-22 09:49:58.256	2025-09-22 11:14:44.356
1493	One touch Classic Condoms 12’s	One touch classic condoms are high quality condoms lubricated with silicone oil. They are natural rubber latex condoms with a…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539688/pharmacy-app/pharmacy/One_touch_Classic_Condoms_12_s_1493_1758539687153.jpg	2025-09-22 09:50:00.671	2025-09-22 11:14:48.043
1494	One Touch Lights Condoms 12’s	One touch lights condoms are ultra thin highly sensitive quality condoms lubricated with silicone oil. They are natural rubber latex…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539689/pharmacy-app/pharmacy/One_Touch_Lights_Condoms_12_s_1494_1758539689122.jpg	2025-09-22 09:50:01.94	2025-09-22 11:14:50.295
1495	One Touch Romantic Condoms 12’s	One touch romantic condoms are high quality condoms with flavored lubricant to excite both of you. They are natural rubber…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539691/pharmacy-app/pharmacy/One_Touch_Romantic_Condoms_12_s_1495_1758539691121.jpg	2025-09-22 09:50:03.271	2025-09-22 11:14:52.343
1496	OPTIBAC PROBIOTICS SACCHAROMYCES BOULARD  1 16 Capsule		51200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539697/pharmacy-app/pharmacy/OPTIBAC_PROBIOTICS_SACCHAROMYCES_BOULARD_1496_1758539696606.jpg	2025-09-22 09:50:04.621	2025-09-22 11:14:57.712
1498	Optimal Tretinoin 0.05% Topical Cream 30g	Used to treat acne.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539702/pharmacy-app/pharmacy/Optimal_Tretinoin_0_05__Topical_Cream_30_1498_1758539701524.jpg	2025-09-22 09:50:07.284	2025-09-22 11:15:02.347
1500	Oracure Gel 15g	For relief of pain from mouth ulcers and denture irritation.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539707/pharmacy-app/pharmacy/Oracure_Gel_15g_1500_1758539705944.jpg	2025-09-22 09:50:09.692	2025-09-22 11:15:07.622
1501	Oral-B Essential Waxed Mint Floss 50m	Gentle on fingers and gums. Mint flavor.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539709/pharmacy-app/pharmacy/Oral_B_Essential_Waxed_Mint_Floss_50m_1501_1758539708446.jpg	2025-09-22 09:50:10.92	2025-09-22 11:15:09.545
1503	OraQuick HIV Self Test	OraQuick HIV Self-Test is a single-easy-to-use oral HIV self test that detects antibodies to Human Immunodeficiency Virus Type 1 (HIV-1)…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539713/pharmacy-app/pharmacy/OraQuick_HIV_Self_Test_1503_1758539713059.jpg	2025-09-22 09:50:13.184	2025-09-22 11:15:14.201
1504	ORAXIN SYRUP 100ML Cyproheptadine 100 ml   Bottle		6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539716/pharmacy-app/pharmacy/ORAXIN_SYRUP_100ML_Cyproheptadine_100_ml_1504_1758539715657.jpg	2025-09-22 09:50:14.319	2025-09-22 11:15:16.665
1507	Organic Apple Cider Vinegar 500ml	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539721/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_500ml_1507_1758539720925.jpg	2025-09-22 09:50:18.142	2025-09-22 11:15:21.707
1509	Organic Apple Cider Vinegar with Honey & Ginger 500ml	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539725/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_with_Honey___1509_1758539724663.jpg	2025-09-22 09:50:20.464	2025-09-22 11:15:25.623
1510	Organic Apple Cider Vinegar With Honey & Turmeric 500ml	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539727/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_With_Honey___1510_1758539726408.jpg	2025-09-22 09:50:21.601	2025-09-22 11:15:27.369
1523	Osteocure Gel 100g	Osteocure gel helps with joint pain & Inflammation, Backache, Stiffness, Sprains& Strains, Muscular Pain, Fibrocytis & highly effective in Arthritis,…	38000	100	\N	2025-09-22 09:50:38.898	2025-09-22 09:50:38.898
1514	Orofer Syrup 150ml	This syrup is indicated for the treatment and prevention of Iron, Vitamin B complex and Zinc deficiencies.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539735/pharmacy-app/pharmacy/Orofer_Syrup_150ml_1514_1758539734351.jpg	2025-09-22 09:50:26.823	2025-09-22 11:15:36.071
1516	ORS Hydration Tablets Lemon Flavour 12’s	Formulated with electrolytes, glucose, and minerals for general hydration, sports & exercise, and use in travel & hot climates.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539741/pharmacy-app/pharmacy/ORS_Hydration_Tablets_Lemon_Flavour_12_s_1516_1758539740457.jpg	2025-09-22 09:50:29.524	2025-09-22 11:15:41.495
1517	Orthoboon Sachets (Glucosamine, Collagen, Vitamin C) 12g 6’s	Keeps the joints and bones healthy. Improves the flexibility of joints. Help in the regeneration of cartilage.	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539743/pharmacy-app/pharmacy/Orthoboon_Sachets__Glucosamine__Collagen_1517_1758539742393.jpg	2025-09-22 09:50:30.766	2025-09-22 11:15:44.018
1519	Osteocare Liquid 200mL	Osteocare is a balanced formula that provides the body requirements of Calcium with cofactor to help maintain healthy bones, teeth,…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539748/pharmacy-app/pharmacy/Osteocare_Liquid_200mL_1519_1758539747379.jpg	2025-09-22 09:50:33.582	2025-09-22 11:15:48.664
1520	Osteocare Original 30’s	Calcium is crucial to everyone so Osteocare Original is scientifically developed to complement your dietary intake at every stage of…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539753/pharmacy-app/pharmacy/Osteocare_Original_30_s_1520_1758539752397.png	2025-09-22 09:50:34.705	2025-09-22 11:15:53.783
1522	Osteocare Plus Omega 3 & Soy Isoflavones 56’s	Osteocare Plus is the ultimate product in the Osteocare range to help maintain healthy bones.It combines the Osteocare tablet formula…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539761/pharmacy-app/pharmacy/Osteocare_Plus_Omega_3___Soy_Isoflavones_1522_1758539760668.png	2025-09-22 09:50:37.411	2025-09-22 11:16:01.669
1524	Osteomin Glucosamine/chondroitin Tablets 30’s	Osteomin Tablet works by supplying materials to rebuild the cushion in joints; works as a building blocks of cartilage to…	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539763/pharmacy-app/pharmacy/Osteomin_Glucosamine_chondroitin_Tablets_1524_1758539762375.jpg	2025-09-22 09:50:40.109	2025-09-22 11:16:03.449
1526	Otrivin 0.05% Xylometazoline (Children) Nasal Drops 10ml	Acts quickly to relieve a blocked or runny nose caused by colds, flu, sinusitis or hayfever in children.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539767/pharmacy-app/pharmacy/Otrivin_0_05__Xylometazoline__Children___1526_1758539766906.png	2025-09-22 09:50:42.752	2025-09-22 11:16:07.791
1528	Otrivin Nasal Drops Paed 10ml	Fast relief from a blocked nose. Acts in 2 minutes and provides long lasting relief up to 10 hours. Suitable…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539771/pharmacy-app/pharmacy/Otrivin_Nasal_Drops_Paed_10ml_1528_1758539770613.jpg	2025-09-22 09:50:45.073	2025-09-22 11:16:11.704
1529	OvaBoost Capsules for Women 120’s	A dietary supplement for healthy women to support egg quality and healthy ovulation.	250000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539773/pharmacy-app/pharmacy/OvaBoost_Capsules_for_Women_120_s_1529_1758539772637.jpg	2025-09-22 09:50:46.233	2025-09-22 11:16:13.751
1531	Ozical Tablets 30’s	It contains vitamin D3 and calcium good for the growth and development of bones. It is also of great help…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539777/pharmacy-app/pharmacy/Ozical_Tablets_30_s_1531_1758539777038.jpg	2025-09-22 09:50:48.741	2025-09-22 11:16:18.053
1533	Palmer’s Cocoa Butter Formula Intensive Relief Hand Cream 60g	Palmer's Cocoa Butter Formula Intensive Relief Hand Cream provides effective and long-lasting relief for severely dry, itchy and irritated hands.…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539781/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Formula_Intensive__1533_1758539780566.jpg	2025-09-22 09:50:51.604	2025-09-22 11:16:21.739
1535	Palmer’s Cocoa Butter Formula Moisturizes Softens Body Oil 250ml	Hydrate and Soften skin with Palmer's Cocoa Butter Formula Body Oil, crafted with intensively moisturising Cocoa Butter and Vitamin E.…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539785/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Formula_Moisturize_1535_1758539784880.png	2025-09-22 09:50:54.573	2025-09-22 11:16:26.04
1536	Palmer’s Cocoa Butter Heals Softens Body Lotion 400ml	Heal and soften rough dry skin with Palmer's Cocoa Butter Formula body lotion, crafted with intensively moisturizing Cocoa Butter and…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539787/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Heals_Softens_Body_1536_1758539786949.png	2025-09-22 09:50:56.007	2025-09-22 11:16:27.986
1538	Palmer’s Cocoa Butter Massage Cream for Stretch Marks 125g	Palmer's Cocoa Butter Formula Massage Cream helps visibly improve skin elasticity and the appearance of stretch marks. Pure Cocoa Butter…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539791/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Massage_Cream_for__1538_1758539790939.jpg	2025-09-22 09:50:58.793	2025-09-22 11:16:32.285
1539	Palmer’s Cocoa Butter Softens Smoothes Daily Skin Therapy Lotion 400ml	Rich luxurious Palmer's Cocoa Butter Formula Fragrance Free daily body lotion provides deep hydration all over. This velvety soft formula…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539793/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Softens_Smoothes_D_1539_1758539792994.jpg	2025-09-22 09:51:00.619	2025-09-22 11:16:33.744
1541	Palmer’s Coconut Oil Conditioning Shampoo 400ml	Palmer's Coconut Oil Formula Coconut Oil Conditioning Shampoo is a rich, creamy shampoo, free of sulfates and harsh detergents, that…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539797/pharmacy-app/pharmacy/Palmer_s_Coconut_Oil_Conditioning_Shampo_1541_1758539796905.jpg	2025-09-22 09:51:03.278	2025-09-22 11:16:38.074
1543	Palmer’s Coconut Oil Formula Lip Balm with SPF 15 4g	Palmer's Coconut Oil SPF 15 Lip Balm is a decadently creamy lip balm that keeps lips hydrated all day long…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539802/pharmacy-app/pharmacy/Palmer_s_Coconut_Oil_Formula_Lip_Balm_wi_1543_1758539801223.png	2025-09-22 09:51:05.906	2025-09-22 11:16:42.628
1647	Relex Cough Syrup 100ml	For relief of irritating and unproductive cough.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540057/pharmacy-app/pharmacy/Relex_Cough_Syrup_100ml_1647_1758540056944.jpg	2025-09-22 09:53:16.354	2025-09-22 11:20:57.889
1555	Pampers Baby Wipes 56’s	Pampers Sensitive Baby Wipes 56's are perfect for babies with allergy-prone skin. They gently clear away dirt and mess without…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539826/pharmacy-app/pharmacy/Pampers_Baby_Wipes_56_s_1555_1758539825803.jpg	2025-09-22 09:51:25.602	2025-09-22 11:17:07.005
1546	Palmer’s Skin Therapy Oil With Vitamin E 60ml	Palmer's Cocoa Butter Formula Skin Therapy Oil is formulated with an exclusive blend of Pure Argan Oil, Natural Oils, Cetesomate-E…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539807/pharmacy-app/pharmacy/Palmer_s_Skin_Therapy_Oil_With_Vitamin_E_1546_1758539807095.jpg	2025-09-22 09:51:10.474	2025-09-22 11:16:48.471
1547	Palmer’s Ultra Moisturizing Lip Balm With SPF 15 4G	Palmer's Cocoa Butter Formula Original Ultra Moisturising Lip Balm, enriched with Vitamin E and with the added benefit of SPF…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539813/pharmacy-app/pharmacy/Palmer_s_Ultra_Moisturizing_Lip_Balm_Wit_1547_1758539812711.jpg	2025-09-22 09:51:11.737	2025-09-22 11:16:53.794
1549	Palmer’s Cocoa Butter Formula Daily Skin Therapy Lotion 400ml	Palmer’s Cocoa Butter Formula Daily Skin Therapy Lotion is made with Cocoa Butter to naturally moisturize and Vitamin E to…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539817/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Formula_Daily_Skin_1549_1758539816689.jpg	2025-09-22 09:51:14.291	2025-09-22 11:16:57.661
1551	Palmer’s Skin Therapy Oil With Vitamin E 150ml	Palmer’s Cocoa Butter Formula Skin Therapy Oil is formulated with an exclusive blend of Pure Argan Oil, Natural Oils, Cetesomate-E…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539821/pharmacy-app/pharmacy/Palmer_s_Skin_Therapy_Oil_With_Vitamin_E_1551_1758539820242.jpg	2025-09-22 09:51:20.005	2025-09-22 11:17:01.264
1552	Palmers Cocoa Butter Formula Softens Smoothes Body Lotion 250ml	Soften and smooth rough, dry skin with Palmer’s Cocoa Butter Formula Daily Body Lotion, crafted with intensively moisturising Cocoa Butter…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539822/pharmacy-app/pharmacy/Palmers_Cocoa_Butter_Formula_Softens_Smo_1552_1758539822023.jpg	2025-09-22 09:51:21.402	2025-09-22 11:17:02.91
1556	Pampers Diapers Jumbo S5(11-25Kg) 48’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. Each pack…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539828/pharmacy-app/pharmacy/Pampers_Diapers_Jumbo_S5_11_25Kg__48_s_1556_1758539827595.jpg	2025-09-22 09:51:26.876	2025-09-22 11:17:08.63
1558	Pampers Diapers S2(3-8Kg) 40’s	The no. 1 choice of pediatricians for newborns. Umbilical friendly shape: Protects your baby’s delicate belly with a perfectly contoured…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539832/pharmacy-app/pharmacy/Pampers_Diapers_S2_3_8Kg__40_s_1558_1758539831582.jpg	2025-09-22 09:51:29.594	2025-09-22 11:17:12.903
1559	Pampers Diapers S3(6-10Kg) 36’s	A great night's sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. The only…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539834/pharmacy-app/pharmacy/Pampers_Diapers_S3_6_10Kg__36_s_1559_1758539833688.jpg	2025-09-22 09:51:30.826	2025-09-22 11:17:14.729
1561	Pampers Diapers S4(9-18Kg) 32’s	Absorbent micro pearls: Absorb up to 30 times its weight and keep the baby’s skin dry. Breathable soft belt: Crafted…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539838/pharmacy-app/pharmacy/Pampers_Diapers_S4_9_18Kg__32_s_1561_1758539837821.jpg	2025-09-22 09:51:33.625	2025-09-22 11:17:19.532
1563	Pampers Diapers S5(11-25Kg) 8’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. Each pack…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539842/pharmacy-app/pharmacy/Pampers_Diapers_S5_11_25Kg__8_s_1563_1758539841930.jpg	2025-09-22 09:51:36.098	2025-09-22 11:17:22.915
1564	Pampers Diapers S5(12-18Kg) 8’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. Each pack contains…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539844/pharmacy-app/pharmacy/Pampers_Diapers_S5_12_18Kg__8_s_1564_1758539843803.jpg	2025-09-22 09:51:37.331	2025-09-22 11:17:25.226
1566	Pampers Pants S4 (9-14Kg) 28’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. The only…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539849/pharmacy-app/pharmacy/Pampers_Pants_S4__9_14Kg__28_s_1566_1758539848213.jpg	2025-09-22 09:51:39.672	2025-09-22 11:17:29.404
1568	Pampers Pants S5 (12-18Kg) 52’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. Each pack…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539853/pharmacy-app/pharmacy/Pampers_Pants_S5__12_18Kg__52_s_1568_1758539852219.jpg	2025-09-22 09:51:41.926	2025-09-22 11:17:33.574
1569	Pampers Pants S6(16+ Kg) 24’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. The only…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539855/pharmacy-app/pharmacy/Pampers_Pants_S6_16__Kg__24_s_1569_1758539854329.jpg	2025-09-22 09:51:43.234	2025-09-22 11:17:35.672
1571	PanOxyl Acne Creamy Wash 4%	Creamy, dreamy, and mighty, this daily acne cleanser with 4% Benzoyl Peroxide clears acne at lightning speed. Dermatologist-recommended acne face…	79000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539859/pharmacy-app/pharmacy/PanOxyl_Acne_Creamy_Wash_4__1571_1758539858652.jpg	2025-09-22 09:51:45.459	2025-09-22 11:17:39.702
1572	Panoxyl Acne Foaming Wash 10%	PanOxyl Acne Foaming Wash is a maximum-strength acne treatment wash that clears, treats, and prevents the worst breakouts.	82000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539865/pharmacy-app/pharmacy/Panoxyl_Acne_Foaming_Wash_10__1572_1758539864520.jpg	2025-09-22 09:51:46.574	2025-09-22 11:17:45.437
1574	Parodontax Toothpaste 75ml	Parodontax is a toothpaste that is clinically proven to help reduce bleeding gums. When used twice daily, it significantly reduces…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539869/pharmacy-app/pharmacy/Parodontax_Toothpaste_75ml_1574_1758539868297.jpg	2025-09-22 09:51:49.267	2025-09-22 11:17:49.496
1576	PediaSure Powder 850g	Pediasure is a complete balanced nutritional supplement formulated to support growth and development, promote immunity and build a healthy appetite…	160000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539872/pharmacy-app/pharmacy/PediaSure_Powder_850g_1576_1758539871850.jpg	2025-09-22 09:51:51.613	2025-09-22 11:17:52.703
1577	Penegra Sildenafil 100mg Tablets 4’s	Penegra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	5600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539874/pharmacy-app/pharmacy/Penegra_Sildenafil_100mg_Tablets_4_s_1577_1758539873680.jpg	2025-09-22 09:51:52.732	2025-09-22 11:17:54.716
1580	Peppermint Oil 10ml	Peppermint Oil (Mentha piperita) 10ml is a cooling, stimulating, restorative and uplifting oil. It can used against tired sweaty feet…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539881/pharmacy-app/pharmacy/Peppermint_Oil_10ml_1580_1758539880181.jpg	2025-09-22 09:51:56.169	2025-09-22 11:18:01.86
1581	Perfectil Max Tabs/Caps 84’s	When your daily beauty regime needs a boost, Perfectil Max is our ultimate formula with a comprehensive range of nutrients…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539883/pharmacy-app/pharmacy/Perfectil_Max_Tabs_Caps_84_s_1581_1758539882631.png	2025-09-22 09:51:57.477	2025-09-22 11:18:03.832
1582	Perfectil Original Tablets 30’s	Perfectil Original gives you nourishment where beauty begins – on the inside, with triple active support for skin, hair and…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539886/pharmacy-app/pharmacy/Perfectil_Original_Tablets_30_s_1582_1758539885206.png	2025-09-22 09:51:58.641	2025-09-22 11:18:06.188
1584	Perobar 5% Cleansing Bar Soap 75g	Perobar 5% Cleansing Bar is an anti-bacterial medicine that helps treat acne. This medicine works by killing acne-causing bacteria.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539890/pharmacy-app/pharmacy/Perobar_5__Cleansing_Bar_Soap_75g_1584_1758539889901.jpg	2025-09-22 09:52:00.872	2025-09-22 11:18:10.991
1586	Pinkoo Syrup Gripe Water 120ml	For the treatment of common digestive problems in infants and children. Used as a daily health supplement to promote healthy…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539894/pharmacy-app/pharmacy/Pinkoo_Syrup_Gripe_Water_120ml_1586_1758539893916.jpg	2025-09-22 09:52:03.436	2025-09-22 11:18:14.992
1587	Piritex Baby Syrup 60ml	Piritex baby syrup is a mild expectorant specially formulated for babies from 3 months old.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539897/pharmacy-app/pharmacy/Piritex_Baby_Syrup_60ml_1587_1758539896163.jpg	2025-09-22 09:52:04.556	2025-09-22 11:18:17.231
1588	Piritex Dry Cough Syrup 100ml	For relief of non-productive cough.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539898/pharmacy-app/pharmacy/Piritex_Dry_Cough_Syrup_100ml_1588_1758539898125.jpg	2025-09-22 09:52:05.702	2025-09-22 11:18:19.087
1591	Placent Activ Milano Eyelash growth serum 5ml	The serum containing the unique placenta extract will help you get thick and luscious eyelashes.	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539904/pharmacy-app/pharmacy/Placent_Activ_Milano_Eyelash_growth_seru_1591_1758539904202.jpg	2025-09-22 09:52:09.204	2025-09-22 11:18:25.369
1593	Placent Activ Milano Hair Growth Placenta Serum 6ml	Placent activ hair care vials contain placenta extract that is rich in amino acids and silk proteins. The steady use…	49500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539909/pharmacy-app/pharmacy/Placent_Activ_Milano_Hair_Growth_Placent_1593_1758539908233.jpg	2025-09-22 09:52:11.685	2025-09-22 11:18:29.433
1594	Placent Activ Milano Hair Growth Shampoo 250ml	For regrowth of healthy hair. Suitable for dry, thinning hair.	41000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539910/pharmacy-app/pharmacy/Placent_Activ_Milano_Hair_Growth_Shampoo_1594_1758539910140.jpg	2025-09-22 09:52:12.801	2025-09-22 11:18:30.966
1596	Postinor-2	Postinor-2 (Levonorgestrel)  is emergency contraception (commonly called the morning after pill) that is used as backup contraception to prevent pregnancy…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539915/pharmacy-app/pharmacy/Postinor_2_1596_1758539914974.jpg	2025-09-22 09:52:15.305	2025-09-22 11:18:36.294
1597	Power Play Condoms 3’s	The latex in power play is slightly thicker for added strength and durability. This means that it’s ideal to delay…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539921/pharmacy-app/pharmacy/Power_Play_Condoms_3_s_1597_1758539920459.jpg	2025-09-22 09:52:16.596	2025-09-22 11:18:41.489
1599	Pregnacare before Conception 30’s	Specially formulated for women to help support a healthy conception when trying for a baby.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539925/pharmacy-app/pharmacy/Pregnacare_before_Conception_30_s_1599_1758539924950.png	2025-09-22 09:52:19.54	2025-09-22 11:18:46.001
1601	Pregnacare Liquid 200ml	Difficulty taking tablets shouldn’t get in the way of nutritional support when it matters most. With Pregnacare Liquid, the trusted…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539929/pharmacy-app/pharmacy/Pregnacare_Liquid_200ml_1601_1758539929160.png	2025-09-22 09:52:21.983	2025-09-22 11:18:50.422
1602	Pregnacare Max Caps 84’s	Specially formulated by experts to be our most optimal and comprehensive pregnancy supplement - ideal for mums-to-be who want the…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539932/pharmacy-app/pharmacy/Pregnacare_Max_Caps_84_s_1602_1758539931721.png	2025-09-22 09:52:23.17	2025-09-22 11:18:52.985
1604	Pregnacare Plus 56’s	Pregnacare Plus is a dual pack of supplements which contain vitamins, minerals, and nutrients which are ideal for pregnant women.…	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539937/pharmacy-app/pharmacy/Pregnacare_Plus_56_s_1604_1758539936361.png	2025-09-22 09:52:25.525	2025-09-22 11:18:58.035
1605	Pregnacare Stretch Mark Cream 100ml	Specially formulated for pregnancy, this is a rich, luxurious moisturiser enriched with natural extracts, vitamins and minerals. With Vitamins C…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539939/pharmacy-app/pharmacy/Pregnacare_Stretch_Mark_Cream_100ml_1605_1758539938957.png	2025-09-22 09:52:26.812	2025-09-22 11:19:00.258
1607	Pristine Gleam Floss Picks UK 75’s	Reaches between teeth to remove debris and prevent plaque build up.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539944/pharmacy-app/pharmacy/Pristine_Gleam_Floss_Picks_UK_75_s_1607_1758539943566.jpg	2025-09-22 09:52:29.08	2025-09-22 11:19:04.568
1609	Pro Nutrition Anabolic Whey GH 1kg	ANABOLIC WHEY GH has been formulated with 100% pure Whey Protein and quality complex carbohydrates in a precise ratio to…	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539949/pharmacy-app/pharmacy/Pro_Nutrition_Anabolic_Whey_GH_1kg_1609_1758539948384.png	2025-09-22 09:52:31.458	2025-09-22 11:19:09.286
1610	Pro Nutrition Creatine Monohydrate 300g	Creatine is one of the most popular and effective bodybuilding supplements on the market. It is a compound that is…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539953/pharmacy-app/pharmacy/Pro_Nutrition_Creatine_Monohydrate_300g_1610_1758539952299.png	2025-09-22 09:52:32.618	2025-09-22 11:19:13.771
1612	Pro Nutrition Extreme Mass (Vanilla & Strawberry) 4kg	Pro nutrition extreme mass is packed with protein, complex carbohydrates and amino acids designed to help you to gain lean…	240000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539958/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Mass__Vanilla___St_1612_1758539958070.png	2025-09-22 09:52:35.233	2025-09-22 11:19:19.21
1632	Promethazine 25mg Tabs 100’s	Promethazine is used to treat allergy symptoms such as itching, runny nose, sneezing, itchy or watery eyes, hives, and itchy skin rashes. It…	10000	100	\N	2025-09-22 09:52:58.82	2025-09-22 09:52:58.82
1633	Promethazine Syrup 60ml	Promethazine is used to treat allergy symptoms such as itching, runny nose, sneezing, itchy or watery eyes, hives, and itchy…	2000	100	\N	2025-09-22 09:53:00.007	2025-09-22 09:53:00.007
1615	Pro Nutrition Extreme Whey Chocolate 907g	Pro Nutrition Extreme Whey is a premium quality Whey Protein which has been instantized for easy mixing and formulated for great…	200000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539973/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Whey_Chocolate_907_1615_1758539972175.jpg	2025-09-22 09:52:38.699	2025-09-22 11:19:33.238
1616	Pro Nutrition Extreme Whey Strawberry 2kg	Pro Nutrition Extreme Whey is a premium quality Whey Protein which has been instantized for easy mixing and formulated for…	385000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539977/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Whey_Strawberry_2k_1616_1758539976601.jpg	2025-09-22 09:52:39.829	2025-09-22 11:19:37.589
1618	Pro Nutrition L-Glutamine 300g	Pro Nutrition L-Glutamine is a high-quality dietary supplement designed to support muscle recovery, enhance immune function, and promote gut health.…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539984/pharmacy-app/pharmacy/Pro_Nutrition_L_Glutamine_300g_1618_1758539983380.png	2025-09-22 09:52:42.131	2025-09-22 11:19:44.509
1619	Pro Nutrition Lean Girl Shaker Bottle 700ml	Premium quality BPA-free Lean Girl Shaker Bottle 700ml	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539994/pharmacy-app/pharmacy/Pro_Nutrition_Lean_Girl_Shaker_Bottle_70_1619_1758539991579.png	2025-09-22 09:52:43.248	2025-09-22 11:19:54.737
1621	Pro Nutrition Lipo Cut XD 120s	Lipo Cut is a powerful thermogenic and lipotropic fat burner, which helps favorably with weight loss, stimulates metabolism, regulates appetite and increases energy levels. Lipo…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540000/pharmacy-app/pharmacy/Pro_Nutrition_Lipo_Cut_XD_120s_1621_1758539999565.png	2025-09-22 09:52:45.51	2025-09-22 11:20:00.447
1623	Pro Nutrition Omega Maxx	Pro Nutrition Omega Maxx is a premium dietary supplement formulated to provide high-quality omega-3 fatty acids, which are essential for…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540008/pharmacy-app/pharmacy/Pro_Nutrition_Omega_Maxx_1623_1758540007278.png	2025-09-22 09:52:47.763	2025-09-22 11:20:08.587
1625	Pro Nutrition Pump Maxx	Pro Nutrition Pump Maxx is a fitness supplement designed to enhance muscle pump during workouts. It contains ingredients aimed at…	145000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540016/pharmacy-app/pharmacy/Pro_Nutrition_Pump_Maxx_1625_1758540015744.png	2025-09-22 09:52:50.656	2025-09-22 11:20:17.942
1626	Pro Nutrition Serious Size 2kg	Serious size's ultra advanced weight gain formula has been scientifically formulated to the ratio of carbs/protein needed for weight and…	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540019/pharmacy-app/pharmacy/Pro_Nutrition_Serious_Size_2kg_1626_1758540019000.png	2025-09-22 09:52:51.772	2025-09-22 11:20:20.363
1628	Pro Nutrition Shaker Bottle 700ml	700ml BPA Free Multi-Purpose Shaker	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540023/pharmacy-app/pharmacy/Pro_Nutrition_Shaker_Bottle_700ml_1628_1758540023201.png	2025-09-22 09:52:54.026	2025-09-22 11:20:24.266
1629	Pro Nutrition Testoboost 120s	Pro Nutrition's Testoboost is the best choice if you really want to naturally increase your own testosterone levels. This unique…	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540026/pharmacy-app/pharmacy/Pro_Nutrition_Testoboost_120s_1629_1758540025213.png	2025-09-22 09:52:55.143	2025-09-22 11:20:26.113
1631	Probeta-N Drops 7.5ml	For the treatment of infection of eye, ear and nose.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540029/pharmacy-app/pharmacy/Probeta_N_Drops_7_5ml_1631_1758540028760.jpg	2025-09-22 09:52:57.635	2025-09-22 11:20:29.911
1634	Pucelle For My Character Wavy Ocean Mist Cologne 150ml	Girls, be yourself and feel great with the rich floral and fresh marine fragrance!	8500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540031/pharmacy-app/pharmacy/Pucelle_For_My_Character_Wavy_Ocean_Mist_1634_1758540030561.jpg	2025-09-22 09:53:01.21	2025-09-22 11:20:31.491
1636	Pucelle Mist Cologne Sweet Fantasy 150ml	It has lovely floral and fruity scents. After usage, it leaves a pleasant sensation. Skin-friendly.	8500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540034/pharmacy-app/pharmacy/Pucelle_Mist_Cologne_Sweet_Fantasy_150ml_1636_1758540033972.jpg	2025-09-22 09:53:03.58	2025-09-22 11:20:35.136
1638	Pure Instinct Black Men Eau de Toilette Perfume 100ml	Timeless, yet still youthful, you can never go wrong with the Pure Instinct Black Men's perfume.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540038/pharmacy-app/pharmacy/Pure_Instinct_Black_Men_Eau_de_Toilette__1638_1758540037449.jpg	2025-09-22 09:53:06.077	2025-09-22 11:20:38.471
1639	PureBorn Kids Bee My Honey Soap	Bee My Honey, gentle cleansing bar is made with 5 ingredients & infused with naturally antibacterial, moisturizing vegan honey. 100%…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540040/pharmacy-app/pharmacy/PureBorn_Kids_Bee_My_Honey_Soap_1639_1758540039410.jpg	2025-09-22 09:53:07.237	2025-09-22 11:20:40.287
1641	PureBorn Kids Sweet Dreamer Bedtime Lotion 300ml	This Lotion is formulated with natural ingredients that gently moisturize sensitive skin, natural jojoba packed with vitamins to repair and…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540043/pharmacy-app/pharmacy/PureBorn_Kids_Sweet_Dreamer_Bedtime_Loti_1641_1758540042967.jpg	2025-09-22 09:53:09.476	2025-09-22 11:20:43.972
1643	Radox Feel Good Stress Relief Bath Soak 500ml	A calming blend with rosemary and eucalyptus. Feel good fragrance. Experts in blending. Contains natural ingredients.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540047/pharmacy-app/pharmacy/Radox_Feel_Good_Stress_Relief_Bath_Soak__1643_1758540046425.png	2025-09-22 09:53:11.733	2025-09-22 11:20:47.562
1644	Re-Cart Vitamins Capsules 30’s	Re Cart Capsules contain Glucosamine Sulphate and Manganese Sulphate as active ingredients. They work by activating enzymes and carbohydrate metabolism;…	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540049/pharmacy-app/pharmacy/Re_Cart_Vitamins_Capsules_30_s_1644_1758540048490.png	2025-09-22 09:53:12.853	2025-09-22 11:20:49.596
1646	Regaine For Women Regular Strength Scalp Solution ( Minoxidil 2% )	Regaine for Women Regular Strength is for women with hereditary hair loss.	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540055/pharmacy-app/pharmacy/Regaine_For_Women_Regular_Strength_Scalp_1646_1758540054926.jpg	2025-09-22 09:53:15.206	2025-09-22 11:20:56.178
1650	Revlon Natural Honey Aloe Vera Hand And Body Lotion 600ml		23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540067/pharmacy-app/pharmacy/Revlon_Natural_Honey_Aloe_Vera_Hand_And__1650_1758540066405.jpg	2025-09-22 09:53:19.709	2025-09-22 11:21:08.001
1652	Revuele  Expert+ Anti-Age Remodeling Serum 30ml	The formula specifically targets, deep lines and wrinkles, loss of elasticity and dehydration by enhancing the anti-ageing power of Filmexel.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540071/pharmacy-app/pharmacy/Revuele__Expert__Anti_Age_Remodeling_Ser_1652_1758540071139.png	2025-09-22 09:53:22.225	2025-09-22 11:21:12.284
1654	Revuele Face Peeling Gel with AHA Fruit Acids  80ml	Lemon Extract helps tighten and tone the skin, narrowing pores and minimizing blemishes and skin imperfections. Brightens skin complexion &…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540076/pharmacy-app/pharmacy/Revuele_Face_Peeling_Gel_with_AHA_Fruit__1654_1758540075545.jpg	2025-09-22 09:53:24.608	2025-09-22 11:21:16.36
1655	Revuele Face Peeling Gel with Charcoal 80ml	Gently exfoliates the skin. Removes dead skin cells without causing any irritation. The charcoal provides a matting effect while rejuvenating…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540078/pharmacy-app/pharmacy/Revuele_Face_Peeling_Gel_with_Charcoal_8_1655_1758540077171.jpg	2025-09-22 09:53:25.823	2025-09-22 11:21:18.38
1656	Rexona Free Spirit Deodorant Roll On 50ml	48 hour protection against odour and wetness	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540079/pharmacy-app/pharmacy/Rexona_Free_Spirit_Deodorant_Roll_On_50m_1656_1758540078997.jpg	2025-09-22 09:53:26.952	2025-09-22 11:21:19.901
1659	Rexona Men Sport Defense Roll-on 50ml	Feel dry and fresh all day with Rexona Men Sport Defense that helps protect you from sweat and body odor.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540084/pharmacy-app/pharmacy/Rexona_Men_Sport_Defense_Roll_on_50ml_1659_1758540083634.jpg	2025-09-22 09:53:30.53	2025-09-22 11:21:24.946
1660	Rexona Shower Fresh Roll On Deodorant 50ml	Underarm odour protection. 10X protection. Prevents odour from Sweat & Bacteria. 48 hours Sweat guard Anti-Perspirant. 0% alcohol. Safe on…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540086/pharmacy-app/pharmacy/Rexona_Shower_Fresh_Roll_On_Deodorant_50_1660_1758540085849.jpg	2025-09-22 09:53:31.648	2025-09-22 11:21:27.391
1662	Rhinathiol 5% Adult Chesty Cough 125ml	Effective and soothing relief for chesty cough in adults	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540090/pharmacy-app/pharmacy/Rhinathiol_5__Adult_Chesty_Cough_125ml_1662_1758540089961.jpg	2025-09-22 09:53:33.973	2025-09-22 11:21:30.934
1664	Rhinathiol Infant Syrup 125ml	Relive symptoms of chest congestion through expulsion of mucus in children.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540094/pharmacy-app/pharmacy/Rhinathiol_Infant_Syrup_125ml_1664_1758540093390.jpg	2025-09-22 09:53:36.491	2025-09-22 11:21:34.411
1665	Right Guard Clean Total Defence 5 Anti-Perspirant Deodorant 250ml	Uses an odour block technology which supports you to smell fresh.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540096/pharmacy-app/pharmacy/Right_Guard_Clean_Total_Defence_5_Anti_P_1665_1758540095820.jpg	2025-09-22 09:53:37.709	2025-09-22 11:21:37.269
1667	Right Guard Fresh Anti-Perspirant Roll On 50ml	Combines the 5 benefits of anti-perspirants into one, protecting you against sweat and body odour.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540100/pharmacy-app/pharmacy/Right_Guard_Fresh_Anti_Perspirant_Roll_O_1667_1758540099610.jpg	2025-09-22 09:53:39.941	2025-09-22 11:21:40.508
1669	Right Guard Women Magic Oil Pink Jasmine Shower Gel 250ml	A light and caring formula with micro oils, that helps nourish and moisturise your skin whilst showering.	15500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540104/pharmacy-app/pharmacy/Right_Guard_Women_Magic_Oil_Pink_Jasmine_1669_1758540103379.jpg	2025-09-22 09:53:42.185	2025-09-22 11:21:44.539
1670	Rinalin Syrup 60ml	Rinalin syrup contains Chlorpheniramine Maleate 2mg per 5ml which is an anti-histamine used to treat runny nose, sneezing, itching, and…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540106/pharmacy-app/pharmacy/Rinalin_Syrup_60ml_1670_1758540105405.jpg	2025-09-22 09:53:43.306	2025-09-22 11:21:46.7
1672	Rivaj Sweet Breath Spray Cool Mint 20ml	A minty blast that lasts! You are just a spray away from fresh minty breath.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540111/pharmacy-app/pharmacy/Rivaj_Sweet_Breath_Spray_Cool_Mint_20ml_1672_1758540110552.jpg	2025-09-22 09:53:45.578	2025-09-22 11:21:51.532
1674	Royal Vit G Capsules 20’s	Royal Vit G is a multivitamin for both men and women, ensuring all-round good health and wellbeing. It contains ginseng…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540118/pharmacy-app/pharmacy/Royal_Vit_G_Capsules_20_s_1674_1758540117909.png	2025-09-22 09:53:47.864	2025-09-22 11:21:59.263
1675	Rugby Benzoyl Peroxide 10% Acne Medication Gel 42.5g	For treatment and prevention of acne pimples, acne blemishes, blackheads or whiteheads.	44000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540120/pharmacy-app/pharmacy/Rugby_Benzoyl_Peroxide_10__Acne_Medicati_1675_1758540120067.jpg	2025-09-22 09:53:49.078	2025-09-22 11:22:01.189
1677	Salbutamol Syrup 100ml	For relief of asthmatic symptoms like chest tightness, wheezing and shortness of breath.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540124/pharmacy-app/pharmacy/Salbutamol_Syrup_100ml_1677_1758540123481.jpg	2025-09-22 09:53:51.4	2025-09-22 11:22:04.31
1678	Salbutamol Tablets 100’s	For relief of obstructive airway diseases.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540125/pharmacy-app/pharmacy/Salbutamol_Tablets_100_s_1678_1758540125108.jpg	2025-09-22 09:53:52.872	2025-09-22 11:22:06.057
1680	Sanex Dermo Invisible Anti-Perspirant Roll-On 50ml	Sanex Dermo Invisible Dry Anti-perspirant Roll On Deodorant looks after your skin and clothes. The anti-perspirant roll on deodorant stops…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540129/pharmacy-app/pharmacy/Sanex_Dermo_Invisible_Anti_Perspirant_Ro_1680_1758540128397.jpg	2025-09-22 09:53:55.345	2025-09-22 11:22:09.525
1682	Sanex Men 7 In 1 Protect 48H Antiperspirant Roll-on Deodorant	Protection for 24 hours whilst respecting skins protective barrier. Fresh fights malodor and bacteria proliferation. Balance: respect pH and bacterial…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540132/pharmacy-app/pharmacy/Sanex_Men_7_In_1_Protect_48H_Antiperspir_1682_1758540131937.jpg	2025-09-22 09:53:57.87	2025-09-22 11:22:13.272
1686	Savlon Antiseptic Liquid 500ml	Savlon Antiseptic Liquid is a versatile and trusted solution designed to protect against infection. It helps cleanse and disinfect minor…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540140/pharmacy-app/pharmacy/Savlon_Antiseptic_Liquid_500ml_1686_1758540140024.jpg	2025-09-22 09:54:02.839	2025-09-22 11:22:20.915
1688	Scholl Complete Corn Removal Treatment Kit	Scholl Complete Corn Treatment Kit constitutes of three parts: the corn removal pads, disc system and the corn cushions. Scholl…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540144/pharmacy-app/pharmacy/Scholl_Complete_Corn_Removal_Treatment_K_1688_1758540143942.png	2025-09-22 09:54:05.115	2025-09-22 11:22:25.327
1690	SD Codefree  Blood Glucose Monitor	SD Codefree Blood Glucose Monitor ,does not require separate coding, therefore  it is easy to use and provides accurate results.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540149/pharmacy-app/pharmacy/SD_Codefree__Blood_Glucose_Monitor_1690_1758540148553.png	2025-09-22 09:54:07.72	2025-09-22 11:22:30.096
1691	SD Codefree Blood Glucose Strips 50’s	SD Codefree Glucose test strips are an easy way to test your blood sugar levels. This is important for people…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540152/pharmacy-app/pharmacy/SD_Codefree_Blood_Glucose_Strips_50_s_1691_1758540151347.jpg	2025-09-22 09:54:08.839	2025-09-22 11:22:32.496
1693	Sebamed Anti-Ageing Q10 Lifting Eye Cream 15ml	Averaging 41% reduction of wrinkles within the 28-day test period. An active hydrating complex based on Phytopeptides combined with Hyaluron…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540155/pharmacy-app/pharmacy/Sebamed_Anti_Ageing_Q10_Lifting_Eye_Crea_1693_1758540154970.jpg	2025-09-22 09:54:11.185	2025-09-22 11:22:36.34
1694	Sebamed Anti-Stretch Mark Cream 200ml	Helps to both reduce and prevent the appearance of stretch marks. By allowing your skin’s connective tissue to adapt along…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540157/pharmacy-app/pharmacy/Sebamed_Anti_Stretch_Mark_Cream_200ml_1694_1758540157110.jpg	2025-09-22 09:54:12.411	2025-09-22 11:22:38.667
1696	Sebamed Baby Bubble Bath 500ml	Made with a special nourishing complex, our Baby Bubble Bath is the best choice for a gentle cleanser that helps…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540161/pharmacy-app/pharmacy/Sebamed_Baby_Bubble_Bath_500ml_1696_1758540161152.jpg	2025-09-22 09:54:14.918	2025-09-22 11:22:41.965
1698	Sebamed Baby Diaper Rash Cream 100ml	Sebamed Diaper Rash Cream provides effective relief and reliable protection against diaper rash. Strongly indicated for skin inflammation in the…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540164/pharmacy-app/pharmacy/Sebamed_Baby_Diaper_Rash_Cream_100ml_1698_1758540164124.jpg	2025-09-22 09:54:17.33	2025-09-22 11:22:44.929
1699	Sebamed Baby Gentle Wash 1 Litre	100% soap and alkali free, Sebamed Baby Gentle Wash is an extremely mild cleansing agent protecting delicate baby skin against…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540169/pharmacy-app/pharmacy/Sebamed_Baby_Gentle_Wash_1_Litre_1699_1758540169153.jpg	2025-09-22 09:54:18.541	2025-09-22 11:22:50.1
1701	Sebamed Baby Lotion 200ml	Sebamed Baby Body Lotion offers gentle protection for delicate baby skin. Its moisturising and emollient complex safeguards against dryness, making…	62000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540173/pharmacy-app/pharmacy/Sebamed_Baby_Lotion_200ml_1701_1758540172313.jpg	2025-09-22 09:54:20.982	2025-09-22 11:22:53.597
1703	Sebamed Balsam Deodorant For Men Roll-On 50ml	Aluminium free, Sebamed Balsam Roll On Deodorant for Men stops odour causing bacteria and does not impede the physiological functions…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540177/pharmacy-app/pharmacy/Sebamed_Balsam_Deodorant_For_Men_Roll_On_1703_1758540176272.png	2025-09-22 09:54:23.526	2025-09-22 11:22:57.368
1704	Sebamed Cleansing Bar 150g	100% soap and alkali free sebamed cleansing bar offers mild and thorough pore-deep skin cleansing. Created with the same pH.…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540178/pharmacy-app/pharmacy/Sebamed_Cleansing_Bar_150g_1704_1758540177981.jpg	2025-09-22 09:54:24.752	2025-09-22 11:22:59.005
1706	Sebamed Clear Face Deep Cleansing Facial Toner 150ml	For oily, impure and acne-prone skin. Panthenol supports the regeneration of the skin. Allantoin smoothes the skin and makes it…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540182/pharmacy-app/pharmacy/Sebamed_Clear_Face_Deep_Cleansing_Facial_1706_1758540181214.jpg	2025-09-22 09:54:27.211	2025-09-22 11:23:02.666
1707	Sebamed Clear Face Gentle Scrub 150ml	For impure and acne-prone skin. Skin appears fresh, smooth and supple. Gentle pore deep cleansing reduces skin impurities. Combats oily…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540184/pharmacy-app/pharmacy/Sebamed_Clear_Face_Gentle_Scrub_150ml_1707_1758540183469.jpg	2025-09-22 09:54:28.458	2025-09-22 11:23:04.76
1709	Sebamed Everyday Shampoo 1 litre	100% soap and alkali free Sebamed Everyday Shampoo is formulated with vegetal based active cleansing agents for gentle daily hair…	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540188/pharmacy-app/pharmacy/Sebamed_Everyday_Shampoo_1_litre_1709_1758540187341.jpg	2025-09-22 09:54:30.739	2025-09-22 11:23:08.463
1711	Sebamed Intimate Feminine Wash 200ml	100% soap and alkali free, Sebamed Feminine Intimate Wash pH 3.8 supports the ecological balance of the natural micro-flora for…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540192/pharmacy-app/pharmacy/Sebamed_Intimate_Feminine_Wash_200ml_1711_1758540191546.jpg	2025-09-22 09:54:33.232	2025-09-22 11:23:12.798
1712	Sebamed Lip Defense Balm 4.8g	Sebamed Lip Defense Balm with SPF 30 is formulated to help relieve dry lips, make lips soft again and guard…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540194/pharmacy-app/pharmacy/Sebamed_Lip_Defense_Balm_4_8g_1712_1758540193585.jpg	2025-09-22 09:54:34.348	2025-09-22 11:23:14.817
1714	Sebamed Moisturising Body Lotion 400ml	Sebamed Moisturising Body Lotion nourishes and preserves the natural moisture balance of the skin. It is naturally cooling and calming,…	38500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540198/pharmacy-app/pharmacy/Sebamed_Moisturising_Body_Lotion_400ml_1714_1758540197699.jpg	2025-09-22 09:54:36.821	2025-09-22 11:23:18.799
1715	Sebamed Moisturising Body Lotion 750ml	Sebamed Moisturising Body Lotion nourishes and preserves the natural moisture balance of the skin. It is naturally cooling and calming,…	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540200/pharmacy-app/pharmacy/Sebamed_Moisturising_Body_Lotion_750ml_1715_1758540199692.jpg	2025-09-22 09:54:38.525	2025-09-22 11:23:21.117
1719	SEDALAC SYRUP Lactulose 120 ml   Bottle		18500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540209/pharmacy-app/pharmacy/SEDALAC_SYRUP_Lactulose_120_ml___Bottle_1719_1758540208364.jpg	2025-09-22 09:54:43.532	2025-09-22 11:23:30.061
1720	Sefal Cinnarizine 25mg Tablets 50’s	For management of travel sickness, morning sickness, nausea and vertigo.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540211/pharmacy-app/pharmacy/Sefal_Cinnarizine_25mg_Tablets_50_s_1720_1758540210997.png	2025-09-22 09:54:44.772	2025-09-22 11:23:32.163
1722	Sekrol Syrup 30mg/5ml	Liquefies viscous mucus and makes cough more productive for relief.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540215/pharmacy-app/pharmacy/Sekrol_Syrup_30mg_5ml_1722_1758540214988.jpg	2025-09-22 09:54:47.1	2025-09-22 11:23:36.04
1724	Selsun Dandruff Treatment Shampoo 50ml	Effective in finding and removing fungi causing dandruff, cleaning scalp and itchy scalp.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540222/pharmacy-app/pharmacy/Selsun_Dandruff_Treatment_Shampoo_50ml_1724_1758540222049.jpg	2025-09-22 09:54:49.518	2025-09-22 11:23:43.021
1726	Sensodyne Extra Fresh Toothpaste 75ml	Sensodyne Extra fresh 75ml. Its fluoride formula strengthens teeth and helps re-mineralize enamel and prevent cavities.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540225/pharmacy-app/pharmacy/Sensodyne_Extra_Fresh_Toothpaste_75ml_1726_1758540225279.jpg	2025-09-22 09:54:52.082	2025-09-22 11:23:46.134
1728	Sensodyne Fresh Mint Toothpaste 75ml	Freshens breath. Mint taste. Protects against cavities. Sensitivity relief and lasting sensitivity protection.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540229/pharmacy-app/pharmacy/Sensodyne_Fresh_Mint_Toothpaste_75ml_1728_1758540228455.jpg	2025-09-22 09:54:54.961	2025-09-22 11:23:49.363
1730	Sensodyne Multi Care Tooth Paste 75ml	Toothpaste offering sensitivity protection. Helps protect against acid wear. Can be used as a daily normal toothpaste.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540232/pharmacy-app/pharmacy/Sensodyne_Multi_Care_Tooth_Paste_75ml_1730_1758540231968.png	2025-09-22 09:54:57.672	2025-09-22 11:23:52.951
1731	Sensodyne Pronamel Daily Protection Toothpaste 75ml	Helps Harden Tooth Enamel And Protects Against Acid Erosion.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540234/pharmacy-app/pharmacy/Sensodyne_Pronamel_Daily_Protection_Toot_1731_1758540233884.png	2025-09-22 09:54:59.002	2025-09-22 11:23:55.408
1733	Sensodyne Repair and Protect Deep Repair Toothpaste 75ml	Helps to repair deep inside the tooth to relieve sensitivity. Helps whiten teeth. Promotes healthy gums. Freshens breath. Improved foaming…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540238/pharmacy-app/pharmacy/Sensodyne_Repair_and_Protect_Deep_Repair_1733_1758540238004.jpg	2025-09-22 09:55:01.479	2025-09-22 11:23:59.28
1735	Seven Seas Cod Liver Oil Caps Once A Day 120’s	Our Cod Liver Oil One-a-day product comes in the form of an easy to consume, single capsule dosage for those…	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540246/pharmacy-app/pharmacy/Seven_Seas_Cod_Liver_Oil_Caps_Once_A_Day_1735_1758540245311.jpg	2025-09-22 09:55:03.865	2025-09-22 11:24:06.452
1736	Seven Seas Cod Liver Oil Caps Once A Day 30’s	Our Cod Liver Oil One-a-day product comes in the form of an easy to consume, single capsule dosage for those…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540248/pharmacy-app/pharmacy/Seven_Seas_Cod_Liver_Oil_Caps_Once_A_Day_1736_1758540247674.png	2025-09-22 09:55:04.981	2025-09-22 11:24:08.801
1738	Seven Seas Cod Liver Oil Maximum Strength Capsules 60’s	Our Cod Liver Oil Maximum Strength capsule contains 2X more Cod Liver Oil. It also contains 308 mg of Omega-3…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540253/pharmacy-app/pharmacy/Seven_Seas_Cod_Liver_Oil_Maximum_Strengt_1738_1758540252992.png	2025-09-22 09:55:07.334	2025-09-22 11:24:14.397
1740	Seven Seas Evening Primrose Oil & Starflower Oil Capsules 30’s	Seven Seas Evening Primrose Oil plus Starflower Oil easy to swallow capsules contain the natural source oils from the Evening…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540259/pharmacy-app/pharmacy/Seven_Seas_Evening_Primrose_Oil___Starfl_1740_1758540258397.jpg	2025-09-22 09:55:09.944	2025-09-22 11:24:19.561
1741	Seven Seas Jointcare Active Capsules 30’s	JointCare support through Vitamin C, Vitamin D, Zinc and Manganese. Plus Chondroitin. Supports muscles. Supports your cartilage and bones	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540261/pharmacy-app/pharmacy/Seven_Seas_Jointcare_Active_Capsules_30__1741_1758540260349.jpg	2025-09-22 09:55:11.143	2025-09-22 11:24:21.651
1743	Seven Seas JointCare Complete Capsules 30’s	Complete all round joint, muscle and bone support through Vitamin C, Vitamin D, Calcium and Copper.	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540267/pharmacy-app/pharmacy/Seven_Seas_JointCare_Complete_Capsules_3_1743_1758540266192.png	2025-09-22 09:55:13.391	2025-09-22 11:24:27.187
1745	Seven Seas Omega-3 Extra Strength Capsules 30’s	Seven Seas Omega-3 Extra Strength Capsules contain 1250mg Omega-3 to help maintain the health of your heart, brain and eyes.…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540271/pharmacy-app/pharmacy/Seven_Seas_Omega_3_Extra_Strength_Capsul_1745_1758540270519.jpg	2025-09-22 09:55:15.816	2025-09-22 11:24:31.493
1746	Seven Seas Original Cod Liver Oil 300ml	Our Original Cod Liver Oil liquid is the closest formulation we have today to the original product we first bottled…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540273/pharmacy-app/pharmacy/Seven_Seas_Original_Cod_Liver_Oil_300ml_1746_1758540273122.png	2025-09-22 09:55:17.233	2025-09-22 11:24:35.061
1748	Seven Seas Original Cod Liver Oil Syrup 150ml	Our Original Cod Liver Oil liquid is the closest formulation we have today to the original product we first bottled…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540281/pharmacy-app/pharmacy/Seven_Seas_Original_Cod_Liver_Oil_Syrup__1748_1758540280671.png	2025-09-22 09:55:19.582	2025-09-22 11:24:41.86
1749	Seven Seas Pregnancy Plus 56’s	21 vitamins & minerals with the exact recommended level of 400µg folic acid & 10µg vitamin D. Suitable during pregnancy…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540289/pharmacy-app/pharmacy/Seven_Seas_Pregnancy_Plus_56_s_1749_1758540287748.png	2025-09-22 09:55:20.701	2025-09-22 11:24:49.983
1751	Seven Seas Trying for A Baby Tablets 28’s	This Trying for a baby product contains the exact recommended level of Folic Acid which contributes to maternal tissue growth…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540294/pharmacy-app/pharmacy/Seven_Seas_Trying_for_A_Baby_Tablets_28__1751_1758540293231.png	2025-09-22 09:55:23.084	2025-09-22 11:24:54.534
1754	Shea Moisture African Black Soap Clarifying Mud Mask 113g	This clarifying mask helps draw out dirt and congestion while helping absorb excess oil and improve the appearance of troubled…	99000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540299/pharmacy-app/pharmacy/Shea_Moisture_African_Black_Soap_Clarify_1754_1758540298967.jpg	2025-09-22 09:55:26.947	2025-09-22 11:25:00.053
1756	Shea Moisture Coconut & Hibiscus Shea Butter Soap 230g	Cleanse and brighten dull skin with this sulfate-free bar soap. Coconut Oil nourishes while Hibiscus Flower and Songyi Mushroom help…	41500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540303/pharmacy-app/pharmacy/Shea_Moisture_Coconut___Hibiscus_Shea_Bu_1756_1758540302819.jpg	2025-09-22 09:55:29.519	2025-09-22 11:25:03.869
1757	Shea Moisture Deep Moisturizing Shampoo For Dry, Damaged Or Transitioning Hair 384ml	Moisturize & Cleanse.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540305/pharmacy-app/pharmacy/Shea_Moisture_Deep_Moisturizing_Shampoo__1757_1758540304648.jpg	2025-09-22 09:55:30.694	2025-09-22 11:25:05.765
1759	Shea Moisture Manuka Honey & Mafura Oil Shea Butter Soap 227g	This hydrating bar soap is specially formulated with Manuka Honey creates a moisturizing barrier to hydrate skin. Mafura Oil helps…	41500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540309/pharmacy-app/pharmacy/Shea_Moisture_Manuka_Honey___Mafura_Oil__1759_1758540308547.jpg	2025-09-22 09:55:33.094	2025-09-22 11:25:09.6
1761	Shower To Shower Fresh Dawn Roll On 50ml	Offers you 24-hour active protection for that "just showered" feeling of freshness. It will keep you feeling confident throughout the…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540312/pharmacy-app/pharmacy/Shower_To_Shower_Fresh_Dawn_Roll_On_50ml_1761_1758540311792.jpg	2025-09-22 09:55:35.474	2025-09-22 11:25:13.293
1763	Shower To Shower Fresh Powder Roll On Deodorant 50ml	24 hour active anti-perspirant protection to help keep you fresh and dry.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540317/pharmacy-app/pharmacy/Shower_To_Shower_Fresh_Powder_Roll_On_De_1763_1758540316253.jpg	2025-09-22 09:55:38.029	2025-09-22 11:25:17.165
1764	Shuya Active Oxygen Pads Day 10’s	Silk Absorption Surface That Absorbs Three Times Faster With negative ion emitter for improved health, well-being, and preventative help for…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540320/pharmacy-app/pharmacy/Shuya_Active_Oxygen_Pads_Day_10_s_1764_1758540319617.jpg	2025-09-22 09:55:39.348	2025-09-22 11:25:20.77
1766	Shuya Large Sanitary Pads for Night 8’s	8 large pads for well-balanced absorption, preventing side leakages Silk Absorption Surface That Absorbs Three Times Faster With negative ion…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540326/pharmacy-app/pharmacy/Shuya_Large_Sanitary_Pads_for_Night_8_s_1766_1758540325313.jpg	2025-09-22 09:55:42.075	2025-09-22 11:25:26.863
1767	Shuya Medium Sanitary Pads for Night 8’s	Silk Absorption Surface That Absorbs Three Times Faster With negative ion emitter for improved health, well-being, and preventative help for…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540329/pharmacy-app/pharmacy/Shuya_Medium_Sanitary_Pads_for_Night_8_s_1767_1758540328809.jpg	2025-09-22 09:55:43.344	2025-09-22 11:25:29.921
1769	Sildenafil 100mg UK Tablets 4’s	Sildenafil is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group of…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540333/pharmacy-app/pharmacy/Sildenafil_100mg_UK_Tablets_4_s_1769_1758540333047.jpg	2025-09-22 09:55:45.828	2025-09-22 11:25:34.18
1770	Sildenafil 50mg UK Tablets 4’s	Sildenafil is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group of…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540336/pharmacy-app/pharmacy/Sildenafil_50mg_UK_Tablets_4_s_1770_1758540335517.jpg	2025-09-22 09:55:47.131	2025-09-22 11:25:36.668
1772	Similac Gold Comfort 2 (6-12Months)820g	Similac Gold Comfort Stage 2 Follow-up Formula 820g is a baby formula partially hydrolysed for infants 6 to 12 months.…	175000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540346/pharmacy-app/pharmacy/Similac_Gold_Comfort_2__6_12Months_820g_1772_1758540345395.jpg	2025-09-22 09:55:49.612	2025-09-22 11:25:46.746
1774	Simple Baby Moisturising Bath 300ml	Simple Baby Moisturising Bath is a bath additive that is ideal for babies who have sensitive skin. This is because…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540359/pharmacy-app/pharmacy/Simple_Baby_Moisturising_Bath_300ml_1774_1758540357774.jpg	2025-09-22 09:55:52.035	2025-09-22 11:25:59.413
1776	Simple Daily Skin Detox Clear Pore Scrub 150 ml	Refresh and renew your skin with new Simple Daily Skin Detox Clear Pore Scrub, the exfoliating scrub specially designed for…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540363/pharmacy-app/pharmacy/Simple_Daily_Skin_Detox_Clear_Pore_Scrub_1776_1758540362924.jpg	2025-09-22 09:55:54.811	2025-09-22 11:26:04.012
1777	Simple Daily Skin Detox SOS Clearing Booster 25ml	Simple Daily Skin Detox SOS Clearing Booster is ideal for controlling oily t-zones or soothing localized blemishes. This oil control…	19500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540365/pharmacy-app/pharmacy/Simple_Daily_Skin_Detox_SOS_Clearing_Boo_1777_1758540364689.jpg	2025-09-22 09:55:56.232	2025-09-22 11:26:05.547
1779	Simple Kind to Skin Alcohol Free Soothing Facial Toner 200ml	Simple Kind to Skin Soothing Facial Toner features a special blend of Simple skin toning goodness to help keep skin toned…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540368/pharmacy-app/pharmacy/Simple_Kind_to_Skin_Alcohol_Free_Soothin_1779_1758540367991.jpg	2025-09-22 09:55:58.91	2025-09-22 11:26:08.862
1780	Simple Kind to Skin Purifying Cleansing Lotion 200 ml	Simple Purifying Cleansing Lotion is ideal for gently cleansing dry skin. With its creamy no-rinse formula, this Simple cleanser makes…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540370/pharmacy-app/pharmacy/Simple_Kind_to_Skin_Purifying_Cleansing__1780_1758540369491.jpg	2025-09-22 09:56:00.136	2025-09-22 11:26:10.348
1782	Simple Moisturising Facial Wash 150ml	Simple Moisturizing Facial Wash thoroughly cleanses your skin, removing oil, dirt, and other impurities without leaving it to feel dry…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540374/pharmacy-app/pharmacy/Simple_Moisturising_Facial_Wash_150ml_1782_1758540373337.jpg	2025-09-22 09:56:02.732	2025-09-22 11:26:14.466
1783	Simple Pure Soap Pack of 2	Simple pure soap cleanses and gently purifies your face and body. Its mild formula means it doesn’t irritate or upset…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540376/pharmacy-app/pharmacy/Simple_Pure_Soap_Pack_of_2_1783_1758540375193.jpg	2025-09-22 09:56:04.026	2025-09-22 11:26:16.412
1787	Sitrus SR Tablets 30’s	Round the clock Vitamin C protection! Also contains Zinc and Selenium for strong immunity. Each pack contains 30tablets.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540383/pharmacy-app/pharmacy/Sitrus_SR_Tablets_30_s_1787_1758540382973.jpg	2025-09-22 09:56:09.556	2025-09-22 11:26:24.644
1789	SK DERM Cream 30g	Used on skin infections such as ringworm, jock itch, athlete's foot, psoriasis, eczema, etc.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540388/pharmacy-app/pharmacy/SK_DERM_Cream_30g_1789_1758540387635.png	2025-09-22 09:56:12.375	2025-09-22 11:26:28.394
1791	Skin Doctor Massage Oil 200ml	It is Massage Oil is specially formulated to hydrate and soothe your skin, whilst leaving it feeling soft, smooth and…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540392/pharmacy-app/pharmacy/Skin_Doctor_Massage_Oil_200ml_1791_1758540392132.jpg	2025-09-22 09:56:14.916	2025-09-22 11:26:33.213
1793	Skins Double Chocolate Flavoured Lubricant 130ml	Experience double the delight with this deliciously chocolatey Double Chocolate Desire flavored sex lube. Lose yourself in the moment as…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540399/pharmacy-app/pharmacy/Skins_Double_Chocolate_Flavoured_Lubrica_1793_1758540398297.jpg	2025-09-22 09:56:19.592	2025-09-22 11:26:39.787
1794	Skins Excite Tingling Sex Lubricant 130ml	Skins Excite Tingling water based sex lube has all the fun and goodness of Aqua but with added zing. Packed…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540402/pharmacy-app/pharmacy/Skins_Excite_Tingling_Sex_Lubricant_130m_1794_1758540401583.jpg	2025-09-22 09:56:21.091	2025-09-22 11:26:42.805
1796	Skins Super Excite Intimate Pleasure Gel for Women	Give yourself just what you need to dial up your desire and liberate your libido with this female stimulating gel.…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540407/pharmacy-app/pharmacy/Skins_Super_Excite_Intimate_Pleasure_Gel_1796_1758540406255.jpg	2025-09-22 09:56:23.688	2025-09-22 11:26:47.525
1797	Skyn Original Condom 3’s	Skyn Original Non-Latex Condoms are made from Polyisoprene, a new non-latex material that provides a softer, more natural feel. These…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540410/pharmacy-app/pharmacy/Skyn_Original_Condom_3_s_1797_1758540409487.jpg	2025-09-22 09:56:25.018	2025-09-22 11:26:50.472
1798	SMA Pro 1 Infant Formula 800g	Breast milk substitute - suitable from birth to six months (stage 1).	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540412/pharmacy-app/pharmacy/SMA_Pro_1_Infant_Formula_800g_1798_1758540411267.jpg	2025-09-22 09:56:26.452	2025-09-22 11:26:52.481
1800	SMA Pro 3 Infant Formula 800g	Fortified milk drink for young children from 1 year onwards.	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540419/pharmacy-app/pharmacy/SMA_Pro_3_Infant_Formula_800g_1800_1758540418661.jpg	2025-09-22 09:56:29.059	2025-09-22 11:27:00.007
1802	Sofine Pure Virgin Olive Oil 120ml	Moisturizes skin and hair. For all skin types.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540423/pharmacy-app/pharmacy/Sofine_Pure_Virgin_Olive_Oil_120ml_1802_1758540422559.jpg	2025-09-22 09:56:31.371	2025-09-22 11:27:03.52
1804	Spring Valley Ashwagandha 500mg Capsules 60’s	Spring Valley Ashwagandha, supports general wellness, may also help moderate stress and support immune health	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540427/pharmacy-app/pharmacy/Spring_Valley_Ashwagandha_500mg_Capsules_1804_1758540426521.jpg	2025-09-22 09:56:34.543	2025-09-22 11:27:07.529
1806	Spring Valley Biotin 5,000mcg Capsules 120’s	Spring Valley Biotin Dietary Supplement Softgels help promote the health of skin, hair and nails by nourishing cells throughout the…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540431/pharmacy-app/pharmacy/Spring_Valley_Biotin_5_000mcg_Capsules_1_1806_1758540430484.jpg	2025-09-22 09:56:37.613	2025-09-22 11:27:11.412
1807	Spring Valley Extra Strength Biotin 10,000mcg Tablets 60’s	Biotin is a B-vitamin that may help support healthy energy metabolism, and the combination of biotin and keratin may support…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540433/pharmacy-app/pharmacy/Spring_Valley_Extra_Strength_Biotin_10_0_1807_1758540432330.jpg	2025-09-22 09:56:39.358	2025-09-22 11:27:13.695
1809	Spring Valley Extra Strength Probiotic Capsules	Contains prebiotic inulin and 10 probiotic strains, Provides 10 billion CFUs per capsule, Resistant to stomach acids, No gluten, dairy,…	170000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540437/pharmacy-app/pharmacy/Spring_Valley_Extra_Strength_Probiotic_C_1809_1758540436946.jpg	2025-09-22 09:56:41.985	2025-09-22 11:27:17.986
1811	Spring Valley Melatonin 5mg Tablets 240’s	Spring Valley Melatonin Tablets Dietary Supplement, 5 mg can help you get through those restless nights and achieve the amount…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540441/pharmacy-app/pharmacy/Spring_Valley_Melatonin_5mg_Tablets_240__1811_1758540441000.jpg	2025-09-22 09:56:44.782	2025-09-22 11:27:22.135
1812	St Ives Sea Salt and Pacific Kelp Body Wash 650ml	Skip the beach and step into the shower. This ocean-inspired body wash is made with sea salt extracts to exfoliate…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540443/pharmacy-app/pharmacy/St_Ives_Sea_Salt_and_Pacific_Kelp_Body_W_1812_1758540442771.jpg	2025-09-22 09:56:46.031	2025-09-22 11:27:23.78
1814	St. Ives Acne Control Apricot Scrub 283g	This apricot face scrub for acne using salicylic acid will help you say goodbye to blemishes. It will reduce breakouts…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540447/pharmacy-app/pharmacy/St__Ives_Acne_Control_Apricot_Scrub_283g_1814_1758540446165.jpg	2025-09-22 09:56:48.618	2025-09-22 11:27:27.518
1816	St. Ives Coconut Water & Orchid Body Wash 650ml	This paraben free, dermatologist tested formula hydrates for soft skin. Made with 100% natural coconut water and orchid extracts.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540450/pharmacy-app/pharmacy/St__Ives_Coconut_Water___Orchid_Body_Was_1816_1758540449704.jpg	2025-09-22 09:56:51.56	2025-09-22 11:27:30.755
1817	St. Ives Daily Hydrating Vitamin E and Avocado Body Lotion 621ml	Our Hydrating Vitamin E & Avocado Body Lotion replenishes lost moisture for hydrated, healthy-looking skin. Great for both dry hands…	31500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540451/pharmacy-app/pharmacy/St__Ives_Daily_Hydrating_Vitamin_E_and_A_1817_1758540451373.jpg	2025-09-22 09:56:52.752	2025-09-22 11:27:32.187
1819	St. Ives Fresh Skin Apricot Scrub 283g	St. Ives Fresh Skin Apricot Face Scrub deeply exfoliates and removes impurities for glowing skin.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540455/pharmacy-app/pharmacy/St__Ives_Fresh_Skin_Apricot_Scrub_283g_1819_1758540454951.png	2025-09-22 09:56:55.116	2025-09-22 11:27:36.493
1822	St. Ives Pampering Vanilla & Oat Milk Body Wash 650ml	St. Ives Vanilla & Oat Milk soothes the mind, body, and soul while cleansing skin with a sudsy sumptuous lather.…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540461/pharmacy-app/pharmacy/St__Ives_Pampering_Vanilla___Oat_Milk_Bo_1822_1758540460713.jpg	2025-09-22 09:56:58.674	2025-09-22 11:27:41.579
1823	St. Ives Pink Lemon & Mandarin Orange Exfoliating Body Wash 650ml	Made with zesty pink lemon and mandarin orange extracts, this exfoliating body wash gently polishes away imperfections for more even-toned…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540462/pharmacy-app/pharmacy/St__Ives_Pink_Lemon___Mandarin_Orange_Ex_1823_1758540462188.jpg	2025-09-22 09:57:00.04	2025-09-22 11:27:43.366
1825	St. Ives Renewing Skin Collagen & Elastin Moisturiser Cream 283g	See ya later, scale-igator (get it?). Inspired by collagen and elastin proteins, this lotion helps renew skin’s glow. Use morning…	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540470/pharmacy-app/pharmacy/St__Ives_Renewing_Skin_Collagen___Elasti_1825_1758540469223.png	2025-09-22 09:57:02.74	2025-09-22 11:27:50.572
1827	St. Ives Soothing Oatmeal & Shea Butter Body Lotion 621ml	When you’re feeling extra-dry, keep calm and smooth on this nourishing lotion infused with oats and shea butter. It keeps…	31500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540474/pharmacy-app/pharmacy/St__Ives_Soothing_Oatmeal___Shea_Butter__1827_1758540473553.jpg	2025-09-22 09:57:05.47	2025-09-22 11:27:54.576
1828	Sterimar Baby Nasal Spray 50ml	Indicated in the hygiene and nasal obstruction of your baby.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540476/pharmacy-app/pharmacy/Sterimar_Baby_Nasal_Spray_50ml_1828_1758540475365.jpg	2025-09-22 09:57:06.798	2025-09-22 11:27:56.517
1830	Strepsils Honey & Lemon Lozenges 24’s	Honey and Lemon flavour lozenges contain two antibacterial agents that help kill bacteria that may have caused your sore throat.…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540479/pharmacy-app/pharmacy/Strepsils_Honey___Lemon_Lozenges_24_s_1830_1758540479037.jpg	2025-09-22 09:57:09.053	2025-09-22 11:27:59.87
1831	Strepsils Orange Vitamin C Lozenges 36’s	Soothing effective relief for sore throats. Each pack contains 36 lozenges.	50400	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540481/pharmacy-app/pharmacy/Strepsils_Orange_Vitamin_C_Lozenges_36_s_1831_1758540480656.jpg	2025-09-22 09:57:10.333	2025-09-22 11:28:02.12
1833	Strepsils Sore Throat & Cough Lozenges 24’s	For sore throat and irritating coughs. Each pack contains 24 lozenges.	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540486/pharmacy-app/pharmacy/Strepsils_Sore_Throat___Cough_Lozenges_2_1833_1758540485162.jpg	2025-09-22 09:57:13.147	2025-09-22 11:28:07.59
1835	Stud 100 Densensitizing Spray for Men – 12g	STUD 100 contains a local anaesthetic, lidocaine, that works by reducing the sensitivity to touch of the penis just before intercourse (sex). …	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540491/pharmacy-app/pharmacy/Stud_100_Densensitizing_Spray_for_Men____1835_1758540490359.jpg	2025-09-22 09:57:15.664	2025-09-22 11:28:12.021
1837	Sudafed Blocked Nose Spray 15ml	Unblocks your nose fast. Lasts up to 10 hours. Non-Drowsy.	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540496/pharmacy-app/pharmacy/Sudafed_Blocked_Nose_Spray_15ml_1837_1758540495525.jpg	2025-09-22 09:57:18.204	2025-09-22 11:28:17.089
1838	Sudafed Congestion & Headache Relief Day & Night Capsules 16’s	Helping you fight your head cold day and night. Each pack contains 16capsules.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540499/pharmacy-app/pharmacy/Sudafed_Congestion___Headache_Relief_Day_1838_1758540499071.png	2025-09-22 09:57:19.472	2025-09-22 11:28:20.25
1840	Sudafed Sinus Pressure & Pain Tablets 12’s	Sudafed Sinus Pressure & Pain Tablets can offer you relief from the unpleasant, painful symptoms of sinus congestion.	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540504/pharmacy-app/pharmacy/Sudafed_Sinus_Pressure___Pain_Tablets_12_1840_1758540504137.png	2025-09-22 09:57:22.177	2025-09-22 11:28:25.015
1841	Sudocrem 125g	The unique formula has been clinically proven to help soothe, heal and protect delicate skin with its antiseptic properties. In…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540506/pharmacy-app/pharmacy/Sudocrem_125g_1841_1758540505653.jpg	2025-09-22 09:57:23.449	2025-09-22 11:28:26.448
1843	Sudocrem 400g	The unique formula has been clinically proven to help soothe, heal and protect delicate skin with its antiseptic properties. In…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540509/pharmacy-app/pharmacy/Sudocrem_400g_1843_1758540509091.jpg	2025-09-22 09:57:26.369	2025-09-22 11:28:30.351
1845	SUGAR FREE (Lactulose/ aspartame sugar substitute) 300’S		21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540513/pharmacy-app/pharmacy/SUGAR_FREE__Lactulose__aspartame_sugar_s_1845_1758540512960.jpg	2025-09-22 09:57:28.976	2025-09-22 11:28:34.156
1846	SUGAR FREE 100’S Lactulose/aspartame		11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540516/pharmacy-app/pharmacy/SUGAR_FREE_100_S_Lactulose_aspartame_1846_1758540515299.png	2025-09-22 09:57:30.101	2025-09-22 11:28:36.921
1848	Sundance Horny Goat Weed Complex Capsules 60’s	Horny goat weed contains chemicals which might help increase blood flow and improve sexual function by addressing low libido and…	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540525/pharmacy-app/pharmacy/Sundance_Horny_Goat_Weed_Complex_Capsule_1848_1758540524395.jpg	2025-09-22 09:57:32.619	2025-09-22 11:28:45.459
1850	Super Welgra ( Sildenafil / Dapoxetine ) Tablets 4’s	The combination of sildenafil/dapoxetine is used in the treatment of erectile dysfunction and premature ejaculation. Sildenafil belongs to a group…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540532/pharmacy-app/pharmacy/Super_Welgra___Sildenafil___Dapoxetine___1850_1758540532202.jpg	2025-09-22 09:57:35.234	2025-09-22 11:28:53.043
1851	Suspenso Perfume For Men 100ml	Inspired by Intenso by Dolce & Gabbana.	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540534/pharmacy-app/pharmacy/Suspenso_Perfume_For_Men_100ml_1851_1758540534072.jpg	2025-09-22 09:57:36.636	2025-09-22 11:28:55.337
1853	Tadalafil 5mg UK Tablets 28’s	Tadalafil is used to treat male sexual function problems (impotence or erectile dysfunction-ED). Tadalafil belongs to a group of medicines called…	56000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540540/pharmacy-app/pharmacy/Tadalafil_5mg_UK_Tablets_28_s_1853_1758540539639.png	2025-09-22 09:57:39.193	2025-09-22 11:29:01.07
1854	Tampax Regular Tampons 20’s	With up to eight hours of comfortable protection, you can live without limits even during your regular flow days. Free…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540542/pharmacy-app/pharmacy/Tampax_Regular_Tampons_20_s_1854_1758540541853.png	2025-09-22 09:57:40.489	2025-09-22 11:29:03.381
1869	The Ordinary Hyaluronic Acid 2% + B5 Serum 30ml	A hydrator that smooths and plumps with hyaluronic acid.	66000	100	\N	2025-09-22 09:57:58.715	2025-09-22 09:57:58.715
1857	Tea Tree Cleansing Facial Scrub 250ml	This Tea Tree Facial Scrub has been specially formulated to gently cleanse and stimulate your skin by helping to remove…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540549/pharmacy-app/pharmacy/Tea_Tree_Cleansing_Facial_Scrub_250ml_1857_1758540548482.jpg	2025-09-22 09:57:44.045	2025-09-22 11:29:10.664
1859	Tea Tree Facial Wipes (25 Wipes)	Specially formulated to help cleanse and refresh your skin. It minimizes breakouts, tones your skin, and unclogs pores with a…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540554/pharmacy-app/pharmacy/Tea_Tree_Facial_Wipes__25_Wipes__1859_1758540553633.jpg	2025-09-22 09:57:46.489	2025-09-22 11:29:14.636
1860	Tea Tree Foaming Cleanser 200ml	Tea Tree Foaming Facial Wash specially formulated to gently cleanse and stimulate your skin. 100% Pure Tea Tree Oil -…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540556/pharmacy-app/pharmacy/Tea_Tree_Foaming_Cleanser_200ml_1860_1758540555486.jpg	2025-09-22 09:57:47.759	2025-09-22 11:29:16.639
1862	The Ordinary AHA 30% + BHA 2% Peeling Solution 30ml	This is an exfoliating treatment designed to improve skin texture, reduce pore congestion, and target uneven skin tone.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540560/pharmacy-app/pharmacy/The_Ordinary_AHA_30____BHA_2__Peeling_So_1862_1758540559269.jpg	2025-09-22 09:57:50.242	2025-09-22 11:29:20.426
1863	The Ordinary Ascorbyl Glucoside Solution 12%	A vitamin C serum that brightens.	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540561/pharmacy-app/pharmacy/The_Ordinary_Ascorbyl_Glucoside_Solution_1863_1758540561056.jpg	2025-09-22 09:57:51.588	2025-09-22 11:29:22.085
1865	The Ordinary Buffet + Copper Peptides 1% 30ml	Targets advanced Signs of Aging and dryness. 1% Copper Peptides Repairs the look of fine lines & Wrinkles. Promotes Skin…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540566/pharmacy-app/pharmacy/The_Ordinary_Buffet___Copper_Peptides_1__1865_1758540565216.jpg	2025-09-22 09:57:53.943	2025-09-22 11:29:26.159
1867	The Ordinary Buffet Serum 30ml	The Ordinary Buffet is an all-rounder serum that helps to improve overall skin health. The anti-ageing serum contains a blend…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540569/pharmacy-app/pharmacy/The_Ordinary_Buffet_Serum_30ml_1867_1758540569328.jpg	2025-09-22 09:57:56.346	2025-09-22 11:29:30.152
1868	The Ordinary Glycolic Acid 7% Toning Solution 240ml	A daily glycolic acid toner that smooths skin texture, evens tone, and enhances luminosity.	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540572/pharmacy-app/pharmacy/The_Ordinary_Glycolic_Acid_7__Toning_Sol_1868_1758540571385.jpg	2025-09-22 09:57:57.544	2025-09-22 11:29:32.724
1871	The Ordinary Mandelic Acid 10% + HA Serum 30ml	A gentler exfoliant, in serum form.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540575/pharmacy-app/pharmacy/The_Ordinary_Mandelic_Acid_10____HA_Seru_1871_1758540574945.jpg	2025-09-22 09:58:01.07	2025-09-22 11:29:35.968
1873	The Ordinary Niacinamide 10% + Zinc 1% Serum 30ml	A universal serum for blemish-prone skin that smooths, brightens, and supports.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540578/pharmacy-app/pharmacy/The_Ordinary_Niacinamide_10____Zinc_1__S_1873_1758540578239.jpg	2025-09-22 09:58:03.4	2025-09-22 11:29:39.049
1874	The Ordinary Niacinamide/Hyaluronic Acid Combo 2IN1	A concentrated dose of Hyaluronic Acid 2% + B5, Niacinamide 10% + Zinc 1%, all in one powerful set. This…	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540581/pharmacy-app/pharmacy/The_Ordinary_Niacinamide_Hyaluronic_Acid_1874_1758540580941.jpg	2025-09-22 09:58:04.655	2025-09-22 11:29:41.969
1876	The Ordinary Salicylic Acid 2% Solution 30ml	A targeted serum for blemish-prone skin.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540589/pharmacy-app/pharmacy/The_Ordinary_Salicylic_Acid_2__Solution__1876_1758540588587.png	2025-09-22 09:58:07.391	2025-09-22 11:29:50.121
1878	The Ordinary Vitamin C 2% Solution	A Vitamin C brightening formula with HA spheres. Targets:  Dullness, Signs of Aging, Antioxidant Support, Uneven Skin Tone. For All…	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540592/pharmacy-app/pharmacy/The_Ordinary_Vitamin_C_2__Solution_1878_1758540591580.jpg	2025-09-22 09:58:09.877	2025-09-22 11:29:52.875
1880	Tigboderm Cream 15g	For skin irritation and skin infections caused by bacteria and fungi.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540596/pharmacy-app/pharmacy/Tigboderm_Cream_15g_1880_1758540595427.jpg	2025-09-22 09:58:12.497	2025-09-22 11:29:56.234
1881	Toff Plus Capsules 20’s	For relief of a runny nose, headache, fever and other symptoms associated with a flu.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540598/pharmacy-app/pharmacy/Toff_Plus_Capsules_20_s_1881_1758540597217.jpg	2025-09-22 09:58:13.69	2025-09-22 11:29:58.543
1883	Toothache Solution Clove Oil 7ml	Clove oil is a natural remedy which has been used since the 19th century to treat toothache.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540602/pharmacy-app/pharmacy/Toothache_Solution_Clove_Oil_7ml_1883_1758540601374.jpg	2025-09-22 09:58:16.124	2025-09-22 11:30:02.457
1885	Topicrem Ultra-Hydrating Body Milk 500ml	Topicrem Ultra-Moisturizing Body Milk is a body lotion specifically developed to relieve dryness, hypersensitivity, and dehydration.	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540605/pharmacy-app/pharmacy/Topicrem_Ultra_Hydrating_Body_Milk_500ml_1885_1758540605151.jpg	2025-09-22 09:58:18.653	2025-09-22 11:30:06
1887	Toractin (Cyproheptadine) Syrup 100ml	Toractin syrup contains cyproheptadine a first generation antihistamine that can provide relief from allergy symptoms such as watery eyes, runny…	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540610/pharmacy-app/pharmacy/Toractin__Cyproheptadine__Syrup_100ml_1887_1758540610013.jpg	2025-09-22 09:58:21.038	2025-09-22 11:30:10.843
1889	Touch Me Anti-aging Soap 135g	Prevents wrinkles.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540614/pharmacy-app/pharmacy/Touch_Me_Anti_aging_Soap_135g_1889_1758540613898.jpg	2025-09-22 09:58:23.755	2025-09-22 11:30:14.991
1890	Touch Me Fade Out Fairness Soap 135g		8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540616/pharmacy-app/pharmacy/Touch_Me_Fade_Out_Fairness_Soap_135g_1890_1758540616150.jpg	2025-09-22 09:58:24.926	2025-09-22 11:30:21.566
1891	Touch Me Herbal Extracts Acne Soap 135g	Treats and prevents acne. For clear skin all year long	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540623/pharmacy-app/pharmacy/Touch_Me_Herbal_Extracts_Acne_Soap_135g_1891_1758540622659.jpg	2025-09-22 09:58:26.045	2025-09-22 11:30:23.761
1895	Tres-Orix Forte Syrup 250ml	Tres Orix Forte is a highly recommended vitamin fortified supplement which greatly increases appetite and aids weight gain. It increases…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540632/pharmacy-app/pharmacy/Tres_Orix_Forte_Syrup_250ml_1895_1758540631868.jpg	2025-09-22 09:58:30.869	2025-09-22 11:30:32.806
1897	Trimetabol Syrup150ml	Trimetabol is specifically thought to treat lack of appetite and cause weight gain ,because it influences every aspect of the…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540637/pharmacy-app/pharmacy/Trimetabol_Syrup150ml_1897_1758540637145.jpg	2025-09-22 09:58:33.37	2025-09-22 11:30:38.471
1898	Trimex Paediatric Syrup 60ml	Cough expectorant for chest cough in children.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540640/pharmacy-app/pharmacy/Trimex_Paediatric_Syrup_60ml_1898_1758540639283.jpg	2025-09-22 09:58:34.528	2025-09-22 11:30:40.443
1900	Trust Ribbed Condoms 3’s	TRUST Ribbed Condoms Size: 3 Pack Condoms Special Feature: Ultra-Thin, Lubricated, Ribbed Material: Natural Rubber Latex	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540648/pharmacy-app/pharmacy/Trust_Ribbed_Condoms_3_s_1900_1758540647302.jpg	2025-09-22 09:58:36.808	2025-09-22 11:30:48.464
1901	Trust Scented Condoms 3’s	TRUST SCENTED CONDOMS Size: 24 Quantity (3 Pack Condoms) Special Feature: Ultra Thin, Lubricated, Scented Item Package Quantity: 1 Material:…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540650/pharmacy-app/pharmacy/Trust_Scented_Condoms_3_s_1901_1758540650152.jpg	2025-09-22 09:58:38.204	2025-09-22 11:30:51.521
1903	Tyzorin Lozenges 24’s	Looking for a quick solution to a painful sore throat and mouth infections? Look no further – Tyzorin Lozenges will…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540654/pharmacy-app/pharmacy/Tyzorin_Lozenges_24_s_1903_1758540653708.jpg	2025-09-22 09:58:40.557	2025-09-22 11:30:54.787
1904	Tyzorin Mouthwash 200ml	Tyzorin Mouth Wash – simply rinse-retain-spit-repeat to say goodbye to germs and hello to healthier oral hygiene.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540656/pharmacy-app/pharmacy/Tyzorin_Mouthwash_200ml_1904_1758540655572.jpg	2025-09-22 09:58:41.724	2025-09-22 11:30:57.007
1906	Ultimate Organics Cocoa & Shea Butter Body Lotion 355ml	Skin is left with a radiant, beautiful glow. Helps to fade blemishes and unattractive scars and marks.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540662/pharmacy-app/pharmacy/Ultimate_Organics_Cocoa___Shea_Butter_Bo_1906_1758540662103.jpg	2025-09-22 09:58:44.119	2025-09-22 11:31:03.064
1908	Ultimate Organics Olive Oil Body Lotion 355ml	Rejuvenates Dry, Ashy, Flaky skin by totally moisturizing difficult to treat areas like knees, elbows and heels.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540665/pharmacy-app/pharmacy/Ultimate_Organics_Olive_Oil_Body_Lotion__1908_1758540665307.jpg	2025-09-22 09:58:46.595	2025-09-22 11:31:06.262
1909	Ultimate Originals Olive Oil Moisturizing Body Whip 426g	It restores dried out, ashy, flaky skin by completely moisturizing tough to treat areas like knees, elbows and heels.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540667/pharmacy-app/pharmacy/Ultimate_Originals_Olive_Oil_Moisturizin_1909_1758540667012.jpg	2025-09-22 09:58:47.867	2025-09-22 11:31:07.937
1911	Ultra Vitamin D3 1000IU 96’s	Ultra Vitamin D provides D3, which is the preferred form of vitamin D. Supports normal immune system function. For strong…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540672/pharmacy-app/pharmacy/Ultra_Vitamin_D3_1000IU_96_s_1911_1758540671629.png	2025-09-22 09:58:50.371	2025-09-22 11:31:12.968
1912	Ultrasolv Syrup 120ml	Ultrasolv is a medicine that is used for treatment of chronic obstructive pulmonary disorder, cough, chest congestion, bronchiectasis and other…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540674/pharmacy-app/pharmacy/Ultrasolv_Syrup_120ml_1912_1758540673896.png	2025-09-22 09:58:51.677	2025-09-22 11:31:14.92
1914	Unifed DM Syrup 120ml	Relieves dry cough and nasal congestion.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540678/pharmacy-app/pharmacy/Unifed_DM_Syrup_120ml_1914_1758540677836.jpg	2025-09-22 09:58:54.523	2025-09-22 11:31:18.786
1916	Unifed Extra Syrup 120ml	Relieves cough and cold symptoms.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540682/pharmacy-app/pharmacy/Unifed_Extra_Syrup_120ml_1916_1758540681448.jpg	2025-09-22 09:58:56.999	2025-09-22 11:31:22.49
1918	Uniortho – 500 Tablets 10’s	Uniortho-500 Tablet is a blend of extracts of Scutellaria Baicalensis and Acacia Catechu which is used to relieve the pain,…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540686/pharmacy-app/pharmacy/Uniortho___500_Tablets_10_s_1918_1758540685236.jpg	2025-09-22 09:58:59.321	2025-09-22 11:31:26.339
1920	Urisol Sachets 10’s	Urisol Sachets provide an effective and convenient solution for managing urinary discomfort, particularly in cases of urinary tract infections (UTIs).…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540689/pharmacy-app/pharmacy/Urisol_Sachets_10_s_1920_1758540688673.jpg	2025-09-22 09:59:01.731	2025-09-22 11:31:29.846
1922	USN Fast Grow Anabolic GH Ultra Lean Gainer 4kg (80 Scoops)	USN Fast Grow Anabolic GH is a powerful lean mass gainer for reaching hardcore goals. It supports building and maintaining…	300000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540693/pharmacy-app/pharmacy/USN_Fast_Grow_Anabolic_GH_Ultra_Lean_Gai_1922_1758540692700.jpg	2025-09-22 09:59:04.105	2025-09-22 11:31:33.788
1923	USN Hyperbolic Mass GH Extreme Mass Gainer 1kg (13 Scoops)	USN Hyperbolic Mass Gainer is a high-performance supplement designed to accelerate muscle growth and boost energy. Packed with essential nutrients,…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540695/pharmacy-app/pharmacy/USN_Hyperbolic_Mass_GH_Extreme_Mass_Gain_1923_1758540694576.jpg	2025-09-22 09:59:05.369	2025-09-22 11:31:35.695
1925	USN Hyperbolic Mass GH Powder 2kg	USN Hyperbolic Mass Gainer is a high-performance supplement designed to accelerate muscle growth and boost energy. Packed with essential nutrients,…	138000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540702/pharmacy-app/pharmacy/USN_Hyperbolic_Mass_GH_Powder_2kg_1925_1758540701528.jpg	2025-09-22 09:59:07.871	2025-09-22 11:31:42.608
1926	USN Pure Creatine Monohydrate Powder 410g	Creatine serves as a high energy bond in muscle and nerve tissues for maintenance of ATP levels during muscular contraction,…	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540704/pharmacy-app/pharmacy/USN_Pure_Creatine_Monohydrate_Powder_410_1926_1758540703797.jpg	2025-09-22 09:59:09.289	2025-09-22 11:31:45.117
1928	UVBLOCK Sunscreen Lotion SPF30	Sunscreen lotion brightens the skin tone and maintains moisture of skin.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540709/pharmacy-app/pharmacy/UVBLOCK_Sunscreen_Lotion_SPF30_1928_1758540708348.jpg	2025-09-22 09:59:11.931	2025-09-22 11:31:49.654
1930	Valupak Cranberry Tablets 30’s	Valupak Herbals Cranberry Tablets may aid urinary health and prevent urinary tract infections. Each pack contains 30tablets.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540712/pharmacy-app/pharmacy/Valupak_Cranberry_Tablets_30_s_1930_1758540712083.jpg	2025-09-22 09:59:14.619	2025-09-22 11:31:53.206
1932	Valupak Garlic Capsules 30’s	Garlic plays a role in the health of the heart and cardiovascular system as well as helping to support the…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540716/pharmacy-app/pharmacy/Valupak_Garlic_Capsules_30_s_1932_1758540715454.jpg	2025-09-22 09:59:17.256	2025-09-22 11:31:56.351
1934	Valupak Omega-3 Fish Oil Capsules 90’s	Omega-3 contributes to a healthy heart and mind. Increase your daily intake and enjoy feeling happier and healthier with these…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540719/pharmacy-app/pharmacy/Valupak_Omega_3_Fish_Oil_Capsules_90_s_1934_1758540719022.jpg	2025-09-22 09:59:19.874	2025-09-22 11:32:00.017
1935	Valupak Selenium & A,C,E One-A-Day Tablets 30’s	A specially blended formulation providing the mineral Selenium, fortified with Vitamins A, C, and E. Selenium, Vitamin C, and Vitamin…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540721/pharmacy-app/pharmacy/Valupak_Selenium___A_C_E_One_A_Day_Table_1935_1758540720796.jpg	2025-09-22 09:59:21.352	2025-09-22 11:32:01.809
1937	Valupak Vitamin D3 1000IU 60’s	Plays a role in the normal absorption and utilisation of calcium and helps maintain normal bones and teeth. Boosts immunity,…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540726/pharmacy-app/pharmacy/Valupak_Vitamin_D3_1000IU_60_s_1937_1758540725520.jpg	2025-09-22 09:59:24.321	2025-09-22 11:32:06.599
1938	Valupak Vitamin D3 5000IU Tablets 30’s	Vitamin D3 plays a role in the normal absorption and utilization of calcium and helps maintain normal bones and teeth.…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540728/pharmacy-app/pharmacy/Valupak_Vitamin_D3_5000IU_Tablets_30_s_1938_1758540727516.jpg	2025-09-22 09:59:25.825	2025-09-22 11:32:08.565
1940	Vaseline Aloe Fresh Petroleum Jelly 240g	Speeds up your skin’s natural recovery and protects against dry skin as it heals.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540731/pharmacy-app/pharmacy/Vaseline_Aloe_Fresh_Petroleum_Jelly_240g_1940_1758540731188.jpg	2025-09-22 09:59:28.444	2025-09-22 11:32:12.355
1942	Vaseline Baby Petroleum Jelly 240ml	Locks moisture to help treat and prevent chaffed skin from diaper rash with a light baby powder fragrance.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540736/pharmacy-app/pharmacy/Vaseline_Baby_Petroleum_Jelly_240ml_1942_1758540735280.jpg	2025-09-22 09:59:30.875	2025-09-22 11:32:16.38
1943	Vaseline Blue Seal Men Cooling Petroleum Jelly 240ml	Is triple purified and locks in moisture to keep skin soft and smooth.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540737/pharmacy-app/pharmacy/Vaseline_Blue_Seal_Men_Cooling_Petroleum_1943_1758540737033.jpg	2025-09-22 09:59:32.05	2025-09-22 11:32:18.026
1945	Vaseline Blue Seal Original Petroleum Jelly 240g	Made with 100% pure petroleum jelly, triple-purified to lock in moisture for healing and protection against dry skin.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540741/pharmacy-app/pharmacy/Vaseline_Blue_Seal_Original_Petroleum_Je_1945_1758540740776.jpg	2025-09-22 09:59:34.484	2025-09-22 11:32:21.881
1947	Vaseline Cocoa Butter Lip Therapy 20g	Protects and relieves dry and chapped lips, while locking in moisture to help keep them healthy. Instantly softens and soothes…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540745/pharmacy-app/pharmacy/Vaseline_Cocoa_Butter_Lip_Therapy_20g_1947_1758540744452.jpg	2025-09-22 09:59:37.014	2025-09-22 11:32:25.665
1948	Vaseline Intensive Care Advanced Repair Body Lotion 725ml	Vaseline Advanced Repair Body Lotion can moisturize and repair stubborn dry skin.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540747/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Advanced_Repair__1948_1758540746256.jpg	2025-09-22 09:59:38.356	2025-09-22 11:32:27.251
1950	Vaseline Intensive Care Cocoa Glow Lotion 400ml	Naturally Healthy, Naturally Glowing Skin.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540753/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Cocoa_Glow_Lotio_1950_1758540752780.jpg	2025-09-22 09:59:41.129	2025-09-22 11:32:33.758
1951	Vaseline Intensive Care Cocoa Glow Lotion 725ml	Naturally Healthy, Naturally Glowing Skin.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540755/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Cocoa_Glow_Lotio_1951_1758540754357.jpg	2025-09-22 09:59:42.518	2025-09-22 11:32:35.234
1953	Vaseline Intensive Care Healthy Hands Stronger Nails Hand Cream 200ml	Smooth hands and strong nails in just 2 weeks.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540759/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Healthy_Hands_St_1953_1758540758391.jpg	2025-09-22 09:59:44.972	2025-09-22 11:32:39.8
1955	Vaseline Lip Therapy Original 20g	Vaseline Original Lip Therapy 20g contains Vaseline jelly to lock in moisture, preventing and healing dry, chapped lips. Non-sticky formula.…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540763/pharmacy-app/pharmacy/Vaseline_Lip_Therapy_Original_20g_1955_1758540762426.jpg	2025-09-22 09:59:47.84	2025-09-22 11:32:43.493
1956	Vaseline Petroleum Jelly 90ml	Locks moisture to help treat and prevent chaffed skin from diaper rash with a light baby powder fragrance.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540765/pharmacy-app/pharmacy/Vaseline_Petroleum_Jelly_90ml_1956_1758540764349.jpg	2025-09-22 09:59:49.273	2025-09-22 11:32:45.327
1958	Ventolin Evohaler 200doses	For relief of obstructive airway disease symptoms like wheezing, chest tightness and breathlessness.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540768/pharmacy-app/pharmacy/Ventolin_Evohaler_200doses_1958_1758540768077.jpg	2025-09-22 09:59:51.959	2025-09-22 11:32:49.423
1960	Viagra 100mg Tablet	Viagra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540773/pharmacy-app/pharmacy/Viagra_100mg_Tablet_1960_1758540772558.jpg	2025-09-22 09:59:55.036	2025-09-22 11:32:53.672
1961	Viagra 50mg Tablet	Viagra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540775/pharmacy-app/pharmacy/Viagra_50mg_Tablet_1961_1758540774450.jpg	2025-09-22 09:59:56.441	2025-09-22 11:32:55.522
1963	Vicks Inhaler Nasal Stick	Vicks Inhaler Nasal Stick provides fast relief from stuffy noses.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540779/pharmacy-app/pharmacy/Vicks_Inhaler_Nasal_Stick_1963_1758540779103.jpg	2025-09-22 09:59:59.158	2025-09-22 11:33:00.392
1966	Victoria’s Secret Pure Seduction Body Mist for Women 250ml	Lighter than a traditional womens perfume, Pure Seduction fragrance mist is the perfect flirty floral sweet perfume. This body splash…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540785/pharmacy-app/pharmacy/Victoria_s_Secret_Pure_Seduction_Body_Mi_1966_1758540784678.jpg	2025-09-22 10:00:03.404	2025-09-22 11:33:05.516
1968	Victoria’s Secret Tropic Rain Fragrance Mist 250ml	Fragrance mists provide that fresh-from-the-shower scent and feel, giving you a subtle but pleasant body scent that's never overpowering. Their…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540788/pharmacy-app/pharmacy/Victoria_s_Secret_Tropic_Rain_Fragrance__1968_1758540787717.jpg	2025-09-22 10:00:06.374	2025-09-22 11:33:08.812
1969	Victoria’s Secret Amber Romance Fragrance Mist 250ml	A warm and alluring fragrance for women. Mist your body with this vibrant, irresistible blend of black cherry, creme anglaise,…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540790/pharmacy-app/pharmacy/Victoria_s_Secret_Amber_Romance_Fragranc_1969_1758540789430.jpg	2025-09-22 10:00:07.683	2025-09-22 11:33:10.26
1970	Vifex Syrup 100ml	It works by relaxing the muscles in the walls of the small airways in the lungs. It is used for…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540791/pharmacy-app/pharmacy/Vifex_Syrup_100ml_1970_1758540791055.jpg	2025-09-22 10:00:08.896	2025-09-22 11:33:12.043
1972	VIP Xchange Perfume by L’orientale Fragrances 100ml	An impresssive masculine scent for confident men that always leaves a good trail.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540796/pharmacy-app/pharmacy/VIP_Xchange_Perfume_by_L_orientale_Fragr_1972_1758540795409.jpg	2025-09-22 10:00:11.556	2025-09-22 11:33:16.412
1974	Visco Liquid Antacid 200ml	It is commonly used for the treatment of gastro-esophageal reflux disease, heartburn , acid indigestion.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540801/pharmacy-app/pharmacy/Visco_Liquid_Antacid_200ml_1974_1758540800816.jpg	2025-09-22 10:00:13.833	2025-09-22 11:33:21.63
1976	Visocor OM60 Blood Pressure Machine	Visocor blood pressure monitor for wrist is clinically tested and proven for accuracy. It can automatically measures voltage and pulse…	220000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540808/pharmacy-app/pharmacy/Visocor_OM60_Blood_Pressure_Machine_1976_1758540807951.jpg	2025-09-22 10:00:16.187	2025-09-22 11:33:29.101
1977	Vitamin C (Ascorbic Acid) 100mg 100’s	A vitamin supplement containing Ascorbic acid 100mg commonly known as vitamin C. It is used for prevention and treatment of…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540810/pharmacy-app/pharmacy/Vitamin_C__Ascorbic_Acid__100mg_100_s_1977_1758540809849.jpg	2025-09-22 10:00:17.31	2025-09-22 11:33:31.332
1979	Vitona Plus Energizer 12’s	VITONA Plus is an effective energizer and biotonic for vitality and for improving general body functions.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540814/pharmacy-app/pharmacy/Vitona_Plus_Energizer_12_s_1979_1758540813906.jpg	2025-09-22 10:00:19.559	2025-09-22 11:33:34.859
1981	Waterguard Tablets	WaterGuard Tablets Size: 80 tablets Special Feature: 1 tablet treats 20 litres Item Package Quantity: 8 strips containing blister of…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540818/pharmacy-app/pharmacy/Waterguard_Tablets_1981_1758540817929.png	2025-09-22 10:00:21.939	2025-09-22 11:33:39.13
1982	Webber Naturals Magnesium Bisglycinate 200mg Capsules 120’s	Magnesium bisglycinate is needed for more than 300 enzymatic reactions in the body. It is required for the formation of…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540820/pharmacy-app/pharmacy/Webber_Naturals_Magnesium_Bisglycinate_2_1982_1758540820029.png	2025-09-22 10:00:23.095	2025-09-22 11:33:41.821
1983	Well’s Olive Oil BP 70ml	Use for skin softening and massage. Also for culinary use in dressings and salads.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540823/pharmacy-app/pharmacy/Well_s_Olive_Oil_BP_70ml_1983_1758540822942.jpg	2025-09-22 10:00:24.294	2025-09-22 11:33:43.915
1985	WellKid Immune Chewable Tablets 30’s	A special formulation of 24 nutrients, Wellkid Immune Chewable is a clever way to safeguard your child’s intake of a…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540827/pharmacy-app/pharmacy/WellKid_Immune_Chewable_Tablets_30_s_1985_1758540827087.jpg	2025-09-22 10:00:27.172	2025-09-22 11:33:48.098
1987	Wellman 70+ 30’s	A carefully formulated supplement for men 70 and over, specially developed to support areas of health particularly relevant to men…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540831/pharmacy-app/pharmacy/Wellman_70__30_s_1987_1758540830758.png	2025-09-22 10:00:29.683	2025-09-22 11:33:51.86
1989	Wellman Max Tablets/Capsules 84’s	The comprehensive micronutrient formula helps maintain health and vitality with pantothenic acid which contributes to normal mental performance	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540836/pharmacy-app/pharmacy/Wellman_Max_Tablets_Capsules_84_s_1989_1758540835756.png	2025-09-22 10:00:32.51	2025-09-22 11:33:57.606
1990	Wellman Original 30’s	Our flagship multivitamin for men with 29 nutrients, specially developed to help maintain overall health and vitality.	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540839/pharmacy-app/pharmacy/Wellman_Original_30_s_1990_1758540838564.jpg	2025-09-22 10:00:33.764	2025-09-22 11:33:59.479
1992	Wellman Prostace 60’s	Wellman Prostace is a dietary supplement that contains a combination of ingredients such as vitamins, minerals for all round health and wellbeing…	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540842/pharmacy-app/pharmacy/Wellman_Prostace_60_s_1992_1758540842124.png	2025-09-22 10:00:36.07	2025-09-22 11:34:03.289
1993	Wellman Sport 30’s	A specialist supplement developed for men involved in sports, fitness and gym. Includes 27 nutrients that support performance, including iron…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540845/pharmacy-app/pharmacy/Wellman_Sport_30_s_1993_1758540844353.png	2025-09-22 10:00:37.507	2025-09-22 11:34:05.342
1995	Wellteen Her 30’s	When nutrient requirements are changing fast, Wellteen Her safeguards the nutrition that helps young women take the world on. With…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540848/pharmacy-app/pharmacy/Wellteen_Her_30_s_1995_1758540847821.png	2025-09-22 10:00:39.992	2025-09-22 11:34:09.08
1996	Wellteen Her Plus 56’s	Optimised for younger female health, Wellteen Her Plus is our maximum level of support for women and girls aged 13…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540850/pharmacy-app/pharmacy/Wellteen_Her_Plus_56_s_1996_1758540849851.png	2025-09-22 10:00:41.366	2025-09-22 11:34:11.168
2011	Wisdom Dual Texture Toothbrush	Easy grip handle for maximum control. Dual texture medium & filaments.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540882/pharmacy-app/pharmacy/Wisdom_Dual_Texture_Toothbrush_2011_1758540882030.jpg	2025-09-22 10:00:58.662	2025-09-22 11:34:43.102
2014	Wisdom Kids Step by Step Toothbrush 3-5 Years	Ideal for cleaning milk teeth.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540887/pharmacy-app/pharmacy/Wisdom_Kids_Step_by_Step_Toothbrush_3_5__2014_1758540886757.jpg	2025-09-22 10:01:02.037	2025-09-22 11:34:47.739
19	21st Century Acidophilus Probiotic Blend Capsules 100’s	Acidophilus Probiotic Blend is a fantastic supplement for anyone looking to enhance their gut health and improve digestion. It reduces…	88000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536425/pharmacy-app/pharmacy/21st_Century_Acidophilus_Probiotic_Blend_19_1758536424260.jpg	2025-09-22 09:04:39.315	2025-09-22 10:20:25.964
1999	Wellwoman 50+ 30’s	Enhanced vitamin and mineral formula to help maintain health and vitality. With specific support for brain, eyes and heart.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540857/pharmacy-app/pharmacy/Wellwoman_50__30_s_1999_1758540856385.png	2025-09-22 10:00:44.757	2025-09-22 11:34:17.473
2001	Wellwoman Max 84’s	Advanced micronutrient tablets with Omega 3-6-9 capsules plus calcium & vitamin D tablets.	117500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540864/pharmacy-app/pharmacy/Wellwoman_Max_84_s_2001_1758540863832.png	2025-09-22 10:00:47.008	2025-09-22 11:34:25.197
2002	Wellwoman Original 30’s	Our flagship multivitamin for women with evening primrose oil and starflower oil, specially developed to help maintain overall health and…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540867/pharmacy-app/pharmacy/Wellwoman_Original_30_s_2002_1758540866636.jpg	2025-09-22 10:00:48.138	2025-09-22 11:34:27.628
2004	Wet N Wild Condoms 3’s	Wet N Wild Premium Latex 3 Condoms come with extra lubrication and are ultra thin to increase sensation for a…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540871/pharmacy-app/pharmacy/Wet_N_Wild_Condoms_3_s_2004_1758540870542.jpg	2025-09-22 10:00:50.398	2025-09-22 11:34:31.55
2005	Wisdom  Coolmint Antibacterial Mouthwash 500ml	Freshens and protects your gums and teeth.	33500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540873/pharmacy-app/pharmacy/Wisdom__Coolmint_Antibacterial_Mouthwash_2005_1758540872466.jpg	2025-09-22 10:00:51.632	2025-09-22 11:34:33.461
2008	Wisdom Dental Floss Mint Waxed 100m	Cleans between the teeth and below the gum line.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540878/pharmacy-app/pharmacy/Wisdom_Dental_Floss_Mint_Waxed_100m_2008_1758540878221.jpg	2025-09-22 10:00:55.046	2025-09-22 11:34:39.093
2009	Wisdom Denture Brush	Effective Denture Cleaning.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540880/pharmacy-app/pharmacy/Wisdom_Denture_Brush_2009_1758540879926.jpg	2025-09-22 10:00:56.414	2025-09-22 11:34:41.039
2016	Wisdom Step by Step Toothbrush 6+ years	Perfect for cleaning the mix of milk and adult teeth.	15500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540891/pharmacy-app/pharmacy/Wisdom_Step_by_Step_Toothbrush_6__years_2016_1758540890711.jpg	2025-09-22 10:01:04.395	2025-09-22 11:34:51.664
2018	Worlds of Curl activator gel	Worlds of Curls Activator gel Starts to Work Instantly; Stimulating and Locking Your Hair Into Lustrous Curls Without Leaving It…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540895/pharmacy-app/pharmacy/Worlds_of_Curl_activator_gel_2018_1758540895179.jpg	2025-09-22 10:01:06.67	2025-09-22 11:34:56.3
2020	Xylo Acino 0.05% Nasal Spray 10ml	Xylo Acino 0.05% is used to reduce symptoms of nasal congestion, allergic rhinitis, and sinusitis. It aids breathing through the…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540899/pharmacy-app/pharmacy/Xylo_Acino_0_05__Nasal_Spray_10ml_2020_1758540898905.jpg	2025-09-22 10:01:08.922	2025-09-22 11:34:59.916
2021	Yoko Collagen Cream 50g	This collagen firming cream helps to ease out skin dryness and dehydration.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540901/pharmacy-app/pharmacy/Yoko_Collagen_Cream_50g_2021_1758540900668.jpg	2025-09-22 10:01:10.171	2025-09-22 11:35:02.026
2023	Zara Man Perfume100ml	Zara Man is opulent and classically dark its fragrance is in line with the best creations of the best perfume…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540906/pharmacy-app/pharmacy/Zara_Man_Perfume100ml_2023_1758540905763.jpg	2025-09-22 10:01:12.668	2025-09-22 11:35:06.74
2025	Zecuf Herbal Lozenges 20’s	Zecuf lozenges soothe the throat, hence providing symptomatic relief from cough, hoarseness, flu and sore throat. Each pack contains 20…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540914/pharmacy-app/pharmacy/Zecuf_Herbal_Lozenges_20_s_2025_1758540913219.jpg	2025-09-22 10:01:15.237	2025-09-22 11:35:14.101
2026	Zecuf Lozenges Orange 20’s	Zecuf lozenges are herbal cough lozenges that treat a sore throat caused by respiratory infections and hoarseness. Each pack contains…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540915/pharmacy-app/pharmacy/Zecuf_Lozenges_Orange_20_s_2026_1758540914863.jpg	2025-09-22 10:01:16.416	2025-09-22 11:35:15.874
2028	Zentel Albendazole 400mg Suspension 20ml	For routine deworming and treatment of worm infestation.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540920/pharmacy-app/pharmacy/Zentel_Albendazole_400mg_Suspension_20ml_2028_1758540919365.png	2025-09-22 10:01:21.325	2025-09-22 11:35:20.325
2030	Zifam Era-DN Capsules 30’s	Zifam Era- DN capsule is especially formulated to prevent diabetic neuropathy. It improves the patient’s condition by normalizing the formation…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540923/pharmacy-app/pharmacy/Zifam_Era_DN_Capsules_30_s_2030_1758540922708.jpg	2025-09-22 10:01:24.629	2025-09-22 11:35:23.6
2031	Zimune D3 Tablets 30’s	Triple action immunity booster! Contains Vitamin C, Vitamin D3 and Zinc. Each pack contains 30 tablets.	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540925/pharmacy-app/pharmacy/Zimune_D3_Tablets_30_s_2031_1758540924384.jpg	2025-09-22 10:01:25.734	2025-09-22 11:35:25.499
2033	ZINC SULPHATE 20MG zinc sulphate 20MG 10 Tablet		1000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540928/pharmacy-app/pharmacy/ZINC_SULPHATE_20MG_zinc_sulphate_20MG_10_2033_1758540928077.jpg	2025-09-22 10:01:28.296	2025-09-22 11:35:29.364
2035	Zyncet Cetirizine 10mg Tablets 10’s	For relief of allergic symptoms like rhinitis, cough and skin rash.	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540932/pharmacy-app/pharmacy/Zyncet_Cetirizine_10mg_Tablets_10_s_2035_1758540932013.jpg	2025-09-22 10:01:31.572	2025-09-22 11:35:33.136
2036	Zyncet Cetirizine Syrup 100ml	For relief of allergy symptoms.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540934/pharmacy-app/pharmacy/Zyncet_Cetirizine_Syrup_100ml_2036_1758540933735.jpg	2025-09-22 10:01:32.651	2025-09-22 11:35:34.836
23	21st Century Alaska Wild Fish Oil Mega Omega-3 Capsules 90’s	Alaska Wild Fish Oil is a premium concentrate of omega-3 fatty acids to support a healthy heart, joint, immune, skin,…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536429/pharmacy-app/pharmacy/21st_Century_Alaska_Wild_Fish_Oil_Mega_O_23_1758536429025.jpg	2025-09-22 09:04:39.316	2025-09-22 10:20:30.058
20	21st Century Biotin 5000mcg Capsules 110’s	21st Century Biotin 5000mcg capsules promote healthy hair growth by strengthening hair follicles, it also strengthens nails and maintains proper…	77000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536434/pharmacy-app/pharmacy/21st_Century_Biotin_5000mcg_Capsules_110_20_1758536433307.jpg	2025-09-22 09:04:39.318	2025-09-22 10:20:34.429
24	21st Century Cranberry Plus Probiotic Plus Vitamin C Tablets 60’s	The 21st Century Cranberry Plus Probiotic with added Vitamin C provides flushing support to help promote urinary tract health and…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536440/pharmacy-app/pharmacy/21st_Century_Cranberry_Plus_Probiotic_Pl_24_1758536439198.jpg	2025-09-22 09:04:45.321	2025-09-22 10:20:40.396
31	21st Century Garlic Extract	Garlic Extract provides a high concentration of allicin, for supporting heart and circulatory health. Enteric-coated tablets help reduce the unpleasant…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536446/pharmacy-app/pharmacy/21st_Century_Garlic_Extract_31_1758536445277.jpg	2025-09-22 09:04:51.323	2025-09-22 10:20:46.44
30	21st Century Ginseng Extract Capsules 60’s	Ginseng has beneficial antioxidant and anti-inflammatory properties and improves brain functions like memory, behavior, and mood, it enhances the function…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536449/pharmacy-app/pharmacy/21st_Century_Ginseng_Extract_Capsules_60_30_1758536448854.png	2025-09-22 09:04:51.325	2025-09-22 10:20:50.406
50	21st Century Niacinamide 500mg Tablets 110’s	21st Century Niacinamide 500mg Tablet is a dietary supplement containing Niacinamide also known as nicotinamide, which is a water-soluble form…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536457/pharmacy-app/pharmacy/21st_Century_Niacinamide_500mg_Tablets_1_50_1758536456824.jpg	2025-09-22 09:16:37.408	2025-09-22 10:20:58.087
51	21st Century Norwegian Cod Liver Oil 400mg Capsules 110’s	Cod Liver Oil supports heart health, vision, skin, and immune function, and promotes calcium absorption for strong bones.	69000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536459/pharmacy-app/pharmacy/21st_Century_Norwegian_Cod_Liver_Oil_400_51_1758536458897.jpg	2025-09-22 09:16:38.849	2025-09-22 10:20:59.872
52	21st Century Prostate Health	21st Century Prostate Health, a comprehensive supplement specifically formulated to support the optimal function and well-being of the prostate gland.	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536461/pharmacy-app/pharmacy/21st_Century_Prostate_Health_52_1758536460536.jpg	2025-09-22 09:16:40.506	2025-09-22 10:21:01.324
54	21st Century Selenium 200mcg Capsules 60’s	Selenium plays a vital role in supporting the immune system, helping your body fight off infections and illnesses, its crucial…	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536464/pharmacy-app/pharmacy/21st_Century_Selenium_200mcg_Capsules_60_54_1758536464088.jpg	2025-09-22 09:16:43.25	2025-09-22 10:21:05.177
57	21st Century VitaJoy Adult Multi Gummies 120’s	21st Century vitajoy adult Multi Gummies supplement your daily vitamin needs.* These gummies with naturally sourced fruit flavors Taste great…	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536471/pharmacy-app/pharmacy/21st_Century_VitaJoy_Adult_Multi_Gummies_57_1758536470823.jpg	2025-09-22 09:16:47.817	2025-09-22 10:21:11.936
60	4711 After Shave 100ml	The After Shave Lotion version of the classic 4711 Original Eau de Cologne fragrance provides you with a pleasant fresh…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536481/pharmacy-app/pharmacy/4711_After_Shave_100ml_60_1758536480469.jpg	2025-09-22 09:16:52.003	2025-09-22 10:21:21.389
62	55H+ Paris Efficacite Extreme Lotion 500ml	A moisturizing and scented lightening body lotion. It will leave the skin even toned and youthful looking. Excellent for stubborn…	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536484/pharmacy-app/pharmacy/55H__Paris_Efficacite_Extreme_Lotion_500_62_1758536483696.jpg	2025-09-22 09:16:54.952	2025-09-22 10:21:25.042
67	Abidec Advanced Multivitamin Syrup Plus Omega 6 & 9 150ml	Abidec Advanced Multivitamin Syrup Plus Omega 6 & 9 offers a balanced blend of 12 essential vitamins and Omega 6…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536490/pharmacy-app/pharmacy/Abidec_Advanced_Multivitamin_Syrup_Plus__67_1758536490003.jpg	2025-09-22 09:17:02.094	2025-09-22 10:21:31.477
69	Abnal Sodium Chloride Saline Nasal Drops	For temporary relief of congestion in the nose caused by various conditions including the common cold, sinusitis, hay fever, and…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536494/pharmacy-app/pharmacy/Abnal_Sodium_Chloride_Saline_Nasal_Drops_69_1758536493989.jpg	2025-09-22 09:17:05.268	2025-09-22 10:21:35.022
73	Acnes Moisturising SPF27 Cream 75g	Is highly moisturising and hydrates the skin while protecting the skin from harmful UV rays. It contains Hyaluronic Acid that…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536500/pharmacy-app/pharmacy/Acnes_Moisturising_SPF27_Cream_75g_73_1758536499322.jpg	2025-09-22 09:17:10.839	2025-09-22 10:21:40.442
76	Acnes Soothing Toner 90ml	Acne treatment. Infused with Salicylic acid and Lactic acid that give a mild peeling effect that gently remove old skin…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536506/pharmacy-app/pharmacy/Acnes_Soothing_Toner_90ml_76_1758536505756.jpg	2025-09-22 09:17:14.988	2025-09-22 10:21:46.751
79	Acretin Tretinoin 0.05% Cream 30g	Helps to treat the symptoms of acne vulgaris. Treats acne and prevents new acne from forming. Contains - tretinoin 0.025%,…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536511/pharmacy-app/pharmacy/Acretin_Tretinoin_0_05__Cream_30g_79_1758536511209.jpg	2025-09-22 09:17:19.605	2025-09-22 10:21:52.076
82	Actifed Wet Cough And Cold Syrup 100ml	Actifed Syrup is a medicine which is used to relieve the symptoms of colds and allergies including sneezing, runny nose,…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536515/pharmacy-app/pharmacy/Actifed_Wet_Cough_And_Cold_Syrup_100ml_82_1758536515074.jpg	2025-09-22 09:17:24.007	2025-09-22 10:21:56.275
88	Adidas Adipure Shower Gel 400ml	Multi-benefit 3 in 1 formula: body, hair, face. Cool and airy fragrance with top notes of zesty citrus and jasmine…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536526/pharmacy-app/pharmacy/Adidas_Adipure_Shower_Gel_400ml_88_1758536525854.png	2025-09-22 09:17:32.404	2025-09-22 10:22:06.667
91	Adidas Dynamic Pulse Shower Gel 400ml	Perfect for daytime wear. Top notes of fresh scent of citrus, cedar and mint. Dry down tones of sweet fruits,…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536529/pharmacy-app/pharmacy/Adidas_Dynamic_Pulse_Shower_Gel_400ml_91_1758536529041.jpg	2025-09-22 09:17:36.807	2025-09-22 10:22:10.028
92	Adidas for Women Protect Shower Gel 400ml	Discover the PROTECT shower experience, enriched with cotton milk , to help cocoon your body and mind. Enjoy extra care…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536531/pharmacy-app/pharmacy/Adidas_for_Women_Protect_Shower_Gel_400m_92_1758536531064.jpg	2025-09-22 09:17:38.241	2025-09-22 10:22:12.184
93	Adidas Ice Dive Deodorant Spray 150ml	Perfect fragrance for casual wear. Top notes of Anise, Lavender, Mint. Middle notes of Kiwi, Mandarin Orange.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536533/pharmacy-app/pharmacy/Adidas_Ice_Dive_Deodorant_Spray_150ml_93_1758536533147.jpg	2025-09-22 09:17:39.785	2025-09-22 10:22:14.195
95	Adidas Moves For Men Perfume 30ml	Launched by the design house of Adidas in 1999, Adidas Moves possesses a blend of jasmine, black pepper, clove, spicy…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536537/pharmacy-app/pharmacy/Adidas_Moves_For_Men_Perfume_30ml_95_1758536536882.jpg	2025-09-22 09:17:42.848	2025-09-22 10:22:17.598
98	Adidas Team Force Deodorant Spray 150ml	Provides long hours of freshness and defense against body odour. You need an anti-perspirant that adapts to the pace of…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536541/pharmacy-app/pharmacy/Adidas_Team_Force_Deodorant_Spray_150ml_98_1758536541185.jpg	2025-09-22 09:17:47.047	2025-09-22 10:22:21.955
101	Ador Perfume For Women 100ml	Accentuating the freshness and sensuality of the most beautiful flowers, its iconic floral bouquet is a magnificently balanced and multifaceted…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536545/pharmacy-app/pharmacy/Ador_Perfume_For_Women_100ml_101_1758536544428.jpg	2025-09-22 09:17:51.398	2025-09-22 10:22:25.392
104	Age Care Adult Diapers Extra Large XL 10s	Leak proof. Double refastenable strips. Absorbent core. Wetness indicator. Elastic between legs. For urine and stool incontinence, bed ridden adult…	42500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536550/pharmacy-app/pharmacy/Age_Care_Adult_Diapers_Extra_Large_XL_10_104_1758536549479.png	2025-09-22 09:17:54.842	2025-09-22 10:22:30.737
107	Alaska Deep Sea Fish Oil Omega 3,6,9 1000mg 100 Soft Gels 100’s	This Omega-3,6,9 formula contains Omega-3, Omega-6 and Omega-9 –the “good” fats important for cellular, heart and metabolic health.	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536555/pharmacy-app/pharmacy/Alaska_Deep_Sea_Fish_Oil_Omega_3_6_9_100_107_1758536555127.jpg	2025-09-22 09:17:58.619	2025-09-22 10:22:36.068
112	Alka-Seltzer XS Effervescent Tablets 20’s	For rapid relief of pain. Each pack contains 20 tablets.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536564/pharmacy-app/pharmacy/Alka_Seltzer_XS_Effervescent_Tablets_20__112_1758536563667.jpg	2025-09-22 09:18:05.992	2025-09-22 10:22:44.607
114	Aloe Pura Aloe Vera Gel 200ml	Is produced from Aloe vera juice, which enables us to capture the natural properties of the Aloe vera plant. This…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536567/pharmacy-app/pharmacy/Aloe_Pura_Aloe_Vera_Gel_200ml_114_1758536567239.jpg	2025-09-22 09:18:08.897	2025-09-22 10:22:48.141
118	Aloe Vera Forte Drink 750ml	Aloe vera forte drink contains a delicate balance of micronutrients made from Aloe barbadensis essential for the body to: Boost immunity…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536571/pharmacy-app/pharmacy/Aloe_Vera_Forte_Drink_750ml_118_1758536571126.jpg	2025-09-22 09:18:14.306	2025-09-22 10:22:52.302
121	ALSOFT HAND SANITIZER 1L (SARAYA) hand sanitizer 1L		35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536577/pharmacy-app/pharmacy/ALSOFT_HAND_SANITIZER_1L__SARAYA__hand_s_121_1758536576843.jpg	2025-09-22 09:18:18.178	2025-09-22 10:22:57.761
122	Alula Gold 1[0-6Months] 400g Infant Formula	Designed to provide complete nutrition for babies 0-6 months   Protein source from cow’s milk   Premium infant formula	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536579/pharmacy-app/pharmacy/Alula_Gold_1_0_6Months__400g_Infant_Form_122_1758536578869.jpg	2025-09-22 09:18:19.63	2025-09-22 10:23:00.101
125	Always Cottony Soft Maxi Thick Long Pads 7’s	Enjoy softness and flexibility that will last throughout the night with Always Maxi Thick Cotton Soft sanitary pads.	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536586/pharmacy-app/pharmacy/Always_Cottony_Soft_Maxi_Thick_Long_Pads_125_1758536585214.jpg	2025-09-22 09:18:24.32	2025-09-22 10:23:06.724
128	Always Platinum Ultra Thin Long Sanitary Pads 7’s	Combines a highly absorbent core and sides with odour-locking technology and a micro-cushioned surface to give you the comfort and…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536592/pharmacy-app/pharmacy/Always_Platinum_Ultra_Thin_Long_Sanitary_128_1758536591508.png	2025-09-22 09:18:28.322	2025-09-22 10:23:13.78
131	Amara Body Milk Lotion 400ml	Contains sweet almond oil which is an excellent emollient and moisturizer. It helps promote a youthful skin complexion, protecting and…	9600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536599/pharmacy-app/pharmacy/Amara_Body_Milk_Lotion_400ml_131_1758536598539.jpg	2025-09-22 09:18:32.514	2025-09-22 10:23:19.865
133	Amara Hydrating Glycerine Lotion 400ml	It helps improves skin elasticity and protect against irritation.	9600	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536604/pharmacy-app/pharmacy/Amara_Hydrating_Glycerine_Lotion_400ml_133_1758536603188.png	2025-09-22 09:18:35.176	2025-09-22 10:23:24.108
134	Amara Intensive Cooling Men Body Lotion 400ml	Contains a unique combination of Ginseng, Cinnamon and camphor which revitalize and sooth the skin while protecting it from the…	10200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536605/pharmacy-app/pharmacy/Amara_Intensive_Cooling_Men_Body_Lotion__134_1758536604704.jpg	2025-09-22 09:18:36.609	2025-09-22 10:23:25.793
137	Amazon Saline Nasal Spray 44ml	This saline nasal spray relieves dry nasal membranes Provides non-medicated relief for irritated and dry nasal passages Relieves dryness from…	37000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536614/pharmacy-app/pharmacy/Amazon_Saline_Nasal_Spray_44ml_137_1758536613382.jpg	2025-09-22 09:18:41.321	2025-09-22 10:23:34.403
141	Ambrox Syrup 100ml	Used to treat cough.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536622/pharmacy-app/pharmacy/Ambrox_Syrup_100ml_141_1758536621471.jpg	2025-09-22 09:18:46.766	2025-09-22 10:23:42.319
142	Amni Health Odourless Garlic Caps 60’s	For Cardiovascular Health, For maintenance of heart health, Increases immunity and aid digestion. Each pack contains 50 capsules.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536623/pharmacy-app/pharmacy/Amni_Health_Odourless_Garlic_Caps_60_s_142_1758536623063.jpg	2025-09-22 09:18:48.286	2025-09-22 10:23:43.845
145	AMS FibroMed Capsules	FibroMed is a dietary supplement from AMS containing a unique formula with Chasteberry and Red clover as key ingredients. The…	308000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536632/pharmacy-app/pharmacy/AMS_FibroMed_Capsules_145_1758536631765.png	2025-09-22 09:18:52.686	2025-09-22 10:23:54.911
616	Derihaler Salbutamol 100mcg	Used in the treatment of obstructive airway diseases.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537666/pharmacy-app/pharmacy/Derihaler_Salbutamol_100mcg_616_1758537665406.jpg	2025-09-22 09:29:28.384	2025-09-22 10:41:06.604
148	AMS Penamax Capsules	PenaMax is an all-natural dietary supplement, formulated for men who are looking to support their overall sexual performance in an…	208000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536641/pharmacy-app/pharmacy/AMS_Penamax_Capsules_148_1758536640754.jpg	2025-09-22 09:18:57.027	2025-09-22 10:24:01.836
151	Antepsin Sucralfate 1g/5ml Suspension 250ml	Forms a film on the gut lining to promote healing of ulcers	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536648/pharmacy-app/pharmacy/Antepsin_Sucralfate_1g_5ml_Suspension_25_151_1758536647208.jpg	2025-09-22 09:19:01.097	2025-09-22 10:24:08.128
153	Anusol Cream Hemorrhoids Treatment 23g	Provides effective, soothing relief from the pain and discomfort. Effective on haemmorrhoids (piles), itching, fissures and other related anal conditions.…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536651/pharmacy-app/pharmacy/Anusol_Cream_Hemorrhoids_Treatment_23g_153_1758536650795.jpg	2025-09-22 09:19:03.794	2025-09-22 10:24:11.68
155	ANUSOL SOOTHING RELIEF SUPPOSITORIES Hydrocortisone, Zinc oxide, Bismuth Subgallate 2.510/296/59 mg 1 Piece		3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536657/pharmacy-app/pharmacy/ANUSOL_SOOTHING_RELIEF_SUPPOSITORIES_Hyd_155_1758536655982.png	2025-09-22 09:19:06.407	2025-09-22 10:24:17.996
157	Apcalis (Tadalafil) 20mg Tablets 4’s	Apcalis (Tadalafil) is used to treat male sexual function problems (impotence or erectile dysfunction-ED). Tadalafil belongs to a group of…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536661/pharmacy-app/pharmacy/Apcalis__Tadalafil__20mg_Tablets_4_s_157_1758536660886.jpg	2025-09-22 09:19:09.48	2025-09-22 10:24:22.196
161	Apidone Syrup 125ml	For relief of allergic reactions and inflammatory symptoms.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536676/pharmacy-app/pharmacy/Apidone_Syrup_125ml_161_1758536673286.png	2025-09-22 09:19:15.112	2025-09-22 10:24:37.369
163	Appeton Multivitamin Infant Drops 30ml	The ONLY multivitamins supplement indicated for infants 12 months & below. A combination of multivitamins, Lysine and Taurine all-in-one drop…	41000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536681/pharmacy-app/pharmacy/Appeton_Multivitamin_Infant_Drops_30ml_163_1758536680726.jpg	2025-09-22 09:19:17.999	2025-09-22 10:24:41.751
165	Appeton Multivitamin Lysine Syrup 120ml	A multivitamin dietary supplement fortified with Lysine (Essential Amino Acid proven to greatly improve appetite) for children to promote healthy…	47000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536685/pharmacy-app/pharmacy/Appeton_Multivitamin_Lysine_Syrup_120ml_165_1758536684375.jpg	2025-09-22 09:19:20.843	2025-09-22 10:24:45.294
168	Appeton Weight Gain Adults Powder 450g	Appeton Weight Gain is a high protein formula which is clinically proven to increase weight healthily. Average weight gain for…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536691/pharmacy-app/pharmacy/Appeton_Weight_Gain_Adults_Powder_450g_168_1758536690265.jpg	2025-09-22 09:19:25.454	2025-09-22 10:24:51.531
169	Appeton Weight Gain Junior(3-12 Years) 450g	Appeton Weight Gain Junior is a high protein formula which is clinically proven to help children gain weight healthily. It…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536693/pharmacy-app/pharmacy/Appeton_Weight_Gain_Junior_3_12_Years__4_169_1758536692579.png	2025-09-22 09:19:26.889	2025-09-22 10:24:54.452
170	Aptamil 1 400g	The Aptamil Stage 1 infant formula is an amazing substitute for mother’s milk when it is either not available or available…	51000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536696/pharmacy-app/pharmacy/Aptamil_1_400g_170_1758536695433.jpg	2025-09-22 09:19:28.322	2025-09-22 10:24:56.629
173	Aptamil 2 800g	Baby milk - suitable from 6-12 months. Tailored to complement a mixed weaning diet. With Vitamin D to support the…	128000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536703/pharmacy-app/pharmacy/Aptamil_2_800g_173_1758536702525.jpg	2025-09-22 09:19:32.44	2025-09-22 10:25:03.873
176	Aptamil Hungry Baby 800g	For hungrier bottle-fed babies, to help delay the early onset of weaning. With a unique blend of ingredients. Now with…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536709/pharmacy-app/pharmacy/Aptamil_Hungry_Baby_800g_176_1758536708971.png	2025-09-22 09:19:36.735	2025-09-22 10:25:09.904
178	Aqua Safe Water Purification Tablets 80s (Sodium dichloroisocyanurate)	Used to treat safe drinking water. one tablet treats 20 litres of collected water or 10 litres of river water.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536713/pharmacy-app/pharmacy/Aqua_Safe_Water_Purification_Tablets_80s_178_1758536712805.jpg	2025-09-22 09:19:39.586	2025-09-22 10:25:14.116
181	Aquafresh Little Teeth Toothpaste 3-5 Years 50mls	Aquafresh Little Teeth Toothpaste is specially designed for children aged 3-5, with age-appropriate fluoride to protect little teeth and support…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536719/pharmacy-app/pharmacy/Aquafresh_Little_Teeth_Toothpaste_3_5_Ye_181_1758536719157.jpg	2025-09-22 09:19:44.194	2025-09-22 10:25:20.19
184	Aqueous Cream BP 100g	Relieves and soothes dry skin. Non-greasy moisturiser ideal to use for treating dry skin, including eczema and dermatitis. Emulsifying ointment…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536728/pharmacy-app/pharmacy/Aqueous_Cream_BP_100g_184_1758536727576.jpg	2025-09-22 09:19:48.29	2025-09-22 10:25:28.487
187	Armaf Shades Body Mist for Men 250ml	Long lasting fragrance. Refreshing body mist. Ideal for gift purpose.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536736/pharmacy-app/pharmacy/Armaf_Shades_Body_Mist_for_Men_250ml_187_1758536736193.jpg	2025-09-22 09:19:52.693	2025-09-22 10:25:37.389
188	Armaf Tag Him Body Mist For Men 250ml	Elegant notes that offer an engulfing feeling of freshness. The oriental fragrance is created for stylish men that would reflect…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536738/pharmacy-app/pharmacy/Armaf_Tag_Him_Body_Mist_For_Men_250ml_188_1758536738041.jpg	2025-09-22 09:19:54.025	2025-09-22 10:25:38.919
192	Ascoril Syrup 200ml	Relief in the treatment of productive cough.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536747/pharmacy-app/pharmacy/Ascoril_Syrup_200ml_192_1758536746501.jpg	2025-09-22 09:19:59.778	2025-09-22 10:25:47.333
193	Atarax 25mg Tablets 30’s	Atarax 25 tablet is an anti-allergic medicine used for the management of various allergic skin conditions. Each pack contains 30…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536749/pharmacy-app/pharmacy/Atarax_25mg_Tablets_30_s_193_1758536748276.jpg	2025-09-22 09:20:01.087	2025-09-22 10:25:49.417
196	Aveeno Baby Hair Care & Body Wash for Sensitive Skin 300ml	Gently cleanses and nourishes baby’s delicate hair and skin from top to toe. Leaves baby skin feeling moisturised. This gentle…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536752/pharmacy-app/pharmacy/Aveeno_Baby_Hair_Care___Body_Wash_for_Se_196_1758536751962.jpg	2025-09-22 09:20:05.493	2025-09-22 10:25:52.935
304	Berocca Orange Effervescent Tablets 30’s	Just one tablet is packed full of 11 vitamins and minerals. Berocca contains all 8 B vitamins – the Vitamin…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536974/pharmacy-app/pharmacy/Berocca_Orange_Effervescent_Tablets_30_s_304_1758536973573.jpg	2025-09-22 09:22:38.908	2025-09-22 10:29:34.619
199	Aveeno Daily Moisturising Body Lotion 300ml	Moisturising Cream Formulated With Naturally Active Colloidal Oatmeal Actively Moisturises Dry And Sensitive Skin Moisturises Dry Skin For 24 Hours…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536758/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Lotion_30_199_1758536757294.jpg	2025-09-22 09:20:09.712	2025-09-22 10:25:58.176
202	Aveeno Daily Moisturising Creamy Oil 300ml	Moisturising lotion formulated with naturally active colloidal oatmeal Moisturises like an oil, absorbs like a cream Non-greasy Skin is left…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536754/pharmacy-app/pharmacy/Aveeno_Daily_Moisturising_Body_Cleansing_197_1758536753595.jpg	2025-09-22 09:20:13.369	2025-09-22 10:26:02.587
205	Aveeno Moisturising Cream 500ml	Aveeno Cream moisturises skin prone to eczema for 24 hours. Regular use helps prevent dryness and irritation caused by skin…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536768/pharmacy-app/pharmacy/Aveeno_Moisturising_Cream_500ml_205_1758536767226.jpg	2025-09-22 09:20:17.118	2025-09-22 10:26:08.283
206	Aveeno Skin Relief Moisturising Body Wash 300ml	Formulated with prebiotiv triple oat complex : Aveeno Skin Relief Body Wash leaves the skin more resilient and healthy looking…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536769/pharmacy-app/pharmacy/Aveeno_Skin_Relief_Moisturising_Body_Was_206_1758536769153.jpg	2025-09-22 09:20:18.415	2025-09-22 10:26:10.434
209	Avent Anti-Colic Bottle 260ml	The air free vent is designed to help your baby swallow less air. The teat stays full of milk, even…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536775/pharmacy-app/pharmacy/Avent_Anti_Colic_Bottle_260ml_209_1758536775280.jpg	2025-09-22 09:20:22.223	2025-09-22 10:26:16.11
212	Avent Classic Slow Flow Teats (1 month plus)	This is a pair of soft silicone Avent Classic+ teats suitable for newborns. They mimic breastfeeding by allowing your baby…	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536785/pharmacy-app/pharmacy/Avent_Classic_Slow_Flow_Teats__1_month_p_212_1758536784966.jpg	2025-09-22 09:20:26.28	2025-09-22 10:26:26.512
214	Avent Disposable Breast Pads SCF254/61 60’S	The Philips Avent disposable breast pads help to support your breast-feeding journey. Honeycombed texture, ultra-thin ultra-absorbent core and leak proof…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536790/pharmacy-app/pharmacy/Avent_Disposable_Breast_Pads_SCF254_61_6_214_1758536789511.jpg	2025-09-22 09:20:29.455	2025-09-22 10:26:31.016
217	Avent Natural Baby Bottle 125ml	The Avent Natural feeding bottle helps to make bottle feeding more natural for your baby and you. The teat features…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536796/pharmacy-app/pharmacy/Avent_Natural_Baby_Bottle_125ml_217_1758536796030.jpg	2025-09-22 09:20:33.775	2025-09-22 10:26:37.057
220	Avent Newborn Natural Starter Set	The Avent Natural Starter set is easy to combine with breastfeeding. Includes: two 125ml/ 4oz neck bottles, two 260ml/9oz wide…	220000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536802/pharmacy-app/pharmacy/Avent_Newborn_Natural_Starter_Set_220_1758536801796.jpg	2025-09-22 09:20:37.567	2025-09-22 10:26:45.557
222	Avit Vitamin A 200,000IU Capsules 30’s	Vitamin A is a fat soluble vitamin necessary for health, deficiency of which can cause disorders of vision, skin, bone…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536809/pharmacy-app/pharmacy/Avit_Vitamin_A_200_000IU_Capsules_30_s_222_1758536808949.jpg	2025-09-22 09:20:40.514	2025-09-22 10:26:49.986
225	Axe Apollo Body Spray Deodorant 150ml	Bust odor and smell irresistible for 48 hours with our Body Spray Deodorant. An irresistible-smelling deodorant for men. An iconic…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536815/pharmacy-app/pharmacy/Axe_Apollo_Body_Spray_Deodorant_150ml_225_1758536814209.jpg	2025-09-22 09:20:45.264	2025-09-22 10:26:55.177
228	Axe Brand Universal Oil 56ml	Quick relief for joint pain relief/ muscular pain/stiff or sore muscles/sprain. Handy medicine for home. Once applied few drops it…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536820/pharmacy-app/pharmacy/Axe_Brand_Universal_Oil_56ml_228_1758536819634.jpg	2025-09-22 09:20:49.443	2025-09-22 10:27:00.816
230	Azelaic Acid + Vitamin C Cream	A combination of azelaic acid and vitamin C can offer a variety of benefits for your skincare routine: brighten and…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536824/pharmacy-app/pharmacy/Azelaic_Acid___Vitamin_C_Cream_230_1758536823979.jpg	2025-09-22 09:20:51.778	2025-09-22 10:27:05.117
233	BACK-UP PILL	Back up(Levonorgestrel)  is emergency contraception (commonly called the morning after pill) that is used as backup contraception to prevent pregnancy…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536830/pharmacy-app/pharmacy/BACK_UP_PILL_233_1758536829858.jpg	2025-09-22 09:20:56.079	2025-09-22 10:27:10.953
236	Balance Gold Collagen Rejuvenating Serum 30mL	This serum has Colloidal Gold, known for its healing properties, gives a radiant glow and Marine Collagen helps smooth and…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536835/pharmacy-app/pharmacy/Balance_Gold_Collagen_Rejuvenating_Serum_236_1758536835052.jpg	2025-09-22 09:21:00.515	2025-09-22 10:27:16.095
238	Balance Vitamin C Serum 30ml	Lightweight and non-greasy pro-radiance serum. It contains 6% Illumiscin and Zinc. As well as two forms of stabilized Vitamin C,…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536843/pharmacy-app/pharmacy/Balance_Vitamin_C_Serum_30ml_238_1758536842534.jpg	2025-09-22 09:21:05.5	2025-09-22 10:27:23.487
241	Ballet Aloe Vera Jelly 250g	Soothes. Heals. Moisturises.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536847/pharmacy-app/pharmacy/Ballet_Aloe_Vera_Jelly_250g_241_1758536845901.jpg	2025-09-22 09:21:09.494	2025-09-22 10:27:27.337
242	Ballet Baby Jelly 100g	Effective. Smoothing. Nourishing. The Ballet Original Baby Jelly soothes and protects your baby's skin.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536848/pharmacy-app/pharmacy/Ballet_Baby_Jelly_100g_242_1758536848023.jpg	2025-09-22 09:21:11.039	2025-09-22 10:27:29.011
245	Bareback Condoms 3’s	Bareback Premium Latex Condoms Ultra Thin 3 Pack are so thin that it almost feels like they're not there. They…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536854/pharmacy-app/pharmacy/Bareback_Condoms_3_s_245_1758536853072.jpg	2025-09-22 09:21:15.363	2025-09-22 10:27:34.194
247	Bath & Body Works Gingham Gorgeous Splash 236 ml	Gingham Gorgeous Mist smells like gorgeous, floral, happy Gingham yet. Fragrance notes: pink strawberries, peach nectar, and peony blooms.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536857/pharmacy-app/pharmacy/Bath___Body_Works_Gingham_Gorgeous_Splas_247_1758536856824.jpg	2025-09-22 09:21:18.509	2025-09-22 10:27:37.895
249	Bath & Body Works Hello Beautiful Splash 236 ml	Hello Beautiful Splash smells like picking flowers on a bright spring day. Fragrance notes: white gardenia, jasmine petals, magnolia blossom,…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536861/pharmacy-app/pharmacy/Bath___Body_Works_Hello_Beautiful_Splash_249_1758536860604.jpg	2025-09-22 09:21:21.495	2025-09-22 10:27:41.494
252	Bath & Body Works You’re The One Splash 236 ml	It smells like a sparkling beautiful night with the one you Love Fragrance notes: white birch, velvety rose, and with…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536866/pharmacy-app/pharmacy/Bath___Body_Works_You_re_The_One_Splash__252_1758536865415.jpg	2025-09-22 09:21:25.703	2025-09-22 10:27:46.309
254	Beautex Anti Itch Hair & Scalp Oil 100ml	Beautex anti-itch hair and scalp treatment, made with salicylic acid, alleviates dry, itchy scalp and helps control scalp irritation and…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536870/pharmacy-app/pharmacy/Beautex_Anti_Itch_Hair___Scalp_Oil_100ml_254_1758536869581.png	2025-09-22 09:21:28.643	2025-09-22 10:27:51.785
257	Beauty Formulas Charcoal Detox Cleanser 150ml	This activated charcoal detox cleanser helps remove impurities and excess oil.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536876/pharmacy-app/pharmacy/Beauty_Formulas_Charcoal_Detox_Cleanser__257_1758536876056.jpg	2025-09-22 09:21:33.056	2025-09-22 10:27:57.442
259	Beauty Formulas Feminine Intimate Gentle Cleansing Wash 250ml	Gentle intimate cleansing wash. Kind & gentle soap. Soap Free non-irritating for ultimate feminine hygiene. pH balanced. Specially formulated to…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536881/pharmacy-app/pharmacy/Beauty_Formulas_Feminine_Intimate_Gentle_259_1758536880488.jpg	2025-09-22 09:21:35.935	2025-09-22 10:28:01.573
262	Beauty Formulas Organic Aloe Vera Lotion 100ml	Moisturises, soothes and revitalises dry irritated skin. Soothing anti-inflammatory effect to calm and cool the skin. Moisturising and cooling relief…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536890/pharmacy-app/pharmacy/Beauty_Formulas_Organic_Aloe_Vera_Lotion_262_1758536889746.jpg	2025-09-22 09:21:40.182	2025-09-22 10:28:10.96
265	Beauty Formulas Tea Tree Cleansing Wipes 30s	Cool moist tea tree cleansing facial wipes will gently cleanse tone and moisture your skin removing all traces of oil,…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536896/pharmacy-app/pharmacy/Beauty_Formulas_Tea_Tree_Cleansing_Wipes_265_1758536895509.jpg	2025-09-22 09:21:44.439	2025-09-22 10:28:16.591
268	Beechams Flu Plus Hot Lemon Sachets 10’s	Relief for headache, sore throat, shivers, fever and  aches in colds and flu. Each pack contains 10 sachets.	29000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536901/pharmacy-app/pharmacy/Beechams_Flu_Plus_Hot_Lemon_Sachets_10_s_268_1758536900607.jpg	2025-09-22 09:21:48.418	2025-09-22 10:28:21.812
271	Bell’s Pure Tea Tree Oil 10ml	Pure Tea Tree Oil possesses antibacterial, anti-inflammatory, antiviral and antifungal properties. Its used  Treatment of acne, athletes foot, contact dermatitis…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536907/pharmacy-app/pharmacy/Bell_s_Pure_Tea_Tree_Oil_10ml_271_1758536906642.jpg	2025-09-22 09:21:52.836	2025-09-22 10:28:28.06
274	Bells Calamine Lotion 100ml	For minor skin irritations and sunburn.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536913/pharmacy-app/pharmacy/Bells_Calamine_Lotion_100ml_274_1758536913010.jpg	2025-09-22 09:21:56.942	2025-09-22 10:28:33.879
276	Bells Children’s Multivitamin Syrup 100ml	Essential for maintaining good health and development. Suitable for children.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536917/pharmacy-app/pharmacy/Bells_Children_s_Multivitamin_Syrup_100m_276_1758536916328.jpg	2025-09-22 09:21:59.977	2025-09-22 10:28:37.379
277	Bells Cough Linctus 200ml	For the relief from the symptoms of colds, sore throats, irritating and chesty coughs.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536918/pharmacy-app/pharmacy/Bells_Cough_Linctus_200ml_277_1758536918053.jpg	2025-09-22 09:22:01.343	2025-09-22 10:28:38.86
279	Bells Menthol Crystals 5g	Ideally used to relieve a blocked nose and helps to relieve symptoms of blocked sinuses like pain.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536922/pharmacy-app/pharmacy/Bells_Menthol_Crystals_5g_279_1758536921536.jpg	2025-09-22 09:22:04.176	2025-09-22 10:28:42.601
282	Bells Vitamin C Syrup 100ml	Bell's Vitamin C syrup is used for wound healing, scurvy, cell damage, tissue repair, red blood cell production and others.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536928/pharmacy-app/pharmacy/Bells_Vitamin_C_Syrup_100ml_282_1758536927851.jpg	2025-09-22 09:22:08.486	2025-09-22 10:28:48.95
284	Belogent Cream Betamethasone and Gentamicin 30g	For the treatment of skin conditions such as eczema, dermatitis, psoriasis, and other inflammatory skin disorders.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536931/pharmacy-app/pharmacy/Belogent_Cream_Betamethasone_and_Gentami_284_1758536931356.jpg	2025-09-22 09:22:11.044	2025-09-22 10:28:51.935
287	Benylin 4 Flu Tabs 24’s	For the relief of symptoms associated with colds and flu; including relief of nasal congestion and congestion of mucous membranes…	38400	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536941/pharmacy-app/pharmacy/Benylin_4_Flu_Tabs_24_s_287_1758536941056.png	2025-09-22 09:22:15.63	2025-09-22 10:29:02.134
289	Benylin Children’s Wet Cough Syrup 100ml	Benylin Wet Cough helps relieve chesty coughs by thinning and loosening up mucus in your child’s chest and provides quick…	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536945/pharmacy-app/pharmacy/Benylin_Children_s_Wet_Cough_Syrup_100ml_289_1758536944983.jpg	2025-09-22 09:22:18.42	2025-09-22 10:29:06.146
292	Benylin Dry and Tickly Cough Syrup 150ml	Relieves dry, tickly coughs & sore throats.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536951/pharmacy-app/pharmacy/Benylin_Dry_and_Tickly_Cough_Syrup_150ml_292_1758536950828.jpg	2025-09-22 09:22:22.715	2025-09-22 10:29:11.889
294	Benylin Original Cough Syrup 100ml	Used to treat cough and chest congestion caused by the common cold, infections, or allergies.	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536955/pharmacy-app/pharmacy/Benylin_Original_Cough_Syrup_100ml_294_1758536955092.jpg	2025-09-22 09:22:25.417	2025-09-22 10:29:16.189
296	Benylin Wet Cough Mucus Relief Menthol Syrup 100ml	Benylin Wet Cough Mucus Relief Menthol 100ml is a fast, effective remedy for treating coughs with phlegm. It loosens the…	29500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536960/pharmacy-app/pharmacy/Benylin_Wet_Cough_Mucus_Relief_Menthol_S_296_1758536959496.jpg	2025-09-22 09:22:28.189	2025-09-22 10:29:20.26
299	Berocca Blackcurrant Effervescent Tablets 15’s	Just 1 tablet contains vitamins and minerals to help you keep going, Support energy release, Support mental performance, & Reduce…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536965/pharmacy-app/pharmacy/Berocca_Blackcurrant_Effervescent_Tablet_299_1758536964891.jpg	2025-09-22 09:22:32.039	2025-09-22 10:29:25.821
301	Berocca Boost Effervescent Acerola Cherry Tabs 10’s	Berocca Boost helps energise you. It contains Caffeine and Guarana, to help you feel more awake and alert. Berocca supports…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536969/pharmacy-app/pharmacy/Berocca_Boost_Effervescent_Acerola_Cherr_301_1758536968695.jpg	2025-09-22 09:22:34.532	2025-09-22 10:29:29.811
306	Betaderm Betamethasone Ointment 15g	Used to treat skin irritation and itch caused by skin conditions such as eczema, psoriasis, contact dermatitis, and seborrhea. It…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536978/pharmacy-app/pharmacy/Betaderm_Betamethasone_Ointment_15g_306_1758536977965.jpg	2025-09-22 09:22:41.859	2025-09-22 10:29:38.668
309	Betadine Mouthwash & Gargle 125ml	The Betadine mouthwash provides soothing relief of dryness or minor irritation of the mouth and throat.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536984/pharmacy-app/pharmacy/Betadine_Mouthwash___Gargle_125ml_309_1758536983173.jpg	2025-09-22 09:22:45.659	2025-09-22 10:29:44.042
311	Betahistine Dihydrochloride 16mg 84’s	Betahistine is a medicine used to treat the symptoms of Ménière's disease. Symptoms include: dizziness (vertigo) ringing in the ears (tinnitus).	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536987/pharmacy-app/pharmacy/Betahistine_Dihydrochloride_16mg_84_s_311_1758536986711.jpg	2025-09-22 09:22:48.516	2025-09-22 10:29:47.83
313	Betaserc Betahistine 16mg Tablets 30’s	Betahistine is a medicine used to treat the symptoms of Ménière's disease. Symptoms include: dizziness (vertigo) ringing in the ears (tinnitus).	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536995/pharmacy-app/pharmacy/Betaserc_Betahistine_16mg_Tablets_30_s_313_1758536994497.png	2025-09-22 09:22:51.352	2025-09-22 10:29:55.613
314	Betaserc Betahistine 8mg Tablets 30’s	Betahistine is a medicine used to treat the symptoms of Ménière's disease. Symptoms include: dizziness (vertigo) ringing in the ears (tinnitus).	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758536997/pharmacy-app/pharmacy/Betaserc_Betahistine_8mg_Tablets_30_s_314_1758536996316.jpg	2025-09-22 09:22:52.437	2025-09-22 10:29:57.385
317	Beverly Hills Polo Club Pour Femme Perfume NO.1 100ML	Beverly Hills Polo Club No.1 Pour Femme by Beverly Hills Polo Club is a Floral Fruity Gourmand fragrance for women.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537003/pharmacy-app/pharmacy/Beverly_Hills_Polo_Club_Pour_Femme_Perfu_317_1758537002120.jpg	2025-09-22 09:22:55.8	2025-09-22 10:30:03.677
319	Beverly Hills Polo Club Sport No.1 Deodorant Body Spray 175 ml	Beverly Hills Polo Club Sport No.1 Deodrant Body Spray is a mesmerising fragrance that captures the essence of elegance .	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537007/pharmacy-app/pharmacy/Beverly_Hills_Polo_Club_Sport_No_1_Deodo_319_1758537006370.jpg	2025-09-22 09:22:58.346	2025-09-22 10:30:07.241
322	Bio balance Niacinamide-G Super Serum 30ml	This Serum reduces the appearance of dark spots, appearance of fine lines & wrinkles, regulates sebum secretion, targets breakouts and…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537012/pharmacy-app/pharmacy/Bio_balance_Niacinamide_G_Super_Serum_30_322_1758537011875.jpg	2025-09-22 09:23:01.968	2025-09-22 10:30:13.061
325	Bio-Oil 60ml	A specialist skin care product, formulated to help improve the appearance of scars, stretch marks and uneven skin tone. It…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537019/pharmacy-app/pharmacy/Bio_Oil_60ml_325_1758537018597.jpg	2025-09-22 09:23:05.856	2025-09-22 10:30:19.479
327	Bioline HIV-1/2 Home Testing Kit	Bioline HIV 1/2 3.0 test is an immunochromatographic assay for the differential and qualitative detection of all isotypes (IgG, IgM,…	5700	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537023/pharmacy-app/pharmacy/Bioline_HIV_1_2_Home_Testing_Kit_327_1758537022819.jpg	2025-09-22 09:23:08.901	2025-09-22 10:30:23.653
330	Bonjela Soothing Teething Gel 15ml	Soothes & calms gums. Fast acting. No artificial colours, flavours or sugar. From ages 6+ months, when most babies start…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537032/pharmacy-app/pharmacy/Bonjela_Soothing_Teething_Gel_15ml_330_1758537031380.png	2025-09-22 09:23:12.886	2025-09-22 10:30:32.784
332	Booster Plus (Moringa Oleifera + Selenium) Capsules 120’s	BOOSTER PLUS is a selenium fortified multi-vitamin food supplement made in Uganda. It also contains moringa(herbal extract) that supports the…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537036/pharmacy-app/pharmacy/Booster_Plus__Moringa_Oleifera___Seleniu_332_1758537035907.jpg	2025-09-22 09:23:15.346	2025-09-22 10:30:37.086
336	Brown Orchid Blanc Edition Perfume 80ml	An absolutely quintessential and modern choice for everyday use, the Brown Orchid Perfume - Blanc Edition is the addition your…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537046/pharmacy-app/pharmacy/Brown_Orchid_Blanc_Edition_Perfume_80ml_336_1758537044833.jpg	2025-09-22 09:23:20.476	2025-09-22 10:30:46.393
339	Brut Aftershave Original 100ml	Fragrance For Men. Has fresh and iconic fragrance. Contains glycerine to help calm the skin post shaving. Distinctive fragrance of…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537055/pharmacy-app/pharmacy/Brut_Aftershave_Original_100ml_339_1758537054234.jpg	2025-09-22 09:23:24.888	2025-09-22 10:30:55.285
342	Buccazole Oral Gel 20g	Buccazole oral gel works by preventing the growth of fungi.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537061/pharmacy-app/pharmacy/Buccazole_Oral_Gel_20g_342_1758537060252.jpg	2025-09-22 09:23:28.973	2025-09-22 10:31:01.252
343	Bump Patrol Liquid (Razor Bump Solution) 65ml	Anti Bump Active (helps and treats razor bumps after shaving). Soothes (Chamomilla Recutita/Chamomile soothes skin and reduces irritation after shaving).	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537063/pharmacy-app/pharmacy/Bump_Patrol_Liquid__Razor_Bump_Solution__343_1758537062045.jpg	2025-09-22 09:23:30.6	2025-09-22 10:31:03.198
346	C24/7 Capsules 10’s	C24/7 contains 22000 phyto-nutrients which help fight cancer and other diseases. Maintain a healthy body, slow down aging and improve…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537069/pharmacy-app/pharmacy/C24_7_Capsules_10_s_346_1758537068704.jpg	2025-09-22 09:23:34.213	2025-09-22 10:31:09.467
347	Cadiphen Expectorant Syrup 100ml	It is used for treatment of Chest congestion, Common cold, Cough, Hay fever, Allergy, Watery eyes.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537071/pharmacy-app/pharmacy/Cadiphen_Expectorant_Syrup_100ml_347_1758537070391.jpg	2025-09-22 09:23:35.367	2025-09-22 10:31:11.494
350	CalciD-Denk Effervescent Tablets 20’s	Life mineral: keeps your bones young & strong. Stops bone loss, prevents brittle bones. Basic therapy against osteoporosis. Each pack…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537077/pharmacy-app/pharmacy/CalciD_Denk_Effervescent_Tablets_20_s_350_1758537076312.jpg	2025-09-22 09:23:39.92	2025-09-22 10:31:17.237
352	Calcivita Capsules 50’s	Dietary supplement  for strong bones for pregnant, lactating, and children. It contains Calcium, Vitamin A & D. Each pack has…	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537080/pharmacy-app/pharmacy/Calcivita_Capsules_50_s_352_1758537079784.jpg	2025-09-22 09:23:42.685	2025-09-22 10:31:20.751
354	Calpol Saline Nasal Drops 10ml	An isotonic nasal saline solution designed to provide natural relief from nasal congestion by gently cleaning and moistening the mucous…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537083/pharmacy-app/pharmacy/Calpol_Saline_Nasal_Drops_10ml_354_1758537082863.png	2025-09-22 09:23:45.451	2025-09-22 10:31:23.795
358	Camera Baby Bottles 250ml	The camera smooth neck feeder has an anti-colic air valve teat. It is ideal for liquid feeds like milk and…	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537092/pharmacy-app/pharmacy/Camera_Baby_Bottles_250ml_358_1758537091179.jpg	2025-09-22 09:23:51.218	2025-09-22 10:31:32.279
360	Candid Clotrimazole Powder 1%	For prevention or treatment of fungal infections such as ringworm, jock itch, athlete's foot and infections resulting from excessive sweating.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537096/pharmacy-app/pharmacy/Candid_Clotrimazole_Powder_1__360_1758537095362.png	2025-09-22 09:23:54.172	2025-09-22 10:31:36.717
363	Candiderm Cream 15g	used to treat skin infections, such as dermatitis, impetigo, eczema, psoriasis, diaper rash, lichen simplex, bug bites, burns, boils, otitis…	6500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537105/pharmacy-app/pharmacy/Candiderm_Cream_15g_363_1758537104513.jpg	2025-09-22 09:23:58.058	2025-09-22 10:31:45.44
366	Cantu Argan Oil Leave-in Conditioning Repair Cream 453g	Deeply moisturises to help protect hair from damage. Specifically formulated for over-treated, over-styled hair.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537110/pharmacy-app/pharmacy/Cantu_Argan_Oil_Leave_in_Conditioning_Re_366_1758537109774.jpg	2025-09-22 09:24:02.244	2025-09-22 10:31:50.767
367	Cantu Care for Kids Conditioning Detangler 177ml	Softens strands for easy-to-comb curls. Adds slip to the hair, reducing breakage. Infused with shea butter, coconut oil, and honey.…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537112/pharmacy-app/pharmacy/Cantu_Care_for_Kids_Conditioning_Detangl_367_1758537111440.jpg	2025-09-22 09:24:03.474	2025-09-22 10:31:52.324
371	Cantu Shea Butter Cleansing Cream Shampoo 400ml	Removes heavy buildup in hair and scalp while the unique formula promotes healthy hair growth.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537120/pharmacy-app/pharmacy/Cantu_Shea_Butter_Cleansing_Cream_Shampo_371_1758537119091.jpg	2025-09-22 09:24:08.498	2025-09-22 10:32:00.293
372	Cantu Shea Butter Coconut Oil Shine & Hold Mist 237ml	REFRESHING MOISTURE: shea butter infused with coconut, almond, grapeseed & olive oils quickly quench dry curls, coils & waves. LASTING…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537121/pharmacy-app/pharmacy/Cantu_Shea_Butter_Coconut_Oil_Shine___Ho_372_1758537121163.jpg	2025-09-22 09:24:09.791	2025-09-22 10:32:02.648
376	Cantu Shea Butter Leave In Conditioning Cream 340g	INTENSIVE deep penetrating leave in cream conditioning treatment reduces frizz and flyaways. MADE with 100% Pure Shea butter and formulated…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537131/pharmacy-app/pharmacy/Cantu_Shea_Butter_Leave_In_Conditioning__376_1758537130722.jpg	2025-09-22 09:24:14.249	2025-09-22 10:32:11.712
378	Cantu Shea Butter Moisturizing Cream Shampoo 400ml	Suitable for curly & wavy hair. Effectively removes buildup. Promotes healthy growth.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537137/pharmacy-app/pharmacy/Cantu_Shea_Butter_Moisturizing_Cream_Sha_378_1758537136150.jpg	2025-09-22 09:24:16.41	2025-09-22 10:32:17.191
381	Cardioace Original 30’s	Cardioace Original is an expertly balanced source of over 20 nutrients to safeguard your diet and support all-round heart health.	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537143/pharmacy-app/pharmacy/Cardioace_Original_30_s_381_1758537142446.jpg	2025-09-22 09:24:19.95	2025-09-22 10:32:23.832
382	Cardioace Plus	Cardioace Plus is a premium nutritional supplement designed to support cardiovascular health and overall well-being. Formulated by experts in nutrition…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537145/pharmacy-app/pharmacy/Cardioace_Plus_382_1758537144455.jpg	2025-09-22 09:24:21.142	2025-09-22 10:32:25.488
383	Carmex Cherry Lipbalm 10G SPF15	Carmex Cherry Flavored Lip Balm SPF15 repairs and protects dry, chapped lips, returning softness and comfort, a moisturizing care cherry flavored.…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537147/pharmacy-app/pharmacy/Carmex_Cherry_Lipbalm_10G_SPF15_383_1758537146321.jpg	2025-09-22 09:24:22.348	2025-09-22 10:32:27.573
385	Carmex Classic Lip balm Stick 4.25g SPF 15	Carmex's classic Lip Balm formula in a easy-to-use stick, complete with SPF15 sun protection. This triple force formula helps to…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537150/pharmacy-app/pharmacy/Carmex_Classic_Lip_balm_Stick_4_25g_SPF__385_1758537149931.jpg	2025-09-22 09:24:25.019	2025-09-22 10:32:31.08
388	Carmex Strawberry Lip Balm 10g SPF 15	Carmex Strawberry SPF-15 Lip Balm contains a unique blend that soothes, moisturises, and relieves, leaving your lips feeling soft and…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537159/pharmacy-app/pharmacy/Carmex_Strawberry_Lip_Balm_10g_SPF_15_388_1758537158905.jpg	2025-09-22 09:24:28.867	2025-09-22 10:32:39.948
391	Centacid Suspension 170ml	Centacid works by lowering the acid in the stomach. This medication is used to treat the symptoms of too much…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537165/pharmacy-app/pharmacy/Centacid_Suspension_170ml_391_1758537164737.jpg	2025-09-22 09:24:32.604	2025-09-22 10:32:45.631
393	Centrum Advance 50+ 100’s	Centrum Advance 50+ is specially formulated for adults 50+. Has adjusted levels of key vitamins and minerals. Helps support your…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537168/pharmacy-app/pharmacy/Centrum_Advance_50__100_s_393_1758537167794.jpg	2025-09-22 09:24:35.034	2025-09-22 10:32:48.784
396	Centrum Advance 60’s	Centrum Advance contains essential vitamins to help fill nutritional gaps if dietary intake is inadequate , supporting multiple health benefits.…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537174/pharmacy-app/pharmacy/Centrum_Advance_60_s_396_1758537173521.png	2025-09-22 09:24:38.811	2025-09-22 10:32:54.777
399	Centrum Men 30’s	Centrum Men is personalized for men to feed your cells and help support muscle function, energy, immunity, and metabolism.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537180/pharmacy-app/pharmacy/Centrum_Men_30_s_399_1758537179994.jpg	2025-09-22 09:24:42.813	2025-09-22 10:33:01.423
401	Centrum Performance 60’s	Unique daily multivitamin specifically formulated for sports people and active lifestyles.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537185/pharmacy-app/pharmacy/Centrum_Performance_60_s_401_1758537184812.jpg	2025-09-22 09:24:45.296	2025-09-22 10:33:05.999
404	Centrum Women 50+ 30’s	Centrum Women 50+ Tablets has adjusted levels of key vitamins and minerals to support the changing health needs of women…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537192/pharmacy-app/pharmacy/Centrum_Women_50__30_s_404_1758537191826.jpg	2025-09-22 09:24:48.938	2025-09-22 10:33:13.202
406	CeraVe Acne Control Gel	CeraVe Acne Control Gel is a hydrating, daily acne treatment with 2% salicylic acid that clears acne and helps prevent…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537196/pharmacy-app/pharmacy/CeraVe_Acne_Control_Gel_406_1758537195828.jpg	2025-09-22 09:24:51.518	2025-09-22 10:33:16.898
408	CeraVe AM Facial Moisturizing Lotion With Sunscreen SPF30 50ml	A morning skincare multitasker, featuring 3 essential ceramides that work together to lock in skins moisture and help restore your…	112000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537200/pharmacy-app/pharmacy/CeraVe_AM_Facial_Moisturizing_Lotion_Wit_408_1758537200274.jpg	2025-09-22 09:24:54.198	2025-09-22 10:33:21.169
411	CeraVe Foaming Facial Cleanser 236ml	Contains 3 Essential Ceramides to respect the skin's natural barrier. With Niacinamide and Hyaluronic Acid, the foaming gel formula cleanses…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537207/pharmacy-app/pharmacy/CeraVe_Foaming_Facial_Cleanser_236ml_411_1758537206676.jpg	2025-09-22 09:24:58.155	2025-09-22 10:33:28.051
414	CeraVe Hydrating Cleanser 236ml	Cleanses and hydrates without disrupting the protective skin moisture barrier.	79000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537216/pharmacy-app/pharmacy/CeraVe_Hydrating_Cleanser_236ml_414_1758537216358.jpg	2025-09-22 09:25:02.147	2025-09-22 10:33:37.278
416	CeraVe Hydrating Cream-to-Foam Facial Cleanser 236ml	Contains 3 essential ceramides to respect the skin’s natural barriers. Transforms from a rich cream into a lathering foam texture…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537220/pharmacy-app/pharmacy/CeraVe_Hydrating_Cream_to_Foam_Facial_Cl_416_1758537220134.jpg	2025-09-22 09:25:04.751	2025-09-22 10:33:41.156
417	CeraVe Hydrating Foaming Oil Cleanser 236ml	Ideal for dry to very dry skin but is also suitable for sensitive skin, eczema-prone skin, and baby skin (3+…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537223/pharmacy-app/pharmacy/CeraVe_Hydrating_Foaming_Oil_Cleanser_23_417_1758537222235.jpg	2025-09-22 09:25:05.947	2025-09-22 10:33:43.41
419	CeraVe Hydrating Hyaluronic Acid Serum 30ml	CeraVe Hydrating Hyaluronic Acid Serum with vitamin B5 and three essential ceramides helps bind moisture to your skin’s surface, smoothing…	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537227/pharmacy-app/pharmacy/CeraVe_Hydrating_Hyaluronic_Acid_Serum_3_419_1758537226745.jpg	2025-09-22 09:25:08.199	2025-09-22 10:33:47.814
422	CeraVe Itch Relief Moisturizing Lotion	CeraVe Itch Relief Moisturizing Lotion moisturizes dry skin and relieves itching associated with insect bites, sunburn, poison ivy and other…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537233/pharmacy-app/pharmacy/CeraVe_Itch_Relief_Moisturizing_Lotion_422_1758537232463.jpg	2025-09-22 09:25:11.884	2025-09-22 10:33:53.822
424	CeraVe Moisturising Cream 340g	Fast-absorbing​. Rich cream, non-greasy formula​. Long-lasting hydration​. Non-comedogenic, so won’t clog pores​. Helps to protect the skin’s natural barrier​. 93%…	96000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537237/pharmacy-app/pharmacy/CeraVe_Moisturising_Cream_340g_424_1758537236988.jpg	2025-09-22 09:25:14.048	2025-09-22 10:33:58.359
429	Cerave Oil Control Moisturising Gel-Cream 52ml	CeraVe Oil Control Moisturizing Gel-Cream is a lightweight moisturizer with oil-absorbing technology and hydrating ingredients that delivers all-day hydration and…	110500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537246/pharmacy-app/pharmacy/Cerave_Oil_Control_Moisturising_Gel_Crea_429_1758537245881.jpg	2025-09-22 09:25:19.862	2025-09-22 10:34:06.964
432	Cerave SA Renewing Foot Cream 88ml	A non-irritating cream containing salicylic acid that exfoliates and moisturises dry, cracked feet and helps protect the skin barrier for…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537253/pharmacy-app/pharmacy/Cerave_SA_Renewing_Foot_Cream_88ml_432_1758537252504.jpg	2025-09-22 09:25:23.243	2025-09-22 10:34:14.205
434	CeraVe SA Smoothing Cleanser 236ml	A gentle daily exfoliant that helps smooth rough and bumpy skin while respecting the protective skin barrier. Suitable for dry…	82000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537258/pharmacy-app/pharmacy/CeraVe_SA_Smoothing_Cleanser_236ml_434_1758537257837.png	2025-09-22 09:25:25.822	2025-09-22 10:34:19.15
438	Cetaphil Gentle Skin Cleanser 236ml	Cetaphil Gentle Skin Cleanser cleanses, moisturises and gently removes what your skin doesn’t need, without stripping away the skin’s natural…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537269/pharmacy-app/pharmacy/Cetaphil_Gentle_Skin_Cleanser_236ml_438_1758537269091.jpg	2025-09-22 09:25:30.564	2025-09-22 10:34:29.838
440	Cetaphil Moisturising Lotion 236ml	Soothes and hydrates Fragrance-free and non-comedogenic Clinically proven to bind water to the skin and prevent moisture loss Quick absorption…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537274/pharmacy-app/pharmacy/Cetaphil_Moisturising_Lotion_236ml_440_1758537273394.png	2025-09-22 09:25:32.739	2025-09-22 10:34:34.687
442	Cetaphil Oily Skin Cleanser 236ml	Removes excess oil without drying the skin Soap-free Removes surface oils, dirt, skin debris and light make-up with a gentle-foaming…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537279/pharmacy-app/pharmacy/Cetaphil_Oily_Skin_Cleanser_236ml_442_1758537278726.png	2025-09-22 09:25:34.904	2025-09-22 10:34:40.039
445	ChapStick Protect & Moisturise Classic Cherry Lip Balm	You can't go wrong with a Classic! The Classic Cherry balm softens lips, helps prevent chapping and is a great…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537285/pharmacy-app/pharmacy/ChapStick_Protect___Moisturise_Classic_C_445_1758537284343.jpg	2025-09-22 09:25:38.259	2025-09-22 10:34:45.348
447	ChapStick Protect & Moisturise Classic Strawberry Lip Balm	From America's lip care experts, trusted for over 130 years: The classic formulation with its sweet strawberry flavor won't disappoint…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537289/pharmacy-app/pharmacy/ChapStick_Protect___Moisturise_Classic_S_447_1758537289109.jpg	2025-09-22 09:25:40.43	2025-09-22 10:34:50.176
449	Chicco Baby Moments Bady Lotion[0m+] 500ml	Chicco Baby Moments Baby Lotion is a gentle, soothing lotion designed to keep your baby’s delicate skin soft and moisturized.	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537293/pharmacy-app/pharmacy/Chicco_Baby_Moments_Bady_Lotion_0m___500_449_1758537293226.jpg	2025-09-22 09:25:42.818	2025-09-22 10:34:54.13
450	Chicco Baby Moments Bar Soap[0m+]	Glycerine-based formula gently cleanses and moisturizes the baby's skin. Vegetable-based soap, with 81% naturally derived-ingredients.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537296/pharmacy-app/pharmacy/Chicco_Baby_Moments_Bar_Soap_0m___450_1758537295158.jpg	2025-09-22 09:25:43.898	2025-09-22 10:34:56.525
452	Chicco Baby Moments No-Tears Shampoo[0m+] 200ml	with 92% naturally derived-ingredients Cleanses baby’s fine hair and delicate skin in a single step. No-tears formula contains calendula extract…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537300/pharmacy-app/pharmacy/Chicco_Baby_Moments_No_Tears_Shampoo_0m__452_1758537299983.jpg	2025-09-22 09:25:46.067	2025-09-22 10:35:01.133
455	Chlorphenamine Maleate (Piriton) 4mg Tablets 10’s	For relief of allergic reactions like allergic rhinitis and skin rash.	500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537307/pharmacy-app/pharmacy/Chlorphenamine_Maleate__Piriton__4mg_Tab_455_1758537306670.jpg	2025-09-22 09:25:49.593	2025-09-22 10:35:07.677
457	Chris Adams Active Man Perfume -100ml	Leaves a long lasting essence throughout a day. Leaves the skin delicately fragranced. Formulated to allow for a long-lasting stay.…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537311/pharmacy-app/pharmacy/Chris_Adams_Active_Man_Perfume__100ml_457_1758537310312.jpg	2025-09-22 09:25:51.749	2025-09-22 10:35:11.898
460	Chris Adams Let’s Imagine Deodorant Body Spray 200ml	An exotic powerful versatile spicy scent expressing masculinity with empowering aromatic notes.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537316/pharmacy-app/pharmacy/Chris_Adams_Let_s_Imagine_Deodorant_Body_460_1758537316159.jpg	2025-09-22 09:25:55.008	2025-09-22 10:35:17.059
462	Cialis (Tadalafil) 20mg Tablet	Cialis (Tadalafil) is used to treat male sexual function problems (impotence or erectile dysfunction-ED). Tadalafil belongs to a group of…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537324/pharmacy-app/pharmacy/Cialis__Tadalafil__20mg_Tablet_462_1758537323795.jpg	2025-09-22 09:25:57.166	2025-09-22 10:35:25.197
466	Clabane Acne Bar 125g	The Clabane Acne bar with 2% Salicylic acid is recommended for management of acne breakouts. It helps to prevent further…	34000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537333/pharmacy-app/pharmacy/Clabane_Acne_Bar_125g_466_1758537332969.jpg	2025-09-22 09:26:02.769	2025-09-22 10:35:34.259
468	Clabane Acne Clearing Cream 50ml	Clabane Organics Acne Clearing Cream helps with the following: Helps reduce acne and unclog pores. Reduces Inflammation in acne Helps…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537337/pharmacy-app/pharmacy/Clabane_Acne_Clearing_Cream_50ml_468_1758537337001.jpg	2025-09-22 09:26:08.626	2025-09-22 10:35:38.1
470	Clabane Eczema Care Moisturising Lotion 300ml	The Clabane Eczema Care cream is made to soothe dry, itchy, sensitive and irritated skin while softening and protecting it.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537341/pharmacy-app/pharmacy/Clabane_Eczema_Care_Moisturising_Lotion__470_1758537340583.jpg	2025-09-22 09:26:11.576	2025-09-22 10:35:41.786
473	Clabane MD Acne Control Cleanser 200ml	10% benzoyl peroxide, clears acne, soothes with Dead Sea minerals, Grapefruit, and tea tree. For all skin types, fragrance-free, paraben-free.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537346/pharmacy-app/pharmacy/Clabane_MD_Acne_Control_Cleanser_200ml_473_1758537346157.jpg	2025-09-22 09:26:15.979	2025-09-22 10:35:47.161
475	Clabane Organics Vitamin C Serum 30ml	Vitamin C serum has 20% Vitamin C serum which helps to renew skin, fade dark spots, remove toxins from skin,…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537350/pharmacy-app/pharmacy/Clabane_Organics_Vitamin_C_Serum_30ml_475_1758537349607.jpg	2025-09-22 09:26:19.05	2025-09-22 10:35:50.592
478	Clabane Pure Transparent Bar 125g	When you have a sensitive, dry, itchy skin, you need to use a soap that is free of chemicals that…	20500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537356/pharmacy-app/pharmacy/Clabane_Pure_Transparent_Bar_125g_478_1758537355350.jpg	2025-09-22 09:26:24.171	2025-09-22 10:35:56.583
480	Clabane Vitamin C Youthful Glow with Ferulic acid, Hyaluronic acid, Jojoba and Witch Hazel Serum 30ml	Clabane Organics Vitamin C youthful glow Serum (with Ferulic acid, Hyaluronic acid, Jojoba and Witch Hazel) is fragrance free, safe…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537360/pharmacy-app/pharmacy/Clabane_Vitamin_C_Youthful_Glow_with_Fer_480_1758537359917.jpg	2025-09-22 09:26:26.834	2025-09-22 10:36:00.893
484	Clean & Clear Blackhead Clearing Cleanser 200ml	CLEAN & CLEAR® Blackhead Clearing Cleanser is specially formulated to start fighting blackheads from Day 1! It helps reduce blackheads by…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537370/pharmacy-app/pharmacy/Clean___Clear_Blackhead_Clearing_Cleanse_484_1758537369602.jpg	2025-09-22 09:26:32.073	2025-09-22 10:36:10.576
485	Clean & Clear Blackhead Clearing Daily Scrub 150ml	Clean & Clear Blackhead Clearing Daily Scrub's formula lifts away dirt, oil and impurities to help reduce blackheads and prevent…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537372/pharmacy-app/pharmacy/Clean___Clear_Blackhead_Clearing_Daily_S_485_1758537371837.jpg	2025-09-22 09:26:33.592	2025-09-22 10:36:12.954
488	Clean & Clear Deep Cleaning Astringent 240ml	Formulated with 2% salicylic acid acne medicine, this deep cleaning astringent targets existing pimples and helps prevent new ones from…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537382/pharmacy-app/pharmacy/Clean___Clear_Deep_Cleaning_Astringent_2_488_1758537381618.jpg	2025-09-22 09:26:37.588	2025-09-22 10:36:22.662
491	Clean and Clear Deep Cleansing Lotion For Sensitive Skin 200ml	A deep cleansing daily essential for sensitive skin! This oil-fighting formula cleanses deep into your pores to help prevent spots without…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537388/pharmacy-app/pharmacy/Clean_and_Clear_Deep_Cleansing_Lotion_Fo_491_1758537387798.jpg	2025-09-22 09:26:41.886	2025-09-22 10:36:28.891
493	Clear Blue Rapid Detect Pregnancy Test 1piece	Pregnancy tests work by checking your urine (pee) for a hormone called human chorionic gonadotropin (HCG). Your body makes this hormone…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537393/pharmacy-app/pharmacy/Clear_Blue_Rapid_Detect_Pregnancy_Test_1_493_1758537392341.jpg	2025-09-22 09:26:44.346	2025-09-22 10:36:33.397
496	Clearasil Rapid Action Clearing Toner 200ml	Rapid action deep pore treatment toner. Visibly clearer skin in as little as 12 hours. Works fast to open blocked…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537400/pharmacy-app/pharmacy/Clearasil_Rapid_Action_Clearing_Toner_20_496_1758537399415.png	2025-09-22 09:26:48.747	2025-09-22 10:36:40.379
499	Clearblue Digital Ovulation Test Kit – 10 tests	Clearblue Digital Ovulation Test helps you maximise your chances of conceiving naturally by identifying your 2 most fertile days each…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537406/pharmacy-app/pharmacy/Clearblue_Digital_Ovulation_Test_Kit___1_499_1758537405319.jpg	2025-09-22 09:26:52.985	2025-09-22 10:36:46.299
502	Clinomyn Fresh Mint Smokers Toothpaste 75ml	Clinomyn Toothpaste 75 Smokers has been specially formulated to remove nicotine stains from teeth, restoring their natural colour. This toothpaste…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537412/pharmacy-app/pharmacy/Clinomyn_Fresh_Mint_Smokers_Toothpaste_7_502_1758537411456.jpg	2025-09-22 09:26:56.551	2025-09-22 10:36:52.411
504	Clotri-Denk Clotrimazole 1% Cream 20g	Used to treat fungal infections of the skin and body such as athlete’s foot, fungal nail infections, ringworm and vaginal…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537415/pharmacy-app/pharmacy/Clotri_Denk_Clotrimazole_1__Cream_20g_504_1758537414658.jpg	2025-09-22 09:26:58.941	2025-09-22 10:36:55.72
508	Cofta Tablets 100’s	Cofta tabs relieves dry irritating cough through its demulscent effects and promotes expulsion of difficult mucus. Each pack contains 100…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537428/pharmacy-app/pharmacy/Cofta_Tablets_100_s_508_1758537428013.png	2025-09-22 09:27:04.415	2025-09-22 10:37:09.237
511	Coldcap Non Drowsy Capsules 12’s	Cold cap is used for common cold, flu, watery eyes caused by allergies, runny nose, watery eyes, rhinitis, hay fever…	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537432/pharmacy-app/pharmacy/Coldcap_Non_Drowsy_Capsules_12_s_511_1758537431627.jpg	2025-09-22 09:27:09.33	2025-09-22 10:37:12.727
514	Coldease Capsules 100’s	Relief of symptoms of the common cold and flu. Each pack contains 100 capsules.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537441/pharmacy-app/pharmacy/Coldease_Capsules_100_s_514_1758537441030.jpg	2025-09-22 09:27:13.943	2025-09-22 10:37:22.181
516	Colgate 360 Optic White Sonic Power Toothbrush	Experience Deep Cleaning Power and a healthier whole mouth clean with a 4X Deeper Reach.	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537445/pharmacy-app/pharmacy/Colgate_360_Optic_White_Sonic_Power_Toot_516_1758537444914.jpg	2025-09-22 09:27:16.907	2025-09-22 10:37:25.986
518	Colgate Extra Clean Medium Toothbrush 3’s	Specially designed cleaning tip that reaches and cleans back teeth. These toothbrushes also come with a soft rubber tongue cleaner…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537449/pharmacy-app/pharmacy/Colgate_Extra_Clean_Medium_Toothbrush_3__518_1758537448322.jpg	2025-09-22 09:27:19.878	2025-09-22 10:37:29.307
519	Colgate Herbal Toothpaste 230g	Strong teeth and healthy gums. Has chamomile that provides a refreshing and stimulating experience. Has the richness of eucalyptus and…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537450/pharmacy-app/pharmacy/Colgate_Herbal_Toothpaste_230g_519_1758537450258.jpg	2025-09-22 09:27:21.338	2025-09-22 10:37:30.979
520	Colgate Jungle Kids Toothbrush 2-5Years	Extra soft toothbrush, with better thumb rest allowing for effective cleaning in a kids mouth. Has multi-height bristles to clean…	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537452/pharmacy-app/pharmacy/Colgate_Jungle_Kids_Toothbrush_2_5Years_520_1758537451617.jpg	2025-09-22 09:27:22.847	2025-09-22 10:37:32.484
522	Colgate Max White Medium Toothbrush	Recharge Your Smile with the Colgate Max White Medium Toothbrush which Removes stains and Reveals natural whiteness of your teeth.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537456/pharmacy-app/pharmacy/Colgate_Max_White_Medium_Toothbrush_522_1758537455397.jpg	2025-09-22 09:27:26.055	2025-09-22 10:37:36.277
525	Colgate Toothpaste Herbal 140g	Strong teeth and healthy gums. Has chamomile that provides a refreshing and stimulating experience. Has the richness of eucalyptus and…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537462/pharmacy-app/pharmacy/Colgate_Toothpaste_Herbal_140g_525_1758537462117.jpg	2025-09-22 09:27:30.219	2025-09-22 10:37:43.339
528	Combivent Nebules 2.5ml	For relief of obstructive airway disease symptoms.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537469/pharmacy-app/pharmacy/Combivent_Nebules_2_5ml_528_1758537468325.jpg	2025-09-22 09:27:34.239	2025-09-22 10:37:49.283
530	Control D Infrared Thermometer	Control D Non-Contact Infrared Thermometer is a non-contact device designed for measuring body and object temperature from a 3-5 cm…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537473/pharmacy-app/pharmacy/Control_D_Infrared_Thermometer_530_1758537472287.jpg	2025-09-22 09:27:36.575	2025-09-22 10:37:53.246
532	Contus Paediatric Syrup 50ml	Used for symptomatic relief of congestion and cough associated with flu and the common cold in children.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537476/pharmacy-app/pharmacy/Contus_Paediatric_Syrup_50ml_532_1758537475993.jpg	2025-09-22 09:27:39.258	2025-09-22 10:37:56.854
535	Corsodyl Original Mouthwash 300ml	For bleeding gums and mouth ulcers. Kills germs in 30seconds.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537481/pharmacy-app/pharmacy/Corsodyl_Original_Mouthwash_300ml_535_1758537481159.jpg	2025-09-22 09:27:43.662	2025-09-22 10:38:02.281
537	Cosmetic Cotton Pads 80’s	These white cotton rounds are useful for a variety of skin care procedures, including make-up removal. They are specially designed…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537485/pharmacy-app/pharmacy/Cosmetic_Cotton_Pads_80_s_537_1758537484746.jpg	2025-09-22 09:27:46.658	2025-09-22 10:38:05.558
541	Cottons Disposable Nursing Pads 30’s	With a 100% cotton cover sheet specially contoured and designed to avoid “leaks’, these disposable nursing pads are perfect for…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537497/pharmacy-app/pharmacy/Cottons_Disposable_Nursing_Pads_30_s_541_1758537496754.jpg	2025-09-22 09:27:51.856	2025-09-22 10:38:17.746
543	Cottons Regular Maxi Pads With Wings 10’s	Choose Cottons maxi regular sanitary pads if you don't want any hassle during the medium and heavy days of your…	23500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537502/pharmacy-app/pharmacy/Cottons_Regular_Maxi_Pads_With_Wings_10__543_1758537501487.jpg	2025-09-22 09:27:54.313	2025-09-22 10:38:22.864
545	Cottons Super Maxi Pads With Wings 10’s	A more absorbent discreet naturally hypo-allergenic pad for when you need greater absorbency.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537507/pharmacy-app/pharmacy/Cottons_Super_Maxi_Pads_With_Wings_10_s_545_1758537506458.jpg	2025-09-22 09:27:56.973	2025-09-22 10:38:27.677
547	Cottons Super Ultra Thin Pads With Wings 12’s	These are extremely comfortable and hypo-allergenic unscented pads, and have been designed with strong wings, to ensure they stay in…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537511/pharmacy-app/pharmacy/Cottons_Super_Ultra_Thin_Pads_With_Wings_547_1758537510381.jpg	2025-09-22 09:27:59.944	2025-09-22 10:38:31.476
551	Covidex 20ml	Made by Jena Herbals Uganda Limited, Covidex is approved by NDA to be used as a supportive treatment for COVID-19…	10500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537518/pharmacy-app/pharmacy/Covidex_20ml_551_1758537518289.jpg	2025-09-22 09:28:06.19	2025-09-22 10:38:39.241
553	Covonia Chesty Cough Mixture Mentholated 150ml	Helps banish productive (chesty) coughs and sore throats.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537522/pharmacy-app/pharmacy/Covonia_Chesty_Cough_Mixture_Mentholated_553_1758537522011.png	2025-09-22 09:28:08.956	2025-09-22 10:38:43.627
555	Covonia Dry & Tickly Cough Linctus 150ml	Fight back against coughs and sore throats with a spoonful of soothing relief.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537527/pharmacy-app/pharmacy/Covonia_Dry___Tickly_Cough_Linctus_150ml_555_1758537526698.jpg	2025-09-22 09:28:12.434	2025-09-22 10:38:47.754
558	Cow & Gate 1 Nutristart 400g	Cow and Gate NutriStart 1 Formula Milk is 100% whey protein. Ensure that your baby is getting nourishment in your…	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537535/pharmacy-app/pharmacy/Cow___Gate_1_Nutristart_400g_558_1758537535166.jpg	2025-09-22 09:28:16.838	2025-09-22 10:38:56.271
559	Cow & Gate 2 900g	Cow & Gate Growing-up milk for 6 to 12 months old babies is nutritionally tailored, with calcium to support normal…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537538/pharmacy-app/pharmacy/Cow___Gate_2_900g_559_1758537538064.png	2025-09-22 09:28:18.375	2025-09-22 10:39:00.65
561	Cow & Gate 3 Junior Infant Formula Milk 400g	Premium Quality. Enriched with vitamin D, calcium, and iron. Nutritionally tailored.	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537546/pharmacy-app/pharmacy/Cow___Gate_3_Junior_Infant_Formula_Milk__561_1758537545729.jpg	2025-09-22 09:28:21.447	2025-09-22 10:39:07.409
562	Cow & Gate Cereal Banana & Milk 200g	With natural ingredients and vitamin B1. Exciting texture. No added sugar - contains naturally occurring sugars. No artificial colours, flavourings…	13500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537548/pharmacy-app/pharmacy/Cow___Gate_Cereal_Banana___Milk_200g_562_1758537548256.jpg	2025-09-22 09:28:22.983	2025-09-22 10:39:09.269
566	Cow & Gate Nutristart 2 400g	Cow & Gate Nutristart 2 baby food range provides you with more options for feeding your baby easily and instantly without depriving…	43000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537538/pharmacy-app/pharmacy/Cow___Gate_2_900g_559_1758537538064.png	2025-09-22 09:28:28.986	2025-09-22 10:39:19.287
568	Cranmax Sachets 10’s	Cranmax powder is a natural cranberry extract that prevents and relieves urinary tract infections.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537563/pharmacy-app/pharmacy/Cranmax_Sachets_10_s_568_1758537562364.jpg	2025-09-22 09:28:31.501	2025-09-22 10:39:23.444
572	Cussons Baby Gift Pack(Pink)	The Cussons baby gift pack is a complete set of baby toiletries from the Soft & Smooth range, packed in a…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537567/pharmacy-app/pharmacy/Cussons_Baby_Gift_Pack_Pink__572_1758537566391.png	2025-09-22 09:28:36.045	2025-09-22 10:39:27.879
575	Cussons Baby Oil Soft & Smooth 100ml	Pure mineral oil with soft floral scent fragrance suitable for baby massage. Helps to remove cradle cap and maintain baby's…	9500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537573/pharmacy-app/pharmacy/Cussons_Baby_Oil_Soft___Smooth_100ml_575_1758537572913.jpg	2025-09-22 09:28:39.621	2025-09-22 10:39:33.906
577	Cussons Baby Powder Mild & Gentle 100g	Unscented talcum powder enriched with Chamomile to nourish baby’s skin and aromatically calm the baby.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537576/pharmacy-app/pharmacy/Cussons_Baby_Powder_Mild___Gentle_100g_577_1758537575997.jpg	2025-09-22 09:28:42.121	2025-09-22 10:39:36.846
580	Cussons Baby Soap Soft & Smooth 100g	Soft And Smooth Moisturises And Cleans Baby's Soft Skin. Dermatologically Tested- Mild Formula. Almond And Rose Oil. Specially Formulated With Soft…	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537583/pharmacy-app/pharmacy/Cussons_Baby_Soap_Soft___Smooth_100g_580_1758537582452.jpg	2025-09-22 09:28:45.589	2025-09-22 10:39:43.44
582	Cussons Powder Mild & Gentle 50g	Unscented talcum powder enriched with Chamomile to nourish baby's skin and aromatically calm the baby.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537587/pharmacy-app/pharmacy/Cussons_Powder_Mild___Gentle_50g_582_1758537586603.jpg	2025-09-22 09:28:47.914	2025-09-22 10:39:47.795
585	Cyrinol Antitussive Syrup 60ml	Treats non productive cough.	16500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537593/pharmacy-app/pharmacy/Cyrinol_Antitussive_Syrup_60ml_585_1758537592470.jpg	2025-09-22 09:28:51.526	2025-09-22 10:39:53.31
587	CYSTONE bergenia ligulata/ciliata) 98 mg, manjishtha (rubia cordifolia) 32 mg, nagarmusta 100’s 100 Tablet		20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537596/pharmacy-app/pharmacy/CYSTONE_bergenia_ligulata_ciliata__98_mg_587_1758537596055.jpg	2025-09-22 09:28:53.85	2025-09-22 10:39:57.182
589	Danalac Goat Premium 1 400g	DANALAC infant goat milk formula is manufactured using specially formulated and developed combination of ingredients to suit to specific needs…	53000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537600/pharmacy-app/pharmacy/Danalac_Goat_Premium_1_400g_589_1758537600133.jpg	2025-09-22 09:28:56.354	2025-09-22 10:40:01.021
592	Danalac Gold Pro+ 2 400g	DANALAC is the proud answer for all hungry babies. Second only to mother's own milk. For 6-12months babies.	38500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537611/pharmacy-app/pharmacy/Danalac_Gold_Pro__2_400g_592_1758537610710.jpg	2025-09-22 09:28:59.731	2025-09-22 10:40:11.585
594	Day and Night Nurse Capsules 24’s	A combination pack for day-time and night-time treatment of cold and flu symptoms. Each pack contains 24capsules.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537615/pharmacy-app/pharmacy/Day_and_Night_Nurse_Capsules_24_s_594_1758537614640.jpg	2025-09-22 09:29:02.012	2025-09-22 10:40:15.709
597	Daynee Ashwagandha Maximum Strength Capsules	Daynee Ashwagandha Maximum Strength Gummies provide a robust dose of this ancient adaptogen to help reduce stress, improve mood, and…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537622/pharmacy-app/pharmacy/Daynee_Ashwagandha_Maximum_Strength_Caps_597_1758537621773.jpg	2025-09-22 09:29:05.471	2025-09-22 10:40:22.98
599	Daynee Horny Goat Weed Men Power 3600mg Gummies	Daynee Horny Goat Weed Men Power Gummies deliver 3600mg of potent Horny Goat Weed in each serving, designed to boost…	89000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537626/pharmacy-app/pharmacy/Daynee_Horny_Goat_Weed_Men_Power_3600mg__599_1758537625600.jpg	2025-09-22 09:29:07.707	2025-09-22 10:40:26.516
601	Daynee L-Glutathione 13-in-1 Gummies	Daynee L-Glutathione 13-in-1 Gummies offer a powerful blend of L-Glutathione and 12 other nutrients to support overall wellness and a…	89000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537632/pharmacy-app/pharmacy/Daynee_L_Glutathione_13_in_1_Gummies_601_1758537631764.jpg	2025-09-22 09:29:09.95	2025-09-22 10:40:32.933
603	DC Wellness Slimming Tea 125g	DC Wellness Slimming tea helps in weight loss by boosting the body metabolism thereby increasing the rate at which the…	25500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537636/pharmacy-app/pharmacy/DC_Wellness_Slimming_Tea_125g_603_1758537635995.jpg	2025-09-22 09:29:12.505	2025-09-22 10:40:36.798
606	DEEP HEAT RUB 35G	Deep heat rub provides clinically proven pain relief for everyday aches and pains such as rheumatic stiffness and muscle soreness.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537642/pharmacy-app/pharmacy/DEEP_HEAT_RUB_35G_606_1758537641425.jpg	2025-09-22 09:29:16.056	2025-09-22 10:40:42.212
609	Delased Dry Cough Syrup 100ml	It soothes and relieves irritation caused by coughs and eases expectoration by loosening phlegm.	5500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537648/pharmacy-app/pharmacy/Delased_Dry_Cough_Syrup_100ml_609_1758537647277.jpg	2025-09-22 09:29:19.586	2025-09-22 10:40:48.171
611	Delivery Sheets 1mtr	The sheet has a soft surface material which is kind to the skin and is waterproof to protect the mother…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537652/pharmacy-app/pharmacy/Delivery_Sheets_1mtr_611_1758537650968.jpg	2025-09-22 09:29:21.906	2025-09-22 10:40:52.685
613	Denk-Air Junior Montelukast 5mg Tablets 28’s	For relief and prevention of bronchial constriction in mild asthma.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537656/pharmacy-app/pharmacy/Denk_Air_Junior_Montelukast_5mg_Tablets__613_1758537656186.jpg	2025-09-22 09:29:24.377	2025-09-22 10:40:57.198
618	Deriva C Gel 15g (Adapalene, Clindamycin)	effectively treats acne.	21500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537670/pharmacy-app/pharmacy/Deriva_C_Gel_15g__Adapalene__Clindamycin_618_1758537669812.jpg	2025-09-22 09:29:30.684	2025-09-22 10:41:10.502
619	Deslora-Denk 5mg Tablets 10’s	Desloratadine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537671/pharmacy-app/pharmacy/Deslora_Denk_5mg_Tablets_10_s_619_1758537671178.jpg	2025-09-22 09:29:31.998	2025-09-22 10:41:12.141
623	Dettol Herbal Soap 100g	Formulated with nourishing moisturizers and Dettol’s trusted germ protection helps in making your skin softer, smoother and healthy every day.	4200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537677/pharmacy-app/pharmacy/Dettol_Herbal_Soap_100g_623_1758537676567.jpg	2025-09-22 09:29:37.187	2025-09-22 10:41:17.665
626	Dettol Liquid 250ml	Use Dettol Antiseptic Liquid to kill germs on the skin, help protect against infection from cuts, scratches and insect bites.	16500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537683/pharmacy-app/pharmacy/Dettol_Liquid_250ml_626_1758537682629.jpg	2025-09-22 09:29:40.645	2025-09-22 10:41:23.415
629	Dettol Original Antibacterial Bar Soap 100g	A gentle soap with specially added original pine fragrance. Contains Anti-bacterial agents that provide you 100% trusted Dettol protection.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537688/pharmacy-app/pharmacy/Dettol_Original_Antibacterial_Bar_Soap_1_629_1758537687749.jpg	2025-09-22 09:29:44.409	2025-09-22 10:41:29.028
632	Diabetone Plus Omega 3 (vitamin B1 (Thiamin), Vit B6, vit C, Zinc and magnesium) Tabs 56’S		120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537694/pharmacy-app/pharmacy/Diabetone_Plus_Omega_3__vitamin_B1__Thia_632_1758537694139.png	2025-09-22 09:29:47.93	2025-09-22 10:41:35.278
634	Diproson Lotion Betamethasone 30ml	Used to treat itching, swollen and irritated skin. They can help with conditions such as eczema, contact dermatitis and psoriasis.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537699/pharmacy-app/pharmacy/Diproson_Lotion_Betamethasone_30ml_634_1758537698586.jpg	2025-09-22 09:29:50.658	2025-09-22 10:41:39.679
636	Disposable Pants 5’s	A pack of 5 single-use panties---No need to wash these knickers. Soft and flexible. They have an elastic band and…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537703/pharmacy-app/pharmacy/Disposable_Pants_5_s_636_1758537702410.jpg	2025-09-22 09:29:53.402	2025-09-22 10:41:43.539
637	Doo Gro Anti-Itch Growth Oil 135ml	Helps eliminate dry scalp. Promotes strong, shiny, healthy hair. Helps reduce breakage allowing hair to grow longer.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537704/pharmacy-app/pharmacy/Doo_Gro_Anti_Itch_Growth_Oil_135ml_637_1758537704261.jpg	2025-09-22 09:29:54.856	2025-09-22 10:41:45.311
638	Doo Gro Hair Vitalizer Anti-Itch Formula 100ml	Promotes strong, shiny, healthy hair. Helps reduce breakage allowing hair to grow longer. Helps relieve itching and tightness due to…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537706/pharmacy-app/pharmacy/Doo_Gro_Hair_Vitalizer_Anti_Itch_Formula_638_1758537706181.jpg	2025-09-22 09:29:56.017	2025-09-22 10:41:47.245
640	Doo Gro Mega Thick Hair Growth Oil 133ml	Promotes thick, strong, healthy hair. Thickens and strengthens weak damaged hair. Tames frizzies and adds shine. Helps reduce breakage allowing…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537711/pharmacy-app/pharmacy/Doo_Gro_Mega_Thick_Hair_Growth_Oil_133ml_640_1758537710400.jpg	2025-09-22 09:29:59.362	2025-09-22 10:41:51.352
643	Dove 0% Aluminum Pear & Aloe Vera Deodorant Stick	Enjoy 48-hour odor protection and the best care with this aluminum-free deodorant stick.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537719/pharmacy-app/pharmacy/Dove_0__Aluminum_Pear___Aloe_Vera_Deodor_643_1758537719216.jpg	2025-09-22 09:30:03.437	2025-09-22 10:42:00.069
645	Dove Avocado Oil Invigorating Ritual Body Lotion 400ml	Enriched with avocado oil and calendula extract for smooth skin. Replenishes the skin with long-lasting hydration. Provides intense softness, intensity…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537722/pharmacy-app/pharmacy/Dove_Avocado_Oil_Invigorating_Ritual_Bod_645_1758537722163.jpg	2025-09-22 09:30:05.885	2025-09-22 10:42:02.956
648	Dove Body Love Glowing Care Body Lotion 250ml	Dove Nourishing Secrets Glowing Body Lotion is inspired by the natural ingredients used by women in Japan. The body lotion…	14500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537728/pharmacy-app/pharmacy/Dove_Body_Love_Glowing_Care_Body_Lotion__648_1758537727516.png	2025-09-22 09:30:09.636	2025-09-22 10:42:08.712
651	Dove Body Silk Moisturising Cream 300ml	Enjoy the feeling of beautiful, silky skin every day with this nourishing body cream – enriched with the unique NutriDUO…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537734/pharmacy-app/pharmacy/Dove_Body_Silk_Moisturising_Cream_300ml_651_1758537733326.png	2025-09-22 09:30:13.232	2025-09-22 10:42:14.292
653	Dove Coconut Milk and Jasmine Petals Body Wash 750ml	Delight your senses with the scent of coconut and jasmine petals every morning with this relaxing body wash.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537737/pharmacy-app/pharmacy/Dove_Coconut_Milk_and_Jasmine_Petals_Bod_653_1758537736812.jpg	2025-09-22 09:30:15.756	2025-09-22 10:42:17.659
656	Dove Essential Care Body Lotion 400ml	Beautiful bodies deserve superior care (that means yours, by the way). Turn everyday routines into a treat with our velvety…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537744/pharmacy-app/pharmacy/Dove_Essential_Care_Body_Lotion_400ml_656_1758537743758.jpg	2025-09-22 09:30:19.281	2025-09-22 10:42:24.948
659	Dove Go Fresh Cucumber & Green Tea Deo Stick 40g	Long-lasting protection. High effect on shoulder wetness and body odour. Pleasant dry feeling.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537749/pharmacy-app/pharmacy/Dove_Go_Fresh_Cucumber___Green_Tea_Deo_S_659_1758537748837.jpg	2025-09-22 09:30:22.759	2025-09-22 10:42:29.606
661	Dove Intensive Nourishing Body Lotion 250ml	Fast-absorbing Dove Body Love Intense Care Body Lotion helps to transform very dry skin into soft, radiant, moisturised skin. Formulated…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537752/pharmacy-app/pharmacy/Dove_Intensive_Nourishing_Body_Lotion_25_661_1758537752278.jpg	2025-09-22 09:30:25.111	2025-09-22 10:42:33.44
664	Dove Invisible Dry Deo Stick	Dove Invisible Dry - proven to leave no white marks on 100 colours, whilst offering 48hr protection and underarm care.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537758/pharmacy-app/pharmacy/Dove_Invisible_Dry_Deo_Stick_664_1758537757812.png	2025-09-22 09:30:28.9	2025-09-22 10:42:39.072
666	Dove Men Mineral Sage Dry Deo Spray 250ml	Combat sweat and odor for 48 hours with this dry spray formula scented with Lime and Sage for long-lasting freshness.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537766/pharmacy-app/pharmacy/Dove_Men_Mineral_Sage_Dry_Deo_Spray_250m_666_1758537765612.png	2025-09-22 09:30:31.559	2025-09-22 10:42:46.959
669	Dove Nourishing Silk Body Wash 500ml	For elegant soft skin: Dove Nourishing Silk Body Wash is silky and light with a rich floral fragrance.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537772/pharmacy-app/pharmacy/Dove_Nourishing_Silk_Body_Wash_500ml_669_1758537771828.png	2025-09-22 09:30:35.13	2025-09-22 10:42:52.911
671	Dove Original Antiperspirant Deodorant Stick	This clean, simple antiperspirant glides onto skin smoothly, giving up to 48-hour protection so you feel fresh and dry.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537776/pharmacy-app/pharmacy/Dove_Original_Antiperspirant_Deodorant_S_671_1758537775330.png	2025-09-22 09:30:37.919	2025-09-22 10:42:56.484
672	Dove Original Beauty Cream Bar Soap 135g	Dove Original Beauty Bar contains ¼ moisturizing cream to soften and smooth skin leaving it looking radiant.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537777/pharmacy-app/pharmacy/Dove_Original_Beauty_Cream_Bar_Soap_135g_672_1758537777130.png	2025-09-22 09:30:39.406	2025-09-22 10:42:58.221
675	Dove Pampering Shea Butter and Warm Vanilla Lotion 400ml	Dove Purely Pampering Shea Butter and Warm Vanilla Nourishing Lotion is a rich moisturiser that nourishes your skin.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537783/pharmacy-app/pharmacy/Dove_Pampering_Shea_Butter_and_Warm_Vani_675_1758537782607.jpg	2025-09-22 09:30:43.376	2025-09-22 10:43:03.536
678	Dove Refreshing Cucumber & Green Tea Scent Body Wash 500ml	A refreshing shower is a great way to start your day off right, and a hydrating body wash can help…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537789/pharmacy-app/pharmacy/Dove_Refreshing_Cucumber___Green_Tea_Sce_678_1758537788327.png	2025-09-22 09:30:47.105	2025-09-22 10:43:09.487
680	Dove Restoring Ritual Coconut And Jasmine Antiperspirant Deo Stick	With the creamy, caring scent of jasmine flower and coconut, this soothing antiperspirant deodorant envelops you in an exotic aroma,…	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537793/pharmacy-app/pharmacy/Dove_Restoring_Ritual_Coconut_And_Jasmin_680_1758537792623.jpg	2025-09-22 09:30:49.746	2025-09-22 10:43:13.888
683	Dr. Organic Charcoal Deep Cleansing Face Scrub 125ml	It is exfoliating and promote deep pore purifying, Anti-pollution detoxifying face scrub.	0	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537799/pharmacy-app/pharmacy/Dr__Organic_Charcoal_Deep_Cleansing_Face_683_1758537798826.jpg	2025-09-22 09:30:53.318	2025-09-22 10:43:21.363
686	Dr. Organic Skin Care Tea Tree Deep Pore Charcoal Mask 5in1 100ml	Best for: Oil control, skin prone to spots, blemishes and breakouts.	57000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537808/pharmacy-app/pharmacy/Dr__Organic_Skin_Care_Tea_Tree_Deep_Pore_686_1758537807726.jpg	2025-09-22 09:30:57.216	2025-09-22 10:43:28.807
688	Dr. Organic Vitamin E  Skin Lotion 200ml	Hydrating and moisturising skin lotion for dry skin.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537812/pharmacy-app/pharmacy/Dr__Organic_Vitamin_E__Skin_Lotion_200ml_688_1758537812155.jpg	2025-09-22 09:30:59.605	2025-09-22 10:43:33.344
691	DUPHALAC Lactulose 667 mg/mL Syrup 300ml	Laxative. For the stool to pass softer and easier.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537816/pharmacy-app/pharmacy/DUPHALAC_Lactulose_667_mg_mL_Syrup_300ml_691_1758537816344.jpg	2025-09-22 09:31:03.326	2025-09-22 10:43:37.081
693	Durex Extra Safe Condoms 6’s	Durex Extra Safe condoms are extra lubricated(silicon) and slightly thicker for greater comfort and peace of mind. They are shaped…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537824/pharmacy-app/pharmacy/Durex_Extra_Safe_Condoms_6_s_693_1758537823533.jpg	2025-09-22 09:31:08.098	2025-09-22 10:43:44.609
696	Durex Fetherlite Condoms 3’s	Durex Fetherlite Condoms 3 are ultra fine, natural rubber latex condoms for greater sensitivity. They are designed to keep you…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537834/pharmacy-app/pharmacy/Durex_Fetherlite_Condoms_3_s_696_1758537833402.jpg	2025-09-22 09:31:11.961	2025-09-22 10:43:54.197
698	Durex Strawberry Lubricant 50ml	Durex Strawberry Lubricant gel is a safe water based lubricant to ensure smooth and comfortable sexual intercourse with your partner.…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537838/pharmacy-app/pharmacy/Durex_Strawberry_Lubricant_50ml_698_1758537837169.jpg	2025-09-22 09:31:14.129	2025-09-22 10:43:58.433
701	Durex Thin Feel Extra Lubricated Condoms 12’s	Durex Thin Feel Extra Lubricated Condoms are designed to enhance feeling between you and your partner, bringing you closer through…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537844/pharmacy-app/pharmacy/Durex_Thin_Feel_Extra_Lubricated_Condoms_701_1758537843851.jpg	2025-09-22 09:31:17.408	2025-09-22 10:44:05.192
704	E45 Cream 350g	Treatment for dry skin conditions including: Dry/flaky skin, Eczema, Itchy skin, Dry psoriasis, and  Sunburn.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537851/pharmacy-app/pharmacy/E45_Cream_350g_704_1758537850375.jpg	2025-09-22 09:31:20.748	2025-09-22 10:44:11.579
707	E45 Itch Relief Cream 100g	Rapid relief from the itch of eczema. Treats and soothes problem, dry skin conditions. Non-greasy, moisturising and quickly absorbed to…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537857/pharmacy-app/pharmacy/E45_Itch_Relief_Cream_100g_707_1758537856789.jpg	2025-09-22 09:31:24.901	2025-09-22 10:44:17.582
708	E45 Moisturising Lotion 200ml	Is ideal for soothing, softening and relieving dry and sensitive skin to visibly reduce redness in just 2 weeks.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537859/pharmacy-app/pharmacy/E45_Moisturising_Lotion_200ml_708_1758537858365.jpg	2025-09-22 09:31:26.082	2025-09-22 10:44:19.342
710	E45 Rich 24 Hours Moisturising Lotion Evening Primrose Oil 400ml	With evening primrose oil.  No added colours or fragrances.  Deep and long-lasting moisturisation. Suitable for dry and sensitive skin.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537863/pharmacy-app/pharmacy/E45_Rich_24_Hours_Moisturising_Lotion_Ev_710_1758537862527.jpg	2025-09-22 09:31:28.45	2025-09-22 10:44:23.856
713	EAD Sunscreen SPF50 95ml	SPF50 Sunscreen Lotion specially formulated with advanced sunscreen complex, enriched with an anti-oxidant blend of vitamins E and C. Deep…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537869/pharmacy-app/pharmacy/EAD_Sunscreen_SPF50_95ml_713_1758537869101.jpg	2025-09-22 09:31:32.422	2025-09-22 10:44:29.972
716	Elastoplast Fabric Water Repellent Plasters 40’s	Elastoplast Fabric Water repellent plasters benefits; Covers and protects minor, everyday wounds  Strong adhesion  Extra flexible  Breathable material	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537877/pharmacy-app/pharmacy/Elastoplast_Fabric_Water_Repellent_Plast_716_1758537876358.jpg	2025-09-22 09:31:36.274	2025-09-22 10:44:37.858
719	Elferb Syrup 120ml	Elferb is a natural and effective remedy for “flu and cold” with added advantage of immunity boosters.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537886/pharmacy-app/pharmacy/Elferb_Syrup_120ml_719_1758537885929.png	2025-09-22 09:31:40.052	2025-09-22 10:44:47.585
721	Elocof Herbal Cough & Flu Mixture 200ml	Elocof is a specially formulated product for cough, flu and sore throat in children and adults.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537891/pharmacy-app/pharmacy/Elocof_Herbal_Cough___Flu_Mixture_200ml_721_1758537890467.jpg	2025-09-22 09:31:42.559	2025-09-22 10:44:51.682
724	Eno Calcium Antacid Tablets 100’s	Act as a calcium supplement and delivers effective relief from indigestion and heartburn. Each tablet contains calcium carbonate 500 mg.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537896/pharmacy-app/pharmacy/Eno_Calcium_Antacid_Tablets_100_s_724_1758537896097.jpg	2025-09-22 09:31:46.554	2025-09-22 10:44:57.212
726	Enrich Oral Iron Drops 30ml	Iron preparation, which is used to treat iron deficiency without latent iron deficiency anemia and iron deficiency that causes anemia.	16200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537900/pharmacy-app/pharmacy/Enrich_Oral_Iron_Drops_30ml_726_1758537899900.jpg	2025-09-22 09:31:49.13	2025-09-22 10:45:01.102
729	Ensure Plus Powder 400g	Ensure Plus Powder is complete, balanced nutrition with extra proteins to help support recovery. The Ensure Plus Powder has balanced macro-nutrients…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537907/pharmacy-app/pharmacy/Ensure_Plus_Powder_400g_729_1758537906321.jpg	2025-09-22 09:31:53.312	2025-09-22 10:45:07.662
732	Ensure Powder Gold 850g	Ensure Powder is a source of complete and balanced nutrition for supplemental use with or between meals. It is useful in…	180000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537913/pharmacy-app/pharmacy/Ensure_Powder_Gold_850g_732_1758537912656.jpg	2025-09-22 09:31:56.952	2025-09-22 10:45:13.707
735	Epimax Original Cream 100g	Epimax Original Cream is an emollient that is gentle enough to use throughout the day for the light relief of…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537919/pharmacy-app/pharmacy/Epimax_Original_Cream_100g_735_1758537917953.jpg	2025-09-22 09:32:00.707	2025-09-22 10:45:19.742
737	Epimax Original Cream 400g	Epimax Original Cream is an emollient that is gentle enough to use throughout the day for the light relief of…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537923/pharmacy-app/pharmacy/Epimax_Original_Cream_400g_737_1758537923212.jpg	2025-09-22 09:32:03.254	2025-09-22 10:45:24.145
739	Equate Kids Multivitamin Gummies 300’s	Equate Kids Multivitamin Gummies for General Health and Natural Fruit, Ensure your child is meeting their nutritional requirements.	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537928/pharmacy-app/pharmacy/Equate_Kids_Multivitamin_Gummies_300_s_739_1758537927547.jpg	2025-09-22 09:32:06.008	2025-09-22 10:45:28.651
742	Erotica Condoms 3’s	Erotica Ribbed condoms are designed to arouse intense sensation with rows of latex ribs for ultimate stimulation.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537942/pharmacy-app/pharmacy/Erotica_Condoms_3_s_742_1758537940090.jpg	2025-09-22 09:32:10.132	2025-09-22 10:45:42.473
743	Estiara Passion Bora Bora Beach Day Body Mist 250ml	One spritz is all you'll need to transport you to a Caribbean holiday with yummy scents of cucumber and melons.…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537944/pharmacy-app/pharmacy/Estiara_Passion_Bora_Bora_Beach_Day_Body_743_1758537943409.jpg	2025-09-22 09:32:11.437	2025-09-22 10:45:44.931
746	Estiara Passion Strawberry Fragrance Mist 250ml	Take your skin to a happy place with the scent of strawberry.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537950/pharmacy-app/pharmacy/Estiara_Passion_Strawberry_Fragrance_Mis_746_1758537949597.jpg	2025-09-22 09:32:15.672	2025-09-22 10:45:50.358
748	Eucalyptus Oil ( Eucalyptus globulus ) 10ml	Powerful and stimulating winter oil with an unmistakeable aroma, widely used in cough and cold remedies. Add to massage oil…	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537953/pharmacy-app/pharmacy/Eucalyptus_Oil___Eucalyptus_globulus___1_748_1758537953184.jpg	2025-09-22 09:32:18.104	2025-09-22 10:45:54.281
750	Eucryl Toothpowder Freshmint Flavour 50g	Eucryl's unique polishing action helps remove stubborn stains caused by smoking, tea, coffee or red wine, leaving teeth bright and…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537957/pharmacy-app/pharmacy/Eucryl_Toothpowder_Freshmint_Flavour_50g_750_1758537956724.jpg	2025-09-22 09:32:20.755	2025-09-22 10:45:57.632
754	Exchange Unlimited Perfume Blanc Edition 100ml	Exchange Unlimited Blanc Edition Perfume is a daring, sensual fragrance for men. Masculine, intense, seductive and at the same time…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537965/pharmacy-app/pharmacy/Exchange_Unlimited_Perfume_Blanc_Edition_754_1758537964518.jpg	2025-09-22 09:32:26.218	2025-09-22 10:46:05.467
756	Extra Virgin Olive Oil (Care) Ear Drops 10ml	Gently softens & removes earwax.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537969/pharmacy-app/pharmacy/Extra_Virgin_Olive_Oil__Care__Ear_Drops__756_1758537968701.jpg	2025-09-22 09:32:28.844	2025-09-22 10:46:09.673
758	Fa Aqua Roll On Deodorant 50ml	Deodorants by Fa provide sustained perspiration regulation while indulging your senses with a variety of fragrance types	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537972/pharmacy-app/pharmacy/Fa_Aqua_Roll_On_Deodorant_50ml_758_1758537972211.jpg	2025-09-22 09:32:31.2	2025-09-22 10:46:13.009
760	FA Pink Passion Roll On Deodorant 50ml	With the newly introduced deodorant system provides 48 hrs protection. Further its skin friendly, dermatology proven, alcohol free and provides…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537977/pharmacy-app/pharmacy/FA_Pink_Passion_Roll_On_Deodorant_50ml_760_1758537976351.png	2025-09-22 09:32:33.766	2025-09-22 10:46:17.393
763	Face Facts Ceramide Oil Control Foaming Cleanser 200mL	Face Facts Ceramide Oil Control Cleanser is Infused with a blend of 5 ceramides, hydrating hyaluronic acid, and pore-refining niacinamide,…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537982/pharmacy-app/pharmacy/Face_Facts_Ceramide_Oil_Control_Foaming__763_1758537981929.jpg	2025-09-22 09:32:37.344	2025-09-22 10:46:23.05
766	Face Facts Glow + Resurface Lactic Acid AHA Serum	Glow & Resurface Lactic Acid Facial Serum, packed with 3% Lactic Acid gently exfoliates & retexturizes the skin.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758537988/pharmacy-app/pharmacy/Face_Facts_Glow___Resurface_Lactic_Acid__766_1758537988165.jpg	2025-09-22 09:32:41.513	2025-09-22 10:46:29.047
768	Face Facts Hyaluronic Hydra Gel Cream 50mL	Face Facts Hyaluronic Hydra Gel Cream it's formulated to deliver intense moisture; its hyaluronic acid helps to keep your skin…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538000/pharmacy-app/pharmacy/Face_Facts_Hyaluronic_Hydra_Gel_Cream_50_768_1758537998937.jpg	2025-09-22 09:32:43.697	2025-09-22 10:46:40.984
771	Face Facts Renew + Radiance Retinol Serum	Renew & Radiance Retinol Facial Serum, Targets Fine lines & uneven skin tone	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538005/pharmacy-app/pharmacy/Face_Facts_Renew___Radiance_Retinol_Seru_771_1758538005054.jpg	2025-09-22 09:32:47.481	2025-09-22 10:46:46.167
774	Fair & White Exfoliating Soap 200g	Contains apricot seed powder, which rejuvenates the skin by removing blackheads and refreshing the complexion, restoring its soft and silky…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538012/pharmacy-app/pharmacy/Fair___White_Exfoliating_Soap_200g_774_1758538011609.jpg	2025-09-22 09:32:51.261	2025-09-22 10:46:52.513
776	Fair & White Gold 2 Even Tone Body Lotion 500ml	Antioxidant, Skin Brightening, Even Skin Tone, Skin Lightening, Moisturizing, Rejuvenating, Smoothening	98000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538015/pharmacy-app/pharmacy/Fair___White_Gold_2_Even_Tone_Body_Lotio_776_1758538015134.jpg	2025-09-22 09:32:53.528	2025-09-22 10:46:56.057
778	Fair & White Lait Eclaircissant Body Clearing Milk 485ml	Reduces the appearance of dark spots caused by aging, repeated environmental exposure, hormonal fluctuations, and post acne scars.	49500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538018/pharmacy-app/pharmacy/Fair___White_Lait_Eclaircissant_Body_Cle_778_1758538018377.jpg	2025-09-22 09:32:55.981	2025-09-22 10:46:59.225
779	Fair & White Miss White 14 Days Lightening Lotion For Dark Skin 500ml	WHITER SKIN IN JUST 14 DAYS! Awaken your body senses with our NEW luxurious Miss White 14 day lightening body…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538020/pharmacy-app/pharmacy/Fair___White_Miss_White_14_Days_Lighteni_779_1758538020004.jpg	2025-09-22 09:32:57.32	2025-09-22 10:47:01.118
780	Fair & White Miss White 7days Body Lotion For Medium Skin 500ml	Blend of whitening and nourishing properties moisturize skin as it prevents new dark spots from surfacing, restoring a more even,…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538022/pharmacy-app/pharmacy/Fair___White_Miss_White_7days_Body_Lotio_780_1758538021894.jpg	2025-09-22 09:32:58.584	2025-09-22 10:47:02.882
783	Fair and White Gold 1 Ultimate PREPARE Exfoliating Soap 200g	This precious soap combines Apricot kernel fragments, which eliminate dead cells, with Argan oil, known for its nourishing and soothing…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538027/pharmacy-app/pharmacy/Fair_and_White_Gold_1_Ultimate_PREPARE_E_783_1758538026978.jpg	2025-09-22 09:33:02.656	2025-09-22 10:47:07.776
785	Fair And White So Carrot Premium Brightening Body Lotion 500ml	This exquisite milk enriched with antioxidant Carrot Oil unifies and enhances the complexion. The ideal skin care product for leaving…	84000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538031/pharmacy-app/pharmacy/Fair_And_White_So_Carrot_Premium_Brighte_785_1758538031061.jpg	2025-09-22 09:33:05.168	2025-09-22 10:47:12.382
789	Femfresh 0% Sensitive Intimate Wash 250ml	Femfresh intimate sensitive wash is suitable for sensitive skin and specifically formulated without soap, fragrance and colour.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538039/pharmacy-app/pharmacy/Femfresh_0__Sensitive_Intimate_Wash_250m_789_1758538038941.jpg	2025-09-22 09:33:10.347	2025-09-22 10:47:20.062
791	Femfresh Intimate Wipes 25’s	Femfresh Intimate wipes will clean your intimate area, providing long-lasting freshness when you don’t have access to water. It works…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538044/pharmacy-app/pharmacy/Femfresh_Intimate_Wipes_25_s_791_1758538044045.jpg	2025-09-22 09:33:12.878	2025-09-22 10:47:25.387
794	Feroglobin B12 Syrup 500ml	Feroglobin B12 Liquid is a hematinic which helps maintain health and vitality, that reduces tiredness and fatigue. It provides an…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538054/pharmacy-app/pharmacy/Feroglobin_B12_Syrup_500ml_794_1758538054252.jpg	2025-09-22 09:33:16.572	2025-09-22 10:47:35.227
797	Ferrofol Iron and Folic Tablets 30’s	Ferrofol is an iron supplement used to treat or prevent low blood levels of iron (such as those caused by…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538061/pharmacy-app/pharmacy/Ferrofol_Iron_and_Folic_Tablets_30_s_797_1758538061043.png	2025-09-22 09:33:20.761	2025-09-22 10:47:42.281
800	FertilAid for Women	Comprehensive reproductive health support supplement with a blend of herbs to promote hormone balance and cycle regularity, along with key…	240000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538069/pharmacy-app/pharmacy/FertilAid_for_Women_800_1758538068260.png	2025-09-22 09:33:24.861	2025-09-22 10:47:49.829
802	Fertilo Forte Denk 30’s	Fertilo Forte Denk contains Vitamin E, folic acid, coenzyme Q10, the trace elements zinc and selenium, and the amino acids…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538074/pharmacy-app/pharmacy/Fertilo_Forte_Denk_30_s_802_1758538073293.jpg	2025-09-22 09:33:27.826	2025-09-22 10:47:54.358
804	Fexofen-180 Fexofenadine 180mg Tablets 60’s	Fexofenadine is used to relieve the allergy symptoms of seasonal allergic rhinitis including runny nose, sneezing, red, itchy or watery…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538078/pharmacy-app/pharmacy/Fexofen_180_Fexofenadine_180mg_Tablets_6_804_1758538077190.jpg	2025-09-22 09:33:30.181	2025-09-22 10:47:58.455
808	Fibo Syrup 120ml	Fibo, is a source of soluble fiber. It also contains benefits of green tea extract. Fibo helps to prevent constipation,…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538088/pharmacy-app/pharmacy/Fibo_Syrup_120ml_808_1758538087520.jpg	2025-09-22 09:33:35.199	2025-09-22 10:48:08.594
811	Fishermans Friend Aniseed Lozenges 25g	A firm favourite for generations, Fisherman's Friend Aniseed lozenges help to relieve congestion. Extra strong lozenges.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538096/pharmacy-app/pharmacy/Fishermans_Friend_Aniseed_Lozenges_25g_811_1758538095590.png	2025-09-22 09:33:38.889	2025-09-22 10:48:16.78
813	Fishermans Friend Mint Lozenges 25g	Sugar free lozenges for sore throat.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538102/pharmacy-app/pharmacy/Fishermans_Friend_Mint_Lozenges_25g_813_1758538101592.jpg	2025-09-22 09:33:41.548	2025-09-22 10:48:22.55
814	Flavours Condoms 3’s	This assortment of condoms provides the ultimate mixed variety for fun: exciting flavours, colours and textures. – Flavoured, Lubricated, teat…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538104/pharmacy-app/pharmacy/Flavours_Condoms_3_s_814_1758538103502.jpg	2025-09-22 09:33:43.29	2025-09-22 10:48:24.854
815	Flintstones Complete Multivitamin Gummies 180’s	Flintstones Complete Multivitamin Gummies are original, easy to chew and help support overall wellness, inside and out. Your kids will…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538106/pharmacy-app/pharmacy/Flintstones_Complete_Multivitamin_Gummie_815_1758538105811.jpg	2025-09-22 09:33:44.645	2025-09-22 10:48:26.816
818	FLORA NORM saccharomyces boulardii 250 mg Sachets 10’s		45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538115/pharmacy-app/pharmacy/FLORA_NORM_saccharomyces_boulardii_250_m_818_1758538115095.png	2025-09-22 09:33:48.409	2025-09-22 10:48:36.989
821	Flugone Syrup 120ml	For relief of common cold and flu symptoms.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538120/pharmacy-app/pharmacy/Flugone_Syrup_120ml_821_1758538120071.jpg	2025-09-22 09:33:52.3	2025-09-22 10:48:41.154
822	Fogg Absolute Fragrance Body Spray for Men 120ml	A refreshing fragrance which gives a refreshed and gentle experience all through the day by giving you 100% protection from…	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538122/pharmacy-app/pharmacy/Fogg_Absolute_Fragrance_Body_Spray_for_M_822_1758538121938.jpg	2025-09-22 09:33:53.754	2025-09-22 10:48:42.737
825	Fogg Napoleon Fragrance Body Spray For Men 120ml	The beautiful scent that will surely captivate your senses. Soothing experience throughout the day.	19000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538127/pharmacy-app/pharmacy/Fogg_Napoleon_Fragrance_Body_Spray_For_M_825_1758538126508.jpg	2025-09-22 09:33:57.432	2025-09-22 10:48:47.403
828	Folic Acid 5mg Tablets (UK) 28’s	Folic acid is the man-made form of folate. Folate is a B-vitamin naturally found in some foods. It is needed…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538132/pharmacy-app/pharmacy/Folic_Acid_5mg_Tablets__UK__28_s_828_1758538132178.jpg	2025-09-22 09:34:01.419	2025-09-22 10:48:53.243
830	Forever Aloe Vera Gel Drink 1L	Aloe vera helps you maintain natural energy levels and has natural cleansing abilities that help the digestive tract absorb nutrients…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538137/pharmacy-app/pharmacy/Forever_Aloe_Vera_Gel_Drink_1L_830_1758538136840.jpg	2025-09-22 09:34:03.872	2025-09-22 10:48:57.638
833	Forscar Scar Recovery UV SPF30 Topical Gel 20ml	Forscar scar Recovery gel has patented silicone technology which flattens, softens and smooths scars by increasing hydration and temperature of…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538144/pharmacy-app/pharmacy/Forscar_Scar_Recovery_UV_SPF30_Topical_G_833_1758538144108.jpg	2025-09-22 09:34:07.777	2025-09-22 10:49:05.085
836	France Lait 3 400g	France Lait “Baby formula” No. 3 is an infant formula based on cow’s milk, enriched with iron, and developed by…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538154/pharmacy-app/pharmacy/France_Lait_3_400g_836_1758538153461.jpg	2025-09-22 09:34:11.859	2025-09-22 10:49:14.638
838	France Lait Comfort 2 400g	France Lait 2 provides high quality proteins in a quantity suited to the infant’s needs. Its recommended for 6 to…	57000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538158/pharmacy-app/pharmacy/France_Lait_Comfort_2_400g_838_1758538157598.png	2025-09-22 09:34:14.739	2025-09-22 10:49:18.926
841	France shGrace Magnesium Glycinate 400mg (Quercetin) Capsules 120’s	Magnesium Glycinate is commonly used for relaxation, muscle function, and overall nervous system support.	94000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538174/pharmacy-app/pharmacy/France_shGrace_Magnesium_Glycinate_400mg_841_1758538174043.jpg	2025-09-22 09:34:18.72	2025-09-22 10:49:35.532
843	Fresubin Protein Energy Drink 200ml	Fresubin Protein Energy is a nutritionally complete, high protein, high energy 1.5kcal/ml drink for the dietary management of individuals with…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538182/pharmacy-app/pharmacy/Fresubin_Protein_Energy_Drink_200ml_843_1758538182087.jpg	2025-09-22 09:34:21.587	2025-09-22 10:49:42.94
847	Fruit of the Earth Aloe Vera Skin Care Cream 113g	Moisturizes, Soothes and Protects. Apply after exposure to wind, sun, and cold weather. For hands, face and body.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538190/pharmacy-app/pharmacy/Fruit_of_the_Earth_Aloe_Vera_Skin_Care_C_847_1758538189382.jpg	2025-09-22 09:34:27.219	2025-09-22 10:49:50.479
849	Fruit Of The Earth Vitamin E Skin Care Cream 113g	Moisturizes soothes and protects softer younger-looking skin. Dry skin cream contains nature's most effective dry skin emollients. Effective cream helps…	11500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538193/pharmacy-app/pharmacy/Fruit_Of_The_Earth_Vitamin_E_Skin_Care_C_849_1758538193005.png	2025-09-22 09:34:30.496	2025-09-22 10:49:54.37
850	Funbact‐A Cream 30g Clotrimazole + Betamethasone + Neomycin	Reduces inflammation. Used in treating fungal and bacterial infections	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538196/pharmacy-app/pharmacy/Funbact_A_Cream_30g_Clotrimazole___Betam_850_1758538195324.jpg	2025-09-22 09:34:32.033	2025-09-22 10:49:56.787
851	Fungnil Clotrimazole Cream 20g	Used to treat a range of skin infections caused by yeasts, including infections in the breast fold, vaginal thrush or…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538199/pharmacy-app/pharmacy/Fungnil_Clotrimazole_Cream_20g_851_1758538198362.jpg	2025-09-22 09:34:33.67	2025-09-22 10:49:59.223
853	FX -1 Herbal Extract Syrup for Ladies	FX – 1  is a  natural product extracted from botanical tropical herbs. It is a functional herbal supplement derived from…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538202/pharmacy-app/pharmacy/FX__1_Herbal_Extract_Syrup_for_Ladies_853_1758538201874.jpg	2025-09-22 09:34:36.248	2025-09-22 10:50:03.55
856	Garnier Ambre Solaire Protection Sunscreen Lotion SPF20 200ml	Garnier Ambre Solaire Sun Protection Lotion SPF20 provides advanced UVA and UVB protection against sun induced skin damage and sunburn.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538209/pharmacy-app/pharmacy/Garnier_Ambre_Solaire_Protection_Sunscre_856_1758538208863.png	2025-09-22 09:34:40.556	2025-09-22 10:50:09.839
859	Garnier Micellar Cleansing Water All-in-1 Mattifying for Oily Skin 400ml	Mattifies skin and purify pores while cleansing and removing makeup.	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538215/pharmacy-app/pharmacy/Garnier_Micellar_Cleansing_Water_All_in__859_1758538214443.jpg	2025-09-22 09:34:44.32	2025-09-22 10:50:15.66
861	Garnier Mineral ActionControl 72h Anti-Perspirant Deo Roll On 50ml	72h Anti-Perspirant Deodorant Stick for women. Heat, Sport, Stress Protection. Enriched with Mineralite (naturally absorbent mineral).	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538219/pharmacy-app/pharmacy/Garnier_Mineral_ActionControl_72h_Anti_P_861_1758538218365.jpg	2025-09-22 09:34:47.495	2025-09-22 10:50:19.406
864	Garnier Mineral InvisiClear Original 24h Roll-On Deo 50ml	Choose Garnier Mineral InvisiClear Original Roll-On Anti-Perspirant for exceptional protection of your skin against sweat and white spots.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538224/pharmacy-app/pharmacy/Garnier_Mineral_InvisiClear_Original_24h_864_1758538223747.jpg	2025-09-22 09:34:52.102	2025-09-22 10:50:24.989
867	Garnier Mineral Ultra Dry Roll-On Deodorant 50ml	It provides up to 48 hour non-stop protection from underarm wetness and anti-body odour protection with quick dry formula –…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538230/pharmacy-app/pharmacy/Garnier_Mineral_Ultra_Dry_Roll_On_Deodor_867_1758538229913.jpg	2025-09-22 09:34:56.634	2025-09-22 10:50:31.021
869	Garnier Pure Active 3-In-1 Clay Wash, Scrub and Mask 150ml	Fights the appearance of blackheads and oil in three different ways. As a face wash it cleanses and removes impurities.…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538240/pharmacy-app/pharmacy/Garnier_Pure_Active_3_In_1_Clay_Wash__Sc_869_1758538239611.jpg	2025-09-22 09:34:59.578	2025-09-22 10:50:40.642
872	Garnier Skin Active Micellar Cleansing Water Sensitive 100ml	Cleanse and refresh your skin with Garnier Skin Naturals Micellar Cleansing Water for combination and sensitive skin.	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538245/pharmacy-app/pharmacy/Garnier_Skin_Active_Micellar_Cleansing_W_872_1758538244916.jpg	2025-09-22 09:35:04.093	2025-09-22 10:50:45.749
875	Garnier Vitamin C Serum	Garnier Vitamin C Serum is enriched with a potent mix of 3.5% Vitamin C, Niacinamide & Salicylic Acid, to visibly…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538251/pharmacy-app/pharmacy/Garnier_Vitamin_C_Serum_875_1758538250499.jpg	2025-09-22 09:35:08.483	2025-09-22 10:50:51.422
877	Gatsby Moist Anti-Dandruff Treatment Hair Cream 125g	Hair cream with a dual care function helps control dandruff while firmly styling the hair. It helps firmly organize the…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538256/pharmacy-app/pharmacy/Gatsby_Moist_Anti_Dandruff_Treatment_Hai_877_1758538255428.jpg	2025-09-22 09:35:11.12	2025-09-22 10:50:56.323
880	Gaviscon Advance Aniseed Suspension 250ml	Gaviscon is used in management of symptoms of gastroesophageal reflux such as acid regurgitation, heartburn and indigestion (related to reflux),	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538262/pharmacy-app/pharmacy/Gaviscon_Advance_Aniseed_Suspension_250m_880_1758538262072.jpg	2025-09-22 09:35:14.378	2025-09-22 10:51:03.082
884	Gillette Arctic Ice Clear Gel Antiperspirant 70ml	It Absorbs Odor While Releasing Scent. Helps You Feel Fresh. Protection Against Wetness And Stress Sweat.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538271/pharmacy-app/pharmacy/Gillette_Arctic_Ice_Clear_Gel_Antiperspi_884_1758538270861.jpg	2025-09-22 09:35:19.369	2025-09-22 10:51:11.965
885	Gillette Blue 3 System Razor 1Up	Best shave disposable with three knives. Comfortable individually spring loaded blades, pivoting head, non-slip rubber grip, extra belt lubricant developed…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538273/pharmacy-app/pharmacy/Gillette_Blue_3_System_Razor_1Up_885_1758538272923.jpg	2025-09-22 09:35:20.55	2025-09-22 10:51:14.142
889	Gillette Mach3 Shaving Cartridge 4pcs	Gillette Mach3 is the World's #1 3-bladed razor. Even after 10 shaves, it feels better than the 1st shave with…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538282/pharmacy-app/pharmacy/Gillette_Mach3_Shaving_Cartridge_4pcs_889_1758538281528.jpg	2025-09-22 09:35:26.407	2025-09-22 10:51:22.611
891	Gillette Mach3 Turbo Shaving Cartridge 2pcs	Gillette Mach3 is the World's #1 3-bladed razor. Even after 10 shaves, it feels better than the 1st shave with…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538285/pharmacy-app/pharmacy/Gillette_Mach3_Turbo_Shaving_Cartridge_2_891_1758538285197.jpg	2025-09-22 09:35:28.998	2025-09-22 10:51:26.213
893	Ginsemax-F Capsules 30’s	Ginsemax-F is a dietary supplement for women, aiming to enhance strength and achieve desirable physical capabilities. It helps with boosting…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538293/pharmacy-app/pharmacy/Ginsemax_F_Capsules_30_s_893_1758538292698.jpg	2025-09-22 09:35:32.141	2025-09-22 10:51:33.923
898	Glycerin Suppositories Children 2g 12’s	For the relief of occasional constipation.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538301/pharmacy-app/pharmacy/Glycerin_Suppositories_Children_2g_12_s_898_1758538300943.jpg	2025-09-22 09:35:39.821	2025-09-22 10:51:42.198
900	Go Clean Anti Bacterial & Pimple Care Soap 75g	This soap deeply cleanses the skin, unclogs pores, and helps prevent future breakouts by targeting bacteria and excess oil.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538306/pharmacy-app/pharmacy/Go_Clean_Anti_Bacterial___Pimple_Care_So_900_1758538305639.jpg	2025-09-22 09:35:42.894	2025-09-22 10:51:47.388
902	Goli Apple Cider Vinegar Gummies	Goli Apple Cider Vinegar Gummies infused with a delicious flavor profile. Source of quality vitamins & nutrients for many health…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538312/pharmacy-app/pharmacy/Goli_Apple_Cider_Vinegar_Gummies_902_1758538311312.jpg	2025-09-22 09:35:45.35	2025-09-22 10:51:52.439
904	Goli Complete KIDS MULTI Gummies	Goli Complete KIDS Multi Gummies are designed for the small but mighty kiddos, and packed with plenty of health-promoting ingredients!…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538316/pharmacy-app/pharmacy/Goli_Complete_KIDS_MULTI_Gummies_904_1758538316159.jpg	2025-09-22 09:35:48.627	2025-09-22 10:51:57.558
907	Goli Sleep Gummies (Melatonin 5mg)	Goli Sleep Gummies are formulated with Melatonin 5 mg which supports sound sleep for those experiencing occasional sleeplessness and helps…	119000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538324/pharmacy-app/pharmacy/Goli_Sleep_Gummies__Melatonin_5mg__907_1758538323246.jpg	2025-09-22 09:35:52.571	2025-09-22 10:52:04.522
910	Good Night Denk Capsules 60’s	Good Night Denk is formulated with Valerian, lemon balm and vitamin C to help you fall asleep faster , support…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538332/pharmacy-app/pharmacy/Good_Night_Denk_Capsules_60_s_910_1758538331600.jpg	2025-09-22 09:35:56.717	2025-09-22 10:52:12.646
912	Grovit Multivitamin Drops 15ml	Grovit Multivitamin Drops work by completing the basic needs of the body and are used to treat vitamin deficiency.	6500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538336/pharmacy-app/pharmacy/Grovit_Multivitamin_Drops_15ml_912_1758538335697.jpg	2025-09-22 09:35:59.584	2025-09-22 10:52:16.912
915	Haemo Forte Syrup 200ml	Haemo Forte syrup is used in treatment of anaemia caused by folic acid deficiency, malnutrition, pregnancy, infancy, chronic blood loss…	11500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538343/pharmacy-app/pharmacy/Haemo_Forte_Syrup_200ml_915_1758538342888.jpg	2025-09-22 09:36:04.601	2025-09-22 10:52:23.978
917	Haliborange Adult Gut Health Gummies 30’s	Looking for support from the inside out? Why not try these yummy gummies? Formulated with Calcium to support your digestive…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538348/pharmacy-app/pharmacy/Haliborange_Adult_Gut_Health_Gummies_30__917_1758538347741.png	2025-09-22 09:36:07.469	2025-09-22 10:52:28.763
921	Haliborange Beauty Collagen Gummies 30’s	Looking for a glorious glow from head to toe? Try our scrummy gummies with Vitamins A, E, C, Biotin and…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538360/pharmacy-app/pharmacy/Haliborange_Beauty_Collagen_Gummies_30_s_921_1758538359313.png	2025-09-22 09:36:15.968	2025-09-22 10:52:40.465
922	Haliborange Effervescent Black Currant Tablets 20’s	Give your body a burst of Vitamin C goodness. Includes 20 tablets. Blackcurrant flavour.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538361/pharmacy-app/pharmacy/Haliborange_Effervescent_Black_Currant_T_922_1758538361198.jpg	2025-09-22 09:36:17.3	2025-09-22 10:52:41.982
924	Haliborange Mr Clever Omega 3 & Multivitamin Softies 30’s	Haliborange Omega-3 Softies are not only tasty but are a balanced multivitamin with Omega-3. Each pack contains 30 softies.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538365/pharmacy-app/pharmacy/Haliborange_Mr_Clever_Omega_3___Multivit_924_1758538364263.jpg	2025-09-22 09:36:20.269	2025-09-22 10:52:45.483
927	Haliborange Multivitamin Softies (strawberry) 30’s	We all want our little ones to shine in life! Haliborange Multivitamin Softies are a tasty way for your child…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538371/pharmacy-app/pharmacy/Haliborange_Multivitamin_Softies__strawb_927_1758538371038.jpg	2025-09-22 09:36:24.877	2025-09-22 10:52:52.096
929	Haliborange Omega-3 Orange Syrup 300ml (3-12 years)	Haliborange Omega 3 DHA with Vitamin A,C, D & E for vision, immunity boost, bones development and brain support.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538375/pharmacy-app/pharmacy/Haliborange_Omega_3_Orange_Syrup_300ml___929_1758538374705.jpg	2025-09-22 09:36:28.16	2025-09-22 10:52:55.929
933	HCG Cassette	Pregnancy tests work by checking your urine (pee) for a hormone called human chorionic gonadotropin (HCG). Your body makes this hormone…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538381/pharmacy-app/pharmacy/HCG_Cassette_933_1758538380595.jpg	2025-09-22 09:36:33.99	2025-09-22 10:53:01.782
935	Head & Shoulders Classic Clean Anti-Dandruff 2 in 1 Shampoo 225ml	Up to 72h dandruff dryness itch protection.  Targets dandruff root cause for up to 100% flake-free.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538385/pharmacy-app/pharmacy/Head___Shoulders_Classic_Clean_Anti_Dand_935_1758538384760.jpg	2025-09-22 09:36:36.973	2025-09-22 10:53:05.962
938	Head & Shoulders Menthol Refresh Anti-Dandruff Shampoo 400ml	This Tri-action formula cleanses, tones & protects your scalp so you can stay up to 100% dandruff free and get…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538390/pharmacy-app/pharmacy/Head___Shoulders_Menthol_Refresh_Anti_Da_938_1758538390116.jpg	2025-09-22 09:36:41.857	2025-09-22 10:53:11.083
940	Head & Shoulders Smooth and Silky Anti-Dandruff Shampoo 400ml	Up to 100% dandruff free hair. Unique formula for dry and frizzy hair. Helps control the frizz for up to…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538393/pharmacy-app/pharmacy/Head___Shoulders_Smooth_and_Silky_Anti_D_940_1758538393245.jpg	2025-09-22 09:36:44.366	2025-09-22 10:53:14.342
943	Health Aid Acidophilus Caps 60’s	Health Aid Acidophilus Capsules are vegan friendly capsules containing 100 million friendly bacteria for use on a daily basis for…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538400/pharmacy-app/pharmacy/Health_Aid_Acidophilus_Caps_60_s_943_1758538399613.jpg	2025-09-22 09:36:48.634	2025-09-22 10:53:20.709
945	Health Aid Aloe Vera 5000 mg Capsules 30’s	Health Aid Aloe Vera 5000mg Capsules contain Aloe Vera, also known as ‘Nature’s Miracle Plant’ has been used through the…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538407/pharmacy-app/pharmacy/Health_Aid_Aloe_Vera_5000_mg_Capsules_30_945_1758538406966.png	2025-09-22 09:36:51.706	2025-09-22 10:53:28.391
948	Health Aid Brainvit Tabs 60’s	Brainvit Tablets by HealthAid contain selected vitamins, amino acids, antioxidants & herbs for good blood flow to and from the…	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538414/pharmacy-app/pharmacy/Health_Aid_Brainvit_Tabs_60_s_948_1758538413339.jpg	2025-09-22 09:36:56.314	2025-09-22 10:53:34.368
952	Health Aid Cranberry 5000mg Tabs 60’s	Cranberry Tablets are formulated using the best quality extracts and powders; derived from wild crafted or organically grown herbs meticulously…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538421/pharmacy-app/pharmacy/Health_Aid_Cranberry_5000mg_Tabs_60_s_952_1758538421112.jpg	2025-09-22 09:37:02.361	2025-09-22 10:53:42.053
953	Health Aid Evening Primrose 1000Mg Caps 30’s	Health Aid's Evening Primrose Oil is a cold-pressed product for maximum purity, rich in many beneficial fatty acids, including GLA.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538423/pharmacy-app/pharmacy/Health_Aid_Evening_Primrose_1000Mg_Caps__953_1758538423137.png	2025-09-22 09:37:03.891	2025-09-22 10:53:44.16
955	Health Aid Garlic Oil 2mg Caps 30’s	Each hermetically sealed capsule contains 2mg of garlic oil providing all the health benefits of garlic but without the garlic…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538427/pharmacy-app/pharmacy/Health_Aid_Garlic_Oil_2mg_Caps_30_s_955_1758538426728.jpg	2025-09-22 09:37:07.167	2025-09-22 10:53:47.655
956	Health Aid Gastone Caps 60’s	Gastone capsules act as a natural internal cleanser and deodoriser beneficial for assisting and maintaining intestinal hygiene and a fresh…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538429/pharmacy-app/pharmacy/Health_Aid_Gastone_Caps_60_s_956_1758538428508.jpg	2025-09-22 09:37:08.806	2025-09-22 10:53:49.396
958	Health Aid Junior-Vit Chewable  30’s	A balanced multivitamin and mineral formulation, rich in b vitamins, iron and vitamin d to support strong bones, healthy teeth and a sharp mind.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538433/pharmacy-app/pharmacy/Health_Aid_Junior_Vit_Chewable__30_s_958_1758538432568.jpg	2025-09-22 09:37:11.468	2025-09-22 10:53:53.551
962	Health Aid Omega 3,6,9 Capsules 60’s	Omega 3 6 9 Capsules contain essential fatty acids which are beneficial for cardiovascular health, brain function, healthy growth and…	82000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538441/pharmacy-app/pharmacy/Health_Aid_Omega_3_6_9_Capsules_60_s_962_1758538440862.jpg	2025-09-22 09:37:16.867	2025-09-22 10:54:02.184
964	Health Aid Osteoflex Cream 100ml	Health Aid OsteoFlex Cream is the optimum formulation for healthy joints and cartilage. It provides a unique combination of high-grade…	57000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538445/pharmacy-app/pharmacy/Health_Aid_Osteoflex_Cream_100ml_964_1758538445109.jpg	2025-09-22 09:37:19.764	2025-09-22 10:54:05.979
966	Health Aid Osteoflex Tablets 30’s	Osteoflex tablets provide nutritional support for healthy joints and cartilage. A unique combination of high-grade Glucosamine and Chondroitin Sulphate with added…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538449/pharmacy-app/pharmacy/Health_Aid_Osteoflex_Tablets_30_s_966_1758538449228.jpg	2025-09-22 09:37:22.938	2025-09-22 10:54:10.166
969	Health Aid Pregnazon Complete Capsules 60’s	Pregnazone Complete helps to maintain nutritional level when planning to be pregnant, or when breastfeeding, it plays a role in…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538456/pharmacy-app/pharmacy/Health_Aid_Pregnazon_Complete_Capsules_6_969_1758538455989.jpg	2025-09-22 09:37:27.549	2025-09-22 10:54:17.234
972	Health Aid Tea Tree Oil (Melaleuca alternifolia) 10ml	Tea Tree Oil (Melaleuca alternifolia) is a well known, natural antiseptic originating in Australia, which can be dabbed directly onto…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538467/pharmacy-app/pharmacy/Health_Aid_Tea_Tree_Oil__Melaleuca_alter_972_1758538466680.jpg	2025-09-22 09:37:32.359	2025-09-22 10:54:27.884
975	Health Aid Vitamin B5 690mg Tablets 30’s	Pantothenic acid (vitamin B5) contributes to normal energy-yielding metabolism, contributes to normal mental performance, helps with the normal synthesis and metabolism of…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538477/pharmacy-app/pharmacy/Health_Aid_Vitamin_B5_690mg_Tablets_30_s_975_1758538476620.jpg	2025-09-22 09:37:36.462	2025-09-22 10:54:37.816
978	Health Aid Zinc Gluconate 70mg Tabs 90’s	Zinc is an essential element needed for a wide range of functions within the body; it helps maintain normal growth,…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538485/pharmacy-app/pharmacy/Health_Aid_Zinc_Gluconate_70mg_Tabs_90_s_978_1758538485054.jpg	2025-09-22 09:37:41.063	2025-09-22 10:54:46.473
981	Hedrin 4% Lotion 50ml	Active Ingredient : Dimeticone. Highly Effective In Treating Head Lice.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538492/pharmacy-app/pharmacy/Hedrin_4__Lotion_50ml_981_1758538491899.jpg	2025-09-22 09:37:45.568	2025-09-22 10:54:52.654
983	Hemani Argan Oil 30ml	Argan Oil is a natural wonder, packed with Free-radical scavengers, essential fatty acids, and vitamins that have been shown to…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538496/pharmacy-app/pharmacy/Hemani_Argan_Oil_30ml_983_1758538495820.jpg	2025-09-22 09:37:48.453	2025-09-22 10:54:57.17
985	Hemani Clove Oil 30ml	Hemani Clove Oil is a high-quality and naturally extracted clove oil. This essential oil harnesses the natural benefits of clove…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538501/pharmacy-app/pharmacy/Hemani_Clove_Oil_30ml_985_1758538500737.jpg	2025-09-22 09:37:51.25	2025-09-22 10:55:01.88
988	Hemani Tea Tree Oil 30ml	Hemani Tea Tree Oil (30 ml bottle) is distilled from the finest tea tree leaves. It's formulated as a natural…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538508/pharmacy-app/pharmacy/Hemani_Tea_Tree_Oil_30ml_988_1758538507619.jpg	2025-09-22 09:37:54.517	2025-09-22 10:55:08.947
989	Hemani Turmeric Oil 30ml	Turmeric powder is the spice that gives curries and mustard their yellow color. Turmeric oil is a much purer source…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538510/pharmacy-app/pharmacy/Hemani_Turmeric_Oil_30ml_989_1758538509688.jpg	2025-09-22 09:37:55.706	2025-09-22 10:55:10.705
990	Henna Speedy Hair Color Cream Natural Black	Permanent hair dye in shampoo form for hair, natural black (881), without ammonia with herbal and natural henna leaf extract,…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538512/pharmacy-app/pharmacy/Henna_Speedy_Hair_Color_Cream_Natural_Bl_990_1758538511488.jpg	2025-09-22 09:37:56.876	2025-09-22 10:55:12.858
992	Hepaticum Syrup Micronized Silymarin 120ml	Hepaticum syrup contains a Silymarin brand which is herbal origin rich in the main active component (Silybin). It acts as…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538516/pharmacy-app/pharmacy/Hepaticum_Syrup_Micronized_Silymarin_120_992_1758538515852.jpg	2025-09-22 09:37:59.495	2025-09-22 10:55:16.867
995	Herboxil Herbal Lozenges 100’s	Double action for throat and nose discomfort. Each pack contains 100 lozenges.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538527/pharmacy-app/pharmacy/Herboxil_Herbal_Lozenges_100_s_995_1758538526248.jpg	2025-09-22 09:38:04	2025-09-22 10:55:27.481
997	Hi Dee Capsules 2000IU 30’s	Used in vitamin D deficiency. Supports immunity. Strengthens bones and teeth. Each pack contains 30 capsules.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538532/pharmacy-app/pharmacy/Hi_Dee_Capsules_2000IU_30_s_997_1758538531268.jpg	2025-09-22 09:38:07.072	2025-09-22 10:55:32.294
1000	Huggies All Over Clean Baby Wipes 56’s	Huggies® All Over Clean are proven to remove dirt and germs from faces, hands and bottoms, making cleaning up a…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538537/pharmacy-app/pharmacy/Huggies_All_Over_Clean_Baby_Wipes_56_s_1000_1758538536747.jpg	2025-09-22 09:38:10.966	2025-09-22 10:55:38.028
1002	Huggies Dry Comfort Size 2 (3-6Kg) 10’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538544/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_2__3_6Kg__10_s_1002_1758538543620.jpg	2025-09-22 09:38:13.728	2025-09-22 10:55:44.522
1005	Huggies Dry Comfort Size 4 (8-14Kg) 8’s	Huggies Dry Comfort comes with break through nappy technology and super absorbent lock dry core technology keeping your baby dry…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538549/pharmacy-app/pharmacy/Huggies_Dry_Comfort_Size_4__8_14Kg__8_s_1005_1758538548550.jpg	2025-09-22 09:38:18.379	2025-09-22 10:55:49.644
1008	Huggies Natural Care Baby Wipes 56’s	With aloe vera & fragrance. Helps prevent the causes of nappy rash. Gently cleans and protects baby's delicate skin. Hypoallergenic.…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538554/pharmacy-app/pharmacy/Huggies_Natural_Care_Baby_Wipes_56_s_1008_1758538554018.jpg	2025-09-22 09:38:22.872	2025-09-22 10:55:54.949
1010	Huggies Pants Size 3 (7-12Kg) 36’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538558/pharmacy-app/pharmacy/Huggies_Pants_Size_3__7_12Kg__36_s_1010_1758538558015.jpg	2025-09-22 09:38:25.812	2025-09-22 10:55:59.125
1013	Huggies Pants Size 6 (15-25Kg) 26’s	Huggies pants are designed with new intelligent fit technology to distribute wetness evenly keep your baby skin perfect with outstanding…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538565/pharmacy-app/pharmacy/Huggies_Pants_Size_6__15_25Kg__26_s_1013_1758538564423.jpg	2025-09-22 09:38:30.032	2025-09-22 10:56:05.288
1016	Immun Active Denk 20’s	For a strong immune system. With vitamin C, zinc, selenium and L-histidine. Direct sticks – ideal for on the move.…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538570/pharmacy-app/pharmacy/Immun_Active_Denk_20_s_1016_1758538569401.jpg	2025-09-22 09:38:34.443	2025-09-22 10:56:10.349
1018	Immunace Original 30’s	A comprehensive multivitamin designed to deliver comprehensive support, Immunace Original gives you advanced nutrition all year round.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538574/pharmacy-app/pharmacy/Immunace_Original_30_s_1018_1758538574064.png	2025-09-22 09:38:37.178	2025-09-22 10:56:15.642
1022	Isoryn Ephedrine Adult Nasal Drops 15ml	Contains Ephedrine hydrochloride. As a result, it shrinks the blood vessels present in the nose and relieves a stuffy nose.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538584/pharmacy-app/pharmacy/Isoryn_Ephedrine_Adult_Nasal_Drops_15ml_1022_1758538583658.jpg	2025-09-22 09:38:43.015	2025-09-22 10:56:24.52
1023	Isoryn Ephedrine Paediatric Nasal Drops 15ml	Contains Ephedrine hydrochloride. As a result, it shrinks the blood vessels present in the nose and relieves a stuffy nose…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538586/pharmacy-app/pharmacy/Isoryn_Ephedrine_Paediatric_Nasal_Drops__1023_1758538585589.jpg	2025-09-22 09:38:44.244	2025-09-22 10:56:26.398
1024	Itoto Acne Oil 50ml	The Itoto Acne Oil controls acne breakout, fades dark spots, restores skin moisture, and helps with skin firming.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538588/pharmacy-app/pharmacy/Itoto_Acne_Oil_50ml_1024_1758538587677.jpg	2025-09-22 09:38:45.781	2025-09-22 10:56:28.723
1027	Itoto Face & Body Oil 50ml	Contains anti-oxidant properties that leave the skin glowing while firming it.	16500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538595/pharmacy-app/pharmacy/Itoto_Face___Body_Oil_50ml_1027_1758538594286.jpg	2025-09-22 09:38:50.49	2025-09-22 10:56:35.344
1029	Itoto Perfumed Petrolium Jelly	Great for both children and adults. Contains skin rejuvenating properties that keep the skin moisturised while giving it a natural…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538598/pharmacy-app/pharmacy/Itoto_Perfumed_Petrolium_Jelly_1029_1758538597877.jpg	2025-09-22 09:38:53.664	2025-09-22 10:56:38.853
1032	Jena DM 100g	Support healthy blood sugar levels. Contains Deartemisinised Artemisia annua, Persea americana.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538605/pharmacy-app/pharmacy/Jena_DM_100g_1032_1758538604451.jpg	2025-09-22 09:38:58.272	2025-09-22 10:56:45.316
1035	Jenacid Syrup 200ml	A herbal remedy for peptic ulcers and heart burn.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538610/pharmacy-app/pharmacy/Jenacid_Syrup_200ml_1035_1758538609921.jpg	2025-09-22 09:39:03.188	2025-09-22 10:56:51.144
1037	Jenafit 100g	Supplement of maintaining heathy body weight.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538614/pharmacy-app/pharmacy/Jenafit_100g_1037_1758538613716.jpg	2025-09-22 09:39:05.756	2025-09-22 10:56:54.609
1039	Jenaprost 100g	Effective prostate tonic	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538617/pharmacy-app/pharmacy/Jenaprost_100g_1039_1758538617114.jpg	2025-09-22 09:39:08.615	2025-09-22 10:56:58.213
1040	Jergens Age Defying Multi-Vitamin Lotion 621ml	Revitalizes and replenishes aging, dry skin for a deeply luminous, visibly rejuvenated look.	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538619/pharmacy-app/pharmacy/Jergens_Age_Defying_Multi_Vitamin_Lotion_1040_1758538619034.jpg	2025-09-22 09:39:10.663	2025-09-22 10:57:00.154
1042	Jergens Soothing Aloe Lotion 621ml	This lightweight body cream is rich in antioxidants known to help skin retain its natural moisture leaving skin silk and…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538623/pharmacy-app/pharmacy/Jergens_Soothing_Aloe_Lotion_621ml_1042_1758538622898.jpg	2025-09-22 09:39:13.531	2025-09-22 10:57:03.839
1046	Johnsons Baby Aqueous Cream Fragrance Free 350ml	Johnson's Baby Aqueous Cream Fragrance-Free 350ml provides gentle and effective cleansing and moisturisation for your little one's delicate skin. With…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538633/pharmacy-app/pharmacy/Johnsons_Baby_Aqueous_Cream_Fragrance_Fr_1046_1758538633138.jpg	2025-09-22 09:39:19.776	2025-09-22 10:57:14.283
1048	Johnsons Baby Bath 500ml	Johnson's Baby Bath is the mildest formula and is specially designed to gently cleanse baby’s delicate skin. It lathers quickly…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538637/pharmacy-app/pharmacy/Johnsons_Baby_Bath_500ml_1048_1758538637286.jpg	2025-09-22 09:39:22.848	2025-09-22 10:57:18.142
1050	Johnsons Baby Jelly Fragrance Free 100ml	Helps prevent against the causes of nappy rash by creating a barrier against wetness. It provides moisture protection and is…	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538640/pharmacy-app/pharmacy/Johnsons_Baby_Jelly_Fragrance_Free_100ml_1050_1758538640225.jpg	2025-09-22 09:39:25.665	2025-09-22 10:57:21.351
1053	Johnsons Baby Jelly Lightly Fragranced 250ml	Johnson's Baby Lightly Fragranced Jelly has a clinically proven mild formula that forms an effective barrier against wetness to help…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538647/pharmacy-app/pharmacy/Johnsons_Baby_Jelly_Lightly_Fragranced_2_1053_1758538646555.jpg	2025-09-22 09:39:29.564	2025-09-22 10:57:27.8
1056	Johnsons Baby Lotion Soap 100g	Johnson’s Baby Lotion Soap 100g understands babies skin. That’s why it contains mild moisturisers and leaves skin perfectly baby soft.…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538653/pharmacy-app/pharmacy/Johnsons_Baby_Lotion_Soap_100g_1056_1758538652798.jpg	2025-09-22 09:39:33.562	2025-09-22 10:57:33.685
1059	Johnsons Baby Oil 300ml	Your baby’s skin loses moisture 2 times faster & is more prone to dryness. Johnson’s Baby Oil 300ml is specially…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538658/pharmacy-app/pharmacy/Johnsons_Baby_Oil_300ml_1059_1758538658118.jpg	2025-09-22 09:39:36.915	2025-09-22 10:57:39.114
1061	Johnsons Baby Oil 50ml	Johnson's baby oil gives your baby a healthy, soft skin, with empowerment to fight irritants. The gentleness, softness and moisturizing…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538661/pharmacy-app/pharmacy/Johnsons_Baby_Oil_50ml_1061_1758538661127.jpg	2025-09-22 09:39:39.538	2025-09-22 10:57:42.123
1062	Johnsons Baby Powder 100g	Specially formulated talcum powder for babies. Eliminates friction on the baby’s skin. Keeps their skin clean and fresh smelling. A…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538664/pharmacy-app/pharmacy/Johnsons_Baby_Powder_100g_1062_1758538663432.jpg	2025-09-22 09:39:41.075	2025-09-22 10:57:44.289
1065	Johnsons Baby Soap Regular 100g	Johnson's Baby Soap is designed with 1/4th baby lotion and vitamin E to preserve the natural moisture of the skin.…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538669/pharmacy-app/pharmacy/Johnsons_Baby_Soap_Regular_100g_1065_1758538668588.jpg	2025-09-22 09:39:45.377	2025-09-22 10:57:49.788
1067	Joint Active Denk 30’s	For cartilage and joints. With glucosamine and chondroitin and Vitamin C for normal function of the cartilage and bones. For…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538673/pharmacy-app/pharmacy/Joint_Active_Denk_30_s_1067_1758538672390.jpg	2025-09-22 09:39:48.858	2025-09-22 10:57:53.354
1069	Jointace Original Capsules 30’s	Cartilage and bone health are important for long term wellbeing. Jointace Original has been developed by Vitabiotics nutritional experts and…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538677/pharmacy-app/pharmacy/Jointace_Original_Capsules_30_s_1069_1758538676965.png	2025-09-22 09:39:51.882	2025-09-22 10:57:58.058
1072	K-Y Gel Sterile Lubricant 82g	KY jelly is a water-based, personal lubricant that is usually used as a lubricant for sexual intercourse or masturbation. Unlike…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538687/pharmacy-app/pharmacy/K_Y_Gel_Sterile_Lubricant_82g_1072_1758538686761.jpg	2025-09-22 09:39:55.924	2025-09-22 10:58:08.046
1075	Kamagra 50mg Tablets 4’S	Kamagra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538693/pharmacy-app/pharmacy/Kamagra_50mg_Tablets_4_S_1075_1758538692295.jpg	2025-09-22 09:40:00.135	2025-09-22 10:58:13.269
1078	Kentaro 5 in 1 Relief Scalp Serum 120ml	KENTARO 5 in 1 relief scalp serum is enriched with minerals offering protection against dandruff and itchy scalp.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538697/pharmacy-app/pharmacy/Kentaro_5_in_1_Relief_Scalp_Serum_120ml_1078_1758538696951.jpg	2025-09-22 09:40:04.626	2025-09-22 10:58:17.991
1081	Kentaro Beard and Hair Oil 30ml	No more scratchy beards with the Kentaro Beard Oil. It also stimulates beard growth and soothes the skin after a…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538703/pharmacy-app/pharmacy/Kentaro_Beard_and_Hair_Oil_30ml_1081_1758538702574.jpg	2025-09-22 09:40:08.743	2025-09-22 10:58:23.512
1083	Kentaro Berry Bliss Moisturising Shampoo 500ml	Gently cleanses leaving hair clean, shiny, and strong.	34000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538706/pharmacy-app/pharmacy/Kentaro_Berry_Bliss_Moisturising_Shampoo_1083_1758538706143.jpg	2025-09-22 09:40:11.225	2025-09-22 10:58:27.027
1085	Kentaro Mint Chocolate Whipped Butter 250g	This mint chocolate whipped butter moisturises and holds natural hairstyles while strengthening hair strands and adding hair shine	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538710/pharmacy-app/pharmacy/Kentaro_Mint_Chocolate_Whipped_Butter_25_1085_1758538710050.jpg	2025-09-22 09:40:13.526	2025-09-22 10:58:31.292
1087	Kentaro Very Berry Grow Hair Oil 200ml	Kentaro very berry grow and restore hair oil 200ml is rich in Omega 3, 9 and Vitamin E, this oil…	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538714/pharmacy-app/pharmacy/Kentaro_Very_Berry_Grow_Hair_Oil_200ml_1087_1758538713538.jpg	2025-09-22 09:40:15.994	2025-09-22 10:58:34.64
1090	Ketojohn (Ketoconazole) Bar Soap 75g	Ketojohn Soap is an antifungal medicine that prevents the growth of various types of fungi by disrupting the production of…	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538727/pharmacy-app/pharmacy/Ketojohn__Ketoconazole__Bar_Soap_75g_1090_1758538726368.jpg	2025-09-22 09:40:19.661	2025-09-22 10:58:47.676
1092	King Size Condoms 3’s	These condoms are for girthy members with a wide contour fit. They are reliable and perfect for girth. In addition,…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538731/pharmacy-app/pharmacy/King_Size_Condoms_3_s_1092_1758538730531.jpg	2025-09-22 09:40:22.547	2025-09-22 10:58:51.644
1095	Kiss Classic Condoms 3’s	Kiss condoms are gently lubricated to provide you with a silky, natural feeling for increased pleasure and sensitivity. Transparent, straight-walled,…	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538739/pharmacy-app/pharmacy/Kiss_Classic_Condoms_3_s_1095_1758538738960.jpg	2025-09-22 09:40:27.258	2025-09-22 10:58:59.902
1097	Knect Lubricant 50ml	Knect Gentle Water-based Lubricant 50ml is a lubricant that feels like your own natural moisture, helping you to enjoy your…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538746/pharmacy-app/pharmacy/Knect_Lubricant_50ml_1097_1758538745680.jpg	2025-09-22 09:40:30.125	2025-09-22 10:59:06.757
1098	Knect Lubricant 75ml	Knect Gentle Water-based Lubricant 50ml is a lubricant that feels like your own natural moisture, helping you to enjoy your…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538748/pharmacy-app/pharmacy/Knect_Lubricant_75ml_1098_1758538747877.png	2025-09-22 09:40:31.663	2025-09-22 10:59:09.825
1101	L’Oreal Hydra Sensitive Shaving Gel 200ml	With Natural Birch Sap, this shave gel helps strengthen skin’s natural resistance.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538754/pharmacy-app/pharmacy/L_Oreal_Hydra_Sensitive_Shaving_Gel_200m_1101_1758538753744.jpg	2025-09-22 09:40:36.372	2025-09-22 10:59:14.564
1102	L’Oreal Men Expert Extreme Protect Deo Spray 250ml	Delivers ultra-absorbent technology that helps combat wetness for a proven 48hr dry effect.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538755/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Extreme_Protect_Deo_S_1102_1758538755176.jpg	2025-09-22 09:40:37.816	2025-09-22 10:59:16.348
1104	L’Oreal Men Expert Invincible Sport 96H Deo Spray 250ml	Provides 96 hour odor protection. Contains odor-fighting ingredients. Fit for everyday use. Suitable for all skin types. Easy to use.…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538759/pharmacy-app/pharmacy/L_Oreal_Men_Expert_Invincible_Sport_96H__1104_1758538758957.jpg	2025-09-22 09:40:40.48	2025-09-22 10:59:20.007
1108	L’Oreal Paris Men Expert Anti Irritation Glycerin Shave Gel 200ml	Swells hair to reduce the force of the blade and make each stroke fluid. Powerful formula creates a protective barrier…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538766/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Anti_Irritation_1108_1758538765744.jpg	2025-09-22 09:40:46.509	2025-09-22 10:59:26.998
1110	L’Oreal Paris Men Expert Cool Power Shower Gel 300ml	Our 1st Men Expert shower gel powered by icy caps technology to provide you with unbeatable freshness and the ultimate…	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538770/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Cool_Power_Show_1110_1758538769581.jpg	2025-09-22 09:40:49.376	2025-09-22 10:59:30.579
1112	L’Oreal Paris Men Expert Fresh Extreme Deo Spray 250ml	Its fantastic agents allow you to remain gorgeously fresh for up to 48 hours.Anti-perspirant and anti-body odour with ultra absorbent…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538773/pharmacy-app/pharmacy/L_Oreal_Paris_Men_Expert_Fresh_Extreme_D_1112_1758538773215.jpg	2025-09-22 09:40:52.76	2025-09-22 10:59:34.433
1115	L’Oreal Paris Revitalift Anti Wrinkle Day Cream SPF30 50ml	Intensive action moisturizer, enriched with Pro-Retinol A and Elasti-Flex, helps to improve skin firmness and ability to bounce back. Wrinkles…	115000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538780/pharmacy-app/pharmacy/L_Oreal_Paris_Revitalift_Anti_Wrinkle_Da_1115_1758538779712.jpg	2025-09-22 09:40:57.188	2025-09-22 10:59:40.925
1118	L’Oreal Paris Revitalift Laser Advanced Anti Ageing Serum 30ml	Smooths wrinkles. Re-densifies. Re-surfaces. Hyaluronic Acid + Vitamin Cg + 3% Pro-Xylane. Dermatologically tested, suitable for all skin types.	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538788/pharmacy-app/pharmacy/L_Oreal_Paris_Revitalift_Laser_Advanced__1118_1758538787442.jpg	2025-09-22 09:41:01.258	2025-09-22 10:59:48.826
1121	L’Oreal Paris Wrinkle Expert 55+ Calcium Day Cream 50ml	Reduces wrinkles. Improves contours. 24 hour hydration.	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538797/pharmacy-app/pharmacy/L_Oreal_Paris_Wrinkle_Expert_55__Calcium_1121_1758538796761.png	2025-09-22 09:41:05.249	2025-09-22 10:59:57.802
1123	L’Oreal Revitalift Laser Renew Advanced Anti-Ageing Day SPF20 Cream 50ml	An advanced anti-aging SPF day cream suitable for all skin types. Makes skin look hydrated, firmer and more even.	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538801/pharmacy-app/pharmacy/L_Oreal_Revitalift_Laser_Renew_Advanced__1123_1758538800292.jpg	2025-09-22 09:41:08.751	2025-09-22 11:00:01.404
1126	L’Oreal Wrinkle Expert 45+ Day Cream	L'Oréal Paris Wrinkle Expert Anti-Wrinkle Firming Cream 45+ addresses the specific needs of skin over 45. Our effective formula with…	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538807/pharmacy-app/pharmacy/L_Oreal_Wrinkle_Expert_45__Day_Cream_1126_1758538806136.jpg	2025-09-22 09:41:16.512	2025-09-22 11:00:07.638
1164	Lemsip Cold & Flu Max Strength Caps 16’s	For the symptomatic relief of cold and flu including a chesty cough. Each pack contains 16 capsules.	35200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538906/pharmacy-app/pharmacy/Lemsip_Cold___Flu_Max_Strength_Caps_16_s_1164_1758538905688.jpg	2025-09-22 09:42:10.579	2025-09-22 11:01:46.974
1168	Levocetirizine 5mg India Tablets	Levocetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, and sneezing.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538915/pharmacy-app/pharmacy/Levocetirizine_5mg_India_Tablets_1168_1758538914216.jpg	2025-09-22 09:42:16.826	2025-09-22 11:01:55.239
1171	Limitless C Zinc Tablets 30’s	Contains the recommended dietary allowances of Vitamin C and Zinc. The lozenges have a local soothing effect. For adults &…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538925/pharmacy-app/pharmacy/Limitless_C_Zinc_Tablets_30_s_1171_1758538924305.jpg	2025-09-22 09:42:21.461	2025-09-22 11:02:05.719
1176	Liptomil Plus LF 400g	A Super-Premium lactose-free formula for infants experiencing diarrhea due to a lactose intolerance from birth to 12 months of age.	63000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538937/pharmacy-app/pharmacy/Liptomil_Plus_LF_400g_1176_1758538937133.jpg	2025-09-22 09:42:29.232	2025-09-22 11:02:18.418
1178	Listerine Cool Mint Mouthwash 250ml	Protects against tartar to help keep teeth naturally white. Great cool mint taste leaves mouth feeling clean and fresh	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538942/pharmacy-app/pharmacy/Listerine_Cool_Mint_Mouthwash_250ml_1178_1758538941210.jpg	2025-09-22 09:42:32.186	2025-09-22 11:02:22.424
1181	Listerine Fresh Burst Mouthwash 500ml	LISTERINE Fresh Burst Mouthwash 600ml removes up to 97% of bad breath and plaque causing germs left after brushing. For…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538948/pharmacy-app/pharmacy/Listerine_Fresh_Burst_Mouthwash_500ml_1181_1758538947723.jpg	2025-09-22 09:42:35.872	2025-09-22 11:02:28.591
1183	Listerine Total Care Stay White 250ml	Used twice daily, Listerine® Total Care Stay White is proven to reduce tartar build up, to help prevent stains keeping…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538952/pharmacy-app/pharmacy/Listerine_Total_Care_Stay_White_250ml_1183_1758538951325.jpg	2025-09-22 09:42:38.945	2025-09-22 11:02:33.039
1187	Lomani Santiago Paris Perfume For Men 100ml	A radically fresh composition, dictated by a name that has the ring of a manifesto. This sensually fresh scent sets…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538960/pharmacy-app/pharmacy/Lomani_Santiago_Paris_Perfume_For_Men_10_1187_1758538959912.jpg	2025-09-22 09:42:44.683	2025-09-22 11:02:41.356
1189	Loratidine 10mg UK Tablets 30’s	This medication is an antihistamine that treats symptoms such as itching, runny nose, watery eyes, and sneezing from "hay fever"…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538965/pharmacy-app/pharmacy/Loratidine_10mg_UK_Tablets_30_s_1189_1758538964699.jpg	2025-09-22 09:42:47.855	2025-09-22 11:02:45.602
1192	Lucky Bear Baby Bottles Starter Small 60ml 1’s	Infant baby mini portable feeding nursing bottle. BPA free and safe newborns. Feeder for fruit juice and milk.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538980/pharmacy-app/pharmacy/Lucky_Bear_Baby_Bottles_Starter_Small_60_1192_1758538979079.jpg	2025-09-22 09:42:51.762	2025-09-22 11:03:01.425
1194	Lydia Post Pill	Lydia (Levonorgestrel)  is emergency contraception (commonly called the morning after pill) that is used as backup contraception to prevent pregnancy…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538985/pharmacy-app/pharmacy/Lydia_Post_Pill_1194_1758538985043.jpg	2025-09-22 09:42:53.949	2025-09-22 11:03:06.137
1197	Lynx Ice Chill Roll On Deodrant 50ml	Feel fresh throughout the day and smelling great thanks to this antiperspirant roll on deodorant by Lynx.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758538994/pharmacy-app/pharmacy/Lynx_Ice_Chill_Roll_On_Deodrant_50ml_1197_1758538994315.jpg	2025-09-22 09:42:58.298	2025-09-22 11:03:15.748
1200	Magnes Direct Denk Magnesium 30’s	For increased magnesium requirements. With 400 mg of magnesium. For muscles, bones, heart and nerves. Direct sticks – handy for…	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539001/pharmacy-app/pharmacy/Magnes_Direct_Denk_Magnesium_30_s_1200_1758539001011.jpg	2025-09-22 09:43:02.906	2025-09-22 11:03:22.214
1201	Magnesium Glycinate 500mg Capsules 120’s	Magnesium Glycinate is a highly bioavailable magnesium supplement designed to support muscle, bone, nerve, heart health and restful sleep.	185000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539004/pharmacy-app/pharmacy/Magnesium_Glycinate_500mg_Capsules_120_s_1201_1758539003233.jpg	2025-09-22 09:43:04.237	2025-09-22 11:03:24.965
1204	Malaika Propolis Tincture 15ml	Malaika Propolis is a natural extract from bees that has demonstrated antiseptic, antibacterial, antifungal and even antiviral properties.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539011/pharmacy-app/pharmacy/Malaika_Propolis_Tincture_15ml_1204_1758539010602.jpg	2025-09-22 09:43:08.755	2025-09-22 11:03:32.044
1206	MAN ACTIVE DENK Caps 60’s	Man Active Denk combines important ingredients for men's health: Nutrients such as L-arginine, vitamin C, zinc and B vitamins can…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539015/pharmacy-app/pharmacy/MAN_ACTIVE_DENK_Caps_60_s_1206_1758539015146.jpg	2025-09-22 09:43:12.035	2025-09-22 11:03:36.313
1209	Mebendazole Suspension 30ml	Used for the treatment of Stomach Infections, Intestinal Infections, Threadworm Infection, Pinworm Infection, Roundworm Infection, Whipworm Infection and other conditions.	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539022/pharmacy-app/pharmacy/Mebendazole_Suspension_30ml_1209_1758539021953.jpg	2025-09-22 09:43:16.946	2025-09-22 11:03:42.971
1212	Meditrol (Calcitriol 0.25mg) Capsules 30’s	Prevents bone loss. Reduces fractures. Ensure mobility. Each pack contains 30 capsules.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539030/pharmacy-app/pharmacy/Meditrol__Calcitriol_0_25mg__Capsules_30_1212_1758539029525.png	2025-09-22 09:43:21.149	2025-09-22 11:03:50.935
1214	Mediven Ointment 15g Betamethasone Ointment	Used to treat skin irritation and itch caused by skin conditions such as eczema, psoriasis, contact dermatitis, and seborrhea. It…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539034/pharmacy-app/pharmacy/Mediven_Ointment_15g_Betamethasone_Ointm_1214_1758539033603.jpg	2025-09-22 09:43:24.008	2025-09-22 11:03:54.697
1217	Mega 3 Salmon Oil Capsules 30’s	Mega 3 natural salmon oil capsules contains 1000g of natural fish oil containing EPA 180mg & DHA 120mg. Each pack…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539042/pharmacy-app/pharmacy/Mega_3_Salmon_Oil_Capsules_30_s_1217_1758539041929.jpg	2025-09-22 09:43:28.405	2025-09-22 11:04:03.505
1219	Melatex Vitamin C 10% serum 30ml	A sophisticated formula that contains 10% C (in addition to Vitamin A and  Vitamin E) 10%pure vitamin C with vitamins…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539047/pharmacy-app/pharmacy/Melatex_Vitamin_C_10__serum_30ml_1219_1758539046387.jpg	2025-09-22 09:43:31.476	2025-09-22 11:04:07.422
1223	Menthodex Syrup 100ml	For The Symptomatic Relief Of Colds, Sore Throats, Irritating And Chesty Coughs.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539058/pharmacy-app/pharmacy/Menthodex_Syrup_100ml_1223_1758539057885.jpg	2025-09-22 09:43:37.326	2025-09-22 11:04:19.096
1224	Menthodex Syrup 200ml	Menthodex Cough Mixture for the relief of colds, sore throats, irritating and chesty coughs.	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539060/pharmacy-app/pharmacy/Menthodex_Syrup_200ml_1224_1758539059942.jpg	2025-09-22 09:43:38.544	2025-09-22 11:04:21.346
1226	Menthoxyl Lozenges 100’s	Menthoxyl lozenges soothe the throat, hence providing symptomatic relief from cough, hoarseness, flu and sore throat. Each pack contains 100…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539065/pharmacy-app/pharmacy/Menthoxyl_Lozenges_100_s_1226_1758539064204.jpg	2025-09-22 09:43:41.75	2025-09-22 11:04:25.651
1229	Milton Sterilising Fluid 1L	Sterilizing fluid allows you to sterilize in just 15 minutes. Hygiene for baby and home. Harmless and leaves no unpleasant…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539071/pharmacy-app/pharmacy/Milton_Sterilising_Fluid_1L_1229_1758539070132.jpg	2025-09-22 09:43:46.128	2025-09-22 11:04:31.191
1232	Minoxil Forte 5% (minoxidil) for Men 60ml	Solution For Baldness And Hair Thinning in Men	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539076/pharmacy-app/pharmacy/Minoxil_Forte_5___minoxidil__for_Men_60m_1232_1758539075564.jpg	2025-09-22 09:43:50.734	2025-09-22 11:04:36.914
1233	Minoxin (Minoxidil) Plus Solution 5% 60ml	Hair Regrowth Treatment. Re-activates natural growth cycle of hair. Naturally denser thicker hair.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539078/pharmacy-app/pharmacy/Minoxin__Minoxidil__Plus_Solution_5__60m_1233_1758539077764.jpg	2025-09-22 09:43:52.274	2025-09-22 11:04:39.163
1236	Moderma Acne Bar	The Moderma Acne Bar is ideal for the management of acne breakouts/pimples and prevents further breakouts.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539085/pharmacy-app/pharmacy/Moderma_Acne_Bar_1236_1758539085216.jpg	2025-09-22 09:43:56.686	2025-09-22 11:04:46.145
1238	Moderma Acne Control Cleanser 100ml	A dermatologist-formulated cleanser helps to clear breakouts, unclog pores, fade acne scars, and refresh the skin without over-drying.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539090/pharmacy-app/pharmacy/Moderma_Acne_Control_Cleanser_100ml_1238_1758539089490.jpg	2025-09-22 09:43:59.044	2025-09-22 11:04:50.635
1239	Moderma Acne Treatment Cream	Moderma Acne Treatment Cream is a powerful, dermatologist-formulated solution designed to effectively combat and manage acne. This advanced treatment targets…	63000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539092/pharmacy-app/pharmacy/Moderma_Acne_Treatment_Cream_1239_1758539091465.jpg	2025-09-22 09:44:00.259	2025-09-22 11:04:52.222
1242	Moderma Eczema Repair Cream	This is an enriched product for a very dry, sensitive, itchy and Eczema skin. The Moderma eczema repair cream has…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539098/pharmacy-app/pharmacy/Moderma_Eczema_Repair_Cream_1242_1758539097389.jpg	2025-09-22 09:44:03.773	2025-09-22 11:04:58.624
1244	Moderma Kojic Acid Brightening Bar Soap 200g	Mordema kojic acid brightening bar has Kojic acid which lightens and brightens the skin by restricting melanin production, the pigment…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539102/pharmacy-app/pharmacy/Moderma_Kojic_Acid_Brightening_Bar_Soap__1244_1758539101658.jpg	2025-09-22 09:44:06.01	2025-09-22 11:05:04.754
1247	Moderma Vitamin C Serum 30ml	Even Skin Tone Vitamin C Serum – a powerful and rejuvenating skincare solution. Formulated with potent Vitamin C and a…	69000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539114/pharmacy-app/pharmacy/Moderma_Vitamin_C_Serum_30ml_1247_1758539113608.jpg	2025-09-22 09:44:09.365	2025-09-22 11:05:14.557
1249	Moderma Xtra Hydration Dry Skin Cream 300ml	Moderma Xtra Hydration cream is formulated with Urea 10% which offers extra moisture for the skin hence giving relief for…	56000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539118/pharmacy-app/pharmacy/Moderma_Xtra_Hydration_Dry_Skin_Cream_30_1249_1758539117828.jpg	2025-09-22 09:44:11.585	2025-09-22 11:05:19.187
1252	Momeasy Electric Breast Pump	Helps improve lactation of breast milk. Electric 2-Phase Breast Pump; More milk in less time	230000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539126/pharmacy-app/pharmacy/Momeasy_Electric_Breast_Pump_1252_1758539125884.jpg	2025-09-22 09:44:14.897	2025-09-22 11:05:27.294
1254	Momeasy Water Filled Teether 4m+	Momeasy Water Filled Teether is a soothing and safe solution for babies experiencing teething discomfort. Designed with a soft, water-filled…	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539131/pharmacy-app/pharmacy/Momeasy_Water_Filled_Teether_4m__1254_1758539130493.jpg	2025-09-22 09:44:17.095	2025-09-22 11:05:31.698
1257	Mosedin Loratidine Syrup 5mg/5ml	For relief of allergic reactions and their symptoms like runny nose, watery eyes, itching, hives and allergic cough.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539137/pharmacy-app/pharmacy/Mosedin_Loratidine_Syrup_5mg_5ml_1257_1758539136727.jpg	2025-09-22 09:44:20.696	2025-09-22 11:05:38.252
1259	Mosi-guard Natural Spray Extra 75ml	Plant-based, DEET free insect repellent with a fresh, zingy smell. Aerosol free, pump action spray. Effective for up to 10+…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539142/pharmacy-app/pharmacy/Mosi_guard_Natural_Spray_Extra_75ml_1259_1758539141960.jpg	2025-09-22 09:44:22.868	2025-09-22 11:05:43.986
1262	Motility Boost for Men	Motility Boost Fertility Supplement. A dietary supplement to support sperm motility.	240000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539152/pharmacy-app/pharmacy/Motility_Boost_for_Men_1262_1758539151586.jpg	2025-09-22 09:44:26.235	2025-09-22 11:05:53.098
1265	Multivitamin Tabs 100’s	Ideal for vigour, growth and vitality, useful in correcting vitamin deficiencies in all age groups. Each pack contains 100 tablets.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539158/pharmacy-app/pharmacy/Multivitamin_Tabs_100_s_1265_1758539157942.jpg	2025-09-22 09:44:29.927	2025-09-22 11:05:59.244
1267	Mumfer Tablets 30’s	Iron, Folic acid Mumfer is used prevent and treat iron deficiency and anemia caused by pregnancy, breastfeeding or malnutrition. Each…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539164/pharmacy-app/pharmacy/Mumfer_Tablets_30_s_1267_1758539162951.jpg	2025-09-22 09:44:32.723	2025-09-22 11:06:04.772
1269	My Pro Nutrition Collagen Powder 500g	Collagen improves skin elasticity, bone and joint health while providing anti-ageing and beautifying benefits.	195000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539169/pharmacy-app/pharmacy/My_Pro_Nutrition_Collagen_Powder_500g_1269_1758539167937.jpg	2025-09-22 09:44:35.385	2025-09-22 11:06:10.089
1273	NAN 1 Infant Formula Milk 400g	Nan Optipro 1 Milk is a hypoallergenic infant formula for healthy infants from birth, who are at increased risk of…	47000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539182/pharmacy-app/pharmacy/NAN_1_Infant_Formula_Milk_400g_1273_1758539181654.jpg	2025-09-22 09:44:40.489	2025-09-22 11:06:23.922
1275	Nat-C Ester Sachets 30’s	NAT-C ESTER sachets are specially formulated to boost and improve your immunity, health and skin. They contain High strength-1000 mg-Buffered…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539188/pharmacy-app/pharmacy/Nat_C_Ester_Sachets_30_s_1275_1758539187626.jpg	2025-09-22 09:44:43.483	2025-09-22 11:06:29.067
1277	Natrol Melatonin 5mg Gummies	Natrol Melatonin 5mg Gummies help you fall asleep faster, stay asleep longer, and wake up refreshed. This strawberry flavored melatonin…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539193/pharmacy-app/pharmacy/Natrol_Melatonin_5mg_Gummies_1277_1758539192242.jpg	2025-09-22 09:44:45.668	2025-09-22 11:06:33.912
1374	Nivea Men Fresh Active Roll On 50ml	Longlasting freshness, with ocean extracts. Reliable 48h anti-perspirant protection that cares for your skin.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539432/pharmacy-app/pharmacy/Nivea_Men_Fresh_Active_Roll_On_50ml_1374_1758539431734.png	2025-09-22 09:47:12.16	2025-09-22 11:10:32.971
1279	Nature’s Bounty Kids Multivitamin Gummies	Nature's Bounty Kids Multivitamin Gummies contain 13 key nutrients that support kids’ Immune System, Eyes, Bones, Antioxidant Health & Energy…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539198/pharmacy-app/pharmacy/Nature_s_Bounty_Kids_Multivitamin_Gummie_1279_1758539197484.jpg	2025-09-22 09:44:48.107	2025-09-22 11:06:38.566
1282	Nature’s Truth Ultra Collagen Grass Fed Peptides Tablets 90’s	Nature’s Truth Ultra Collagen tablets have Types I and III collagen peptides, essential for improving skin elasticity, joint flexibility, and…	135000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539207/pharmacy-app/pharmacy/Nature_s_Truth_Ultra_Collagen_Grass_Fed__1282_1758539206695.jpg	2025-09-22 09:44:52.179	2025-09-22 11:06:47.987
1285	Natures Aid Cholesterol Support Formula 90g	Plant Sterols offer a natural way to maintain a healthy cholesterol level.	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539214/pharmacy-app/pharmacy/Natures_Aid_Cholesterol_Support_Formula__1285_1758539213132.jpg	2025-09-22 09:44:57.094	2025-09-22 11:06:54.382
1287	Natures Aid Collagen Beauty Formula 90’s	Marine sourced hydrolysed Collagen with Vitamin C, Zinc & B-Vitamins for good skin, hair and nails.	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539218/pharmacy-app/pharmacy/Natures_Aid_Collagen_Beauty_Formula_90_s_1287_1758539217343.jpg	2025-09-22 09:45:00.166	2025-09-22 11:06:58.439
1290	Natures Aid Fenugreek 500mg 90’s	Has benefits for lowering blood sugar levels, boosting testosterone, and increasing milk production in breastfeeding mothers.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539225/pharmacy-app/pharmacy/Natures_Aid_Fenugreek_500mg_90_s_1290_1758539224936.jpg	2025-09-22 09:45:04.089	2025-09-22 11:07:06.726
1292	Natures Aid Flaxseed Oil 1000mg 90’s	A cold pressed oil providing Omegas 3, 6 & 9 for normal heart health, brain function and vision.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539230/pharmacy-app/pharmacy/Natures_Aid_Flaxseed_Oil_1000mg_90_s_1292_1758539230022.png	2025-09-22 09:45:07.129	2025-09-22 11:07:11.026
1295	Natures Aid Glucosamine MSM & Chondroitin 90’s	Glucosamine, MSM & Chondroitin with Vitamin C to support normal collagen formation and the function of cartilage in joints.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539236/pharmacy-app/pharmacy/Natures_Aid_Glucosamine_MSM___Chondroiti_1295_1758539235557.jpg	2025-09-22 09:45:11.478	2025-09-22 11:07:16.853
1296	Natures Aid Green Tea 10,000mg 60’s	A handy daily Green Tea supplement for metabolic support, heart health and anti-ageing.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539241/pharmacy-app/pharmacy/Natures_Aid_Green_Tea_10_000mg_60_s_1296_1758539241141.jpg	2025-09-22 09:45:12.576	2025-09-22 11:07:22.206
1298	Natures Aid Iron Bisglycinate 90’s	A daily Iron supplement that is gentle on the stomach, for the reduction of tiredness and fatigue.	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539246/pharmacy-app/pharmacy/Natures_Aid_Iron_Bisglycinate_90_s_1298_1758539245437.jpg	2025-09-22 09:45:14.738	2025-09-22 11:07:26.694
1301	Natures Aid Saw Palmetto Complex 60’s	With Nettle, Zinc & Amino Acids for normal male reproductive health.	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539252/pharmacy-app/pharmacy/Natures_Aid_Saw_Palmetto_Complex_60_s_1301_1758539251955.jpg	2025-09-22 09:45:18.598	2025-09-22 11:07:33.146
1303	Natures Bounty Acidophilus Probiotic Chewable Tablets 60’s	Acidophilus is a friendly bacteria for the digestive system. Supports Digestive, Intestinal & Immune Health.	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539257/pharmacy-app/pharmacy/Natures_Bounty_Acidophilus_Probiotic_Che_1303_1758539256554.jpg	2025-09-22 09:45:20.783	2025-09-22 11:07:38.172
1305	Natures Bounty Beautiful Skin Gummies 60’s	Get that healthy skin glow. Rich in hyaluronic acid. Contains Vitamin C for collagen production. Antioxidant support and cell protection.…	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539262/pharmacy-app/pharmacy/Natures_Bounty_Beautiful_Skin_Gummies_60_1305_1758539261213.jpg	2025-09-22 09:45:23.922	2025-09-22 11:07:42.38
1308	Natures Bounty Calcium Magnesium Zinc Tabs 100’s	May Reduce the Risk of Osteoporosis. Supports a calm, relaxed mood. Helps with occasional anxiety.	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539268/pharmacy-app/pharmacy/Natures_Bounty_Calcium_Magnesium_Zinc_Ta_1308_1758539267930.jpg	2025-09-22 09:45:28.542	2025-09-22 11:07:49.017
1310	Natures Bounty Vitamin C + Zinc Immunity Gummies 60’s	Immune support for all seasons. Contributes to antioxidant & cell protection. Easy to take on the go. Sugar free. Great…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539272/pharmacy-app/pharmacy/Natures_Bounty_Vitamin_C___Zinc_Immunity_1310_1758539271640.jpg	2025-09-22 09:45:31.705	2025-09-22 11:07:52.665
1312	Natures Plus Collagen Powder 294g	Collagen is important for looking and feeling your best. Boost the health of your hair, skin, nails, joints, immune system…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539276/pharmacy-app/pharmacy/Natures_Plus_Collagen_Powder_294g_1312_1758539275429.jpg	2025-09-22 09:45:34.48	2025-09-22 11:07:56.595
1313	Natures Plus Fast Acting Melatonin 5mg	Supports rest & relaxation. Nutritionally supports sound sleep. Promotes a healthy immune system. Supports mental sharpness. Promotes eye health. Supports…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539278/pharmacy-app/pharmacy/Natures_Plus_Fast_Acting_Melatonin_5mg_1313_1758539277455.jpg	2025-09-22 09:45:36.006	2025-09-22 11:07:58.439
1316	Neurozan Tablets 30’s	Neurozan enhances cognitive function, boosts overall mental abilities, improves memory performance, supports better recall and retention, elevates mood and attention,…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539285/pharmacy-app/pharmacy/Neurozan_Tablets_30_s_1316_1758539284993.jpg	2025-09-22 09:45:40.844	2025-09-22 11:08:07.145
1318	Neutrogena Blackhead Eliminating Cleansing Toner	The Neutrogena blackhead eliminating cleansing toner is clinically proven to eliminate and prevent blackheads. Developed with dermatologists, the formula uses…	39000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539291/pharmacy-app/pharmacy/Neutrogena_Blackhead_Eliminating_Cleansi_1318_1758539289973.jpg	2025-09-22 09:45:43.801	2025-09-22 11:08:11.942
1321	Neutrogena Clear & Defend Facial Wash 200mls	Developed with dermatologists, the Neutrogena Clear and Defend Facial wash contains salicylic acid and is clinically proven to help prevent…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539303/pharmacy-app/pharmacy/Neutrogena_Clear___Defend_Facial_Wash_20_1321_1758539302818.jpg	2025-09-22 09:45:47.987	2025-09-22 11:08:23.937
1324	Neutrogena Clear and Defend Moisturiser, 50 ml	This oil-free moisturiser has been developed with dermatologists to provide 24 hour hydration without clogging pores. Formulated with aloe vera…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539311/pharmacy-app/pharmacy/Neutrogena_Clear_and_Defend_Moisturiser__1324_1758539310269.jpg	2025-09-22 09:45:52.595	2025-09-22 11:08:31.719
1327	Neutrogena Clear Face Lotion SPF50 88ML	Forget the heavy, oily residue of other sun care products with the Clear Face Breakout Liquid Lotion Sunscreen. Formulated with…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539317/pharmacy-app/pharmacy/Neutrogena_Clear_Face_Lotion_SPF50_88ML_1327_1758539316836.jpg	2025-09-22 09:45:56.793	2025-09-22 11:08:37.769
1329	Neutrogena Concentrated Scented Hand Cream 50ml	The Neutrogena® Norwegian Formula Concentrated Scented Hand Cream provides relief to chapped, dry hands instantly. One dab of this glycerin-rich…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539328/pharmacy-app/pharmacy/Neutrogena_Concentrated_Scented_Hand_Cre_1329_1758539322292.jpg	2025-09-22 09:45:59.484	2025-09-22 11:08:57.133
1332	Neutrogena Hydro Boost Body Gel Cream 250ml	Neutrogena Hydro Boost Body Gel Cream gives skin the boost of hydration it needs Absorbs instantly with a non-greasy feeling…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539350/pharmacy-app/pharmacy/Neutrogena_Hydro_Boost_Body_Gel_Cream_25_1332_1758539350314.jpg	2025-09-22 09:46:03.4	2025-09-22 11:09:11.214
1335	NEUTROGENA Hydro Boost Whipped Body Balm 200ml	Neutrogena Hydro Boost Whipped Body Balm hydrates and replenishes the skin for supple and radiant skin.  Use overnight for nighttime…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539356/pharmacy-app/pharmacy/NEUTROGENA_Hydro_Boost_Whipped_Body_Balm_1335_1758539355328.jpg	2025-09-22 09:46:07.546	2025-09-22 11:09:16.372
1337	Neutrogena Norwegian Formula Intense Repair Body Lotion Sensitive Skin 400ml	Neutrogena Intense Repair Body Lotion Dry Sensitive Skin is a deeply moisturizing body lotion suitable for dry to very dry…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539359/pharmacy-app/pharmacy/Neutrogena_Norwegian_Formula_Intense_Rep_1337_1758539358942.png	2025-09-22 09:46:11.027	2025-09-22 11:09:20.052
1340	Neutrogena Oil Balancing In Shower Mask 150ml	NEUTROGENA® Oil Balancing In-Shower Mask with lime and glycolic acid deeply cleanses and rebalances oil for a visibly mattified complexion.…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539365/pharmacy-app/pharmacy/Neutrogena_Oil_Balancing_In_Shower_Mask__1340_1758539364228.jpg	2025-09-22 09:46:18.604	2025-09-22 11:09:25.407
1342	Neutrogena Oil- and Alcohol-Free Facial Toner	This specially formulated, oil-free Alcohol-Free Face Toner refreshes skin without stripping its own natural moisturizers, so you can get a…	77000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539368/pharmacy-app/pharmacy/Neutrogena_Oil__and_Alcohol_Free_Facial__1342_1758539368105.jpg	2025-09-22 09:46:21.676	2025-09-22 11:09:29.086
1343	Neutrogena Oil-Free Acne Stress Control Triple-Action Toner	With MicroClear® Technology, scientifically proven to dissolve oil and help boost delivery of salicylic acid to the source of breakouts, this…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539370/pharmacy-app/pharmacy/Neutrogena_Oil_Free_Acne_Stress_Control__1343_1758539369889.jpg	2025-09-22 09:46:23.212	2025-09-22 11:09:30.793
1346	Neutrogena Refreshingly Clear Daily Exfoliator 150ml	Developed with dermatologists, Neutrogena Refreshingly Clear Daily Exfoliator with pink grapefruit and vitamin C is an uplifting daily facial scrub.…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539379/pharmacy-app/pharmacy/Neutrogena_Refreshingly_Clear_Daily_Exfo_1346_1758539378265.jpg	2025-09-22 09:46:27.926	2025-09-22 11:09:39.405
1348	Neutrogena T/Gel Anti-Dandruff Shampoo for Dry Hair 125ml	NEUTROGENA T/Gel® Shampoo for Dry Hair contains added conditioners, which leaves hair clean and soft and helps relieve the flaking…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539382/pharmacy-app/pharmacy/Neutrogena_T_Gel_Anti_Dandruff_Shampoo_f_1348_1758539382054.png	2025-09-22 09:46:31.303	2025-09-22 11:09:43.137
1351	Neutrogena Visibly Clear Spot Stress Control Daily Scrub 150ml	Our NEUTROGENA® Visibly Clear* Spot Stress Control® Daily Scrub is a powerful creamy scrub to help clear spots before they…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539388/pharmacy-app/pharmacy/Neutrogena_Visibly_Clear_Spot_Stress_Con_1351_1758539387786.jpg	2025-09-22 09:46:35.808	2025-09-22 11:09:48.786
1355	Nivea Black & White Invisible Clear Roll On 50ml	White mark protection on black clothing & anti-yellow staining on white clothing. Reliable 48h anti-perspirant protection that cares for your…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539395/pharmacy-app/pharmacy/Nivea_Black___White_Invisible_Clear_Roll_1355_1758539395253.jpg	2025-09-22 09:46:41.745	2025-09-22 11:09:56.178
1358	Nivea Creme 60ml	Effective Results: intensive protective care. Multi-Use: for face, body and hands. Rich Formula: soft, soothing and moisturising. Quality Ingredients: enriched…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539400/pharmacy-app/pharmacy/Nivea_Creme_60ml_1358_1758539399864.png	2025-09-22 09:46:46.764	2025-09-22 11:10:01.114
1360	Nivea Dry Comfort Roll On Deodorant	Powerful protection tested in real life situations. Dual Active formula with 2 anti-perspirant actives for a long-lasting dry feeling. Reliable…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539404/pharmacy-app/pharmacy/Nivea_Dry_Comfort_Roll_On_Deodorant_1360_1758539403969.png	2025-09-22 09:46:49.66	2025-09-22 11:10:04.994
1363	Nivea Express Hydration Lotion 200ml	Sea minerals and deep moisture serum. Deep moisturisation, quick absorption, smoother skin. This body lotion for men and women is…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539409/pharmacy-app/pharmacy/Nivea_Express_Hydration_Lotion_200ml_1363_1758539408796.jpg	2025-09-22 09:46:53.625	2025-09-22 11:10:09.619
1366	Nivea Fresh Natural Roll On 50ml	Fresh feeling all day long, with ocean extracts. Reliable 48h deodorant protection that cares for your skin. Quick Dry. Skin…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539413/pharmacy-app/pharmacy/Nivea_Fresh_Natural_Roll_On_50ml_1366_1758539413292.png	2025-09-22 09:46:58.687	2025-09-22 11:10:14.132
1368	Nivea Love Sunshine Shower Gel 250ml	For a touchably smooth, instantly refreshed skin feel. The NIVEA sun scent turns your everyday shower into refreshing bliss. Formula…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539418/pharmacy-app/pharmacy/Nivea_Love_Sunshine_Shower_Gel_250ml_1368_1758539417327.png	2025-09-22 09:47:02.536	2025-09-22 11:10:18.417
1370	Nivea Men Black & White Invisible Roll On 50ml	White mark protection on black clothing.. Anti-yellow staining on white clothing. Reliable 48h anti-perspirant protection that cares for your skin.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539421/pharmacy-app/pharmacy/Nivea_Men_Black___White_Invisible_Roll_O_1370_1758539421017.png	2025-09-22 09:47:05.609	2025-09-22 11:10:21.987
1373	Nivea Men Fresh Active Deodorant Maxi Spray 150ml	Long lasting freshness, with ocean extracts. Reliable 48h deodorant protection that cares for your skin. Quick Dry.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539430/pharmacy-app/pharmacy/Nivea_Men_Fresh_Active_Deodorant_Maxi_Sp_1373_1758539430082.png	2025-09-22 09:47:10.532	2025-09-22 11:10:31.089
1375	Nivea Men Max Hydration Body Lotion 100ml	Provides intensive 24h moisture care for your skin. Innovative formula enriched with aloe vera relieves the feeling of dryness in…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539434/pharmacy-app/pharmacy/Nivea_Men_Max_Hydration_Body_Lotion_100m_1375_1758539433788.png	2025-09-22 09:47:14.037	2025-09-22 11:10:35.265
1377	Nivea Men Max Hydration Body Lotion 400ml	Provides intensive 24h moisture care for your skin. Innovative formula enriched with aloe vera relieves the feeling of dryness in…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539438/pharmacy-app/pharmacy/Nivea_Men_Max_Hydration_Body_Lotion_400m_1377_1758539437442.png	2025-09-22 09:47:17.324	2025-09-22 11:10:38.248
1379	Nivea Men Revitalising Body Lotion 250ml	Revitalizes and refreshes your skin. Provides 24h+ moisturization. Absorbs in seconds, with no sticky feeling. Non-greasy formula, enriched with Vitamin…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539442/pharmacy-app/pharmacy/Nivea_Men_Revitalising_Body_Lotion_250ml_1379_1758539441339.png	2025-09-22 09:47:20.148	2025-09-22 11:10:42.343
1382	Nivea Men Silver Protect Deodorant Spray 150ml	-Day long odour protection with anti-bacterial silver ions. -Long lasting freshness. -0% alcohol & NIVEA® MEN Care Complex.	17500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539450/pharmacy-app/pharmacy/Nivea_Men_Silver_Protect_Deodorant_Spray_1382_1758539449427.png	2025-09-22 09:47:25.164	2025-09-22 11:10:50.418
1385	Nivea Nourishing Cocoa Lotion 400ml	Noticeably smoother skin. Cocoa Butter & Vitamin E. 48h intensive & nourishing care. Glowing & healthy looking skin.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539454/pharmacy-app/pharmacy/Nivea_Nourishing_Cocoa_Lotion_400ml_1385_1758539453369.jpg	2025-09-22 09:47:29.772	2025-09-22 11:10:54.568
1388	Nivea Perfect & Matte Effect 3-IN-1 Vanishing Cream Very Oily Skin 50ml	The caring oil control solution for healthy-looking, perfect and matte skin. It cares for your skin and controls oil and…	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539459/pharmacy-app/pharmacy/Nivea_Perfect___Matte_Effect_3_IN_1_Vani_1388_1758539458903.png	2025-09-22 09:47:34.469	2025-09-22 11:10:59.855
1390	NIVEA Perfect & Radiant Micellar 3-in-1 Cleansing Water 400ml	Enriched with Vitamin E works in harmony with your skin to: deeply clean without oily residues, gently remove even waterproof…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539462/pharmacy-app/pharmacy/NIVEA_Perfect___Radiant_Micellar_3_in_1__1390_1758539461952.jpg	2025-09-22 09:47:37.456	2025-09-22 11:11:03.015
1393	Nivea Q10 Firming Body Lotion 400ml	Skin Firming Moisturiser. With Q10 + Vit C to firm & nourish the skin. Provides elasticity after just 10 days…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539469/pharmacy-app/pharmacy/Nivea_Q10_Firming_Body_Lotion_400ml_1393_1758539468378.png	2025-09-22 09:47:42.166	2025-09-22 11:11:09.368
1395	Nivea Rich Nourishing Body Lotion 100ml	5in1 Complete Care. 48h Deep Moisture. Dry-out protection. Smooth skin feel. Non-greasy. Healthy-looking skin.	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539472/pharmacy-app/pharmacy/Nivea_Rich_Nourishing_Body_Lotion_100ml_1395_1758539471980.png	2025-09-22 09:47:45.251	2025-09-22 11:11:13.205
1398	NIVEA Shea Smooth Body Lotion 200ml	Deeply moisturizes and repairs dry skin, promoting a soft, smooth feeling that lasts for up to 48 hours.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539482/pharmacy-app/pharmacy/NIVEA_Shea_Smooth_Body_Lotion_200ml_1398_1758539481942.png	2025-09-22 09:47:49.956	2025-09-22 11:11:22.862
1400	Nivea Shower Coconut Cream 250ml	Let this indulging shower cream with jojoba oil nourish your skin with a silky soft foam, while its exotic scent…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539487/pharmacy-app/pharmacy/Nivea_Shower_Coconut_Cream_250ml_1400_1758539486090.png	2025-09-22 09:47:52.218	2025-09-22 11:11:27.364
1402	Nivea Sun Protect & Moisture SPF30 Lotion 200ml	NIVEA SUN Protect & Moisture Lotion protects healthy skin from inside & outside. It provides immediate UV protection and supports…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539491/pharmacy-app/pharmacy/Nivea_Sun_Protect___Moisture_SPF30_Lotio_1402_1758539490387.jpg	2025-09-22 09:47:54.478	2025-09-22 11:11:31.433
1405	Nizoral Cream Ketoconazole 2% 15g	Ketaconazole cream is an antifungal that is primarily used to treat fungal infections of the skin such as ringworm, jock…	24500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539497/pharmacy-app/pharmacy/Nizoral_Cream_Ketoconazole_2__15g_1405_1758539497113.png	2025-09-22 09:47:58.861	2025-09-22 11:11:38.293
1409	Now Alpha Lipoic Acid 100mg 60’s	Supports Glutathione Production. With Vitamins C & E. It extends the activities of antioxidants in the body. Each pack contains…	52000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539507/pharmacy-app/pharmacy/Now_Alpha_Lipoic_Acid_100mg_60_s_1409_1758539506369.jpg	2025-09-22 09:48:05.309	2025-09-22 11:11:47.532
1410	Now Ashwagandha 450mg 90’s	Standardized Extract, Free Radical Scavenger, Immune System Support. Each pack contains 90capsules.	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539509/pharmacy-app/pharmacy/Now_Ashwagandha_450mg_90_s_1410_1758539508562.jpg	2025-09-22 09:48:06.841	2025-09-22 11:11:49.455
1412	Now Biotin 5000mcg 60’s	Supports Amino Acid Metabolism, Promotes Normal Immune Function and Strengthens hair and nails. Promotes good skin health. Each pack contains…	54000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539513/pharmacy-app/pharmacy/Now_Biotin_5000mcg_60_s_1412_1758539512309.jpg	2025-09-22 09:48:09.61	2025-09-22 11:11:53.491
1416	Now Gr8-Dophilus 60’s	8 Strains & 4 Billion Potency. Dairy & Gluten Free / With FOS. Clinically Validated Strains. Each pack contains 60…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539520/pharmacy-app/pharmacy/Now_Gr8_Dophilus_60_s_1416_1758539519843.jpg	2025-09-22 09:48:15.341	2025-09-22 11:12:00.913
1418	Now L-Glutamine Powder 170g	Maintains proper nitrogen balance in the body. Aids in faster protein metabolism.	86000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539524/pharmacy-app/pharmacy/Now_L_Glutamine_Powder_170g_1418_1758539523721.jpg	2025-09-22 09:48:18.617	2025-09-22 11:12:04.867
1420	Now Maca 500mg Capsules 100’s	Maca (Lepidium meyenii), sometimes referred to as Peruvian Ginseng has for centuries been used as a food source and a…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539528/pharmacy-app/pharmacy/Now_Maca_500mg_Capsules_100_s_1420_1758539527852.jpg	2025-09-22 09:48:21.485	2025-09-22 11:12:09.164
1423	Now NAC (N-Acetyl Cysteine) 600mg 100’s	With Selenium & Molybdenum. Maintains Cellular Health. Each pack contains 100 capsules.	74000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539538/pharmacy-app/pharmacy/Now_NAC__N_Acetyl_Cysteine__600mg_100_s_1423_1758539537236.jpg	2025-09-22 09:48:25.786	2025-09-22 11:12:18.64
1425	Now Omega-3 Fish Oil Capsules 100’s	Omega-3 fish oil helps improve risk factors for heart disease, significantly reduces levels of triglycerides, it helps raise HDL (good)…	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539543/pharmacy-app/pharmacy/Now_Omega_3_Fish_Oil_Capsules_100_s_1425_1758539542107.jpg	2025-09-22 09:48:29.373	2025-09-22 11:12:23.607
1430	Nurofen Ibuprofen 200mg Tablets 16’s	Nurofen relieves pain and reduces inflammation and temperature as well as relieving headaches and other types of pain. Each pack contains…	19200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539554/pharmacy-app/pharmacy/Nurofen_Ibuprofen_200mg_Tablets_16_s_1430_1758539554134.jpg	2025-09-22 09:48:37.565	2025-09-22 11:12:35.114
1433	OB Normal Tampons 16’s	O.B normal tampons are great for first-time non-applicator tampon users, or for women with light to moderate flow. These tampons…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539561/pharmacy-app/pharmacy/OB_Normal_Tampons_16_s_1433_1758539560899.png	2025-09-22 09:48:41.966	2025-09-22 11:12:42.192
1435	Odomos Mosquito Repellent Cream 30g	Be free from mosquito bite for the whole hours of sleep. Apply to The External part of the body. Create…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539565/pharmacy-app/pharmacy/Odomos_Mosquito_Repellent_Cream_30g_1435_1758539565222.jpg	2025-09-22 09:48:45.037	2025-09-22 11:12:45.998
1438	Oilatum Fragrance Free Emollient Cream 150g	Soothes, softens and re-hydrates. Relieves itching. Especially beneficial after washing. Fragrance free. Suitable for children, adults and the elderly.	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539570/pharmacy-app/pharmacy/Oilatum_Fragrance_Free_Emollient_Cream_1_1438_1758539570036.jpg	2025-09-22 09:48:49.541	2025-09-22 11:12:50.925
1441	Oilatum Scalp Anti-Dandruff Shampoo 100ml	Helps clear dandruff. pH balanced. For itchy, flaking scalps caused by stubborn dandruff.	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539576/pharmacy-app/pharmacy/Oilatum_Scalp_Anti_Dandruff_Shampoo_100m_1441_1758539575820.jpg	2025-09-22 09:48:53.502	2025-09-22 11:12:56.912
1443	Oilatum Soap Bar 100g (India)	Oilatum bar is a medicated soap used to treat dry and sensitive skin. An emollient cleanser.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539580/pharmacy-app/pharmacy/Oilatum_Soap_Bar_100g__India__1443_1758539579651.jpg	2025-09-22 09:48:56.096	2025-09-22 11:13:00.828
1444	Olay Anti Wrinkle Firm & Lift Moisturiser SPF15 Day Cream 50ml	Olay Anti-Wrinkle’s targeted solution minimizes the appearance of wrinkles, so you can laugh in the face of wrinkles.	67000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539582/pharmacy-app/pharmacy/Olay_Anti_Wrinkle_Firm___Lift_Moisturise_1444_1758539581783.jpg	2025-09-22 09:48:57.444	2025-09-22 11:13:02.835
1446	Olay Anti-wrinkle 2in1 Day Cream And Firming Serum 50ml	Firmer healthier looking skin in 21 days. Proven anti-wrinkle cream - now combined with a powerful firming serum This day…	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539589/pharmacy-app/pharmacy/Olay_Anti_wrinkle_2in1_Day_Cream_And_Fir_1446_1758539588672.jpg	2025-09-22 09:49:00.089	2025-09-22 11:13:10.147
1448	Olay Beauty Fluid Moisturiser for Oily Skin 200ml	Olay Essentials Beauty Day Fluid Normal, Dry and Combination Skin 100ml provides skin with the additional moisture it needs to…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539593/pharmacy-app/pharmacy/Olay_Beauty_Fluid_Moisturiser_for_Oily_S_1448_1758539593231.jpg	2025-09-22 09:49:02.492	2025-09-22 11:13:13.964
1451	Olay Cleanse Makeup Melting Cleansing Milk 200ml	Olay Cleanse Make-up Melting Cleansing Milk, is designed with vitamins e & b3, & pro-vitamin b5 to remove even stubborn…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539600/pharmacy-app/pharmacy/Olay_Cleanse_Makeup_Melting_Cleansing_Mi_1451_1758539599284.jpg	2025-09-22 09:49:06.279	2025-09-22 11:13:20.221
1453	Olay Complete Care Day Cream Sensitive Moisturiser Spf15 50ml	This nourishing and vitamin enriched complete care cream provides 24 hour hydration. Also protects with spf15 and anti-oxidant vitamin e…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539603/pharmacy-app/pharmacy/Olay_Complete_Care_Day_Cream_Sensitive_M_1453_1758539602875.jpg	2025-09-22 09:49:08.816	2025-09-22 11:13:23.645
1456	Olay Double Action Facial Cream & Primer for Sensitive Skin 50ml	Sensitive skin feels smooth and moisturised - and protected from the unpredictable weather with Olay Double Action Moisturiser Day Cream…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539610/pharmacy-app/pharmacy/Olay_Double_Action_Facial_Cream___Primer_1456_1758539609673.jpg	2025-09-22 09:49:12.555	2025-09-22 11:13:31.037
1459	Olay Regenerist Hydrate Firm & Renew Day Cream SPF30 50ml	Firms Skin And Reduces The Look Of Fine Lines And Wrinkles Every Day. Anti-ageing lightweight moisturiser with broad UV protection…	155000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539617/pharmacy-app/pharmacy/Olay_Regenerist_Hydrate_Firm___Renew_Day_1459_1758539616266.jpg	2025-09-22 09:49:16.375	2025-09-22 11:13:37.385
1462	Olay Regenerist Skin Perfecting Cleanser 150ml	Exfoliating facial cleanser deep cleans and speeds surface cell regeneration. Creamy formula gently exfoliates and detoxifies. Gentle, creamy formula works…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539624/pharmacy-app/pharmacy/Olay_Regenerist_Skin_Perfecting_Cleanser_1462_1758539623166.jpg	2025-09-22 09:49:20.676	2025-09-22 11:13:44.352
1464	Olay Regenerist Whip Hydrate Firm & Renew Day Cream 50ml	Instantly hydrates dry skin, visibly firms and renews skin. Olay’s Amino-Peptide Complex II formula with Vitamin B3. Light as air…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539628/pharmacy-app/pharmacy/Olay_Regenerist_Whip_Hydrate_Firm___Rene_1464_1758539627594.jpg	2025-09-22 09:49:23.252	2025-09-22 11:13:48.834
1467	Olay Total Effects 7-In-One Anti-Aging Moisturizer 50ml	Evens skin tone appearance. Visibly smoothes fine lines & wrinkles. 7 Benefits in 1 for younger, healthier-looking skin.	132000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539634/pharmacy-app/pharmacy/Olay_Total_Effects_7_In_One_Anti_Aging_M_1467_1758539633853.jpg	2025-09-22 09:49:27.228	2025-09-22 11:13:54.892
1470	Olay Vitality Radiance Day Cream SPF15 50ml	OLAY Vitality is specifically designed to nourish and strengthen even fragile, mature skin – reveal beautiful, younger looking skin, no…	58000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539640/pharmacy-app/pharmacy/Olay_Vitality_Radiance_Day_Cream_SPF15_5_1470_1758539639631.jpg	2025-09-22 09:49:31.404	2025-09-22 11:14:00.838
1473	Olbas Oil For Children 12ml	Olbas Oil for Children 12ml is for use in children to help relieve nasal congestion, ideal for children and infants…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539649/pharmacy-app/pharmacy/Olbas_Oil_For_Children_12ml_1473_1758539649038.jpg	2025-09-22 09:49:35.546	2025-09-22 11:14:10.359
1476	Old Spice Bearglove 2in1 Shower Gel & Shampoo 400ml	With a 2 in 1 composition, because masculinity is something that the Old Spice shower gel takes very seriously.	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539656/pharmacy-app/pharmacy/Old_Spice_Bearglove_2in1_Shower_Gel___Sh_1476_1758539655562.jpg	2025-09-22 09:49:39.513	2025-09-22 11:14:16.81
1477	Old Spice Citron Antiperspirant Deodorant Stick 50ml	Old Spice delicious scent makes you unforgettable, you'll basically be the centre of the universe. Old Spice antiperspirant and deodorant…	22500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539658/pharmacy-app/pharmacy/Old_Spice_Citron_Antiperspirant_Deodoran_1477_1758539657902.png	2025-09-22 09:49:40.637	2025-09-22 11:14:18.776
1480	Old Spice Fresh White Oasis with Vanilla Deo Stick 85g	Oasis Deodorant smells like apple nectar and buttercream. Deodorant with long lasting protection. Triple protection: Anti-odor, goes on clear, fresh…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539664/pharmacy-app/pharmacy/Old_Spice_Fresh_White_Oasis_with_Vanilla_1480_1758539663439.jpg	2025-09-22 09:49:44.156	2025-09-22 11:14:24.395
1482	Old Spice Rock with Charcoal 2in1 Shampoo & Shower Gel 400ml	Body shower gel indicated to cleanse and purify the skin and hair.	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539667/pharmacy-app/pharmacy/Old_Spice_Rock_with_Charcoal_2in1_Shampo_1482_1758539666972.jpg	2025-09-22 09:49:46.685	2025-09-22 11:14:27.842
1484	Old Spice Whitewater Deodorant Stick 85g	An exciting and refreshing deodorant with the masculinity of old spice. One application is designed to take you through the…	29000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539671/pharmacy-app/pharmacy/Old_Spice_Whitewater_Deodorant_Stick_85g_1484_1758539670187.jpg	2025-09-22 09:49:49.162	2025-09-22 11:14:31.352
1487	Olive Oil Sheen Spray (Big)  472ml	ORS Olive Oil Nourishing Sheen Spray 472ml with a blend of Vitamin E, olive oil, and herbal extracts add a…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539676/pharmacy-app/pharmacy/Olive_Oil_Sheen_Spray__Big___472ml_1487_1758539675368.jpg	2025-09-22 09:49:53.275	2025-09-22 11:14:36.313
1490	Omega H3 Capsules 30’s	Omega-H3 is a concentrated blend of vitamins, minerals, amino acids, cod liver oil and garlic. Each pack contains 30capsules.	51000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539681/pharmacy-app/pharmacy/Omega_H3_Capsules_30_s_1490_1758539681026.png	2025-09-22 09:49:56.978	2025-09-22 11:14:42.308
1492	On Call Plus Code Free Blood Glucose Meter	On Call Plus Code Free Glucose meter is a Blood Glucose Machine used to regularly monitor blood glucose levels. The On Call Plus Code Free system eliminates the need for manual coding, streamlining the testing process and reducing the chances of errors. Users can enjoy hassle-free testing without the requirement for code strips.	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539686/pharmacy-app/pharmacy/On_Call_Plus_Code_Free_Blood_Glucose_Met_1492_1758539685368.jpg	2025-09-22 09:49:59.436	2025-09-22 11:14:46.221
1497	Optilyf Capsules 60’s	Optilyf supports eye health and helps in sustaining and maintaining vision and supports macular and retinal health. It helps to prevents cataract,…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539700/pharmacy-app/pharmacy/Optilyf_Capsules_60_s_1497_1758539699660.png	2025-09-22 09:50:05.851	2025-09-22 11:15:00.741
1499	Optrex Multi Action Eye Wash 100ml	It's formulated to wash away external irritants like dust, pollen, and make-up, and revitalize eyes tired from activities like prolonged…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539704/pharmacy-app/pharmacy/Optrex_Multi_Action_Eye_Wash_100ml_1499_1758539703469.jpg	2025-09-22 09:50:08.515	2025-09-22 11:15:04.842
1502	Oral-B Super Floss 50 Pre-Cut Pieces	Oral-B Super Floss 50 pre-cut strands is ideal for cleaning braces, bridges and wide gaps between teeth.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539711/pharmacy-app/pharmacy/Oral_B_Super_Floss_50_Pre_Cut_Pieces_1502_1758539710491.jpg	2025-09-22 09:50:12.06	2025-09-22 11:15:11.596
1505	ORAXIN SYRUP 200ML Cyproheptadine 200 ml   Bottle		10500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539718/pharmacy-app/pharmacy/ORAXIN_SYRUP_200ML_Cyproheptadine_200_ml_1505_1758539717446.jpg	2025-09-22 09:50:15.541	2025-09-22 11:15:18.48
1506	Organic Apple Cider Vinegar 1L	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539719/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_1L_1506_1758539719107.jpg	2025-09-22 09:50:16.913	2025-09-22 11:15:20.067
1508	Organic Apple Cider Vinegar with Honey & Cranberry 500ml	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539723/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_with_Honey___1508_1758539722632.jpg	2025-09-22 09:50:19.345	2025-09-22 11:15:23.85
1511	Organic Apple Cider Vinegar With Honey 500ml	Apple cider vinegar is a popular home remedy that has been used for centuries to relieve a wide range of…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539729/pharmacy-app/pharmacy/Organic_Apple_Cider_Vinegar_With_Honey_5_1511_1758539728146.jpg	2025-09-22 09:50:23.243	2025-09-22 11:15:29.41
1512	Organics Olive Oil Moisturizing Body Lotion 355ml	Rejuvenates Dry, Ashy, Flaky skin by totally moisturizing difficult to treat areas like knees, elbows and heels.	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539731/pharmacy-app/pharmacy/Organics_Olive_Oil_Moisturizing_Body_Lot_1512_1758539730400.jpg	2025-09-22 09:50:24.368	2025-09-22 11:15:31.473
1513	Organics Olive Oil Moisturizing Body Whip Cream 426g	Rich with Olive Oil. Rejuvenate dry, dull and ashy skin. Gives natural radiant shine glow.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539733/pharmacy-app/pharmacy/Organics_Olive_Oil_Moisturizing_Body_Whi_1513_1758539732572.jpg	2025-09-22 09:50:25.514	2025-09-22 11:15:33.508
1515	ORS Hydration Tablets Blackcurrent Flavour 12’s	Formulated with electrolytes, glucose, and minerals for general hydration, sports & exercise, and use in travel & hot climates.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539739/pharmacy-app/pharmacy/ORS_Hydration_Tablets_Blackcurrent_Flavo_1515_1758539737486.jpg	2025-09-22 09:50:28.249	2025-09-22 11:15:39.373
1518	Osteocare Fizz Effervescent Tablets 20’s	Osteocare Fizz is a convenient source of Calcium and co-factors, Calcium, magnesium, vitamin D and zinc which contribute to the…	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539745/pharmacy-app/pharmacy/Osteocare_Fizz_Effervescent_Tablets_20_s_1518_1758539745066.jpg	2025-09-22 09:50:32.148	2025-09-22 11:15:46.104
1521	Osteocare Plus (Glucosamine & chondroitin) 30’s	If you’re striving for all-round bone and cartilage health, Osteocare Plus Glucosamine and Chondroitin gives you one comprehensive formula to…	100000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539758/pharmacy-app/pharmacy/Osteocare_Plus__Glucosamine___chondroiti_1521_1758539757912.png	2025-09-22 09:50:36.053	2025-09-22 11:15:59.399
1525	Osteomin Once A Day Sachets 30’s	For flexibility, mobility, and comfort in your joints. Each pack contains 30 sachets.	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539765/pharmacy-app/pharmacy/Osteomin_Once_A_Day_Sachets_30_s_1525_1758539764399.jpg	2025-09-22 09:50:41.567	2025-09-22 11:16:05.668
1527	Otrivin 0.1% Xylometazoline (Adult) Nasal Drops 10ml	Acts quickly to relieve a blocked or runny nose caused by colds, flu, sinusitis or hayfever.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539769/pharmacy-app/pharmacy/Otrivin_0_1__Xylometazoline__Adult__Nasa_1527_1758539768654.jpg	2025-09-22 09:50:43.876	2025-09-22 11:16:09.661
1530	OvaBoost for Women	OvaBoost for egg quality A dietary supplement for support egg quality and healthy ovulation.	250000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539775/pharmacy-app/pharmacy/OvaBoost_for_Women_1530_1758539774842.jpg	2025-09-22 09:50:47.405	2025-09-22 11:16:16.209
1532	Palmer’s Cocoa Butter Formula Daily Skin Therapy Lotion 250ml	Palmer's Cocoa Butter Formula Daily Skin Therapy Lotion is made with Cocoa Butter to naturally moisturize and Vitamin E to…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539779/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Formula_Daily_Skin_1532_1758539778734.jpg	2025-09-22 09:50:50.17	2025-09-22 11:16:19.802
1534	Palmer’s Cocoa Butter Formula Men Body and Face Moisturizer Lotion 400ml	Palmer’s Cocoa Butter Formula for Men is a fast-absorbing moisturizer that helps smooth skin all over body and face. The…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539783/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Formula_Men_Body_a_1534_1758539782839.jpg	2025-09-22 09:50:52.872	2025-09-22 11:16:23.898
1537	Palmer’s Cocoa Butter Heals Softens Lotion 250ml	Soften and smooth rough, dry skin with Palmer’s Cocoa Butter Formula heals softens body Lotion, crafted with intensively moisturising Cocoa…	38000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539789/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Heals_Softens_Loti_1537_1758539788769.jpg	2025-09-22 09:50:57.441	2025-09-22 11:16:29.664
1540	Palmer’s Coconut Oil Body Lotion 400ml	Hydrate and replenish skin with Palmer's Coconut Oil daily body lotion, crafted with antioxidant-rich Extra Virgin Coconut Oil and Green…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539795/pharmacy-app/pharmacy/Palmer_s_Coconut_Oil_Body_Lotion_400ml_1540_1758539794561.jpg	2025-09-22 09:51:02.049	2025-09-22 11:16:35.973
1542	Palmer’s Coconut Oil Formula Coconut Oil Body Lotion 250ml	Palmer's® Coconut Oil Formula™ Body Lotion contains ethically and sustainably sourced Coconut Oil and Tahitian Monoi Oil, infused with Tiare…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539799/pharmacy-app/pharmacy/Palmer_s_Coconut_Oil_Formula_Coconut_Oil_1542_1758539798896.jpg	2025-09-22 09:51:04.629	2025-09-22 11:16:39.966
1544	Palmer’s Coconut Oil Repairing Conditioner 250ml	Palmer's Coconut Oil Formula Repairing Conditioner contains ethically and sustainably sourced Coconut Oil and Tahitian Monoï, infused with Tiaré flower…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539804/pharmacy-app/pharmacy/Palmer_s_Coconut_Oil_Repairing_Condition_1544_1758539803570.jpg	2025-09-22 09:51:07.374	2025-09-22 11:16:44.685
1545	Palmer’s Daily Skin Therapy With Vitamin E Lotion 400ml	Rich, luxurious Palmer's Cocoa Butter Formula daily body lotion provides deep hydration all over. This velvety soft formula absorbs quickly,…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539806/pharmacy-app/pharmacy/Palmer_s_Daily_Skin_Therapy_With_Vitamin_1545_1758539805359.jpg	2025-09-22 09:51:08.811	2025-09-22 11:16:46.19
1548	Palmer’s Cocoa Butter Firming Butter 315ml	A unique formula specifically designed to restore your body to its natural, original firmness.  Made from pure Cocoa Butter and…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539815/pharmacy-app/pharmacy/Palmer_s_Cocoa_Butter_Firming_Butter_315_1548_1758539814685.jpg	2025-09-22 09:51:13.045	2025-09-22 11:16:55.786
1550	Palmer’s Massage Lotion for Stretch Marks 250ml	Palmer's Cocoa Butter Formula Massage Lotion helps visibly improve skin elasticity and reduce the appearance of stretch marks. Pure Cocoa…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539819/pharmacy-app/pharmacy/Palmer_s_Massage_Lotion_for_Stretch_Mark_1550_1758539818355.jpg	2025-09-22 09:51:18.456	2025-09-22 11:16:59.32
1553	Palmolive Aroma Sensations So Relaxed Shower Gel 500ml	Take a relaxed bath and be enveloped with this aromatic shower gel containing Lavender essential oil, Ylang Ylang and Cardamom.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539824/pharmacy-app/pharmacy/Palmolive_Aroma_Sensations_So_Relaxed_Sh_1553_1758539823662.jpg	2025-09-22 09:51:22.753	2025-09-22 11:17:04.746
1557	Pampers Diapers S2(3-8Kg) 10’s	The no. 1 choice of pediatricians for newborns. Umbilical friendly shape: Protects your baby's delicate belly with a perfectly contoured…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539830/pharmacy-app/pharmacy/Pampers_Diapers_S2_3_8Kg__10_s_1557_1758539829319.jpg	2025-09-22 09:51:28.202	2025-09-22 11:17:10.275
1560	Pampers Diapers S3(6-10Kg) 9’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. The only…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539836/pharmacy-app/pharmacy/Pampers_Diapers_S3_6_10Kg__9_s_1560_1758539835488.jpg	2025-09-22 09:51:32.463	2025-09-22 11:17:16.888
1562	Pampers Diapers S4(9-18Kg) 8’s	Absorbent micro pearls: Absorb up to 30 times its weight and keep the baby’s skin dry. Breathable soft belt: Crafted…	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539841/pharmacy-app/pharmacy/Pampers_Diapers_S4_9_18Kg__8_s_1562_1758539840282.jpg	2025-09-22 09:51:34.835	2025-09-22 11:17:21.233
1565	Pampers Pants S3 (6-11Kg) 9’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. The only…	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539846/pharmacy-app/pharmacy/Pampers_Pants_S3__6_11Kg__9_s_1565_1758539845998.jpg	2025-09-22 09:51:38.549	2025-09-22 11:17:27.071
1567	Pampers Pants S5 (12-18Kg) 26’s	A great night’s sleep means a good morning mood. Introducing new easy put-on Pampers for boys and girls. Each pack…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539851/pharmacy-app/pharmacy/Pampers_Pants_S5__12_18Kg__26_s_1567_1758539850255.jpg	2025-09-22 09:51:40.808	2025-09-22 11:17:31.252
1570	Panadol Baby & Infant Syrup 100ml	Panadol Baby & Infant Suspension provides effective temporary relief from the pain and fever associated with: Toothache, Sore throat, Childhood…	15500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539857/pharmacy-app/pharmacy/Panadol_Baby___Infant_Syrup_100ml_1570_1758539856682.jpg	2025-09-22 09:51:44.347	2025-09-22 11:17:37.721
1573	Paradox Omega Babies Syrup 105ml	Paradox Omega Babies is a natural source of essential Omega 3,6,9 & vitamin D3. This supplement is suitable for babies…	31000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539867/pharmacy-app/pharmacy/Paradox_Omega_Babies_Syrup_105ml_1573_1758539866248.jpg	2025-09-22 09:51:47.919	2025-09-22 11:17:47.372
1575	Pearl Drops Smokers Stain Removing Whitening Gel Toothpaste 50ml	Effectively helps remove stains and plaque. Helps restore natural teeth whiteness.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539870/pharmacy-app/pharmacy/Pearl_Drops_Smokers_Stain_Removing_White_1575_1758539870094.jpg	2025-09-22 09:51:50.498	2025-09-22 11:17:51.077
1578	Penegra Sildenafil 50mg Tablets 4’s	Penegra (Sildenafil) is used to treat men who have erectile dysfunction (also called sexual impotence). Sildenafil belongs to a group…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539876/pharmacy-app/pharmacy/Penegra_Sildenafil_50mg_Tablets_4_s_1578_1758539875827.jpg	2025-09-22 09:51:53.863	2025-09-22 11:17:56.977
1579	PentaSure DM Diabetes Care Vanilla Powder 400gm	Pentasure DM Powder is a specially balanced oral supplement for diabetic patients which provides improved glycemic control and lower diabetic complications.…	81000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539878/pharmacy-app/pharmacy/PentaSure_DM_Diabetes_Care_Vanilla_Powde_1579_1758539877931.jpg	2025-09-22 09:51:55	2025-09-22 11:17:59.019
1583	Perfectil Skin Extra Support Tabs/Caps 56’s	Perfectil Skin Extra Support gives you the advantage of Perfectil with a Nutri-dermalTM capsule including biotin, Omega-3 fatty acids and…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539888/pharmacy-app/pharmacy/Perfectil_Skin_Extra_Support_Tabs_Caps_5_1583_1758539887551.png	2025-09-22 09:51:59.753	2025-09-22 11:18:08.952
1585	Phenergan Elixir Sugar-Free Oral Solution 100ml	Promethazine is an antihistamine. It is used to treat allergic reactions and to treat or prevent nausea and vomiting from…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539892/pharmacy-app/pharmacy/Phenergan_Elixir_Sugar_Free_Oral_Solutio_1585_1758539891949.jpg	2025-09-22 09:52:02.095	2025-09-22 11:18:12.968
1589	Piritex Junior Syrup 60ml	For relief of flu symptoms and cough in children.	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539900/pharmacy-app/pharmacy/Piritex_Junior_Syrup_60ml_1589_1758539900021.jpg	2025-09-22 09:52:06.914	2025-09-22 11:18:21.727
1590	Piriton Syrup 150ml	Fast relief from the symptoms of hay fever; skin, food, pet and house mite dust allergies; insect bites; and mould…	45000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539903/pharmacy-app/pharmacy/Piriton_Syrup_150ml_1590_1758539902498.jpg	2025-09-22 09:52:08.057	2025-09-22 11:18:23.468
1592	Placent Activ Milano Hair Growth Conditioner 250ml	The rich conditioner contains placenta extract which boosts hair growth and reduces hair loss. You will see the first results…	41000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539906/pharmacy-app/pharmacy/Placent_Activ_Milano_Hair_Growth_Conditi_1592_1758539906030.jpg	2025-09-22 09:52:10.452	2025-09-22 11:18:27.281
1595	Plus Multivitamin Capsules 30’s	Fights Fatigue. Boosts Immunity. Enhances Vitality. Each pack contains 30 capsules.	24000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539913/pharmacy-app/pharmacy/Plus_Multivitamin_Capsules_30_s_1595_1758539912793.png	2025-09-22 09:52:14.016	2025-09-22 11:18:33.873
1598	Power Plus Capsules 30’s	It combines 18 powerful vitamins, minerals, and antioxidants that our busy lives demand. Micronutrients such as calcium, magnesium, iron, zinc,…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539923/pharmacy-app/pharmacy/Power_Plus_Capsules_30_s_1598_1758539922299.jpg	2025-09-22 09:52:17.999	2025-09-22 11:18:43.564
1600	Pregnacare Breastfeeding 84’s	Pregnacare Breast-Feeding is specially formulated to help support the nutritional requirements of new mothers throughout the postnatal period and while…	105000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539927/pharmacy-app/pharmacy/Pregnacare_Breastfeeding_84_s_1600_1758539927082.jpg	2025-09-22 09:52:20.794	2025-09-22 11:18:48.377
1603	Pregnacare Original 30’s	Formulated by experts and trusted by mums for generations, this is an ideal tried and tested way to safeguard a…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539935/pharmacy-app/pharmacy/Pregnacare_Original_30_s_1603_1758539934413.png	2025-09-22 09:52:24.393	2025-09-22 11:18:55.454
1606	Prenatal + DHA Denk 30’s	A daily companion during pregnancy and breastfeeding to optimally supply mother and child with all of the important nutrients.	49000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539942/pharmacy-app/pharmacy/Prenatal___DHA_Denk_30_s_1606_1758539941324.jpg	2025-09-22 09:52:27.946	2025-09-22 11:19:02.445
1608	Pro Nutrition Anabolic Huge Fast Gains 2kg	Pro Nutrition ANABOLIC HUGE will help you to gain muscle fast! In order to gain muscle mass you need to…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539946/pharmacy-app/pharmacy/Pro_Nutrition_Anabolic_Huge_Fast_Gains_2_1608_1758539946008.png	2025-09-22 09:52:30.272	2025-09-22 11:19:07.218
1611	Pro Nutrition Extreme Lean 907g	Extreme Lean is a high protein, moderate carbohydrate, low-fat meal replacement which may be used to replace two or three…	170000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539956/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Lean_907g_1611_1758539955362.jpg	2025-09-22 09:52:33.852	2025-09-22 11:19:16.333
1613	Pro Nutrition Extreme Mass 2kg	Pro nutrition extreme mass is packed with protein, complex carbohydrates and amino acids designed to help you to gain lean…	150000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539961/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Mass_2kg_1613_1758539960955.jpg	2025-09-22 09:52:36.364	2025-09-22 11:19:21.75
1614	Pro Nutrition Extreme Mass Chocolate 4kg	Pro nutrition extreme mass is packed with protein, complex carbohydrates and amino acids designed to help you to gain lean…	240000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539969/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Mass_Chocolate_4kg_1614_1758539966822.png	2025-09-22 09:52:37.479	2025-09-22 11:19:30.462
1617	Pro Nutrition Extreme Whey Vanilla 2kg	Pro Nutrition Extreme Whey is a premium quality Whey Protein which has been instantized for easy mixing and formulated for…	385000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539980/pharmacy-app/pharmacy/Pro_Nutrition_Extreme_Whey_Vanilla_2kg_1617_1758539979552.png	2025-09-22 09:52:40.946	2025-09-22 11:19:40.719
1620	Pro Nutrition Lipo Cut XD	Pro Nutrition Lipo Cut XD is a high-performance fat-burning supplement designed to support weight loss and enhance energy levels. This…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758539998/pharmacy-app/pharmacy/Pro_Nutrition_Lipo_Cut_XD_1620_1758539997215.png	2025-09-22 09:52:44.386	2025-09-22 11:19:58.55
1622	Pro Nutrition Liver Protect Capsules	Pro Nutrition Liver Protect is a dietary supplement designed to support and maintain liver health. Formulated with a blend of…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540005/pharmacy-app/pharmacy/Pro_Nutrition_Liver_Protect_Capsules_1622_1758540004866.png	2025-09-22 09:52:46.632	2025-09-22 11:20:06.031
1624	Pro Nutrition Pump & Cut(Blue Lemonade & Cherry Bomb)	Pro Nutrition Pump & Cut is a specialized pre-workout supplement designed to enhance your exercise performance and support muscle growth.…	140000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540010/pharmacy-app/pharmacy/Pro_Nutrition_Pump___Cut_Blue_Lemonade___1624_1758540009935.png	2025-09-22 09:52:49.053	2025-09-22 11:20:11.7
1627	Pro Nutrition Serious Size Anabolic 4.5kg	Serious size anabolic is the absolute ultimate mass gainer scientifically engineered for the hard gainer in need of serious caloric…	250000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540021/pharmacy-app/pharmacy/Pro_Nutrition_Serious_Size_Anabolic_4_5k_1627_1758540021124.jpg	2025-09-22 09:52:52.904	2025-09-22 11:20:22.134
1630	Pro Nutrition Vitamaxx Capsules 60’s	For the human body to perform at its maximum potential, it requires a vast array of vital nutrients. Becoming deficient…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540027/pharmacy-app/pharmacy/Pro_Nutrition_Vitamaxx_Capsules_60_s_1630_1758540026898.jpg	2025-09-22 09:52:56.366	2025-09-22 11:20:27.932
1635	Pucelle For My Character Wavy Ocean Mist Cologne 75ml	Girls, be yourself and feel great with the rich floral and fresh marine fragrance!	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540033/pharmacy-app/pharmacy/Pucelle_For_My_Character_Wavy_Ocean_Mist_1635_1758540032398.jpg	2025-09-22 09:53:02.431	2025-09-22 11:20:33.226
1637	Pure & Soft Facial Cleansing Wipes 25s	Pure & soft facial cleansing wipes also works as the perfect facial moisturising cleanser. Conveniently using for face hand and…	3500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540036/pharmacy-app/pharmacy/Pure___Soft_Facial_Cleansing_Wipes_25s_1637_1758540035880.jpg	2025-09-22 09:53:04.734	2025-09-22 11:20:36.701
1640	PureBorn Kids Sunscreen Spray SPF 50+	PureBorn Kids Sunscreen Spray SPF 50+ is an everyday shield for children’s skin. Formulated with SPF50+, UVA / UVB &…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540042/pharmacy-app/pharmacy/PureBorn_Kids_Sunscreen_Spray_SPF_50__1640_1758540041215.jpg	2025-09-22 09:53:08.358	2025-09-22 11:20:42.219
1642	Quest Super Omega 3-6-9 Capsules 90’s	A balanced blend of Omega, 3,6 and 9 fatty acids. Contains omega 6 fatty acids gamma linolenic acid (GLA) and…	78000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540045/pharmacy-app/pharmacy/Quest_Super_Omega_3_6_9_Capsules_90_s_1642_1758540044786.jpg	2025-09-22 09:53:10.615	2025-09-22 11:20:45.83
1645	Regaine For Men Extra Strength Scalp Solution ( Minoxidil 5% )	Take Control of Your Hair Loss. Regaine is for the treatment of hereditary hair loss and works best in men…	295000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540051/pharmacy-app/pharmacy/Regaine_For_Men_Extra_Strength_Scalp_Sol_1645_1758540050517.jpg	2025-09-22 09:53:14.074	2025-09-22 11:20:51.735
1648	Replenish Plus (Moringa + Selenium) Capsules	Replenish is an ultra advanced powerful immune booster. Contains both organic Moringa and selonoExcell selenium. Is a powerful antioxidant and…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540059/pharmacy-app/pharmacy/Replenish_Plus__Moringa___Selenium__Caps_1648_1758540058832.png	2025-09-22 09:53:17.47	2025-09-22 11:20:59.916
1649	Rescue Oil 75ml	Specially formulated to help with: Stretch Marks, Scars, Dry Skin, Ageing Skin, and  Blemishes.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540064/pharmacy-app/pharmacy/Rescue_Oil_75ml_1649_1758540064057.jpg	2025-09-22 09:53:18.587	2025-09-22 11:21:05.764
1651	Revlon Natural Honey Original Lotion 600ml	Real Honey blended with other natural ingredients gives instant lasting relief to dry skin. A smoothing moisturizer for body.	23000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540069/pharmacy-app/pharmacy/Revlon_Natural_Honey_Original_Lotion_600_1651_1758540068651.jpg	2025-09-22 09:53:21.108	2025-09-22 11:21:09.747
1653	Revuele Expert+ Lifting Effect Eye Contour Serum 30ml	Lifting Effect serum contains peptides and hyaluronic acid which soothe the delicate skin around the eyes, to reduce puffiness and…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540074/pharmacy-app/pharmacy/Revuele_Expert__Lifting_Effect_Eye_Conto_1653_1758540073897.png	2025-09-22 09:53:23.383	2025-09-22 11:21:14.93
1657	Rexona Men Invisible Dry Deodorant Roll-On 50ml	Triple Anti Marks Protection against white marks, yellow stains and sweat marks!	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540081/pharmacy-app/pharmacy/Rexona_Men_Invisible_Dry_Deodorant_Roll__1657_1758540080519.jpg	2025-09-22 09:53:28.068	2025-09-22 11:21:21.389
1658	Rexona Men Invisible Ice Fresh Roll-on 50ml	Invisible Ice Roll-on Deodorant for Men. No more unpleasant sweating. No white deodorant marks Reliable, 48 hour long lasting protection.	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540082/pharmacy-app/pharmacy/Rexona_Men_Invisible_Ice_Fresh_Roll_on_5_1658_1758540082008.jpg	2025-09-22 09:53:29.27	2025-09-22 11:21:22.934
1661	REXONA Women Cotton Dry Algodon Roll-on Deodorant 50ml	Light floral scent to keep you feeling fresh and dry all-day long.	11000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540088/pharmacy-app/pharmacy/REXONA_Women_Cotton_Dry_Algodon_Roll_on__1661_1758540088016.jpg	2025-09-22 09:53:32.771	2025-09-22 11:21:29.176
1663	Rhinathiol Expectorant Sugar Free Adult Syrup 200ml	Effective and soothing relief of productive cough or cough with phlegm in adults with diabetes.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540092/pharmacy-app/pharmacy/Rhinathiol_Expectorant_Sugar_Free_Adult__1663_1758540091780.jpg	2025-09-22 09:53:35.146	2025-09-22 11:21:32.763
1666	Right Guard Cool Total Defence 5 Anti-Perspirant Deodorant 250ml	It fights perspiration, prevents odour for long-lasting freshness.	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540098/pharmacy-app/pharmacy/Right_Guard_Cool_Total_Defence_5_Anti_Pe_1666_1758540097887.jpg	2025-09-22 09:53:38.827	2025-09-22 11:21:38.933
1668	Right Guard Recharge Shower Gel 250ml	Deeply refreshes the skin and prevents dryness. Leaves skin feeling mildly cleansed for long-lasting freshness. Skin friendly.	15500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540102/pharmacy-app/pharmacy/Right_Guard_Recharge_Shower_Gel_250ml_1668_1758540101368.jpg	2025-09-22 09:53:41.063	2025-09-22 11:21:42.594
1671	Rinavit Multivitamin Syrup	Rinavit Syrup is a product used to treat or prevent vitamin deficiency due to poor diet, certain illnesses or during…	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540109/pharmacy-app/pharmacy/Rinavit_Multivitamin_Syrup_1671_1758540108881.jpg	2025-09-22 09:53:44.436	2025-09-22 11:21:49.864
1673	Rough Rider Condom 3’s	When you want extra stimulation the Rough Rider Studded condom is the one. Seductively studded up and down and all…	10500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540113/pharmacy-app/pharmacy/Rough_Rider_Condom_3_s_1673_1758540112347.jpg	2025-09-22 09:53:46.695	2025-09-22 11:21:53.576
1676	Rugby Benzoyl Peroxide 5% Acne Medication Gel 42.5g	For treatment and prevention of acne pimples, acne blemishes, blackheads or whiteheads.	41000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540122/pharmacy-app/pharmacy/Rugby_Benzoyl_Peroxide_5__Acne_Medicatio_1676_1758540121960.jpg	2025-09-22 09:53:50.241	2025-09-22 11:22:02.867
1679	Sanex Dermo Extra Control 48h Antiperspirant Roll On 50ml	Restores natural pH. Keeps skin healthy. Dermatologically tested. Extra long lasting protection from sweat & odour.	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540127/pharmacy-app/pharmacy/Sanex_Dermo_Extra_Control_48h_Antiperspi_1679_1758540126662.jpg	2025-09-22 09:53:54.1	2025-09-22 11:22:07.784
1681	Sanex Dermo Sensitive Antiperspirant Roll-On 50ml	Specially formulated to care for your delicate underarm skin whilst offering effective, lasting protection against sweat. Helps you stay fresh…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540131/pharmacy-app/pharmacy/Sanex_Dermo_Sensitive_Antiperspirant_Rol_1681_1758540130533.jpg	2025-09-22 09:53:56.693	2025-09-22 11:22:11.252
1683	Sanex Men Active Control Roll On Deodorant 50ml	This hardworking anti-perspirant roll-on offers unbeatable protection when you need it most. Formulated especially for men, its fresh, odour-fighting formula…	14000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540134/pharmacy-app/pharmacy/Sanex_Men_Active_Control_Roll_On_Deodora_1683_1758540134105.jpg	2025-09-22 09:53:59.118	2025-09-22 11:22:15.157
1684	Saraya Mosquito Repellent 60ml	INSECT AND BUG REPELLENT. HANDY AND EASY TO USE.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540136/pharmacy-app/pharmacy/Saraya_Mosquito_Repellent_60ml_1684_1758540135763.jpg	2025-09-22 09:54:00.3	2025-09-22 11:22:16.873
1685	Savlon Antiseptic Liquid 250ml	Savlon Antiseptic Liquid is a versatile and trusted solution designed to protect against infection. It helps cleanse and disinfect minor…	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540138/pharmacy-app/pharmacy/Savlon_Antiseptic_Liquid_250ml_1685_1758540137989.jpg	2025-09-22 09:54:01.669	2025-09-22 11:22:19.058
1687	Scaro Plus Cream 50gm	Scaro Plus Cream is a topical medication that is used to treat scars. It contains a combination of ingredients that…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540142/pharmacy-app/pharmacy/Scaro_Plus_Cream_50gm_1687_1758540141704.jpg	2025-09-22 09:54:03.972	2025-09-22 11:22:22.98
1689	Scotts Emulsion Cod Liver Oil Orange 100ml	Scott’s Emulsion Cod Liver Oil Orange 100ml has been trusted for over 100 years to keep families healthy. Made from…	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540147/pharmacy-app/pharmacy/Scotts_Emulsion_Cod_Liver_Oil_Orange_100_1689_1758540146162.jpg	2025-09-22 09:54:06.27	2025-09-22 11:22:27.786
1692	Sebamed Anti-Ageing Q10 Firming Body Lotion 200ml	Dermo-Active botanic ingredient complex, with Barley extract, Argan Oil and Shea Butter. Regularly used, the lotion will protect against premature…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540153/pharmacy-app/pharmacy/Sebamed_Anti_Ageing_Q10_Firming_Body_Lot_1692_1758540153109.jpg	2025-09-22 09:54:09.965	2025-09-22 11:22:34.182
1695	Sebamed Baby Bubble Bath 200ml	Made with a special nourishing complex, our Baby Bubble Bath is the best choice for a gentle cleanser that helps…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540160/pharmacy-app/pharmacy/Sebamed_Baby_Bubble_Bath_200ml_1695_1758540159444.jpg	2025-09-22 09:54:13.705	2025-09-22 11:22:40.528
1697	Sebamed Baby Cleansing Bar Soap 100g	The Sebamed Baby Cleansing Bar provides 100 percent soap-free, mild cleansing of baby's delicate skin, making it smooth and soft…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540163/pharmacy-app/pharmacy/Sebamed_Baby_Cleansing_Bar_Soap_100g_1697_1758540162726.jpg	2025-09-22 09:54:16.131	2025-09-22 11:22:43.501
1700	Sebamed Baby Lotion 100ml	Sebamed Baby Body Lotion offers gentle protection for delicate baby skin. Its moisturising and emollient complex safeguards against dryness, making…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540171/pharmacy-app/pharmacy/Sebamed_Baby_Lotion_100ml_1700_1758540170723.jpg	2025-09-22 09:54:19.783	2025-09-22 11:22:51.536
1702	Sebamed Baby Lotion 750ml	Sebamed Baby Body Lotion offers gentle protection for delicate baby skin. Its moisturising and emollient complex safeguards against dryness, making…	120000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540175/pharmacy-app/pharmacy/Sebamed_Baby_Lotion_750ml_1702_1758540174366.jpg	2025-09-22 09:54:22.162	2025-09-22 11:22:55.328
1705	Sebamed Clear Face Anti-Pimple Gel 10ml	Fast relief from pimples. Antibacterial gel reduces irritation and dries pimples out. Care complex with Panthenol supports the skin's regeneration.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540180/pharmacy-app/pharmacy/Sebamed_Clear_Face_Anti_Pimple_Gel_10ml_1705_1758540179640.jpg	2025-09-22 09:54:25.995	2025-09-22 11:23:00.493
1708	Sebamed Energizing Hair & Body Wash 200ml	It is the effective 2 in 1 cleansing and skin care solution for the active man. Specially developed formula combines…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540186/pharmacy-app/pharmacy/Sebamed_Energizing_Hair___Body_Wash_200m_1708_1758540185760.jpg	2025-09-22 09:54:29.616	2025-09-22 11:23:06.689
1710	Sebamed Everyday Shampoo 200ml	100% soap and alkali free Sebamed Everyday Shampoo is formulated with vegetal based active cleansing agents for gentle daily hair…	27000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540189/pharmacy-app/pharmacy/Sebamed_Everyday_Shampoo_200ml_1710_1758540189121.jpg	2025-09-22 09:54:32.071	2025-09-22 11:23:10.773
1713	Sebamed Moisturising Body Lotion 200ml	Sebamed Moisturising Body Lotion nourishes and preserves the natural moisture balance of the skin. It is naturally cooling and calming,…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540196/pharmacy-app/pharmacy/Sebamed_Moisturising_Body_Lotion_200ml_1713_1758540195585.jpg	2025-09-22 09:54:35.566	2025-09-22 11:23:16.989
1716	Sebamed Sensitive Skin Fresh Deodorant 50ml	No Aluminium salts. 48h effective. Effectively and reliably prevents body odor. For a long-lasting feeling of freshness. Is well tolerated…	18000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540203/pharmacy-app/pharmacy/Sebamed_Sensitive_Skin_Fresh_Deodorant_5_1716_1758540202321.png	2025-09-22 09:54:39.77	2025-09-22 11:23:23.397
1717	Sebamed Sensitive Skin Liquid Face & Body Wash 200ml	100% soap and alkali free, Sebamed liquid Face and Body Wash gently cleanses pore deep to leave a unique after…	48000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540204/pharmacy-app/pharmacy/Sebamed_Sensitive_Skin_Liquid_Face___Bod_1717_1758540204162.jpg	2025-09-22 09:54:41.014	2025-09-22 11:23:25.642
1718	Secrets Maxi Heavy Flow Pads 8’s	Extra thickness for guaranteed absorption. Grooves for more protection against leakage. Soft wide cotton wings gentle on your skin to…	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540207/pharmacy-app/pharmacy/Secrets_Maxi_Heavy_Flow_Pads_8_s_1718_1758540206414.jpg	2025-09-22 09:54:42.34	2025-09-22 11:23:27.592
1721	Sekrol Paediatric Syrup 150ml		12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540213/pharmacy-app/pharmacy/Sekrol_Paediatric_Syrup_150ml_1721_1758540212969.jpg	2025-09-22 09:54:45.914	2025-09-22 11:23:34.281
1723	Selsun Dandruff Treatment Shampoo 150ml	A medicated shampoo used to treat dandruff and seborrhoea dermatitis.	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540217/pharmacy-app/pharmacy/Selsun_Dandruff_Treatment_Shampoo_150ml_1723_1758540216675.jpg	2025-09-22 09:54:48.353	2025-09-22 11:23:37.804
1725	Sensodyne Extra Fresh Toothpaste 40ml	Sensodyne Extra fresh 40ml. Its fluoride formula strengthens teeth and helps re-mineralize enamel and prevent cavities.	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540224/pharmacy-app/pharmacy/Sensodyne_Extra_Fresh_Toothpaste_40ml_1725_1758540223717.jpg	2025-09-22 09:54:50.83	2025-09-22 11:23:44.611
1727	Sensodyne Fresh Mint Toothpaste 40ml	Freshens breath. Mint taste. Protects against cavities. Sensitivity relief and lasting sensitivity protection.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540227/pharmacy-app/pharmacy/Sensodyne_Fresh_Mint_Toothpaste_40ml_1727_1758540226771.jpg	2025-09-22 09:54:53.679	2025-09-22 11:23:47.826
1729	Sensodyne Multi Care Tooth Paste 40ml	Toothpaste offering sensitivity protection. Helps protect against acid wear. Can be used as a daily normal toothpaste.	7500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540230/pharmacy-app/pharmacy/Sensodyne_Multi_Care_Tooth_Paste_40ml_1729_1758540230094.jpg	2025-09-22 09:54:56.271	2025-09-22 11:23:51.003
1732	Sensodyne Rapid Action Toothpaste 75ml	Clinically proven action in just 60 seconds. Whitens enamel & prevents staining. Long lasting protection.	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540236/pharmacy-app/pharmacy/Sensodyne_Rapid_Action_Toothpaste_75ml_1732_1758540236082.jpg	2025-09-22 09:55:00.254	2025-09-22 11:23:57.393
1734	Sensodyne Sensitivity & Gum Toothpaste 75ml	Builds a protective layer over sensitive areas, Targets and helps to remove plaque bacteria. Relieves teeth sensitivity and improves gum…	42000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540243/pharmacy-app/pharmacy/Sensodyne_Sensitivity___Gum_Toothpaste_7_1734_1758540240048.jpg	2025-09-22 09:55:02.593	2025-09-22 11:24:04.112
1737	Seven Seas Cod Liver Oil Caps Once A Day 60’S	Our Cod Liver Oil One-a-day product comes in the form of an easy to consume, single capsule dosage for those…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540251/pharmacy-app/pharmacy/Seven_Seas_Cod_Liver_Oil_Caps_Once_A_Day_1737_1758540250339.jpg	2025-09-22 09:55:06.143	2025-09-22 11:24:11.287
1739	Seven Seas Cod Liver Oil Syrup 150ml	A rich natural source of Omega-3, including nutrients EPA and DHA, and vitamins C,D & E with orange syrup that…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540257/pharmacy-app/pharmacy/Seven_Seas_Cod_Liver_Oil_Syrup_150ml_1739_1758540256219.png	2025-09-22 09:55:08.529	2025-09-22 11:24:17.557
1742	Seven Seas Jointcare Active Capsules 60’s	JointCare support through Vitamin C, Vitamin D, Zinc and Manganese. Plus Chondroitin. Supports muscles. Supports your cartilage and bones.	110000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540264/pharmacy-app/pharmacy/Seven_Seas_Jointcare_Active_Capsules_60__1742_1758540263275.png	2025-09-22 09:55:12.267	2025-09-22 11:24:24.487
1744	Seven Seas Jointcare Max Tablets/Capsules 30’s	Seven Seas JointCare Max contains ingredients to support bones, muscles, cartilage and collagen formation. Plus Omega 3.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540269/pharmacy-app/pharmacy/Seven_Seas_Jointcare_Max_Tablets_Capsule_1744_1758540268658.png	2025-09-22 09:55:14.51	2025-09-22 11:24:29.728
1747	Seven Seas Original Cod Liver Oil 450ml	Our Original Cod Liver Oil liquid is the closest formulation we have today to the original product we first bottled…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540277/pharmacy-app/pharmacy/Seven_Seas_Original_Cod_Liver_Oil_450ml_1747_1758540276875.png	2025-09-22 09:55:18.459	2025-09-22 11:24:38.321
1750	Seven Seas Simply Timeless Orange Syrup 300ml	The syrup contains omega-3 and a number of vitamins that help to maintain the body’s normal functions. It maintains and…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540291/pharmacy-app/pharmacy/Seven_Seas_Simply_Timeless_Orange_Syrup__1750_1758540290603.jpg	2025-09-22 09:55:21.941	2025-09-22 11:24:51.62
1752	Shea Moisture African Black Bar Soap for Troubled Skin 230g	Made from Palm Ash, Tamarind Extract, Tar and Plantain Peel. This blend helps calm the skin and clear blemishes from…	36500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540295/pharmacy-app/pharmacy/Shea_Moisture_African_Black_Bar_Soap_for_1752_1758540295176.jpg	2025-09-22 09:55:24.397	2025-09-22 11:24:56.044
1753	Shea Moisture African Black Soap Clarifying Conditioner 384ml	Moisturises And Detangles Hair While It Soothes Dry, Itchy And Flaking Scalp.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540297/pharmacy-app/pharmacy/Shea_Moisture_African_Black_Soap_Clarify_1753_1758540296826.jpg	2025-09-22 09:55:25.746	2025-09-22 11:24:58.099
1755	Shea Moisture African Black Soap Problem Skin Moisturizer Cream 56g	Clears and balances blemished oily skin.	89000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540301/pharmacy-app/pharmacy/Shea_Moisture_African_Black_Soap_Problem_1755_1758540300851.jpg	2025-09-22 09:55:28.276	2025-09-22 11:25:01.977
1758	Shea Moisture Face and Body Bar Soap for Dry Skin 230g	Gently cleanse and moisturize skin with this sulfate-free bar soap. Raw Shea works with Frankincense & Myrrh to hydrate and…	41500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540307/pharmacy-app/pharmacy/Shea_Moisture_Face_and_Body_Bar_Soap_for_1758_1758540306613.jpg	2025-09-22 09:55:31.815	2025-09-22 11:25:07.749
1760	Shea Moisture Olive & Green Tea Bath, Body & Massage Oil 236ml	SheaMoisture's Olive & Green Tea Bath, Body & Massage Oil helps deeply hydrate and repair dry skin. Helps prevent signs…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540310/pharmacy-app/pharmacy/Shea_Moisture_Olive___Green_Tea_Bath__Bo_1760_1758540310215.jpg	2025-09-22 09:55:34.23	2025-09-22 11:25:11.009
1762	Shower To Shower Fresh Morning Roll On Deodorant 50ml	Specially formulated to provide 24 hour freshness and comfort. Provides 48 hours, protection against sweat and odour.	7000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540315/pharmacy-app/pharmacy/Shower_To_Shower_Fresh_Morning_Roll_On_D_1762_1758540314296.jpg	2025-09-22 09:55:36.723	2025-09-22 11:25:15.431
1765	Shuya Active Oxygen Pantliners 30’s	Pantyliners with anion chip for improved health and well-being Silk absorption surface that absorbs three times faster than regular pantyliners…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540323/pharmacy-app/pharmacy/Shuya_Active_Oxygen_Pantliners_30_s_1765_1758540322215.jpg	2025-09-22 09:55:40.907	2025-09-22 11:25:23.389
1768	Shuya Ultra Night Super Long Sanitary Pads 4’s	4 ultra large pads for well-balanced absorption, preventing side leakages Silk Absorption Surface That Absorbs Three Times Faster With negative…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540331/pharmacy-app/pharmacy/Shuya_Ultra_Night_Super_Long_Sanitary_Pa_1768_1758540330924.jpg	2025-09-22 09:55:44.538	2025-09-22 11:25:32.268
1771	Similac Gold Comfort 1 (0-6Months)820g	Similac Gold Comfort Stage 1 Starter Formula 820g is a baby formula that is  partially hydrolysed for infants 0 to…	175000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540340/pharmacy-app/pharmacy/Similac_Gold_Comfort_1__0_6Months_820g_1771_1758540339611.png	2025-09-22 09:55:48.325	2025-09-22 11:25:41.485
1773	Similac Gold Comfort 3 (1-3 Years)820g	Similac Gold Comfort Stage 3 Growing-Up Formula 820g is a baby formula for infants 1 to 3 years. Does not…	175000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540350/pharmacy-app/pharmacy/Similac_Gold_Comfort_3__1_3_Years_820g_1773_1758540349612.png	2025-09-22 09:55:50.853	2025-09-22 11:25:51.735
1775	Simple Cleansing Facial Wipes 25’s	Simple Exfoliating Cleansing Facial Wipes effectively remove dirt and makeup from your face while also clearing dead skin cells that…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540361/pharmacy-app/pharmacy/Simple_Cleansing_Facial_Wipes_25_s_1775_1758540360787.jpg	2025-09-22 09:55:53.483	2025-09-22 11:26:02.083
1778	Simple Express Glow Clay Polish 150ml	Simple cleansing Protect ‘n’ Glow Express Glow Clay Polish instantly smooths, brightens and revitalises for glowing skin Natural bamboo exfoliators…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540366/pharmacy-app/pharmacy/Simple_Express_Glow_Clay_Polish_150ml_1778_1758540366175.jpg	2025-09-22 09:55:57.533	2025-09-22 11:26:07.363
1781	Simple Kind to Skin Replenishing Rich Moisturiser 125ml	Dry skin? Start your day with the Simple Kind to Skin Replenishing Rich Moisturiser. This product is ideal for when…	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540371/pharmacy-app/pharmacy/Simple_Kind_to_Skin_Replenishing_Rich_Mo_1781_1758540371152.jpg	2025-09-22 09:56:01.484	2025-09-22 11:26:12.419
1785	Sinarest Forte Tablets 4s	It is used to treat body ache, fever, headache, runny nose and congestion in common cold and flu.	500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540379/pharmacy-app/pharmacy/Sinarest_Forte_Tablets_4s_1785_1758540378605.jpg	2025-09-22 09:56:06.941	2025-09-22 11:26:20.068
1786	Sinarest Paediatric Nasal Drops 10ml	Used in new-borns and in infants (aged below 1 year) to treat nasal congestion, itching and discomfort caused due to…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540381/pharmacy-app/pharmacy/Sinarest_Paediatric_Nasal_Drops_10ml_1786_1758540380884.jpg	2025-09-22 09:56:08.156	2025-09-22 11:26:22.351
1788	SK DERM Cream 15g	Used on skin infections such as ringworm, jock itch, athlete's foot, psoriasis, eczema, etc.	4000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540386/pharmacy-app/pharmacy/SK_DERM_Cream_15g_1788_1758540385622.jpg	2025-09-22 09:56:10.888	2025-09-22 11:26:26.846
1790	Skin Doctor Heel Balm 100ml	Super concentrated moisturizer. It is non-greasy. Effectively restore dry and cracked heels. Visible results in 3 days! Clinically proven and…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540390/pharmacy-app/pharmacy/Skin_Doctor_Heel_Balm_100ml_1790_1758540389621.jpg	2025-09-22 09:56:13.621	2025-09-22 11:26:31.506
1792	Skins Aqua Water Based Lubricant  130ml	Natural feeling, extra-long-lasting water-based lubricant for natural intimacy. Designed specifically to enhance the pleasure and comfort of intimacy, this fragrance…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540396/pharmacy-app/pharmacy/Skins_Aqua_Water_Based_Lubricant__130ml_1792_1758540395362.jpg	2025-09-22 09:56:16.036	2025-09-22 11:26:36.481
1795	Skins Fruity Sensual Lubricant 130ml	Arouse your sexual appetite and nourish your desires with Skins edible lube. An oasis of thirst-quenching delights, this flavored sex…	85000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540404/pharmacy-app/pharmacy/Skins_Fruity_Sensual_Lubricant_130ml_1795_1758540403778.jpg	2025-09-22 09:56:22.379	2025-09-22 11:26:44.903
1799	SMA Pro 2 Infant Formula 800g	Is tailored for babies from 6 months as part of a varied weaning diet. At 6 months babies development progresses…	130000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540417/pharmacy-app/pharmacy/SMA_Pro_2_Infant_Formula_800g_1799_1758540416587.jpg	2025-09-22 09:56:27.721	2025-09-22 11:26:57.873
1801	Sodium Bicarbonate Ear Drops 10ml	Gently softens ear wax prior to syringing by a doctor or nurse.	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540421/pharmacy-app/pharmacy/Sodium_Bicarbonate_Ear_Drops_10ml_1801_1758540420992.jpg	2025-09-22 09:56:30.241	2025-09-22 11:27:01.921
1803	Sonatec Alcohol Free Mouthwash 250ml	Sonatec Mouthwash Has Antiseptic Properties Intended To Reduce The Microbial Growth In The Oral Cavity.	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540425/pharmacy-app/pharmacy/Sonatec_Alcohol_Free_Mouthwash_250ml_1803_1758540424447.jpg	2025-09-22 09:56:32.904	2025-09-22 11:27:05.446
1805	Spring Valley Biotin 10,000mcg Capsules 120’s	Spring Valley Biotin Dietary Supplement Softgels help promote the health of skin, hair and nails by nourishing cells throughout the…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540429/pharmacy-app/pharmacy/Spring_Valley_Biotin_10_000mcg_Capsules__1805_1758540428449.jpg	2025-09-22 09:56:36.283	2025-09-22 11:27:09.72
1808	Spring Valley Extra Strength Melatonin 10mg Tablets 240’s	Spring Valley Extra Strength Melatonin Tablets can help you get through those restless nights and achieve the amount of sleep…	125000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540435/pharmacy-app/pharmacy/Spring_Valley_Extra_Strength_Melatonin_1_1808_1758540434960.jpg	2025-09-22 09:56:40.661	2025-09-22 11:27:16.116
1810	Spring Valley Melatonin 5mg Tablets 120’s	Spring Valley Melatonin Tablets Dietary Supplement, 5 mg can help you get through those restless nights and achieve the amount…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540439/pharmacy-app/pharmacy/Spring_Valley_Melatonin_5mg_Tablets_120__1810_1758540439109.jpg	2025-09-22 09:56:43.351	2025-09-22 11:27:20.391
1813	St. Ives 24hour Deep Restoring Almond Body Lotion 621ml	Formulated to replenish dry skin and keep it radiant all day. Made with rich shea butter and soothing almond oil.	31500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540445/pharmacy-app/pharmacy/St__Ives_24hour_Deep_Restoring_Almond_Bo_1813_1758540444419.jpg	2025-09-22 09:56:47.367	2025-09-22 11:27:25.391
1815	St. Ives Body Wash Refreshing Rose Water & Aloe Vera Body Wash 650ml	Hit refresh on your shower routine! Made with 100% natural rose and aloe vera extracts, our refreshing body wash delivers…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540448/pharmacy-app/pharmacy/St__Ives_Body_Wash_Refreshing_Rose_Water_1815_1758540448125.jpg	2025-09-22 09:56:50.332	2025-09-22 11:27:29.097
1818	St. Ives Energising Citrus & Cherry Blossom Body Wash 650ml	Here’s a tangerine dream! Upgrade your shower experience with this body wash for invigorated, refreshed skin. With 100% natural citrus…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540453/pharmacy-app/pharmacy/St__Ives_Energising_Citrus___Cherry_Blos_1818_1758540453021.jpg	2025-09-22 09:56:53.993	2025-09-22 11:27:34.171
1820	St. Ives Gentle Smoothing Oatmeal Face Scrub and Mask 170g	It's 2-in-1. A gentle exfoliating face scrub to soften and smooth away dryness and a mask to instantly nourish skin.…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540457/pharmacy-app/pharmacy/St__Ives_Gentle_Smoothing_Oatmeal_Face_S_1820_1758540457109.jpg	2025-09-22 09:56:56.39	2025-09-22 11:27:38.399
1821	St. Ives Oatmeal & Shea Butter Body Wash 650ml	Formulated with plant based cleansers, this body wash pampers the skin, leaving it soft, supple and hydrated.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540459/pharmacy-app/pharmacy/St__Ives_Oatmeal___Shea_Butter_Body_Wash_1821_1758540459007.jpg	2025-09-22 09:56:57.545	2025-09-22 11:27:40.104
1824	St. Ives Renewing Collagen & Elastin Body Lotion 621ml	For skin that needs a little rejuvenation, our Renewing Collagen & Elastin Body Lotion will reawaken your glow. Smooth on…	33000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540468/pharmacy-app/pharmacy/St__Ives_Renewing_Collagen___Elastin_Bod_1824_1758540467341.jpg	2025-09-22 09:57:01.39	2025-09-22 11:27:48.383
1826	St. Ives Smoothing Rose & Argan Oil Body Lotion 621ml	Give your skin the TLC it deserves! Made with 100% natural moisturizers blended with rose extract and argan oil, our…	31500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540472/pharmacy-app/pharmacy/St__Ives_Smoothing_Rose___Argan_Oil_Body_1826_1758540471358.jpg	2025-09-22 09:57:03.87	2025-09-22 11:27:52.74
1829	Sterimar Hypertonic Congestion Relief 100ml	Sterimar Congestion Relief helps rapidly decongest the nose in the event of colds and sinusitis, allowing you to breathe better,…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540478/pharmacy-app/pharmacy/Sterimar_Hypertonic_Congestion_Relief_10_1829_1758540477331.jpg	2025-09-22 09:57:07.921	2025-09-22 11:27:58.411
1832	Strepsils Sore Throat & Blocked Nose Lozenges 36’s	Soothing effective relief for sore throats. Each pack contains 36 lozenges.	43200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540483/pharmacy-app/pharmacy/Strepsils_Sore_Throat___Blocked_Nose_Loz_1832_1758540482910.jpg	2025-09-22 09:57:11.714	2025-09-22 11:28:04.152
1834	Strepsils Strawberry Sugar Free Lozenges 36’s	Soothing effective relief for sore throats. Each pack contains 36 lozenges.	43200	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540489/pharmacy-app/pharmacy/Strepsils_Strawberry_Sugar_Free_Lozenges_1834_1758540488210.jpg	2025-09-22 09:57:14.285	2025-09-22 11:28:09.362
1836	Suave Intense Perfume for Men 100ml	Enchants everyone with its courage, power, and individuality. It is a true elite composition, suitable for both young and mature…	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540494/pharmacy-app/pharmacy/Suave_Intense_Perfume_for_Men_100ml_1836_1758540493230.jpg	2025-09-22 09:57:16.883	2025-09-22 11:28:14.727
1839	Sudafed Congestion & Headache Relief Max Strength Capsules 16’s	Relief of congestion, headache and day-time fatigue associated with a head cold.	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540502/pharmacy-app/pharmacy/Sudafed_Congestion___Headache_Relief_Max_1839_1758540502094.png	2025-09-22 09:57:20.929	2025-09-22 11:28:23.183
1842	Sudocrem 250g	The unique formula has been clinically proven to help soothe, heal and protect delicate skin with its antiseptic properties. In…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540508/pharmacy-app/pharmacy/Sudocrem_250g_1842_1758540507256.jpg	2025-09-22 09:57:25.164	2025-09-22 11:28:28.303
1844	Sudocrem 60g	The unique formula has been clinically proven to help soothe, heal and protect delicate skin with its antiseptic properties. In…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540511/pharmacy-app/pharmacy/Sudocrem_60g_1844_1758540511154.jpg	2025-09-22 09:57:27.608	2025-09-22 11:28:32.092
1847	Sundance Chelated Zinc Gluconate 50mg Capsules 90’s	Zinc protects against infections, oxidative stress, heavy metal toxicity, psychological and emotional stress, and blood sugar problems. Zinc is also needed…	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540518/pharmacy-app/pharmacy/Sundance_Chelated_Zinc_Gluconate_50mg_Ca_1847_1758540518102.jpg	2025-09-22 09:57:31.378	2025-09-22 11:28:43.259
1849	Sundance Magnesium Glycinate 665mg Capsules 50’s	Magnesium Glycinate is a highly absorbable form of magnesium, an essential mineral the body needs but cannot produce on its…	145000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540530/pharmacy-app/pharmacy/Sundance_Magnesium_Glycinate_665mg_Capsu_1849_1758540530134.jpg	2025-09-22 09:57:33.954	2025-09-22 11:28:51.586
1852	Tadalafil 20mg UK Tablets 4’s	Tadalafil is used to treat male sexual function problems (impotence or erectile dysfunction-ED). Tadalafil belongs to a group of medicines called…	20000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540537/pharmacy-app/pharmacy/Tadalafil_20mg_UK_Tablets_4_s_1852_1758540536202.jpg	2025-09-22 09:57:37.928	2025-09-22 11:28:57.598
1855	Tampax Super Plus Tampons (20 Pack)	Tampax Super Plus tampons help you feel clean and confident. They are free from fragrances and dyes. Tampax tampons have…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540544/pharmacy-app/pharmacy/Tampax_Super_Plus_Tampons__20_Pack__1855_1758540544174.jpg	2025-09-22 09:57:41.709	2025-09-22 11:29:05.618
1856	Tampax Super Tampons (20 pack)	Tampax Super Tampons have an absorbent core and an anti-leak skirt for additional back-up protection. Tampax tampons are free of…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540547/pharmacy-app/pharmacy/Tampax_Super_Tampons__20_pack__1856_1758540546418.jpg	2025-09-22 09:57:42.918	2025-09-22 11:29:07.633
1858	Tea Tree Essential oil 10ml	Tea Tree Oil (Melaleuca alternifolia) is a well known, natural antiseptic originating in Australia, which can be dabbed directly onto…	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540552/pharmacy-app/pharmacy/Tea_Tree_Essential_oil_10ml_1858_1758540551696.jpg	2025-09-22 09:57:45.274	2025-09-22 11:29:12.855
1861	The Ordinary 100% Organic Cold-Pressed Rose Hip Seed Oil	Targets Dryness, Dullness, Signs of Aging For all skin types It is completely unrefined and imparts a natural scent partly…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540557/pharmacy-app/pharmacy/The_Ordinary_100__Organic_Cold_Pressed_R_1861_1758540557252.jpg	2025-09-22 09:57:49.112	2025-09-22 11:29:18.495
1864	The Ordinary Azelaic Acid Suspension 10% 30ML	Azelaic Acid Suspension 10% is a cream-like formula that brightens skin tone and visibly improves skin texture due to a…	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540563/pharmacy-app/pharmacy/The_Ordinary_Azelaic_Acid_Suspension_10__1864_1758540563039.jpg	2025-09-22 09:57:52.715	2025-09-22 11:29:24.201
1866	The Ordinary Buffet Multi-Peptide Serum 30ml	A multi-peptide serum with a multitude of – anything but ordinary – benefits, this powerful all-in-one treatment tackles multiple signs…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540568/pharmacy-app/pharmacy/The_Ordinary_Buffet_Multi_Peptide_Serum__1866_1758540567788.jpg	2025-09-22 09:57:55.068	2025-09-22 11:29:28.691
1870	The Ordinary Lactic Acid 5% + HA serum 30ml	A milder exfoliator that works to reveal smoother skin.	66000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540573/pharmacy-app/pharmacy/The_Ordinary_Lactic_Acid_5____HA_serum_3_1870_1758540573379.jpg	2025-09-22 09:57:59.842	2025-09-22 11:29:34.151
1872	The Ordinary Natural Moisturizing Factors + HA 30ml	This moisturizer provides both immediate and lasting effects by replenishing lost moisture and fortifying the skin barrier over time. The…	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540577/pharmacy-app/pharmacy/The_Ordinary_Natural_Moisturizing_Factor_1872_1758540576614.jpg	2025-09-22 09:58:02.281	2025-09-22 11:29:37.586
1875	The Ordinary Retinol 1% In Squalane Serum 30ml	A high-strength retinol serum that targets general signs of skin aging.	72000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540587/pharmacy-app/pharmacy/The_Ordinary_Retinol_1__In_Squalane_Seru_1875_1758540586227.jpg	2025-09-22 09:58:06.008	2025-09-22 11:29:47.369
1877	The Ordinary Salicylic Acid 2% Solution 50ml	A targeted serum for blemish-prone skin.	75000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540589/pharmacy-app/pharmacy/The_Ordinary_Salicylic_Acid_2__Solution__1876_1758540588587.png	2025-09-22 09:58:08.52	2025-09-22 11:29:50.643
1879	Theramed 2-In-1 Gel Toothpaste Whitening Power 75ml	Your solution for healthy teeth and gums, deep oral hygiene and fresh breath.	13000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540594/pharmacy-app/pharmacy/Theramed_2_In_1_Gel_Toothpaste_Whitening_1879_1758540593762.jpg	2025-09-22 09:58:11.228	2025-09-22 11:29:54.64
1882	Tooche Drops 10ml	Temporarily relieves minor toothache.	3000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540600/pharmacy-app/pharmacy/Tooche_Drops_10ml_1882_1758540599566.jpg	2025-09-22 09:58:14.814	2025-09-22 11:30:00.591
1884	Top Society Nail Polish Remover 100ml	Top Society Nail Polish Remover 100ml is a high-quality, fast-acting formula designed to effortlessly remove nail polish without drying or…	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540604/pharmacy-app/pharmacy/Top_Society_Nail_Polish_Remover_100ml_1884_1758540603249.jpg	2025-09-22 09:58:17.391	2025-09-22 11:30:04.491
1886	Topizone Cream Betamethasone + Fusidic Acid 15g	For inflammation, bacterial skin infections and skin irritation from shaving, cuts and bruises	22000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540607/pharmacy-app/pharmacy/Topizone_Cream_Betamethasone___Fusidic_A_1886_1758540606807.jpg	2025-09-22 09:58:19.811	2025-09-22 11:30:07.908
1888	Toractin (Cyproheptadine) Tablets 100’s	Toractin tablets contain cyproheptadine a first generation antihistamine that can provide relief from allergy symptoms such as watery eyes, runny…	10000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540612/pharmacy-app/pharmacy/Toractin__Cyproheptadine__Tablets_100_s_1888_1758540611683.jpg	2025-09-22 09:58:22.63	2025-09-22 11:30:12.617
1892	Touch Me Make Up Cleansing Wipes With Aloe Vera Extracts 25s	Fine tissue that cleans deep and leaves skin soft. It gently removes face and eye makeup leaving the skin smooth…	6000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540625/pharmacy-app/pharmacy/Touch_Me_Make_Up_Cleansing_Wipes_With_Al_1892_1758540624524.jpg	2025-09-22 09:58:27.168	2025-09-22 11:30:25.727
1893	TOUCH ME PLEASE Acne Soap With Lemon And Lime 135g	Lemon and lime oil works as an astringent, which tones and cleanses the skin. Helps diminish wrinkles and fine lines.…	8000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540627/pharmacy-app/pharmacy/TOUCH_ME_PLEASE_Acne_Soap_With_Lemon_And_1893_1758540626488.jpg	2025-09-22 09:58:28.295	2025-09-22 11:30:28.429
1894	Tres-Orix Forte Syrup 100ml	Tres Orix Forte is a highly recommended vitamin fortified supplement which greatly increases appetite and aids weight gain. It increases…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540630/pharmacy-app/pharmacy/Tres_Orix_Forte_Syrup_100ml_1894_1758540629191.jpg	2025-09-22 09:58:29.435	2025-09-22 11:30:31.027
1896	Tri-Tect Medicated Acne Soap 100gm	Tri-Tect is a medicated soap for clean acne-prone skin, Treating all types of acne without drying the skin because it…	21500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540635/pharmacy-app/pharmacy/Tri_Tect_Medicated_Acne_Soap_100gm_1896_1758540634230.png	2025-09-22 09:58:32.133	2025-09-22 11:30:36.314
1899	Trust Classic Condoms 3’s	TRUST Classic Condoms Size: 24 Quantity (3 Pack Condoms) Special Feature: Ultra Thin, Lubricated Item Package Quantity: 1 Material: Polyisoprene	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540642/pharmacy-app/pharmacy/Trust_Classic_Condoms_3_s_1899_1758540641366.jpg	2025-09-22 09:58:35.681	2025-09-22 11:30:42.474
1902	Trust Studded Condoms 3’s	TRUST Studded Condoms Size: 3 Pack Condoms Special Feature: Ultra-thin, Lubricated, studded Material: Natural Rubber Latex	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540652/pharmacy-app/pharmacy/Trust_Studded_Condoms_3_s_1902_1758540652143.jpg	2025-09-22 09:58:39.337	2025-09-22 11:30:52.913
1905	Ubinext-LC Ubidecarenone/L-Carnitine Tablets 10’s	Ubinext-LC Tablet is a combination of supplements used to treat nutritional deficiencies and various health conditions such as heart health,…	21000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540661/pharmacy-app/pharmacy/Ubinext_LC_Ubidecarenone_L_Carnitine_Tab_1905_1758540660343.jpg	2025-09-22 09:58:42.971	2025-09-22 11:31:01.332
1907	Ultimate Organics Moisturising Body Gloss 355ml	Light weight, non greasy blend of natural oils that soften, smooth and energize skin. Leaves skin with a radiant, healthy…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540664/pharmacy-app/pharmacy/Ultimate_Organics_Moisturising_Body_Glos_1907_1758540663823.jpg	2025-09-22 09:58:45.369	2025-09-22 11:31:04.714
1910	Ultra Omega-3 High Purity Fish Oil Capsules 60’s	Provides a rich source of DHA and EPA (which your body doesn’t produce) to help maintain health and well-being, normal…	60000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540669/pharmacy-app/pharmacy/Ultra_Omega_3_High_Purity_Fish_Oil_Capsu_1910_1758540668998.png	2025-09-22 09:58:49.096	2025-09-22 11:31:10.883
1913	Unifed Blocked and Runny Noses Syrup 120ml	For relief of blocked and runny noses.	13500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540676/pharmacy-app/pharmacy/Unifed_Blocked_and_Runny_Noses_Syrup_120_1913_1758540675879.jpg	2025-09-22 09:58:53.192	2025-09-22 11:31:17.054
1915	Unifed Expectorant Syrup 120ml	For relief of productive cough and common cold symptoms.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540680/pharmacy-app/pharmacy/Unifed_Expectorant_Syrup_120ml_1915_1758540679556.jpg	2025-09-22 09:58:55.866	2025-09-22 11:31:20.667
1917	Unifed Tablets 20’s	For relief of flu and common cold symptoms. Each pack contains 20 tablets.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540684/pharmacy-app/pharmacy/Unifed_Tablets_20_s_1917_1758540683498.jpg	2025-09-22 09:58:58.128	2025-09-22 11:31:24.422
1919	Unisten Clotrimazole Cream 20g	Used to treat fungus infections on the skin like ringworm, jock itch and balanitis	2000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540687/pharmacy-app/pharmacy/Unisten_Clotrimazole_Cream_20g_1919_1758540686934.jpg	2025-09-22 09:59:00.523	2025-09-22 11:31:27.876
1921	USN Fast Grow Anabol GH Ultra Lean Gainer 1kg (20 Scoops)	USN Fast Grow Anabolic GH is a powerful lean mass gainer for reaching hardcore goals. It supports building and maintaining…	95000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540691/pharmacy-app/pharmacy/USN_Fast_Grow_Anabol_GH_Ultra_Lean_Gaine_1921_1758540690756.jpg	2025-09-22 09:59:02.935	2025-09-22 11:31:31.719
1924	USN Hyperbolic Mass GH Extreme Mass Gainer 2kg (26 Scoops)	USN Hyperbolic Mass Gainer is a high-performance supplement designed to accelerate muscle growth and boost energy. Packed with essential nutrients,…	158000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540697/pharmacy-app/pharmacy/USN_Hyperbolic_Mass_GH_Extreme_Mass_Gain_1924_1758540696443.jpg	2025-09-22 09:59:06.605	2025-09-22 11:31:37.437
1927	UVBLOCK – 50 Sunscreen Lotion Spf50 100ml	Sunscreen lotion brightens the skin tone and maintains moisture of skin.	44000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540706/pharmacy-app/pharmacy/UVBLOCK___50_Sunscreen_Lotion_Spf50_100m_1927_1758540705863.jpg	2025-09-22 09:59:10.6	2025-09-22 11:31:47.367
1929	Valupak CO-Q10 30mgTablets 30’s	Valupak CO-Q10 works as an antioxidant, helping to protect your cells from oxidative stress, which happens as you age but…	36000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540710/pharmacy-app/pharmacy/Valupak_CO_Q10_30mgTablets_30_s_1929_1758540710308.png	2025-09-22 09:59:13.286	2025-09-22 11:31:51.333
1931	Valupak Evening Primrose Oil 1000mg 30’s	Evening Primrose Oil has become a favoured treatment for a number of conditions including breast pain, eczema, high cholesterol, rheumatoid…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540714/pharmacy-app/pharmacy/Valupak_Evening_Primrose_Oil_1000mg_30_s_1931_1758540713833.jpg	2025-09-22 09:59:15.925	2025-09-22 11:31:54.834
1933	Valupak Magnesium Tablets 30’s	Valupak Vitamins Magnesium 187.5mg provides a prevalent mineral in the body helping to build and construct healthy strong bones, assisting…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540718/pharmacy-app/pharmacy/Valupak_Magnesium_Tablets_30_s_1933_1758540717081.jpg	2025-09-22 09:59:18.607	2025-09-22 11:31:58.251
1936	Valupak Vitamin C + Zinc Effervescent Tablets 20’s	Valupak Vitamin C + Zinc Eff Tab has a rich delicious blackcurrant flavor and is an excellent way to supplement…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540724/pharmacy-app/pharmacy/Valupak_Vitamin_C___Zinc_Effervescent_Ta_1936_1758540722840.jpg	2025-09-22 09:59:22.714	2025-09-22 11:32:04.405
1939	Valupak Zinc Tablets 60’s	Valupak Zinc Gluconate is good for energy, health, good skin, hair, vision and daily defence against colds and flu.	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540730/pharmacy-app/pharmacy/Valupak_Zinc_Tablets_60_s_1939_1758540729331.jpg	2025-09-22 09:59:27.127	2025-09-22 11:32:10.438
1941	Vaseline Aloe Vera Lip Therapy 20g	Protects and relieves dry and chapped lips, while locking in moisture to help keep them healthy. Instantly softens and soothes…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540734/pharmacy-app/pharmacy/Vaseline_Aloe_Vera_Lip_Therapy_20g_1941_1758540733159.jpg	2025-09-22 09:59:29.645	2025-09-22 11:32:14.4
1944	Vaseline Blue Seal Men Cooling Petroleum Jelly 95ml	Is triple purified and locks in moisture to keep skin soft and smooth.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540739/pharmacy-app/pharmacy/Vaseline_Blue_Seal_Men_Cooling_Petroleum_1944_1758540738668.jpg	2025-09-22 09:59:33.187	2025-09-22 11:32:19.756
1946	Vaseline Blue Seal Original Petroleum Jelly 95g	Made with 100% pure petroleum jelly, triple-purified to lock in moisture for healing and protection against dry skin.	5000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540743/pharmacy-app/pharmacy/Vaseline_Blue_Seal_Original_Petroleum_Je_1946_1758540742810.jpg	2025-09-22 09:59:35.756	2025-09-22 11:32:23.679
1949	Vaseline Intensive Care Aloe Soothe Body Lotion 400ml	A moisturising body lotion infused with soothing and hydrating Aloe Vera. Calms and soothes dry skin, leaving your skin feeling…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540748/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Aloe_Soothe_Body_1949_1758540747845.jpg	2025-09-22 09:59:39.954	2025-09-22 11:32:28.818
1952	Vaseline Intensive Care Essential Healing Lotion 725ml	Clinically proven to moisturize deeply with the first application. Keeps dry skin healed for 3 weeks.	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540757/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Essential_Healin_1952_1758540756261.jpg	2025-09-22 09:59:43.805	2025-09-22 11:32:37.442
1954	Vaseline Intensive Care Soothing Hydration Body Lotion 725ml	A dermatologist-tested Vaseline® body lotion for dry and dehydrated skin. It is formulated with 1% Aloe Vera for soothed, refreshed…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540761/pharmacy-app/pharmacy/Vaseline_Intensive_Care_Soothing_Hydrati_1954_1758540760492.jpg	2025-09-22 09:59:46.306	2025-09-22 11:32:41.608
1957	Vaseline Rosy Lips Lip Therapy 20g	Vaseline Lip Care Gel Rosy Lips is made with pure Vaseline jelly to ensure lips are kept moisturised and glossy.…	15000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540767/pharmacy-app/pharmacy/Vaseline_Rosy_Lips_Lip_Therapy_20g_1957_1758540766347.jpg	2025-09-22 09:59:50.613	2025-09-22 11:32:47.308
1959	Vermox Mebendazole 500mg Tablet	Vermox is a prescription medicine used to treat the symptoms of intestinal worms such as Pinworm, Roundworm, Whipworm, and Hookworm.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540771/pharmacy-app/pharmacy/Vermox_Mebendazole_500mg_Tablet_1959_1758540770357.jpg	2025-09-22 09:59:53.474	2025-09-22 11:32:51.558
1962	Vicks Baby Rub 50g	Moisturising and Soothing. Contains Extract of Aloe Vera. Fragrances of Rosemary and Lavender. Suitable for babies over 6 months.	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540777/pharmacy-app/pharmacy/Vicks_Baby_Rub_50g_1962_1758540776452.jpg	2025-09-22 09:59:57.875	2025-09-22 11:32:58.49
1964	Vicks Vaporub 50g	Relieves 4 Cough & Cold Symptoms: Cough, Nasal congestion, Body ache, Headache and Muscle stiffness.	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540782/pharmacy-app/pharmacy/Vicks_Vaporub_50g_1964_1758540781521.jpg	2025-09-22 10:00:00.742	2025-09-22 11:33:02.63
1965	Victoria’s Secret Love Spell Fragrance Mist 250ml	A flirty, floral fragrance. This vibrant, irresistible fragrance is a blend of lush cherry blossom and juicy peach. The fragrance…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540783/pharmacy-app/pharmacy/Victoria_s_Secret_Love_Spell_Fragrance_M_1965_1758540783233.jpg	2025-09-22 10:00:02.277	2025-09-22 11:33:04.081
1967	Victoria’s Secret Temptation Fragrance Body Mist 250ml	A fruity floral fragrance mist featuring fresh apple and Saguaro flower. This new refreshing formula is ideal for mixing with…	55000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540786/pharmacy-app/pharmacy/Victoria_s_Secret_Temptation_Fragrance_B_1967_1758540786111.jpg	2025-09-22 10:00:04.835	2025-09-22 11:33:06.897
1971	Viotic Ear Drops Flumethasone / Clioquinol	Combines the anti-fungal and anti-bacterial properties of clioquinol with the anti-inﬂammatory activity of ﬂumethasone pivalate.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540794/pharmacy-app/pharmacy/Viotic_Ear_Drops_Flumethasone___Clioquin_1971_1758540793496.png	2025-09-22 10:00:10.368	2025-09-22 11:33:14.814
1973	Virgin Hair Fertilizer Cream 125g	Anti-Dandruff. Hair Conditioning Cream. Rapid Hair Growth. It conditions, Weak and Dry Hair.	10500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540798/pharmacy-app/pharmacy/Virgin_Hair_Fertilizer_Cream_125g_1973_1758540797182.jpg	2025-09-22 10:00:12.687	2025-09-22 11:33:18.362
1975	Visionace Original Tabs 30’s	A comprehensive multivitamin with no need to take an additional supplement, Visionace Original gives you all-round support for your health…	59000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540807/pharmacy-app/pharmacy/Visionace_Original_Tabs_30_s_1975_1758540806250.png	2025-09-22 10:00:15.063	2025-09-22 11:33:27.205
1978	Vitamin C + Zinc 1000/50mg 30’s	Enhances the immune system. Fights free radicals. Each pack contains 30 tablets.	16000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540812/pharmacy-app/pharmacy/Vitamin_C___Zinc_1000_50mg_30_s_1978_1758540812087.jpg	2025-09-22 10:00:18.437	2025-09-22 11:33:33.132
1980	Vitrum A To Zinc Multivitamins & Minerals 30’s	Vitrum A to Zinc is a comprehensive formula of vitamins and minerals, specifically designed to maintain complete wellbeing.	35000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540816/pharmacy-app/pharmacy/Vitrum_A_To_Zinc_Multivitamins___Mineral_1980_1758540815605.jpg	2025-09-22 10:00:20.689	2025-09-22 11:33:36.819
1984	Wellbaby Multivitamin Syrup150ml (6months – 4years)	For your baby's vital years, this includes a source of 14 important vitamins and minerals to support a time of…	40000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540825/pharmacy-app/pharmacy/Wellbaby_Multivitamin_Syrup150ml__6month_1984_1758540824980.png	2025-09-22 10:00:25.933	2025-09-22 11:33:46.174
1986	Wellman 50+ 30’s	Our comprehensive nutritional formula for men over 50, specially developed to support areas of health particularly relevant to men in…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540829/pharmacy-app/pharmacy/Wellman_50__30_s_1986_1758540828842.png	2025-09-22 10:00:28.439	2025-09-22 11:33:50.004
1988	Wellman Conception 30’s	Optimised for male fertility and reproduction, Wellman conception is specially formulated with nutrients to support normal spermatogenesis and testosterone levels…	68000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540833/pharmacy-app/pharmacy/Wellman_Conception_30_s_1988_1758540832936.png	2025-09-22 10:00:31.158	2025-09-22 11:33:54.691
1991	Wellman Plus Omega 3.6.9 56’s	Provides all the benefits of the Wellman Original multivitamin tablet - which contains essential nutrients for health & vitality, plus…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540841/pharmacy-app/pharmacy/Wellman_Plus_Omega_3_6_9_56_s_1991_1758540840410.png	2025-09-22 10:00:34.894	2025-09-22 11:34:01.369
1994	Wellness Cold and Flu Tablets 20’s	For relief of cold and flu symptoms for example congestion, runny nose and headache. Each pack contains 20 tablets.	17000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540846/pharmacy-app/pharmacy/Wellness_Cold_and_Flu_Tablets_20_s_1994_1758540846104.jpg	2025-09-22 10:00:38.769	2025-09-22 11:34:07.063
1997	Wellteen Him 30’s	We can’t help with the homework, but we can help support healthy teenagers with their nutrient intake and a balanced…	50000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540852/pharmacy-app/pharmacy/Wellteen_Him_30_s_1997_1758540852097.png	2025-09-22 10:00:42.497	2025-09-22 11:34:13.278
1998	Wellteen Him Plus 56’s	A hunger for adventure. An appetite to explore the world. Balanced, moderate nutrition isn’t always a priority in a young…	80000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540855/pharmacy-app/pharmacy/Wellteen_Him_Plus_56_s_1998_1758540854346.png	2025-09-22 10:00:43.63	2025-09-22 11:34:15.542
2000	Wellwoman 70+ 30’s	A carefully formulated supplement for women 70 and over, scientifically developed to support overall health & vitality, along with areas…	65000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540862/pharmacy-app/pharmacy/Wellwoman_70__30_s_2000_1758540861713.png	2025-09-22 10:00:45.886	2025-09-22 11:34:22.915
2003	Wellwoman Plus 56’s	Contains all the health and vitality benefits that come with the original Wellwoman multivitamin formula, with the addition of an…	90000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540869/pharmacy-app/pharmacy/Wellwoman_Plus_56_s_2003_1758540868392.png	2025-09-22 10:00:49.271	2025-09-22 11:34:29.516
2006	Wisdom Active Whitening Charcoal Mouthwash 500ml	Removes & prevents stains. Fights plaque bacteria. Whitens teeth. Freshens breath.	33500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540874/pharmacy-app/pharmacy/Wisdom_Active_Whitening_Charcoal_Mouthwa_2006_1758540874061.jpg	2025-09-22 10:00:52.781	2025-09-22 11:34:35.304
2007	Wisdom Clean Between Interdental Brushes 20’s	Wisdom Clean Between Brushes are incredibly easy to use. They give gentle yet effective interdental cleaning whilst helping to minimize…	30000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540876/pharmacy-app/pharmacy/Wisdom_Clean_Between_Interdental_Brushes_2007_1758540876161.jpg	2025-09-22 10:00:53.906	2025-09-22 11:34:37.455
2013	Wisdom Extra Hard Smokers Toothbrush	Extra Hard Filaments for effective removal of tobacco and food stains.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540884/pharmacy-app/pharmacy/Wisdom_Extra_Hard_Smokers_Toothbrush_2013_1758540883967.jpg	2025-09-22 10:01:00.908	2025-09-22 11:34:45.237
2015	Wisdom Step By Step Toothbrush (0 – 2years)	Safe and gentle cleaning for your baby's first teeth.	12000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540890/pharmacy-app/pharmacy/Wisdom_Step_By_Step_Toothbrush__0___2yea_2015_1758540889187.jpg	2025-09-22 10:01:03.265	2025-09-22 11:34:50.108
2017	Woodwards Gripe Water(UK) 150ml	Alcohol free & sugar free. Dual action. Rapid relief of wind and gripe. Suitable for: Babies 1 month to 12…	32000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540893/pharmacy-app/pharmacy/Woodwards_Gripe_Water_UK__150ml_2017_1758540893111.jpg	2025-09-22 10:01:05.54	2025-09-22 11:34:54.008
2019	Xpel XBC Body Care Aqueous Cream 500ml	Suitable for all skin types. Can be used as a moisturiser or soap substitute. Ideal for those with eczema or…	26000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540897/pharmacy-app/pharmacy/Xpel_XBC_Body_Care_Aqueous_Cream_500ml_2019_1758540897063.jpg	2025-09-22 10:01:07.794	2025-09-22 11:34:58.143
2022	Zandros Dietary Supplement  Capsules 20’s	Zandros dietary supplement Capsules contain Fish Oil 1200 mg & Vitamin E 19 IU Used to reduce the risk of…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540904/pharmacy-app/pharmacy/Zandros_Dietary_Supplement__Capsules_20__2022_1758540903866.jpg	2025-09-22 10:01:11.523	2025-09-22 11:35:05.002
2024	Zecuf Herbal Cough Remedy 100ml	Zecuf is a natural and herbal composition that is recommended for the treatment of various types of cough including seasonal…	4500	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540908/pharmacy-app/pharmacy/Zecuf_Herbal_Cough_Remedy_100ml_2024_1758540907957.jpg	2025-09-22 10:01:13.845	2025-09-22 11:35:09.097
2027	Zentel Albendazole 400mg Chewable Tablet	For routine deworming and treatment of worm infestation.	9000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540917/pharmacy-app/pharmacy/Zentel_Albendazole_400mg_Chewable_Tablet_2027_1758540916474.jpg	2025-09-22 10:01:17.85	2025-09-22 11:35:18.206
2029	Zerostat VT Spacer 1’s	A spacer enhances the delivery of inhaled medications to reach the lungs with minimal deposition in the mouth or throat.	70000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540921/pharmacy-app/pharmacy/Zerostat_VT_Spacer_1_s_2029_1758540921092.jpg	2025-09-22 10:01:23.291	2025-09-22 11:35:22.081
2032	Zinc & Castor Oil Cream 200ml	Zinc & castor oil cream is a topical cream that combines the healing properties of zinc oxide and castor oil.…	25000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540927/pharmacy-app/pharmacy/Zinc___Castor_Oil_Cream_200ml_2032_1758540926267.jpg	2025-09-22 10:01:27.089	2025-09-22 11:35:27.222
2034	Zincast Baby Cream 225g	It is a protective cream to waterproof and soothe the skin. It assists in the treatment of baby nappy rash,…	28000	100	https://res.cloudinary.com/ditrgj8ms/image/upload/v1758540931/pharmacy-app/pharmacy/Zincast_Baby_Cream_225g_2034_1758540930237.jpg	2025-09-22 10:01:29.625	2025-09-22 11:35:31.247
\.


--
-- Data for Name: ProductCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductCategory" ("productId", "categoryId") FROM stdin;
958	15
959	15
960	1
960	9
961	1
961	36
962	6
963	1
963	6
964	5
965	5
966	5
967	36
968	22
968	40
969	40
970	1
970	9
971	1
971	9
972	1
972	36
973	17
974	1
19	1
19	2
19	3
22	4
23	1
23	3
23	5
23	6
21	1
20	1
20	7
27	1
28	1
24	8
24	9
24	10
25	4
26	6
31	4
32	4
30	1
33	4
29	1
49	4
50	1
51	11
51	1
51	3
51	5
51	6
52	12
53	12
54	1
54	3
55	13
55	1
56	1
56	5
57	1
57	3
58	14
58	3
58	15
59	15
60	16
61	17
62	17
5	17
1	18
65	19
66	19
67	15
67	6
68	14
68	15
69	20
69	21
6	8
6	22
71	13
72	13
73	13
74	13
75	13
76	13
77	13
77	23
78	13
78	23
79	13
79	23
80	20
11	20
82	20
13	2
84	2
12	2
8	13
8	23
87	24
88	24
10	24
90	25
91	24
92	24
93	25
94	24
95	25
96	25
97	24
98	25
99	24
7	25
101	25
102	20
103	20
104	26
104	10
105	26
105	10
106	26
106	10
107	6
2	18
109	1
4	25
111	20
111	27
112	27
113	17
114	17
115	17
115	7
3	17
9	13
118	3
118	28
119	7
120	7
121	18
122	29
123	29
124	30
125	8
126	8
127	8
128	8
129	8
130	2
131	17
132	17
133	17
134	17
135	17
136	17
137	31
137	21
137	32
137	30
138	20
139	20
140	20
141	20
142	1
142	2
143	23
144	12
145	12
146	12
147	33
148	12
149	12
150	2
151	2
152	18
153	2
154	2
155	2
156	2
157	9
158	20
159	20
160	20
161	20
162	31
163	14
163	15
164	1
164	15
164	28
165	14
165	1
165	15
165	28
166	3
166	15
167	3
167	15
168	1
168	34
168	28
169	35
169	14
169	1
169	15
169	34
170	29
171	29
172	29
173	29
174	29
175	29
176	29
177	29
178	26
178	10
179	19
180	33
180	19
181	33
181	19
182	33
182	19
183	17
184	17
185	25
186	25
187	25
188	25
189	20
190	20
191	20
192	20
193	20
194	1
194	3
195	3
196	17
197	17
198	17
199	17
200	17
201	17
202	17
203	17
204	17
205	17
206	33
207	17
208	17
208	13
209	35
210	35
211	35
212	35
213	22
214	22
215	35
216	35
217	35
218	35
219	35
220	35
221	22
222	1
222	3
223	20
224	25
225	25
226	5
226	36
227	20
227	21
227	32
227	36
228	20
228	21
228	27
228	36
229	25
230	33
230	13
231	33
231	13
232	21
232	27
233	37
234	23
235	23
236	17
236	13
237	33
238	33
975	1
975	3
239	35
239	17
241	35
241	17
242	35
242	17
243	35
243	17
244	35
244	17
245	37
246	33
247	33
248	33
248	25
249	33
250	33
250	25
251	33
252	33
253	23
254	7
255	8
256	13
257	13
258	13
259	8
260	13
261	13
262	17
263	13
264	13
265	13
266	13
267	20
268	20
269	27
270	36
271	27
271	23
272	17
272	36
273	36
274	23
275	23
276	3
276	15
277	20
278	20
279	20
280	20
281	20
282	3
282	15
283	35
284	23
285	22
285	30
286	20
287	20
288	20
289	20
290	20
291	20
292	20
293	20
294	20
295	20
296	21
297	20
298	13
298	23
299	1
300	1
301	1
302	1
303	1
304	1
305	23
306	23
307	23
308	23
309	19
310	19
311	21
312	23
313	21
314	21
315	23
316	25
317	17
317	25
318	25
319	25
320	25
321	17
321	25
322	17
322	13
323	17
324	17
325	17
326	28
327	38
328	39
329	19
330	35
330	19
331	35
331	29
332	3
333	35
334	20
335	20
336	25
337	25
338	25
339	16
340	25
340	16
341	25
342	19
343	16
344	16
345	16
346	1
347	20
348	20
349	23
350	5
351	5
351	40
352	5
352	40
353	31
354	31
355	31
356	31
357	35
358	35
359	23
360	23
361	19
362	23
363	23
364	35
364	23
365	35
365	23
366	7
367	7
368	7
369	7
370	7
371	7
372	7
373	7
374	7
375	7
376	7
377	7
378	7
379	7
380	1
381	1
382	4
383	39
384	39
385	39
386	39
387	39
388	39
389	18
390	23
391	2
392	1
392	3
393	1
393	3
394	1
394	3
395	1
395	3
396	1
396	3
397	3
398	15
399	1
399	3
400	14
400	1
400	3
401	1
402	1
403	1
404	1
404	3
405	13
406	33
407	17
407	13
407	39
408	13
409	17
409	13
410	17
410	11
410	13
411	13
412	13
413	13
414	13
415	13
416	13
417	13
418	35
418	17
418	13
419	33
420	33
421	33
422	33
423	17
423	13
424	17
424	13
976	13
976	1
425	17
425	13
427	17
428	17
429	17
429	13
430	13
431	33
432	17
433	33
434	17
434	13
435	17
435	13
436	13
437	21
438	17
438	13
439	17
439	13
440	17
440	13
441	17
441	13
442	13
443	20
444	25
445	33
445	39
446	33
446	39
447	33
447	39
448	35
448	30
449	35
449	30
450	30
451	30
452	30
453	30
454	30
455	20
456	25
457	25
458	25
459	25
460	25
461	25
462	9
463	20
464	41
465	41
466	17
466	13
467	13
468	13
469	35
470	17
471	17
471	13
472	13
473	33
473	17
473	13
474	33
474	17
474	39
475	13
476	13
477	33
477	17
477	13
477	39
478	17
478	13
479	33
479	17
479	13
480	13
481	20
482	20
483	39
484	13
485	13
486	13
487	13
488	13
489	13
490	13
491	13
492	38
493	38
494	13
495	13
496	13
497	13
498	13
499	38
500	13
500	23
501	13
501	23
502	19
503	13
503	23
504	23
505	23
506	13
507	20
508	20
509	20
510	20
511	20
512	20
513	20
514	20
515	20
516	19
517	19
518	19
519	19
520	19
521	19
522	19
523	19
524	19
525	19
526	19
527	19
528	20
529	18
530	42
531	20
532	20
533	19
534	19
535	19
536	20
537	13
538	13
538	18
539	18
540	18
541	22
542	8
542	22
543	8
544	8
545	8
546	8
547	8
548	8
549	20
549	32
550	20
551	20
552	20
553	20
554	20
555	20
556	20
557	29
558	29
559	29
560	29
561	29
562	35
562	29
563	35
563	29
564	29
565	29
566	29
567	1
568	1
569	18
570	18
571	35
572	35
573	35
574	35
575	35
576	35
577	35
578	35
579	35
580	35
581	35
582	35
583	35
584	33
584	17
585	20
586	1
587	2
588	19
589	29
590	29
591	29
592	29
593	29
594	20
595	20
596	20
597	4
598	4
599	12
600	43
601	4
602	1
602	28
603	28
604	25
605	18
605	27
606	18
607	18
608	20
609	20
610	20
611	22
611	30
612	20
613	20
614	19
615	35
615	19
616	20
617	13
617	23
618	13
618	23
619	20
620	20
621	10
622	24
623	24
624	24
625	10
626	10
627	10
628	10
629	24
630	3
630	5
631	33
631	7
632	1
632	6
633	23
634	23
635	18
636	8
636	22
637	7
638	7
639	7
640	7
641	6
642	5
643	25
644	17
645	17
646	25
647	25
648	17
649	17
650	17
651	17
652	24
653	24
654	25
655	25
656	17
657	17
658	24
659	25
660	25
661	17
662	17
663	25
664	25
665	25
666	25
667	33
667	25
668	33
668	25
669	24
670	25
671	25
672	24
673	25
674	17
675	17
676	24
677	25
678	24
679	24
680	25
681	25
682	33
682	17
682	13
682	39
683	33
683	17
683	19
683	13
684	33
684	17
684	13
685	33
685	39
686	33
686	17
686	13
687	17
687	13
688	17
688	13
689	19
690	19
690	27
690	23
691	2
692	37
693	37
694	37
695	37
696	37
697	37
698	37
699	37
700	37
701	37
702	28
703	17
704	17
705	17
706	17
707	17
708	17
709	17
710	17
711	13
712	13
713	13
714	17
714	13
715	17
716	18
717	18
718	44
718	45
719	20
720	37
721	20
722	1
722	3
723	17
724	2
725	2
726	1
727	1
727	3
727	28
728	1
728	3
728	34
729	1
729	3
729	34
730	1
730	3
730	34
731	1
731	3
732	1
732	3
732	34
733	35
733	17
733	13
734	17
734	13
735	17
735	13
736	17
736	13
737	17
737	13
738	24
739	1
740	9
741	20
742	37
743	25
744	25
745	25
746	25
747	25
748	36
749	19
750	19
751	19
752	19
752	21
752	32
753	20
754	25
755	33
755	24
756	21
757	20
758	25
759	25
760	25
761	13
762	17
762	13
763	17
763	13
764	13
765	13
766	13
767	17
767	13
768	17
768	13
769	13
770	13
771	13
772	13
773	13
774	33
774	17
775	17
776	17
777	17
778	17
779	17
780	17
781	17
782	25
783	17
784	17
785	17
786	17
786	13
787	28
788	20
789	8
790	17
790	8
791	17
791	8
792	1
793	1
794	1
794	3
795	1
795	3
796	1
797	1
797	40
798	1
799	1
800	12
801	9
802	1
802	9
803	20
804	20
805	20
806	2
806	28
807	2
807	28
808	1
808	2
809	20
810	18
811	20
812	20
813	20
814	37
815	1
815	3
815	15
816	1
816	3
816	15
817	1
817	3
817	15
818	2
819	20
819	32
820	20
821	20
822	25
823	25
824	25
825	25
826	25
827	1
827	4
827	40
828	1
828	40
829	39
830	1
830	3
830	28
831	1
831	3
831	6
832	19
833	17
834	35
834	29
835	35
835	29
836	35
836	29
837	35
837	29
838	35
838	29
839	35
839	29
840	35
840	29
841	1
842	17
842	13
843	1
843	28
844	20
845	20
846	20
847	17
848	17
849	17
850	23
851	23
852	23
853	37
854	1
854	2
855	20
856	17
856	13
857	17
858	17
859	13
860	25
861	25
862	25
863	25
864	25
865	25
866	25
867	25
868	25
869	13
870	13
871	13
872	13
873	13
874	13
875	33
876	2
877	7
878	7
879	18
880	2
881	2
882	2
883	2
884	25
885	16
885	24
886	8
886	16
886	24
887	25
888	16
888	24
889	16
890	16
891	16
892	25
893	1
893	3
894	1
894	9
895	20
896	19
897	2
898	2
899	35
899	2
900	17
900	13
900	24
901	17
901	13
901	24
902	4
903	1
904	4
905	4
906	4
907	4
908	4
909	20
910	1
911	3
912	14
912	15
913	3
913	15
914	37
915	1
916	1
917	1
917	2
918	3
919	1
919	3
920	3
920	5
921	1
922	3
923	3
924	15
924	6
925	15
926	14
926	15
927	15
928	3
928	15
929	15
930	3
930	15
931	3
931	15
932	18
933	38
934	38
935	7
936	7
937	7
938	7
939	7
940	7
941	7
942	1
943	1
943	2
944	1
944	2
945	1
945	28
946	1
947	1
948	1
949	3
949	5
950	1
950	28
951	1
952	1
953	1
954	1
954	5
954	6
954	36
955	1
955	3
955	36
956	1
956	2
957	2
977	17
977	36
978	1
978	3
979	1
979	3
980	1
980	3
981	7
982	7
983	36
984	36
985	36
986	36
987	36
988	36
989	36
990	7
991	1
992	1
993	1
994	45
995	20
996	3
996	5
997	3
997	5
998	3
998	5
998	15
999	35
999	22
1000	35
1001	35
1002	35
1003	35
1004	35
1005	35
1006	35
1007	35
1008	35
1009	35
1010	35
1011	35
1012	35
1013	35
1014	35
1015	18
1016	3
1017	3
1018	3
1019	35
1019	29
1020	20
1021	1
1021	40
1022	20
1022	21
1023	20
1023	21
1024	36
1025	33
1025	17
1026	33
1026	17
1027	36
1028	36
1029	30
1030	1
1030	32
1030	3
1031	33
1031	19
1032	1
1032	32
1032	3
1033	1
1033	32
1033	3
1034	2
1035	2
1036	20
1037	1
1037	3
1037	43
1037	28
1038	20
1039	1
1039	32
1039	3
1039	9
1039	12
1040	17
1041	17
1042	17
1043	17
1044	35
1045	35
1045	21
1046	35
1047	35
1048	35
1049	35
1050	35
1051	35
1052	35
1053	35
1054	35
1055	35
1055	17
1056	35
1057	35
1058	30
1059	35
1060	35
1061	35
1061	33
1061	17
1061	30
1062	35
1063	35
1064	35
1065	35
1066	35
1067	5
1068	5
1068	6
1069	5
1070	37
1071	37
1072	37
1073	20
1074	9
1075	9
1076	7
1077	7
1078	7
1079	7
1080	7
1081	16
1082	16
1083	7
1084	7
1085	7
1086	7
1087	7
1088	23
1089	7
1090	17
1090	13
1090	24
1091	35
1091	30
1092	37
1093	20
1094	37
1095	37
1096	37
1097	37
1098	37
1099	20
1100	20
1101	16
1102	25
1103	24
1104	25
1105	25
1106	25
1107	13
1108	16
1109	25
1110	24
1111	25
1112	25
1113	24
1114	16
1114	24
1115	13
1116	13
1117	13
1118	13
1119	13
1120	13
1121	13
1122	39
1123	13
1124	25
1125	25
1126	13
1127	25
1128	25
1129	17
1129	24
1130	17
1130	24
1131	17
1132	33
1132	17
1132	13
1133	17
1133	13
1134	13
1135	17
1135	13
1136	17
1136	13
1137	17
1137	13
1138	17
1138	13
1139	17
1139	13
1140	17
1140	13
1141	17
1141	13
1142	35
1142	17
1142	13
1143	17
1143	13
1144	17
1144	13
1145	17
1145	13
1146	17
1146	13
1147	17
1147	13
1148	35
1148	13
1149	17
1149	13
1150	33
1150	17
1150	13
1151	33
1151	17
1151	13
1152	35
1152	17
1152	13
1153	17
1153	13
1154	33
1154	17
1154	13
1155	17
1155	13
1156	22
1156	30
1157	6
1157	40
1158	45
1159	7
1160	36
1161	36
1162	36
1163	2
1164	20
1165	20
1166	9
1167	20
1168	20
1169	20
1170	1
1171	3
1171	15
1172	29
1173	29
1174	29
1175	35
1175	29
1176	29
1177	19
1178	19
1179	19
1180	19
1181	19
1182	19
1183	19
1184	1
1185	1
1186	2
1187	25
1188	20
1189	20
1190	20
1191	20
1192	35
1193	35
1194	37
1195	25
1196	25
1197	25
1198	2
1199	2
1200	1
1201	1
1201	5
1201	46
1202	2
1203	2
1204	20
1205	22
1205	30
1206	1
1206	9
1207	1
1207	9
1208	5
1209	2
1210	2
1211	19
1212	5
1213	23
1214	23
1215	23
1216	3
1216	6
1217	3
1217	6
1218	13
1219	17
1220	1
1221	20
1222	20
1223	20
1224	20
1225	20
1226	20
1227	19
1228	5
1229	35
1230	35
1231	7
1232	7
1233	7
1234	7
1235	20
1235	19
1236	33
1237	33
1238	17
1238	13
1239	33
1240	35
1240	17
1241	17
1241	13
1242	33
1243	17
1243	13
1244	17
1244	13
1245	33
1246	33
1247	17
1247	13
1248	17
1248	13
1249	17
1249	13
1250	17
1250	13
1251	35
1251	30
1252	35
1252	30
1253	35
1253	30
1254	35
1254	30
1255	35
1255	22
1256	20
1257	20
1258	23
1259	23
1260	23
1261	23
1262	9
1263	20
1264	20
1265	3
1266	1
1267	1
1268	22
1269	17
1269	13
1269	5
1270	1
1271	39
1272	39
1273	29
1274	29
1275	3
1276	1
1276	3
1276	4
1277	1
1277	3
1277	4
1278	1
1278	3
1279	15
1280	1
1281	5
1282	13
1282	7
1282	39
1282	5
1283	5
1284	27
1284	36
1285	1
1286	1
1287	1
1288	1
1289	1
1290	1
1290	40
1291	6
1292	6
1293	40
1294	1
1295	5
1296	1
1297	1
1298	1
1299	5
1300	1
1300	36
1301	9
1302	13
1303	1
1303	3
1304	1
1304	3
1305	1
1306	1
1307	5
1308	5
1309	1
1310	3
1311	3
1311	5
1312	5
1313	1
1313	3
1313	4
1314	20
1315	1
1316	1
1317	17
1317	13
1318	13
1319	13
1320	13
1321	13
1322	13
1323	13
1324	13
1325	13
1326	33
1327	33
1328	13
1329	39
1330	17
1331	39
1332	17
1333	13
1334	33
1335	17
1336	17
1337	17
1338	13
1339	13
1340	13
1341	13
1342	13
1343	13
1344	13
1345	13
1346	13
1347	13
1348	7
1349	13
1350	13
1351	13
1352	20
1353	20
1354	20
1355	25
1356	25
1357	17
1357	13
1358	17
1358	13
1359	25
1360	25
1361	25
1362	17
1363	17
1364	17
1365	25
1366	25
1367	17
1368	24
1369	25
1370	25
1371	25
1372	25
1373	25
1374	25
1375	17
1376	17
1377	17
1378	17
1379	17
1380	17
1381	16
1382	25
1383	17
1384	17
1385	17
1386	25
1387	25
1388	33
1388	17
1388	13
1389	33
1389	17
1389	13
1390	33
1390	17
1390	13
1391	16
1392	13
1393	17
1394	33
1394	17
1394	13
1395	17
1396	17
1397	17
1398	33
1398	17
1399	17
1400	24
1401	17
1401	13
1402	17
1403	17
1404	7
1405	23
1406	13
1406	23
1407	19
1408	2
1409	1
1409	3
1410	1
1410	3
1411	1
1412	1
1413	5
1414	1
1415	1
1416	1
1416	2
1417	1
1417	9
1418	1
1418	3
1419	1
1420	1
1420	9
1421	1
1422	1
1423	1
1423	3
1424	1
1424	3
1424	5
1424	6
1424	45
1425	11
1425	1
1425	6
1426	11
1426	1
1426	3
1426	6
1427	1
1427	3
1427	36
1428	20
1429	27
1430	27
1431	8
1432	37
1433	8
1434	8
1435	23
1436	23
1437	17
1438	17
1439	35
1440	35
1440	17
1441	7
1442	24
1443	24
1444	13
1445	13
1446	13
1447	13
1448	17
1448	13
1449	17
1449	13
1450	17
1450	13
1451	13
1452	13
1453	13
1454	17
1455	17
1456	13
1457	13
1458	13
1459	13
1460	13
1461	13
1462	13
1463	13
1464	13
1465	13
1466	13
1467	13
1468	13
1469	13
1470	13
1471	13
1472	20
1473	31
1474	20
1474	36
1475	20
1475	36
1476	24
1477	25
1478	24
1479	25
1480	25
1481	25
1482	24
1483	25
1484	25
1485	24
1486	25
1487	7
1488	7
1489	5
1490	6
1491	44
1492	47
1493	37
1494	37
1495	37
1496	2
1497	11
1498	13
1498	23
1499	11
1500	19
1501	19
1502	19
1503	38
1504	2
1505	2
1506	1
1506	28
1507	1
1507	28
1508	1
1508	28
1509	1
1509	28
1510	1
1510	28
1511	1
1511	28
1512	17
1513	17
1514	1
1515	1
1516	1
1517	5
1518	5
1518	46
1519	5
1519	46
1520	5
1521	5
1522	5
1523	5
1523	46
1524	5
1525	5
1526	20
1526	21
1527	20
1527	21
1528	31
1528	20
1529	40
1530	12
1531	5
1532	17
1533	39
1534	17
1534	16
1535	17
1536	17
1536	13
1537	17
1537	13
1538	17
1538	22
1539	17
1540	17
1540	13
1541	7
1542	17
1543	39
1544	7
1545	17
1546	17
1547	39
1548	17
1548	22
1549	17
1550	17
1550	22
1551	17
1552	17
1553	24
1555	35
1555	30
1556	35
1557	35
1558	35
1559	35
1560	35
1561	35
1562	35
1563	35
1564	35
1565	35
1566	35
1567	35
1568	35
1569	35
1570	31
1571	13
1572	13
1573	14
1573	15
1573	6
1574	19
1575	19
1576	1
1576	15
1576	34
1577	9
1578	9
1579	1
1579	34
1580	36
1581	1
1582	1
1583	1
1584	17
1584	13
1585	20
1586	35
1586	29
1587	31
1588	20
1589	20
1590	31
1591	7
1592	7
1593	7
1594	7
1595	1
1595	3
1596	37
1597	37
1598	1
1598	3
1599	40
1600	22
1600	40
1601	40
1602	22
1602	40
1603	40
1604	40
1605	17
1605	22
1606	6
1606	40
1607	19
1608	43
1609	43
1610	34
1610	43
1611	43
1612	34
1613	34
1614	43
1615	34
1616	43
1617	34
1618	34
1619	43
1620	28
1621	28
1622	1
1623	1
1624	43
1625	43
1626	43
1627	43
1628	43
1629	9
1629	28
1630	3
1631	21
1631	11
1632	20
1633	20
1634	25
1635	25
1636	25
1637	13
1638	25
1639	30
1640	30
1641	35
1641	17
1641	13
1642	6
1643	24
1644	5
1645	7
1646	7
1647	20
1648	3
1649	17
1649	13
1650	17
1651	17
1652	13
1653	13
1654	13
1655	13
1656	25
1657	25
1658	25
1659	25
1660	25
1661	25
1662	20
1663	20
1664	20
1665	25
1666	25
1667	25
1668	24
1669	24
1670	20
1671	3
1671	15
1672	19
1673	37
1674	1
1674	9
1675	13
1676	13
1677	20
1678	20
1679	25
1680	25
1681	25
1682	25
1683	25
1684	23
1685	26
1685	10
1686	26
1686	10
1687	17
1688	23
1689	3
1689	15
1689	6
1690	47
1691	47
1692	17
1693	13
1694	17
1695	35
1696	35
1697	35
1697	17
1698	35
1699	35
1700	35
1701	35
1702	35
1703	25
1704	17
1704	13
1705	13
1706	13
1707	13
1708	17
1708	7
1708	16
1709	7
1710	7
1711	8
1712	39
1713	17
1714	17
1715	17
1716	7
1717	17
1718	8
1719	2
1720	20
1721	20
1722	20
1723	7
1724	7
1725	19
1726	19
1727	19
1728	19
1729	19
1730	19
1731	19
1732	19
1733	19
1734	19
1735	3
1735	6
1736	3
1736	6
1737	3
1737	6
1738	3
1738	6
1739	3
1739	6
1740	1
1741	5
1742	5
1743	5
1744	5
1745	11
1745	1
1745	3
1745	5
1745	6
1746	3
1746	6
1747	3
1747	6
1748	3
1748	6
1749	40
1750	3
1750	15
1750	6
1751	40
1752	17
1753	7
1754	13
1755	13
1756	17
1757	7
1758	17
1758	13
1759	17
1760	17
1761	25
1762	25
1763	25
1764	8
1765	8
1766	8
1767	8
1768	8
1769	9
1770	9
1771	35
1771	29
1772	35
1772	29
1773	35
1773	29
1774	35
1775	17
1775	13
1776	13
1777	13
1778	13
1779	13
1780	13
1781	13
1782	13
1783	17
1783	13
1784	20
1785	20
1785	21
1786	20
1786	21
1787	3
1788	23
1789	23
1790	23
1791	17
1792	37
1793	37
1794	37
1795	37
1796	37
1797	37
1798	29
1799	29
1800	29
1801	21
1802	17
1802	7
1802	36
1803	19
1804	1
1804	3
1805	13
1805	7
1805	39
1806	17
1806	13
1806	7
1806	39
1807	17
1807	13
1807	7
1807	39
1808	1
1809	2
1809	32
1810	1
1811	1
1812	24
1813	17
1814	13
1815	24
1816	24
1817	17
1818	24
1819	17
1820	17
1821	24
1822	24
1823	24
1824	17
1825	13
1826	17
1827	17
1828	20
1829	20
1830	20
1831	20
1832	20
1833	20
1834	20
1835	9
1836	25
1837	20
1838	20
1838	32
1839	20
1839	32
1840	20
1841	35
1841	33
1841	17
1841	30
1842	35
1842	33
1842	17
1842	30
1843	35
1843	33
1843	17
1843	30
1844	35
1844	33
1844	17
1844	30
1845	1
1845	28
1846	1
1846	28
1847	1
1847	3
1848	1
1848	9
1849	1
1849	5
1850	9
1851	25
1852	9
1853	9
1854	8
1855	8
1856	8
1857	13
1858	17
1858	1
1858	36
1859	13
1860	13
1861	13
1862	17
1862	13
1863	13
1864	17
1864	13
1865	13
1866	13
1867	17
1867	13
1868	13
1869	13
1870	13
1871	13
1872	13
1873	13
1874	33
1874	13
1875	13
1876	13
1877	13
1878	33
1878	13
1879	19
1880	23
1881	20
1882	19
1883	19
1884	33
1884	39
1885	35
1885	17
1886	23
1887	14
1887	1
1887	2
1887	15
1887	28
1888	1
1888	2
1888	28
1889	13
1890	17
1890	13
1891	17
1891	13
1892	13
1893	13
1894	1
1894	28
1895	1
1895	28
1896	17
1896	13
1897	1
1897	28
1898	20
1899	12
1900	12
1901	12
1902	12
1903	20
1904	19
1905	1
1906	17
1907	17
1908	17
1909	17
1910	6
1911	3
1911	5
1912	20
1913	20
1914	20
1915	20
1916	20
1917	20
1918	5
1919	23
1920	1
1921	34
1921	28
1922	34
1922	28
1923	34
1923	28
1924	34
1924	28
1925	34
1926	5
1926	34
1927	17
1927	13
1928	17
1928	13
1929	1
1930	1
1931	1
1931	3
1932	1
1932	3
1933	1
1934	1
1935	3
1936	3
1937	3
1937	5
1938	1
1938	5
1939	1
1940	17
1941	39
1942	35
1942	17
1943	17
1944	17
1945	17
1946	17
1947	39
1948	17
1949	17
1950	17
1951	17
1952	17
1953	17
1953	39
1954	17
1955	39
1956	35
1956	17
1957	39
1958	20
1959	2
1960	9
1961	9
1962	35
1963	20
1964	20
1965	25
1966	25
1967	25
1968	25
1969	25
1970	20
1971	21
1972	25
1973	7
1974	2
1975	1
1976	44
1977	3
1978	3
1979	1
1979	9
1980	1
1981	26
1982	1
1982	5
1983	17
1983	36
1984	14
1984	15
1985	15
1986	1
1987	1
1988	9
1989	1
1989	3
1989	6
1990	1
1991	1
1991	6
1992	1
1992	9
1993	43
1994	20
1995	15
1996	15
1996	6
1997	15
1998	15
1998	6
1999	1
2000	1
2001	1
2001	6
2002	1
2003	1
2003	6
2004	37
2005	19
2006	19
2007	19
2008	19
2009	19
2011	19
2013	19
2014	19
2015	19
2016	19
2017	35
2017	29
2018	33
2018	7
2019	19
2020	31
2021	13
2022	1
2022	3
2022	6
2023	25
2024	20
2025	20
2026	20
2027	2
2028	2
2029	42
2030	1
2031	3
2032	35
2033	2
2034	35
2034	17
2035	20
2036	20
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, password, role, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-09-22 07:24:30
20211116045059	2025-09-22 07:24:33
20211116050929	2025-09-22 07:24:36
20211116051442	2025-09-22 07:24:38
20211116212300	2025-09-22 07:24:41
20211116213355	2025-09-22 07:24:43
20211116213934	2025-09-22 07:24:46
20211116214523	2025-09-22 07:24:49
20211122062447	2025-09-22 07:24:51
20211124070109	2025-09-22 07:24:54
20211202204204	2025-09-22 07:24:56
20211202204605	2025-09-22 07:24:58
20211210212804	2025-09-22 07:25:06
20211228014915	2025-09-22 07:25:08
20220107221237	2025-09-22 07:25:10
20220228202821	2025-09-22 07:25:13
20220312004840	2025-09-22 07:25:15
20220603231003	2025-09-22 07:25:19
20220603232444	2025-09-22 07:25:21
20220615214548	2025-09-22 07:25:24
20220712093339	2025-09-22 07:25:26
20220908172859	2025-09-22 07:25:29
20220916233421	2025-09-22 07:25:31
20230119133233	2025-09-22 07:25:33
20230128025114	2025-09-22 07:25:36
20230128025212	2025-09-22 07:25:39
20230227211149	2025-09-22 07:25:41
20230228184745	2025-09-22 07:25:43
20230308225145	2025-09-22 07:25:46
20230328144023	2025-09-22 07:25:48
20231018144023	2025-09-22 07:25:51
20231204144023	2025-09-22 07:25:54
20231204144024	2025-09-22 07:25:57
20231204144025	2025-09-22 07:25:59
20240108234812	2025-09-22 07:26:01
20240109165339	2025-09-22 07:26:04
20240227174441	2025-09-22 07:26:08
20240311171622	2025-09-22 07:26:11
20240321100241	2025-09-22 07:26:16
20240401105812	2025-09-22 07:26:23
20240418121054	2025-09-22 07:26:26
20240523004032	2025-09-22 07:26:34
20240618124746	2025-09-22 07:26:37
20240801235015	2025-09-22 07:26:39
20240805133720	2025-09-22 07:26:41
20240827160934	2025-09-22 07:26:44
20240919163303	2025-09-22 07:26:47
20240919163305	2025-09-22 07:26:49
20241019105805	2025-09-22 07:26:52
20241030150047	2025-09-22 07:27:01
20241108114728	2025-09-22 07:27:04
20241121104152	2025-09-22 07:27:06
20241130184212	2025-09-22 07:27:09
20241220035512	2025-09-22 07:27:11
20241220123912	2025-09-22 07:27:13
20241224161212	2025-09-22 07:27:16
20250107150512	2025-09-22 07:27:18
20250110162412	2025-09-22 07:27:20
20250123174212	2025-09-22 07:27:23
20250128220012	2025-09-22 07:27:25
20250506224012	2025-09-22 07:27:27
20250523164012	2025-09-22 07:27:29
20250714121412	2025-09-22 07:27:32
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-09-22 07:24:24.427722
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-09-22 07:24:24.479929
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-09-22 07:24:24.490166
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-09-22 07:24:24.570397
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-09-22 07:24:24.665837
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-09-22 07:24:24.674547
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-09-22 07:24:24.682923
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-09-22 07:24:24.691516
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-09-22 07:24:24.697806
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-09-22 07:24:24.704082
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-09-22 07:24:24.711403
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-09-22 07:24:24.718955
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-09-22 07:24:24.731668
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-09-22 07:24:24.738879
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-09-22 07:24:24.745986
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-09-22 07:24:24.786741
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-09-22 07:24:24.79455
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-09-22 07:24:24.801178
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-09-22 07:24:24.819396
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-09-22 07:24:24.831351
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-09-22 07:24:24.838969
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-09-22 07:24:24.849087
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-09-22 07:24:24.872835
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-09-22 07:24:24.884923
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-09-22 07:24:24.891855
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-09-22 07:24:24.899374
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Category_id_seq"', 94, true);


--
-- Name: InventoryLog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."InventoryLog_id_seq"', 1, false);


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderItem_id_seq"', 1, false);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_id_seq"', 1, false);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_id_seq"', 2036, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_client_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_client_id_key UNIQUE (client_id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: InventoryLog InventoryLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLog"
    ADD CONSTRAINT "InventoryLog_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: ProductCategory ProductCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductCategory"
    ADD CONSTRAINT "ProductCategory_pkey" PRIMARY KEY ("productId", "categoryId");


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_clients_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_client_id_idx ON auth.oauth_clients USING btree (client_id);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: Category_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Category_name_key" ON public."Category" USING btree (name);


--
-- Name: Product_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_name_key" ON public."Product" USING btree (name);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: InventoryLog InventoryLog_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLog"
    ADD CONSTRAINT "InventoryLog_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: InventoryLog InventoryLog_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryLog"
    ADD CONSTRAINT "InventoryLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Order Order_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ProductCategory ProductCategory_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductCategory"
    ADD CONSTRAINT "ProductCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ProductCategory ProductCategory_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductCategory"
    ADD CONSTRAINT "ProductCategory_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime Product; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public."Product";


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE "Category"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Category" TO anon;
GRANT ALL ON TABLE public."Category" TO authenticated;
GRANT ALL ON TABLE public."Category" TO service_role;


--
-- Name: SEQUENCE "Category_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Category_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Category_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Category_id_seq" TO service_role;


--
-- Name: TABLE "InventoryLog"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."InventoryLog" TO anon;
GRANT ALL ON TABLE public."InventoryLog" TO authenticated;
GRANT ALL ON TABLE public."InventoryLog" TO service_role;


--
-- Name: SEQUENCE "InventoryLog_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."InventoryLog_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."InventoryLog_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."InventoryLog_id_seq" TO service_role;


--
-- Name: TABLE "Order"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Order" TO anon;
GRANT ALL ON TABLE public."Order" TO authenticated;
GRANT ALL ON TABLE public."Order" TO service_role;


--
-- Name: TABLE "OrderItem"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."OrderItem" TO anon;
GRANT ALL ON TABLE public."OrderItem" TO authenticated;
GRANT ALL ON TABLE public."OrderItem" TO service_role;


--
-- Name: SEQUENCE "OrderItem_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."OrderItem_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."OrderItem_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."OrderItem_id_seq" TO service_role;


--
-- Name: SEQUENCE "Order_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Order_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Order_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Order_id_seq" TO service_role;


--
-- Name: TABLE "Product"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Product" TO anon;
GRANT ALL ON TABLE public."Product" TO authenticated;
GRANT ALL ON TABLE public."Product" TO service_role;


--
-- Name: TABLE "ProductCategory"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."ProductCategory" TO anon;
GRANT ALL ON TABLE public."ProductCategory" TO authenticated;
GRANT ALL ON TABLE public."ProductCategory" TO service_role;


--
-- Name: SEQUENCE "Product_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Product_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Product_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Product_id_seq" TO service_role;


--
-- Name: TABLE "User"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."User" TO anon;
GRANT ALL ON TABLE public."User" TO authenticated;
GRANT ALL ON TABLE public."User" TO service_role;


--
-- Name: SEQUENCE "User_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."User_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."User_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."User_id_seq" TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict f7pUuxFOT34JkMh0pfMRfj90OHinXQvAL5TnOesi7mKdehWErsyxsabOzBvoXQP

