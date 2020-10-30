PGDMP                      	    x            cinema    12.4    12.4 /    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16434    cinema    DATABASE     �   CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Bulgarian_Bulgaria.1251' LC_CTYPE = 'Bulgarian_Bulgaria.1251';
    DROP DATABASE cinema;
                postgres    false            �            1259    16448    movies    TABLE     j   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying,
    date date
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    16446    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    205            ;           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    204            �            1259    16461 
   screenings    TABLE     �   CREATE TABLE public.screenings (
    screening_id integer NOT NULL,
    movie_id integer NOT NULL,
    seats integer,
    "time" timestamp without time zone
);
    DROP TABLE public.screenings;
       public         heap    postgres    false            �            1259    16459    screenings_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.screenings_movie_id_seq;
       public          postgres    false    208            <           0    0    screenings_movie_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.screenings_movie_id_seq OWNED BY public.screenings.movie_id;
          public          postgres    false    207            �            1259    16457    screenings_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.screenings_screening_id_seq;
       public          postgres    false    208            =           0    0    screenings_screening_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.screenings_screening_id_seq OWNED BY public.screenings.screening_id;
          public          postgres    false    206            �            1259    16474    tickets    TABLE     �   CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    screening_id integer NOT NULL,
    code character varying
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    16472    tickets_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tickets_screening_id_seq;
       public          postgres    false    212            >           0    0    tickets_screening_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tickets_screening_id_seq OWNED BY public.tickets.screening_id;
          public          postgres    false    211            �            1259    16468    tickets_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tickets_ticket_id_seq;
       public          postgres    false    212            ?           0    0    tickets_ticket_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;
          public          postgres    false    209            �            1259    16470    tickets_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tickets_user_id_seq;
       public          postgres    false    212            @           0    0    tickets_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tickets_user_id_seq OWNED BY public.tickets.user_id;
          public          postgres    false    210            �            1259    16437    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    role character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16435    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    203            A           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    202            �
           2604    16451    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    16464    screenings screening_id    DEFAULT     �   ALTER TABLE ONLY public.screenings ALTER COLUMN screening_id SET DEFAULT nextval('public.screenings_screening_id_seq'::regclass);
 F   ALTER TABLE public.screenings ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    208    206    208            �
           2604    16465    screenings movie_id    DEFAULT     z   ALTER TABLE ONLY public.screenings ALTER COLUMN movie_id SET DEFAULT nextval('public.screenings_movie_id_seq'::regclass);
 B   ALTER TABLE public.screenings ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    16477    tickets ticket_id    DEFAULT     v   ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);
 @   ALTER TABLE public.tickets ALTER COLUMN ticket_id DROP DEFAULT;
       public          postgres    false    212    209    212            �
           2604    16478    tickets user_id    DEFAULT     r   ALTER TABLE ONLY public.tickets ALTER COLUMN user_id SET DEFAULT nextval('public.tickets_user_id_seq'::regclass);
 >   ALTER TABLE public.tickets ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    212    210    212            �
           2604    16479    tickets screening_id    DEFAULT     |   ALTER TABLE ONLY public.tickets ALTER COLUMN screening_id SET DEFAULT nextval('public.tickets_screening_id_seq'::regclass);
 C   ALTER TABLE public.tickets ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    211    212    212            �
           2604    16440    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    203    202    203            -          0    16448    movies 
   TABLE DATA           7   COPY public.movies (movie_id, title, date) FROM stdin;
    public          postgres    false    205   E4       0          0    16461 
   screenings 
   TABLE DATA           K   COPY public.screenings (screening_id, movie_id, seats, "time") FROM stdin;
    public          postgres    false    208   b4       4          0    16474    tickets 
   TABLE DATA           I   COPY public.tickets (ticket_id, user_id, screening_id, code) FROM stdin;
    public          postgres    false    212   4       +          0    16437    users 
   TABLE DATA           E   COPY public.users (user_id, email, password, name, role) FROM stdin;
    public          postgres    false    203   �4       B           0    0    movies_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_movie_id_seq', 1, false);
          public          postgres    false    204            C           0    0    screenings_movie_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.screenings_movie_id_seq', 1, false);
          public          postgres    false    207            D           0    0    screenings_screening_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.screenings_screening_id_seq', 1, false);
          public          postgres    false    206            E           0    0    tickets_screening_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tickets_screening_id_seq', 1, false);
          public          postgres    false    211            F           0    0    tickets_ticket_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 1, false);
          public          postgres    false    209            G           0    0    tickets_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tickets_user_id_seq', 1, false);
          public          postgres    false    210            H           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    202            �
           2606    16456    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    205            �
           2606    16467    screenings screenings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_pkey PRIMARY KEY (screening_id);
 D   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_pkey;
       public            postgres    false    208            �
           2606    16484    tickets tickets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    212            �
           2606    16445    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �
           2606    16495 #   screenings screenings_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id) NOT VALID;
 M   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_movie_id_fkey;
       public          postgres    false    2724    208    205            �
           2606    16490 !   tickets tickets_screening_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_screening_id_fkey FOREIGN KEY (screening_id) REFERENCES public.screenings(screening_id) NOT VALID;
 K   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_screening_id_fkey;
       public          postgres    false    2726    208    212            �
           2606    16485    tickets tickets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 F   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_user_id_fkey;
       public          postgres    false    212    2722    203            -      x������ � �      0      x������ � �      4      x������ � �      +      x������ � �     