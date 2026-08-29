# JERLOORXHCK + Supabase

## Setup
1. Create a Supabase project.
2. Open SQL Editor and run `supabase.sql`.
3. Copy your Project URL and anon/publishable key into `supabase-config.js`.
4. Upload all files to GitHub Pages.

## Flow
Create message → browser AES-256-GCM encrypts it → encrypted ciphertext is stored in Supabase → link contains only a random message UUID → recipient enters password → browser fetches ciphertext and decrypts locally → message displays.

The password is never stored in Supabase and is never put in the URL.

## Important
Because this is a public static site, anyone can submit records unless you add server-side rate limiting/authentication. The ciphertext remains encrypted, but users should choose strong passwords.
