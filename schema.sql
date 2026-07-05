-- ==========================================
-- CONVERSO SUPABASE DATABASE SCHEMA & POLICIES
-- Designed for Clerk Authentication (Text User IDs)
-- ==========================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ------------------------------------------
-- 1. COMPANIONS TABLE
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS public.companions (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        TEXT NOT NULL,
    subject     TEXT NOT NULL,
    topic       TEXT NOT NULL,
    voice       TEXT NOT NULL,
    style       TEXT NOT NULL,
    duration    INTEGER NOT NULL DEFAULT 15,
    author      TEXT NOT NULL, -- Holds Clerk User ID (plain text)
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable RLS for Companions
ALTER TABLE public.companions ENABLE ROW LEVEL SECURITY;

-- Companions Policies
CREATE POLICY "Allow public read access to companions"
    ON public.companions FOR SELECT
    USING (true);

CREATE POLICY "Allow authenticated users to create companions"
    ON public.companions FOR INSERT
    WITH CHECK (author = (auth.jwt() ->> 'sub'));

CREATE POLICY "Allow users to update their own companions"
    ON public.companions FOR UPDATE
    USING (author = (auth.jwt() ->> 'sub'));

CREATE POLICY "Allow users to delete their own companions"
    ON public.companions FOR DELETE
    USING (author = (auth.jwt() ->> 'sub'));


-- ------------------------------------------
-- 2. SESSION HISTORY TABLE
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS public.session_history (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    companion_id UUID NOT NULL REFERENCES public.companions(id) ON DELETE CASCADE,
    user_id      TEXT NOT NULL, -- Holds Clerk User ID (plain text)
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable RLS for Session History
ALTER TABLE public.session_history ENABLE ROW LEVEL SECURITY;

-- Session History Policies
CREATE POLICY "Allow users to view their own session history"
    ON public.session_history FOR SELECT
    USING (user_id = (auth.jwt() ->> 'sub'));

CREATE POLICY "Allow users to insert their own session history"
    ON public.session_history FOR INSERT
    WITH CHECK (user_id = (auth.jwt() ->> 'sub'));


-- ------------------------------------------
-- 3. BOOKMARKS TABLE
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS public.bookmarks (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    companion_id UUID NOT NULL REFERENCES public.companions(id) ON DELETE CASCADE,
    user_id      TEXT NOT NULL, -- Holds Clerk User ID (plain text)
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT bookmarks_user_companion_unique UNIQUE (user_id, companion_id)
);

-- Enable RLS for Bookmarks
ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;

-- Bookmarks Policies
CREATE POLICY "Allow users to view their own bookmarks"
    ON public.bookmarks FOR SELECT
    USING (user_id = (auth.jwt() ->> 'sub'));

CREATE POLICY "Allow users to insert their own bookmarks"
    ON public.bookmarks FOR INSERT
    WITH CHECK (user_id = (auth.jwt() ->> 'sub'));

CREATE POLICY "Allow users to delete their own bookmarks"
    ON public.bookmarks FOR DELETE
    USING (user_id = (auth.jwt() ->> 'sub'));
