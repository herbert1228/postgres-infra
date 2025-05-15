CREATE TYPE app_type AS ENUM('WHATSAPP', 'DISCORD');

ALTER TABLE discord_messages
    ADD COLUMN IF NOT EXISTS source_app app_type;