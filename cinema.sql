PGDMP     $                     y            cinema    12.4    12.4 6    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    32936    cinema    DATABASE     �   CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Bulgarian_Bulgaria.1251' LC_CTYPE = 'Bulgarian_Bulgaria.1251';
    DROP DATABASE cinema;
                postgres    false            �            1259    32937    movies    TABLE     	  CREATE TABLE public.movies (
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
       public         heap    postgres    false            �            1259    32943    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    202            G           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    203            �            1259    32945    roles    TABLE     {   CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role character varying,
    description character varying
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    32951    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public          postgres    false    204            H           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    205            �            1259    32953 
   screenings    TABLE     �   CREATE TABLE public.screenings (
    screening_id integer NOT NULL,
    movie_id integer NOT NULL,
    seats integer,
    "time" timestamp without time zone
);
    DROP TABLE public.screenings;
       public         heap    postgres    false            �            1259    32956    screenings_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.screenings_movie_id_seq;
       public          postgres    false    206            I           0    0    screenings_movie_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.screenings_movie_id_seq OWNED BY public.screenings.movie_id;
          public          postgres    false    207            �            1259    32958    screenings_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.screenings_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.screenings_screening_id_seq;
       public          postgres    false    206            J           0    0    screenings_screening_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.screenings_screening_id_seq OWNED BY public.screenings.screening_id;
          public          postgres    false    208            �            1259    32960    tickets    TABLE     �   CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    screening_id integer NOT NULL,
    code character varying,
    price double precision,
    email character varying
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    32966    tickets_screening_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tickets_screening_id_seq;
       public          postgres    false    209            K           0    0    tickets_screening_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tickets_screening_id_seq OWNED BY public.tickets.screening_id;
          public          postgres    false    210            �            1259    32968    tickets_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tickets_ticket_id_seq;
       public          postgres    false    209            L           0    0    tickets_ticket_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;
          public          postgres    false    211            �            1259    32972    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    role_id integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32978    users_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_role_id_seq;
       public          postgres    false    212            M           0    0    users_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users.role_id;
          public          postgres    false    213            �            1259    32980    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    212            N           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    214            �
           2604    32982    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    32983    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    32984    screenings screening_id    DEFAULT     �   ALTER TABLE ONLY public.screenings ALTER COLUMN screening_id SET DEFAULT nextval('public.screenings_screening_id_seq'::regclass);
 F   ALTER TABLE public.screenings ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    208    206            �
           2604    32985    screenings movie_id    DEFAULT     z   ALTER TABLE ONLY public.screenings ALTER COLUMN movie_id SET DEFAULT nextval('public.screenings_movie_id_seq'::regclass);
 B   ALTER TABLE public.screenings ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    32986    tickets ticket_id    DEFAULT     v   ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);
 @   ALTER TABLE public.tickets ALTER COLUMN ticket_id DROP DEFAULT;
       public          postgres    false    211    209            �
           2604    32988    tickets screening_id    DEFAULT     |   ALTER TABLE ONLY public.tickets ALTER COLUMN screening_id SET DEFAULT nextval('public.tickets_screening_id_seq'::regclass);
 C   ALTER TABLE public.tickets ALTER COLUMN screening_id DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    32989    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    212            �
           2604    32990    users role_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN role_id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    213    212            4          0    32937    movies 
   TABLE DATA           h   COPY public.movies (movie_id, title, date, description, picture, director, actors, country) FROM stdin;
    public          postgres    false    202   ;<       6          0    32945    roles 
   TABLE DATA           ;   COPY public.roles (role_id, role, description) FROM stdin;
    public          postgres    false    204   �]       8          0    32953 
   screenings 
   TABLE DATA           K   COPY public.screenings (screening_id, movie_id, seats, "time") FROM stdin;
    public          postgres    false    206   �]       ;          0    32960    tickets 
   TABLE DATA           N   COPY public.tickets (ticket_id, screening_id, code, price, email) FROM stdin;
    public          postgres    false    209   B_       >          0    32972    users 
   TABLE DATA           H   COPY public.users (user_id, email, password, name, role_id) FROM stdin;
    public          postgres    false    212   �_       O           0    0    movies_movie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movies_movie_id_seq', 6, true);
          public          postgres    false    203            P           0    0    roles_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_role_id_seq', 2, true);
          public          postgres    false    205            Q           0    0    screenings_movie_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.screenings_movie_id_seq', 1, false);
          public          postgres    false    207            R           0    0    screenings_screening_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.screenings_screening_id_seq', 8, true);
          public          postgres    false    208            S           0    0    tickets_screening_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tickets_screening_id_seq', 1, false);
          public          postgres    false    210            T           0    0    tickets_ticket_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 12, true);
          public          postgres    false    211            U           0    0    users_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);
          public          postgres    false    213            V           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    214            �
           2606    32992    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    202            �
           2606    32994    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    204            �
           2606    32996    screenings screenings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_pkey PRIMARY KEY (screening_id);
 D   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_pkey;
       public            postgres    false    206            �
           2606    32998    tickets tickets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    209            �
           2606    33000    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �
           2606    33001 #   screenings screenings_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.screenings
    ADD CONSTRAINT screenings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id) NOT VALID;
 M   ALTER TABLE ONLY public.screenings DROP CONSTRAINT screenings_movie_id_fkey;
       public          postgres    false    206    202    2730            �
           2606    33006 !   tickets tickets_screening_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_screening_id_fkey FOREIGN KEY (screening_id) REFERENCES public.screenings(screening_id) NOT VALID;
 K   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_screening_id_fkey;
       public          postgres    false    2734    206    209            �
           2606    33016    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    212    204    2732            4      x��\Ms�u]E��U�)�,�Y)�rR�J�W.m`�hI�CRN%+`@$�E ���@�eycf���|�,�z��I�=��ׯ �T�ș���q��{_/����gk��7�����^��������VV}U��*�����2����,��>�T����{�b�3�f���E�*�iV=�z�(�7�m̻����'���O����/#��rf�/����1��{�w|�(��~�w���U_�/6�0�r~�_����eV���M��o���%qb�I��pa�F��4��:Š��ۮ���S���ᇽ�����S������NV��¼�f�)�«�a���0���m��oN�0��Fm�Ϸl�;�3{�Ėx�Vb`3O�f�h�d��7�;XU-p���A��z��N�~h�Q�^��R�6C[����˰Ca�_$����0��Зq#�2���!G�'X�5,b��(��"�Ls�0�6M4��	���3N��������!��v�gK������)?��W%���7;\��g�����>j�\7��y��&a����Gbg�!m�����:|��:�!������aV���W`W��=�؋�|�Z���j����O����ԕ+�`��h�l�� <@��5����>da�º�F�a��u�#���/��-��q�f,&�ю-��k�� ��~x$<�Z݉];�i7|�~k�ٖ��}6�U���`C�d׆n�M?Ŭd�fU9p�+3Ô�ؗ[�hJaj�r{��V�h��ȵ�𑱡(,>|�FX3���']�)�!�C�{p��x�!Β���#lgWnn+����y%���Þ4�_�o�~�Dϣ!	SݧK���fa�3�����E1�h��xU�[n���,hD#s�sv�V�g�x����Z��.)����T9�L�{q.`h�q�Q�Mgf�����F�	�����M{h�~���A�Q������A/�R���E|��]������M9�o�Cv��ۛ���__��ڧ���V�,���|e�ʛ�z�b{'��xD�����d$��C�HFp$˱A,��[t�8���m}��(ו��E���/�WFl�܀AGa�Ƽ3�l�~	���Y�g�����c����w�VQ��+Ew�2!4\ZG�(\���w��(~�������&sC7�`�h�>�w��pdK�k�D�����w?�`��q�c�i'@#lc?�Vu��w�s6��bP�]^{Ҕ����.aK����ı��F{���"�e�G������Ƣ��\�yٌ���>�&���>O�v'��vJ��i+�a9��`Q3q�P��v��#]�KW5��.Fj�:��^H���MX�'���"��������UV�4c4�k��K�W����  0�0�)��&��K��ݾǝl7Ƅ��I��	0�]��_�o�����m���	��܃�uyA��;�xd�@��xV� ~<aX~���ل��[�_~���b��Zv�߲����o^���-C�w�� {˖�T6������R}�;?�n��_�<�2�65�5�L��m\��f�q�Hs�!��a,�{?��g�?[(<� 6s���i������\��k"�F`=�"� ���I��0����+��h ��r*��Ȩ4��p� ��1ߑ��%ҹG�Q3����em�A�a�wDZ��d�|Z��M�5i5B�c@BH�H� �n�2�$/|�iZ<��ͨ��]a��� �2CP��GhjPWCp�{L�7�c�o�r�ca�f�i��	P�yj�1��p�ծ��Z���`�'6�1M�ߓ�X�W��`�e֑��)/3
8��h�I<B�����2� o�N�`U�Ύ�G]��K?#���M��C̷��Y�T!ܜ��i�b�����((�`��P��{t�:��ƛ.��(�E:�~	J �̤E��G�O�͛G���m�*�Z�İl�����!���!������M�e��"���#��;
��&?��n��̟� .����k�?������e�������𿛿���!7��0L���f�����!�1��#[�Vr"��:���~�?�cW�P0�{��R�ɜ:�t rp��
7,���.���e@��3�XX�#x�S��0�|����=g�es��0sۧ��3���)��(�Y�P��Lo���=�N�7�eLV�|�H<��E^o:�����!	u��@���}H ��5��r�HI`{t#���gW.�{5b����$y����0	K�k�t��=��Z���C�-�oy�1|90"�1����)�����~�z��?_7+׬|e�r,#̛Ka���Q�FnV��NcA]>��Ij���S/�d���������.oK�9Q9uO$��RDj����?���R��dX�UREU.]pP�&5�2��~��3�F3�<����)�$"�۔���Y(��9��VL��S_�@�ԀgY�v�3K�Չ���ͥ�>FB�:r"d{�R�i���%�m����e<�zE�f�!�5�^S4��WJ��Ŷӽ���PJ�@y�k�}�ꇁ2���W���³祅[t�z��,1B�	��u�b>;���Ҧ�Z�OI0�Gp�;�|�J���옏�t���!,�g��"��0 ���^TPn
�I��J�`����K)�7ڕN�����R��g�0����m55�:M�Cj\]��#\�<�#x�E���U��G�! �`!}I}9R�����7���'0����/�3L5M^�ݞ�]�FC�!�`�O%����0e���␸.��wښ(5pdI�r���=P�z*3��#���|�FѬ�#U:��D���ʖ��~��C I2Z�41-]��8��m���qi�xYD;s�B���ꄏBX܈%��������$�'J�
�gj3l�BYB`��+��Ѝɥ�Y��@�Z�YF����%ܛ��%�A�+V/��)��IDǜ�B�0� u��<����C\1�jA���U[t��+W�������k�����X��9YaM�^Y���tk7<�E�� O����B!X�[��m+<L�Y���Rɽ��Z�_�<��I�b��^�`�D�:� ;�FW�8e	7��ǐis$�6�v"$���L&\�>0�<u�T��H�<�0�P�d��@*!!�7e��,T��2A6��I¹��J��ڢ�g�
8��	��bf��h-,�Cm��_,.������E{�k�5�C��L�h�,`�6hYl54 �ư�$����J�,�e��-.h/�w�`���#8>���O�ƿ�z��Ya��v�W�,6��?*'�x-�����m�RYgb`QF�H�8>�C�Ŋ�S�HH�_���	���7���:F��"H�Y,���1!z�	�'ƨ�F���*������H�þ�us5�fk�@y�NJ�(?�`E>GZ�~l����9s����e�G��L����rT��'�zj�
~8��KZx!h�g���M��#�,ٝ�lHq*�,
�R���L��;��P�u���w:�71:�*����Z��w��B	ͱ�;��7(MXY���K��@:����zЉb79�b�������mދ��y�:�/&$)��]VG�����J���O�8�n��Nc��ǐW�6�d��ժK����ֻÍU�����N+L?���Ȕ��Xɢ��-+��;���U���� ��ך\H˹�x���OB�K�͒��wGM_CF����#<�8�W$�Iz�6f�S۳ʓ����G6F̜��?H2�='/�@���F��.+g��N��7n��t��k�&�0Ō�5S��O)�6U����M0�D��(����$�%�h�?�N�Ź�+b�&ߴ����t��������zJ��t���)dl�*ҍ�Sң�p��{ܭ����/v�=����ir��+Y�^�� ~E��6�i�ϊ��'|�f�
�5`Y̪qN����d=3����� �]�7oH�8�A�6�\�e[�#�    Yk�n���V6���\��P9u�f� p~������9��V�����W}�?�g�z�7�DS��jR�ĐL�P�ޡ`8&�u�׫�o_�[�w��d`O^�Ǣ����]�����?�l���ߺ����e���k�/ß�q���H]�.���Ӻ�k�Z�f�Q2;�3����Yf��kM^�o������psm�����?���S2�;���İ�r�D��֮ô2&=,N@�\£�=m-d2���1D}Q_!J�����p
/��� ޳����l7<��=#�p�3���t��br��:�Vo�]��ѕ�g��5��+<�Q|dP��S��T����I�S/�D2X+J�(U�� �˰���Ba��YІO=�ycF��$S�Vu��/�GܑN�=����z�w��ܠ�&;����E�b�4P�l*��d�i��o���X6�)��e |�c��̰��g ��*��O	�0卩7��K�,�S���Ƭ��!��^�i;l�Kͩ��Vpj�41�"P�2|�^�I��5��V�օW��1%;c�ôĺ�u[T�H�]T~�;k\��q���{����(�$ߓǾݲѥ&̎JQ�w���tucz]B�V��F�w.�p�I �<�����'Z�QΣ�\g/��`lW�H����KA dsg����&�82`�`k;8y���ڵ�Z�}�>ɲe���[��>a�W�������!t��^og��ҮCܸ���1�u�����H}T=��(���Vj��A�Z=@�솞�����$4�DE-�.�Լ(XY��>��^؉�(<r�R����:$rzٛj�o].�E9I�������DJ*������U�ҘEQ���X_��y��vW����}
a0s�&^��`b��� ��x��='�)L@0�5_�Y��0vmcfu4�ʬ%	�L�R����5TGi8rC����μ����]�m����̃�rxs}�a��w[%�&������u�[f�a�.r�y줳TSXt��.�g�N���՛�^���+��KㆬC�ǘ)��z-t�}%�a�T'�%�TiR4ө_��»�g;��6�@O]�3����NJ}d�*�F�ô���T����MkB+2v*n�Dk�~e�jV�-��~�Nj���8R�S&�ft;e���DNI�@"��w֘�zݝ׋ ;�ܼ%���z�r1�$.e\�����uV�+����k�K��Y[��{�}�v��T�Uz AbCX|+^����ݺ�J��Q�#�Y�&DLZh�f�����񪠏9�o��n�in��Pd!4XV	�� �}�hR���[|��O1e�ߘ���8����ʳ���#g!X!��������Y9<��-�;�(�d�ݖ�u�����b��$3��'�-�2��kF�t�%��d�f��ӎ
��J�%l ��D��c���~�'�`C��c��8�/��d��ybl^l,���)#�1�s��A%����	�<����>LGk����w�m2@���x�Sk(p�g��TRX'+�H��,�x�SS�Xn�h(l�+�o�P���K��Q�*{�\r�Rr�U��&�yRۋG)�ԎU�is��_�����������?�rJ�5? p�����!9n��.�Vg��L��%�p����0�[P�ix�E2��F	㶎#��������3۞��h9H�:&����
n�֭�W?�����k�>�����۷[g<��~��@���Ȱ��4�����`Dc����X��|f�hY�?]5K�����a�5S�.����k�rvBN>u�7۟?�s�ƴ����#�ࠏ����V,�j ɷ,y���2�M�1��.}�ίmjv=�����K�mf�<P7�O��n8v!�%�Ol�k�-�r��~�+�/Cf�6mA�VT\��� թ�d=6e�|�]��ris�4�3Sr.C���<�@�>�Se�_��ţ�[���������F���@�\�qηZ���~��}H4��i}����k7�QO�s����Z��~F��
sd��Q��������v��N(�%I���A����]_x�1�y��Rx��T�!��~ �����2�,��u�̒�V��K�M��ld*�^��
�u��<�ێğ�2���y[S����!A74ߐ�`�!�|�__���\e:�����D�D)v*'��<E^�ǃj��Lp�]�?��S�:���#��.B�X
j�$�O����ز�I���ͮ�K\6h.�K�̷�DФ~G������JG�@�c(i�ܤ�
���z�8�_�1���N%}_���K5%S��FT��=?)�v��#	X�-�U�-b���L��dʂp�W��ǽ�M���FR<p�k�μm�Y�ë0_���*�sY�Ɗ��L�t�H�������� yhͳȥ-'����s �{?����Y�=�^�S�u��� �;ژ�@#�;Zq91�X��m�^aaǨ�ᬷ���g����^p�LH��!M+cgD�
�8�7?�A'.٩�g�s��d-fQ�I>{+,�h;����U�y7��߮��IMf�9<��.�t�����i�}1�����{���NK{	��*w���z��L���8e�bt���w�Q&�J	7�X�7����q�:Q��	2�����^#�bө;�����ڇ��I߅�O��;Z%����R�Ǎz ��4��#���vatP�U�"�{Z����Uw�#�f>G����y[�󥨲�%�����\VZ�j� �؉i<0�V7�g؏�ZTYW��)��E������g2�n��*w*U7]������>�}5	��� ����-6�gԶ�p�Nc?�y/�D(����'�Ʀq,ud��?`]9Į��/���e\��C=6)(�10�S(���I�"��Q͒��9�1���ldc֭]1׽�������0x��b|�Q�\���m �)i�b�Q)���T+q�
.=tu�2�F�����d���\K6������X�����t���G�X��.�W��` �E�P>�����a3���j[�kX�R\�y@�rN/,pf�J�u���|KV���솇>����r�߆���`�]M��B��f�����湪4��Ӯ�ODl�Ȫ;j����l��{$�������v�D��'�7?�}���K��2�V�Ś�}x״�g3�LYl�V:�����n��6ZFʣF����ދ_E�W�E_VJ�?����2h�:�\�Y�� :�Ė�f�_��v#�#v��ElZ�`>�����U�C9�{-P®�u;ئ�*Wq�j
��� �#�o�m��w��w.�i�?��9�ׯ# �ڋ8�b�)���m~p�$����Ml�b]���ɒ���{��I��ul�IK-<�U՝�?O=SOz8�U��:*���t�ۥp�o*5�M�H������G�S�)�*g$>'*�E�����H||��
k�Q��ە�.��(�AN�7{8!����G��	IC�T�i��Z .��bk�IC6 �E�/�j�e=�^���=X�Nk�����N�ޡOh D-�2�+`R�Y
�b��i��<�Eq,����PK���zv�����G��?������{�r�{��VÌg,R{��\/�'�y�W�S�N���S�Q����»��~�:����GwV�Ex�i���$��b��EC��x�,)9t��Ur���h�d��7�35Lj���ZM�R?/�O���t\�%B��s���b���R�Ɛ�ӵ=7^'��ŕΉ��PB�^��V�aX�5$6
+���N��k�LT�:�՛�)�ϓ�G*LZ~,J���h�r���'�0��
��j����,��F��1)~R* �D3SA$�/]@"��aď=c{~K{�� 
���t�q��=&������:��?���4�]%��z���S�l�X8_o��lm�U�s��[b�B=y�Ê�
^kF����Q�7c�r�Z/Io�D�-_}����ǫ-�*k�7f���m}�o!N�"�u��n��>�Ah��c�U�Uڙ5�Ĺ�yZ�MX�������9ӀӷQ} D  MQ��k�f�EfM��%Vd���ʉLB�����"U��,-y1ز�T�:����I)��uv��f���y�5y֙�����rt�?�FB\�(���0wN�>\�w�v��X v�[��<R�)S��F�dM���g��;ٝN'�"�N~@J�96jC��/��.�Ex��ѵ�:�s�bh�8�:;מ��/��x�0��kV@�*^�W�j�{����1�4����,8��ȡ.�c5i+�a4���zOܫP�/a�ƣPx����9+\zy	���OL)����W��3^���~�N���O���c�K�"�]�$6��:�.]�_ec�$      6      x�3�LL������2�,-N-�b���� _h`      8   j  x�]�ە� ���X��rA�Z��:6a'�:߉�J�Z�
���F~���� C�K��rUh�T�	�w���蹩|� �i�B�ދ��3���SM3����j4 ��ѭ���h��9c{��S�3�֌�(���v�qc�V�v��-W�z��m�#c�v�9��9w�\����Z��^���9�c���9o%��lm����1R���[i;w�,B;p����K9��b��\�v���\�i��\���s}z-��I�s{N\�s{F�ܞy�� 	�V�-HB����Bv�'F������z��ˡ�z�ڹd���&k7;����󗭺���MVo�%�����+w{����u����W�      ;   �   x�u�11E�zf/́ :b&�����{]�}���Y���ċ ��������n��>�k�F��|섋;���
�t�0/N���,%8-޲z����u�+#r�:��޾�Mɠu*��~g_5�^�Ԝ�ߏ}�?� @y      >   K   x�3��,K�sHL*�KJ�L,NLK,N�.-R.I���T��,�4�2�3�)�JLI�tO�KL�T�4����� ��     