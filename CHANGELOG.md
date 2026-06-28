# Changelog

## v22 - Family-friendly invites

- Added one-tap invite links using `?invite=CODE`.
- Added large visible invite-code box.
- Added Copy Invite Link and Share Invitation buttons for text/email/AirDrop.
- App now saves invite links before sign-in and joins the farm automatically after login/signup.
- Updated cache/service worker version to v22.


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
