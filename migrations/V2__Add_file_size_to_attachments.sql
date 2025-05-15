ALTER TABLE discord_attachments
    ADD COLUMN IF NOT EXISTS file_size_bytes BIGINT;

COMMENT ON COLUMN discord_attachments.file_size_bytes IS 'Size of the attachment file in bytes';