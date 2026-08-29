-- JERLOORXHCK Secret Messages - Supabase schema
-- Passwords are NEVER stored in this table. Only encrypted ciphertext is stored.

create extension if not exists pgcrypto;

create table if not exists public.secret_messages (
  id uuid primary key default gen_random_uuid(),
  ciphertext text not null,
  expires_at timestamptz null,
  created_at timestamptz not null default now()
);

alter table public.secret_messages enable row level security;

-- Remove older policies if this script is run again.
drop policy if exists "public insert secret messages" on public.secret_messages;
drop policy if exists "read unexpired secret messages" on public.secret_messages;

-- Static GitHub Pages has no user login, so creation must be allowed from the browser.
-- Add rate limiting/Edge Functions later if this becomes a public production service.
create policy "public insert secret messages"
on public.secret_messages
for insert
to anon
with check (
  length(ciphertext) > 0 and
  (expires_at is null or expires_at > now())
);

-- Anyone holding the random message ID can retrieve the ciphertext, but only while unexpired.
-- The ciphertext is AES-GCM encrypted in the browser; the password is never sent to Supabase.
create policy "read unexpired secret messages"
on public.secret_messages
for select
to anon
using (expires_at is null or expires_at > now());

-- Optional cleanup function. Run periodically with pg_cron if enabled in your project.
create or replace function public.delete_expired_secret_messages()
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare n integer;
begin
  delete from public.secret_messages where expires_at is not null and expires_at <= now();
  get diagnostics n = row_count;
  return n;
end;
$$;
