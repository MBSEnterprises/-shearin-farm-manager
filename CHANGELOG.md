# Changelog

## v21 - Farm sharing / workspace model

- Added farm/workspace sharing model.
- Added `farms`, `farm_members`, and `farm_invites` database migration.
- App now scopes egg, flock, sales, use, expense, and eggs-on-hand data to the selected farm when the v21 SQL migration is installed.
- Added Settings > Farm Sharing section.
- Added invite-code flow for family members.
- Added User ID to Diagnostics to make the Supabase bootstrap step easier.
- Preserved legacy behavior if the v21 SQL has not been run yet.

## v20 - Auth hardening

- Added explicit Supabase email redirect handling.
- Added resend verification email.
- Added forgot password.
- Added diagnostics for auth redirect troubleshooting.
