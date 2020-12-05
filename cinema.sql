PGDMP                         x            cinema    12.4    12.4 ;    H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            K           1262    16420    cinema    DATABASE     �   CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE cinema;
                postgres    false            �            1259    16421    movies    TABLE     �   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying,
    date date,
    description character varying
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    16427    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    202            L           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    203            �            1259    24614    roles    TABLE     {   CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role character varying,
    description character varying
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    24612    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public          postgres    false    214            M           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    213            �            1259    16429 
   screenings    TABLE     �   CREATE TABLE public.screenings (
    screening_id integer NOT NULL,
    movie_id integer NOT NULL,
    seats integer,
    "time" timestamp without time zone
);
    DROP TABLE public.screenings;
       public         heap    postgres    false            �            1259    16432    screenings_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.screenings_movie_id_seq;
       public          postgres    false    204            N           0    0    screenings_movie_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.screenings_movie_id_seq OWNED BY public.screenings.movie_id;
          public          postgres    false    205            �            1259    16434    screenings_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.screenings_screening_id_seq;
       public          postgres    false    204            O           0    0    screenings_screening_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.screenings_screening_id_seq OWNED BY public.screenings.screening_id;
          public          postgres    false    206            �            1259    16436    tickets    TABLE     �   CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    screening_id integer NOT NULL,
    code character varying,
    price double precision
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    16442    tickets_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tickets_screening_id_seq;
       public          postgres    false    207            P           0    0    tickets_screening_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tickets_screening_id_seq OWNED BY public.tickets.screening_id;
          public          postgres    false    208            �            1259    16444    tickets_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tickets_ticket_id_seq;
       public          postgres    false    207            Q           0    0    tickets_ticket_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;
          public          postgres    false    209            �            1259    16446    tickets_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tickets_user_id_seq;
       public          postgres    false    207            R           0    0    tickets_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tickets_user_id_seq OWNED BY public.tickets.user_id;
          public          postgres    false    210            �            1259    16448    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    role_id integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24623    users_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_role_id_seq;
       public          postgres    false    211            S           0    0    users_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users.role_id;
          public          postgres    false    215            �            1259    16454    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    211            T           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    212            �
           2604    16456    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    24617    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    214    213    214            �
           2604    16457    screenings screening_id    DEFAULT     �   ALTER TABLE ONLY public.screenings ALTER COLUMN screening_id SET DEFAULT nextval('public.screenings_screening_id_seq'::regclass);
 F   ALTER TABLE public.screenings ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    206    204            �
           2604    16458    screenings movie_id    DEFAULT     z   ALTER TABLE ONLY public.screenings ALTER COLUMN movie_id SET DEFAULT nextval('public.screenings_movie_id_seq'::regclass);
 B   ALTER TABLE public.screenings ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16459    tickets ticket_id    DEFAULT     v   ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);
 @   ALTER TABLE public.tickets ALTER COLUMN ticket_id DROP DEFAULT;
       public          postgres    false    209    207            �
           2604    16460    tickets user_id    DEFAULT     r   ALTER TABLE ONLY public.tickets ALTER COLUMN user_id SET DEFAULT nextval('public.tickets_user_id_seq'::regclass);
 >   ALTER TABLE public.tickets ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    210    207            �
           2604    16461    tickets screening_id    DEFAULT     |   ALTER TABLE ONLY public.tickets ALTER COLUMN screening_id SET DEFAULT nextval('public.tickets_screening_id_seq'::regclass);
 C   ALTER TABLE public.tickets ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    208    207            �
           2604    16462    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    212    211            �
           2604    24625    users role_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN role_id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    215    211            8          0    16421    movies 
   TABLE DATA           D   COPY public.movies (movie_id, title, date, description) FROM stdin;
    public          postgres    false    202   �A       D          0    24614    roles 
   TABLE DATA           ;   COPY public.roles (role_id, role, description) FROM stdin;
    public          postgres    false    214   �A       :          0    16429 
   screenings 
   TABLE DATA           K   COPY public.screenings (screening_id, movie_id, seats, "time") FROM stdin;
    public          postgres    false    204    B       =          0    16436    tickets 
   TABLE DATA           P   COPY public.tickets (ticket_id, user_id, screening_id, code, price) FROM stdin;
    public          postgres    false    207   fB       A          0    16448    users 
   TABLE DATA           H   COPY public.users (user_id, email, password, name, role_id) FROM stdin;
    public          postgres    false    211   �B       U           0    0    movies_movie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movies_movie_id_seq', 2, true);
          public          postgres    false    203            V           0    0    roles_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_role_id_seq', 2, true);
          public          postgres    false    213            W           0    0    screenings_movie_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.screenings_movie_id_seq', 1, false);
          public          postgres    false    205            X           0    0    screenings_screening_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.screenings_screening_id_seq', 2, true);
          public          postgres    false    206            Y           0    0    tickets_screening_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tickets_screening_id_seq', 1, false);
          public          postgres    false    208            Z           0    0    tickets_ticket_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 1, true);
          public          postgres    false    209            [           0    0    tickets_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tickets_user_id_seq', 1, false);
          public          postgres    false    210            \           0    0    users_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);
          public          postgres    false    215            ]           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    212            �
           2606    16464    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    202            �
           2606    24622    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    214            �
           2606    16466    screenings screenings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_pkey PRIMARY KEY (screening_id);
 D   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_pkey;
       public            postgres    false    204            �
           2606    16468    tickets tickets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    207            �
           2606    16470    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    211            �
           2606    16471 #   screenings screenings_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id) NOT VALID;
 M   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_movie_id_fkey;
       public          postgres    false    204    2733    202            �
           2606    16476 !   tickets tickets_screening_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_screening_id_fkey FOREIGN KEY (screening_id) REFERENCES public.screenings(screening_id) NOT VALID;
 K   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_screening_id_fkey;
       public          postgres    false    2735    204    207            �
           2606    16481    tickets tickets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 F   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_user_id_fkey;
       public          postgres    false    211    2739    207            �
           2606    24633    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    214    2741    211            8   [   x�3�tLI�UH�KQp-K�4202�54 "��/6\�wa���6( �.l���bӅ\F����E�ɉy
�� =����&�1~\1z\\\ ��      D      x�3�LL������2�,-N-�b���� _h`      :   6   x�3�4�45�4202�50�52V04�24�24�2�4�46J�ä��R1z\\\ ' 	�      =      x�3�4�4�LL*�44�3����� %�i      A   K   x�3��,K�sHL*�KJ�L,NLK,N�.-R.I���T��,�4�2�3�)�JLI�tO�KL�T�4����� ��     