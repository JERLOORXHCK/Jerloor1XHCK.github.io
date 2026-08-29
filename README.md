# JERLOORXHCK Secret Message — Auto-Expiring Edition

## Features
- AES-256-GCM message encryption in the browser.
- PBKDF2-SHA-256 key derivation with 250,000 iterations.
- Matrix/hacker gateway animation.
- Secret key is never placed in the share URL.
- Expiry choices: 10 minutes, 1 hour, 24 hours, 7 days, or no expiry.
- Expiration timestamp is inside the encrypted/authenticated payload.
- Recipient sees a live countdown while reading.
- Expired messages are rejected before the message is displayed.

## How to use
1. Open `create.html` on GitHub Pages.
2. Write the message.
3. Enter a strong key, or leave it blank for a generated key.
4. Choose an expiration time.
5. Encrypt and copy the share link.
6. Send the share link and secret key separately.
7. Recipient opens the link and enters the key.

## Important limitation
This is a static GitHub Pages implementation. The expiry is enforced by JavaScript using the recipient's device clock. A technically capable user can alter their local clock or modify the client code. The encrypted content itself remains protected by AES-GCM, but **true server-enforced expiration/deletion requires a backend/database**.

Do not use this for OTPs, banking details, passwords, or other highly sensitive information.
