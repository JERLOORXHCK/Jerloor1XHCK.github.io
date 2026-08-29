# JERLOORXHCK Secret Message — Link + Password Edition

## Flow
1. Open `create.html`.
2. Write your complete message.
3. Choose a password (or let the generator create one).
4. Choose an expiration time.
5. Generate the share link.
6. Send the **share link** and **password separately**.
7. The recipient opens the link, enters the password, and the complete message opens.

## Security
The share link contains only the encrypted payload. The password is not included in the URL. AES-256-GCM protects the message and PBKDF2-SHA-256 derives the encryption key with 250,000 iterations.

## Expiry
The encrypted payload contains an expiration timestamp. The browser blocks display after expiry and shows a countdown while the message is open.

Because GitHub Pages is static, expiration is client-side and depends on the recipient's device clock. True server-enforced deletion requires a backend.

Do not use this for OTPs, banking details, passwords, or other highly sensitive information.


## Pro Edition additions
- Copy Share Link button
- Copy Password button
- WhatsApp Share button that shares the link without exposing the password
- WhatsApp contact button on the message page

For best privacy, send the password separately from the share link.


## Password Generator
The Create page now includes a **GENERATE** button that creates a cryptographically random 24-character password using the browser's `crypto.getRandomValues()` API. The generated password is placed in the password field and is used for the AES-256-GCM encryption.


## Password Strength Meter
The Create page now evaluates the password as **Weak, Medium, Strong, or Very Strong** based on length, character variety, and repeated-character patterns. The meter updates while typing and after using Generate.


## Matrix/Hacker FX
- CRT scan/noise overlay and vignette
- Glitch pulses
- Access-granted flash and toast
- Hacker-style UI sound effects for clicks, typing, boot, success and error
- Password generation and encryption completion sounds

Audio starts after browser interaction where required by mobile autoplay policies.
