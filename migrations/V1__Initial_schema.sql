-- Discord channels table
CREATE TABLE IF NOT EXISTS discord_channels (
    id VARCHAR(255) PRIMARY KEY,
    name TEXT NOT NULL
);

-- Discord authors table
CREATE TABLE IF NOT EXISTS discord_authors (
    id VARCHAR(255) PRIMARY KEY,
    name TEXT NOT NULL,
    discriminator TEXT,
    nickname TEXT,
    color TEXT,
    is_bot BOOLEAN,
    avatar_url TEXT
);

-- Discord messages table
CREATE TABLE IF NOT EXISTS discord_messages (
    id VARCHAR(255) PRIMARY KEY,
    type TEXT,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    is_pinned BOOLEAN,
    content TEXT,
    author_id VARCHAR(255) REFERENCES discord_authors(id),
    channel_id VARCHAR(255) REFERENCES discord_channels(id),
    timestamp_edited TIMESTAMP WITH TIME ZONE
);

-- Author roles table
CREATE TABLE IF NOT EXISTS discord_author_roles (
    author_id VARCHAR(255) REFERENCES discord_authors(id),
    role TEXT,
    PRIMARY KEY (author_id, role)
);

-- Mentions table
CREATE TABLE IF NOT EXISTS discord_mentions (
    message_id VARCHAR(255) REFERENCES discord_messages(id),
    author_id VARCHAR(255) REFERENCES discord_authors(id),
    PRIMARY KEY (message_id, author_id)
);

-- Attachments table
CREATE TABLE IF NOT EXISTS discord_attachments (
    id VARCHAR(255) PRIMARY KEY,
    message_id VARCHAR(255) REFERENCES discord_messages(id),
    path TEXT,
    file_name TEXT
);

-- Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_discord_messages_timestamp ON discord_messages(timestamp);
CREATE INDEX IF NOT EXISTS idx_discord_messages_author_id ON discord_messages(author_id);
CREATE INDEX IF NOT EXISTS idx_discord_mentions_author_id ON discord_mentions(author_id);
