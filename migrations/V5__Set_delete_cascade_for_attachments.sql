-- 1. Drop the existing constraint
ALTER TABLE discord_attachments
DROP CONSTRAINT discord_attachments_message_id_fkey;

-- 2. Re-create it with ON DELETE CASCADE
ALTER TABLE discord_attachments
    ADD CONSTRAINT discord_attachments_message_id_fkey
        FOREIGN KEY (message_id)
            REFERENCES discord_messages(id)
            ON DELETE CASCADE;