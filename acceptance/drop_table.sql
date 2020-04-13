ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
