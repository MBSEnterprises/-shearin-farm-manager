-- Shearin Farm Manager v12
-- Adds a manual, editable eggs-on-hand count table.

create table if not exists public.egg_on_hand_counts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid(),
  entry_date date not null,
  eggs_on_hand integer not null check (eggs_on_hand >= 0),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, entry_date)
);

alter table public.egg_on_hand_counts enable row level security;

drop policy if exists "Users can view their own eggs on hand counts" on public.egg_on_hand_counts;
create policy "Users can view their own eggs on hand counts"
  on public.egg_on_hand_counts for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert their own eggs on hand counts" on public.egg_on_hand_counts;
create policy "Users can insert their own eggs on hand counts"
  on public.egg_on_hand_counts for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their own eggs on hand counts" on public.egg_on_hand_counts;
create policy "Users can update their own eggs on hand counts"
  on public.egg_on_hand_counts for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own eggs on hand counts" on public.egg_on_hand_counts;
create policy "Users can delete their own eggs on hand counts"
  on public.egg_on_hand_counts for delete
  using (auth.uid() = user_id);

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists set_egg_on_hand_counts_updated_at on public.egg_on_hand_counts;
create trigger set_egg_on_hand_counts_updated_at
before update on public.egg_on_hand_counts
for each row execute function public.set_updated_at();
