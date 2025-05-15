UPDATE discord_messages
SET source_app = 'DISCORD'
WHERE source_app IS NULL;

ALTER TABLE discord_messages
    ALTER COLUMN source_app SET DEFAULT 'DISCORD',
ALTER COLUMN source_app SET NOT NULL;
