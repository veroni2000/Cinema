PGDMP         ;                 y            cinema    12.4    12.4 ;    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    32861    cinema    DATABASE     �   CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Bulgarian_Bulgaria.1251' LC_CTYPE = 'Bulgarian_Bulgaria.1251';
    DROP DATABASE cinema;
                postgres    false            �            1259    32862    movies    TABLE     	  CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying,
    date date,
    description character varying,
    picture character varying,
    director character varying,
    actors character varying,
    country character varying
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    32868    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    202            M           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    203            �            1259    32870    roles    TABLE     {   CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role character varying,
    description character varying
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    32876    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public          postgres    false    204            N           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    205            �            1259    32878 
   screenings    TABLE     �   CREATE TABLE public.screenings (
    screening_id integer NOT NULL,
    movie_id integer NOT NULL,
    seats integer,
    "time" timestamp without time zone
);
    DROP TABLE public.screenings;
       public         heap    postgres    false            �            1259    32881    screenings_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.screenings_movie_id_seq;
       public          postgres    false    206            O           0    0    screenings_movie_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.screenings_movie_id_seq OWNED BY public.screenings.movie_id;
          public          postgres    false    207            �            1259    32883    screenings_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.screenings_screening_id_seq;
       public          postgres    false    206            P           0    0    screenings_screening_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.screenings_screening_id_seq OWNED BY public.screenings.screening_id;
          public          postgres    false    208            �            1259    32885    tickets    TABLE     �   CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    screening_id integer NOT NULL,
    code character varying,
    price double precision
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    32891    tickets_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tickets_screening_id_seq;
       public          postgres    false    209            Q           0    0    tickets_screening_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tickets_screening_id_seq OWNED BY public.tickets.screening_id;
          public          postgres    false    210            �            1259    32893    tickets_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tickets_ticket_id_seq;
       public          postgres    false    209            R           0    0    tickets_ticket_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;
          public          postgres    false    211            �            1259    32895    tickets_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tickets_user_id_seq;
       public          postgres    false    209            S           0    0    tickets_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tickets_user_id_seq OWNED BY public.tickets.user_id;
          public          postgres    false    212            �            1259    32897    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    role_id integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32903    users_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_role_id_seq;
       public          postgres    false    213            T           0    0    users_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users.role_id;
          public          postgres    false    214            �            1259    32905    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    213            U           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    215            �
           2604    32907    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    32908    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    32909    screenings screening_id    DEFAULT     �   ALTER TABLE ONLY public.screenings ALTER COLUMN screening_id SET DEFAULT nextval('public.screenings_screening_id_seq'::regclass);
 F   ALTER TABLE public.screenings ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    208    206            �
           2604    32910    screenings movie_id    DEFAULT     z   ALTER TABLE ONLY public.screenings ALTER COLUMN movie_id SET DEFAULT nextval('public.screenings_movie_id_seq'::regclass);
 B   ALTER TABLE public.screenings ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    32911    tickets ticket_id    DEFAULT     v   ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);
 @   ALTER TABLE public.tickets ALTER COLUMN ticket_id DROP DEFAULT;
       public          postgres    false    211    209            �
           2604    32912    tickets user_id    DEFAULT     r   ALTER TABLE ONLY public.tickets ALTER COLUMN user_id SET DEFAULT nextval('public.tickets_user_id_seq'::regclass);
 >   ALTER TABLE public.tickets ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    212    209            �
           2604    32913    tickets screening_id    DEFAULT     |   ALTER TABLE ONLY public.tickets ALTER COLUMN screening_id SET DEFAULT nextval('public.tickets_screening_id_seq'::regclass);
 C   ALTER TABLE public.tickets ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    32914    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    213            �
           2604    32915    users role_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN role_id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    214    213            9          0    32862    movies 
   TABLE DATA           h   COPY public.movies (movie_id, title, date, description, picture, director, actors, country) FROM stdin;
    public          postgres    false    202   B       ;          0    32870    roles 
   TABLE DATA           ;   COPY public.roles (role_id, role, description) FROM stdin;
    public          postgres    false    204   �L       =          0    32878 
   screenings 
   TABLE DATA           K   COPY public.screenings (screening_id, movie_id, seats, "time") FROM stdin;
    public          postgres    false    206   �L       @          0    32885    tickets 
   TABLE DATA           P   COPY public.tickets (ticket_id, user_id, screening_id, code, price) FROM stdin;
    public          postgres    false    209   8M       D          0    32897    users 
   TABLE DATA           H   COPY public.users (user_id, email, password, name, role_id) FROM stdin;
    public          postgres    false    213   dM       V           0    0    movies_movie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movies_movie_id_seq', 6, true);
          public          postgres    false    203            W           0    0    roles_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_role_id_seq', 2, true);
          public          postgres    false    205            X           0    0    screenings_movie_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.screenings_movie_id_seq', 1, false);
          public          postgres    false    207            Y           0    0    screenings_screening_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.screenings_screening_id_seq', 7, true);
          public          postgres    false    208            Z           0    0    tickets_screening_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tickets_screening_id_seq', 1, false);
          public          postgres    false    210            [           0    0    tickets_ticket_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 1, true);
          public          postgres    false    211            \           0    0    tickets_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tickets_user_id_seq', 1, false);
          public          postgres    false    212            ]           0    0    users_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);
          public          postgres    false    214            ^           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    215            �
           2606    32917    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    202            �
           2606    32919    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    204            �
           2606    32921    screenings screenings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_pkey PRIMARY KEY (screening_id);
 D   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_pkey;
       public            postgres    false    206            �
           2606    32923    tickets tickets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    209            �
           2606    32925    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    213            �
           2606    32926 #   screenings screenings_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id) NOT VALID;
 M   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_movie_id_fkey;
       public          postgres    false    202    206    2734            �
           2606    32931 !   tickets tickets_screening_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_screening_id_fkey FOREIGN KEY (screening_id) REFERENCES public.screenings(screening_id) NOT VALID;
 K   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_screening_id_fkey;
       public          postgres    false    2738    206    209            �
           2606    32936    tickets tickets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 F   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_user_id_fkey;
       public          postgres    false    213    2742    209            �
           2606    32941    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    213    2736    204            9   k
  x��X�r�]�_1ZŪP$�8qvڸR�e�ԆqG)�J��ER� %����m�Q�W��� 3���_ȗ�sn ��S��(r���>�=���h������ֽ�;ۍ�O?]oml�6>i$�!M�8�B�_�PVG��صg�0��ɪ��"�zU7	��b�P$�<�!�S{�[u�gU'�ȟ�xj��g�K��7,��4�s��w:>�=��o[�N�s|�gf�AY��Y���I��~3�}��q܊Kj����`q3q���F�m�q��E[6����4\"6�[���άzI�����,\���a��m��	z����eb��a5�Ww;��i3��:�Hᡝ�M�=ɹz��1���~�y��~���=[?B>2�zj�,�!�da���!��%���!C/G1����ؼ-���m9a<�51g*�����0b�f�5�	\�ȝ0��M�0c^dRi�f�V�� k��B�xU2�aV�����������E�P�d��of�?�v�D��q.��P4�kQm�N�;� ܤ�s|���,RO��-�1��ôf�p��k�Ku�l�R7Q���Â��%4�l�������@5�C˒��0o �Łv���kr�8G�`��^b����Z,�?��0�#Y17��	��	��a�'Dk��Xn_V_%�ﬓ���]�k�N�#��Ǻ3��e^&�Z%sM)���-0�Lq�6�P��,J�ۃ3�l�F�,����n

� �x��@!�ή��m��#�ג���}`9Y�#_^��+ug'����sj��R41����-t֍%�%5g���4<ԪT)R͘)3�r���G�SDq�-E�z�d�XR��F��rג���?�sơ�,٢������k��6�MUc_���X��J��g�׌��`����������(�A<�q�5���}�����x�#�}ܸ������{�����Z���+�0����x�fvp�	��I���}G�x��te���ٻw^��*��;�I#ŗ�+9�-�F�[��ڙ͈���GNB<$a&�6h�MpD�1t:Q��|�����]�J5�n�,	�62A��%�rd:�}��v�TUl\5�#L� �L�O��*3�J���	
��#�~����'7��t@9�8H��.���:g7jT��ƋJ*�,��m��d�Dj�m}m��m�Pm��O1̃�Jl���D��<P��*����|3���T�&䉜�/D7$2O����C�������[�-v�ܗ��Q�a{LK�i{Q�b�����p�ْ�Q�P�x�/���U^��\��2o��v�`J�l)ԍ��߈�}�L6Wl�~RMi�y�<�K�[#~� ��5ѮE��^~M�u��^��"�S�K�`B���$�Ǚ��?	����[����v��֣����G����?����nDva,}��� U�G�v>a6�����3���iů=��۽�x;�S���=5�B>��C3����=a�(-@�Lj0!NC��$8r
�s	0'������r����	��T��C�8�JG4�P�,\zg�1eJ:����N`T=����DwN5�~���>K��L� J��h����2L"&ʅh� �HDɴt@���]F��j��y{�l����������	�~ȜM��_SӊtEbY>Հ�4�.�1�-c,{m�q��j��j姨fIq�	1��ڍjyq9@��0�3X1��I����d����]�R���u-CT�7����~&6�'�SR������q����A�Fu�9�2�C�~.;^xVH�[�G(Mchj*���X���g[����������6YH��t���𡛮q�%�u}�~K,A&�]���z�3;՜�uSi�zW3YA��Y0�T,o�����^O�ÿ�:���=��t��v���bF)ߚ҇8�����L���Ư��|��˭�_$��_o�`�����/w?���fcӎ��΍�H�8����;���b̝�sD �U�_��'�!-P�����fI9v�fȠ��|S�lBQۧC�x�#�↥xǲ$�����D;j&>c1�}V�L.�(��;�K�=p˼��j�9F�2�;���2����a0�o��@U��ty��g�e��_�R�Q�N��S�ϴ���\��C	�1���$�9�{ �#�6�H-pf�%	��P~�?�^��U�)�T�׌CrN������0��p�Y[e��Y.S�:�� I�2���B��BH=�K�Xq$��L+�;;k�4n���9��(��h،��ײ�S%��)��a8���Nu���*��6F��\%�t2��;��_�L|�,b%��ޒ��@3ـ?�x��k��B;�JݢP*�����7���>�YS]���h��#ꗑ�b�{K��S>���%�:�.���ca�ы�f�O^5�,mGq��X����|i.�]�D���G͢������{�]�Sޞԗ֫��+�B�5�
#H��M�+��(�&_��)a�Ƌ�Q��G&�v���o��8�D]�ŋ-��"q�)��Z\��:X�(����k��x�Y�K.Д��u>��PW�B���F�p'L[��0�� �L`)��zAd�נ
]7X3)�TU�d\X���;җ�@�4nt��4�xy7��5�S0aP��ڝ���� ��      ;      x�3�LL������2�,-N-�b���� _h`      =   f   x�U���0C�3=�H R��h��?G Aܫ>(BH�L܌�ӋVd8>�E�ˬ%s��������K��n�ZQ��#1�������/�.U�E߽��x� �      @      x�3�4�4�LL*�44�3����� %�i      D   K   x�3��,K�sHL*�KJ�L,NLK,N�.-R.I���T��,�4�2�3�)�JLI�tO�KL�T�4����� ��     