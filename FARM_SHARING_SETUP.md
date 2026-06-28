# Shearin Farm Manager v21 - Farm Sharing Setup

This version changes the app from **one account = one private dataset** to **one farm = shared dataset**.

## What this enables

- Mike can own `Shearin Farm`.
- Family members can create their own accounts.
- Mike can create an invite code.
- Family members can join `Shearin Farm` and see the same farm data.
- Future users can keep their own private farms unless they share them.

## Required Supabase step

1. Upload v21 to GitHub.
2. Open the app as Mike.
3. Go to **Settings > Diagnostics**.
4. Copy the **User ID**.
5. In Supabase, open **SQL Editor**.
6. Open `SUPABASE_FARM_SHARING_V21.sql` from this ZIP.
7. At the bottom, replace the placeholder UUID in this line:

```sql
select public.bootstrap_farm_for_user('00000000-0000-0000-0000-000000000000', 'Shearin Farm');
```

with Mike's actual User ID.

8. Run the SQL.
9. Refresh the app.

## Inviting a family member

1. Family member creates and verifies their own account.
2. Mike signs in.
3. Go to **Settings > Farm Sharing**.
4. Choose role:
   - `Viewer`: can see data/reports.
   - `Editor`: can add/edit/delete farm records.
   - `Admin`: can help manage sharing.
5. Click **Create Invite Code**.
6. Give the code to the family member.
7. Family member signs in, goes to **Settings > Farm Sharing**, enters the code, and clicks **Join Farm**.

## Rollback note

This migration adds `farm_id` columns and sharing tables. It does not delete existing egg/flock/sales/use/expense data.
