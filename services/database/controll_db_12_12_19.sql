PGDMP     "                    w            controll_db     11.6 (Ubuntu 11.6-1.pgdg19.04+1)     12.1 (Ubuntu 12.1-1.pgdg19.04+1) �    h           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            i           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            j           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            k           1262    24602    controll_db    DATABASE     }   CREATE DATABASE controll_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE controll_db;
                kaspary    false            �            1259    24603 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public            kaspary    false            �            1259    24606    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          kaspary    false    196            l           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          kaspary    false    197            �            1259    24608    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public            kaspary    false            �            1259    24611    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          kaspary    false    198            m           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          kaspary    false    199            �            1259    24613    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public            kaspary    false            �            1259    24616    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          kaspary    false    200            n           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          kaspary    false    201            �            1259    24618 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public            kaspary    false            �            1259    24624    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public            kaspary    false            �            1259    24627    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          kaspary    false    203            o           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          kaspary    false    204            �            1259    24629    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          kaspary    false    202            p           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          kaspary    false    205            �            1259    24631    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public            kaspary    false            �            1259    24634 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          kaspary    false    206            q           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          kaspary    false    207            �            1259    24636    core_systemuser    TABLE     "  CREATE TABLE public.core_systemuser (
    id integer NOT NULL,
    first_name character varying(300) NOT NULL,
    last_name character varying(300) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.core_systemuser;
       public            kaspary    false            �            1259    24642    core_systemuser_earnings    TABLE     �   CREATE TABLE public.core_systemuser_earnings (
    id integer NOT NULL,
    systemuser_id integer NOT NULL,
    earnings_id integer NOT NULL
);
 ,   DROP TABLE public.core_systemuser_earnings;
       public            kaspary    false            �            1259    24645    core_systemuser_earnings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_systemuser_earnings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.core_systemuser_earnings_id_seq;
       public          kaspary    false    209            r           0    0    core_systemuser_earnings_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.core_systemuser_earnings_id_seq OWNED BY public.core_systemuser_earnings.id;
          public          kaspary    false    210            �            1259    24647    core_systemuser_expense    TABLE     �   CREATE TABLE public.core_systemuser_expense (
    id integer NOT NULL,
    systemuser_id integer NOT NULL,
    expense_id integer NOT NULL
);
 +   DROP TABLE public.core_systemuser_expense;
       public            kaspary    false            �            1259    24650     core_systemuser_expense_category    TABLE     �   CREATE TABLE public.core_systemuser_expense_category (
    id integer NOT NULL,
    systemuser_id integer NOT NULL,
    expensescategory_id integer NOT NULL
);
 4   DROP TABLE public.core_systemuser_expense_category;
       public            kaspary    false            �            1259    24653 '   core_systemuser_expense_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_systemuser_expense_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.core_systemuser_expense_category_id_seq;
       public          kaspary    false    212            s           0    0 '   core_systemuser_expense_category_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.core_systemuser_expense_category_id_seq OWNED BY public.core_systemuser_expense_category.id;
          public          kaspary    false    213            �            1259    24655    core_systemuser_expense_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_systemuser_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_systemuser_expense_id_seq;
       public          kaspary    false    211            t           0    0    core_systemuser_expense_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_systemuser_expense_id_seq OWNED BY public.core_systemuser_expense.id;
          public          kaspary    false    214            �            1259    24657    core_systemuser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_systemuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_systemuser_id_seq;
       public          kaspary    false    208            u           0    0    core_systemuser_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_systemuser_id_seq OWNED BY public.core_systemuser.id;
          public          kaspary    false    215            �            1259    24659    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public            kaspary    false            �            1259    24666    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          kaspary    false    216            v           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          kaspary    false    217            �            1259    24668    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public            kaspary    false            �            1259    24671    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          kaspary    false    218            w           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          kaspary    false    219            �            1259    24673    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public            kaspary    false            �            1259    24679    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          kaspary    false    220            x           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          kaspary    false    221            �            1259    24681    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public            kaspary    false            �            1259    24687    finances_earnings    TABLE     o  CREATE TABLE public.finances_earnings (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(300) NOT NULL,
    value double precision NOT NULL,
    date timestamp with time zone NOT NULL,
    fixed boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.finances_earnings;
       public            kaspary    false            �            1259    24690    finances_earnings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.finances_earnings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.finances_earnings_id_seq;
       public          kaspary    false    223            y           0    0    finances_earnings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.finances_earnings_id_seq OWNED BY public.finances_earnings.id;
          public          kaspary    false    224            �            1259    24692    finances_expense    TABLE     �  CREATE TABLE public.finances_expense (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(300) NOT NULL,
    value double precision NOT NULL,
    date timestamp with time zone NOT NULL,
    fixed boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer
);
 $   DROP TABLE public.finances_expense;
       public            kaspary    false            �            1259    24695    finances_expense_id_seq    SEQUENCE     �   CREATE SEQUENCE public.finances_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.finances_expense_id_seq;
       public          kaspary    false    225            z           0    0    finances_expense_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.finances_expense_id_seq OWNED BY public.finances_expense.id;
          public          kaspary    false    226            �            1259    24697    finances_expensescategory    TABLE     
  CREATE TABLE public.finances_expensescategory (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(300) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
 -   DROP TABLE public.finances_expensescategory;
       public            kaspary    false            �            1259    24700     finances_expensescategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.finances_expensescategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.finances_expensescategory_id_seq;
       public          kaspary    false    227            {           0    0     finances_expensescategory_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.finances_expensescategory_id_seq OWNED BY public.finances_expensescategory.id;
          public          kaspary    false    228            ^           2604    24702    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    197    196            _           2604    24703    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    199    198            `           2604    24704    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    201    200            a           2604    24705    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    205    202            b           2604    24706    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    204    203            c           2604    24707    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    207    206            d           2604    24708    core_systemuser id    DEFAULT     x   ALTER TABLE ONLY public.core_systemuser ALTER COLUMN id SET DEFAULT nextval('public.core_systemuser_id_seq'::regclass);
 A   ALTER TABLE public.core_systemuser ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    215    208            e           2604    24709    core_systemuser_earnings id    DEFAULT     �   ALTER TABLE ONLY public.core_systemuser_earnings ALTER COLUMN id SET DEFAULT nextval('public.core_systemuser_earnings_id_seq'::regclass);
 J   ALTER TABLE public.core_systemuser_earnings ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    210    209            f           2604    24710    core_systemuser_expense id    DEFAULT     �   ALTER TABLE ONLY public.core_systemuser_expense ALTER COLUMN id SET DEFAULT nextval('public.core_systemuser_expense_id_seq'::regclass);
 I   ALTER TABLE public.core_systemuser_expense ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    214    211            g           2604    24711 #   core_systemuser_expense_category id    DEFAULT     �   ALTER TABLE ONLY public.core_systemuser_expense_category ALTER COLUMN id SET DEFAULT nextval('public.core_systemuser_expense_category_id_seq'::regclass);
 R   ALTER TABLE public.core_systemuser_expense_category ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    213    212            h           2604    24712    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    217    216            j           2604    24713    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    219    218            k           2604    24714    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    221    220            l           2604    24715    finances_earnings id    DEFAULT     |   ALTER TABLE ONLY public.finances_earnings ALTER COLUMN id SET DEFAULT nextval('public.finances_earnings_id_seq'::regclass);
 C   ALTER TABLE public.finances_earnings ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    224    223            m           2604    24716    finances_expense id    DEFAULT     z   ALTER TABLE ONLY public.finances_expense ALTER COLUMN id SET DEFAULT nextval('public.finances_expense_id_seq'::regclass);
 B   ALTER TABLE public.finances_expense ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    226    225            n           2604    24717    finances_expensescategory id    DEFAULT     �   ALTER TABLE ONLY public.finances_expensescategory ALTER COLUMN id SET DEFAULT nextval('public.finances_expensescategory_id_seq'::regclass);
 K   ALTER TABLE public.finances_expensescategory ALTER COLUMN id DROP DEFAULT;
       public          kaspary    false    228    227            E          0    24603 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          kaspary    false    196   a�       G          0    24608    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          kaspary    false    198   ~�       I          0    24613    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          kaspary    false    200   ��       K          0    24618 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          kaspary    false    202   ��       L          0    24624    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          kaspary    false    203   {�       O          0    24631    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          kaspary    false    206   ��       Q          0    24636    core_systemuser 
   TABLE DATA           e   COPY public.core_systemuser (id, first_name, last_name, created_at, updated_at, user_id) FROM stdin;
    public          kaspary    false    208   ��       R          0    24642    core_systemuser_earnings 
   TABLE DATA           R   COPY public.core_systemuser_earnings (id, systemuser_id, earnings_id) FROM stdin;
    public          kaspary    false    209   o�       T          0    24647    core_systemuser_expense 
   TABLE DATA           P   COPY public.core_systemuser_expense (id, systemuser_id, expense_id) FROM stdin;
    public          kaspary    false    211   �       U          0    24650     core_systemuser_expense_category 
   TABLE DATA           b   COPY public.core_systemuser_expense_category (id, systemuser_id, expensescategory_id) FROM stdin;
    public          kaspary    false    212   �       Y          0    24659    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          kaspary    false    216   ��       [          0    24668    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          kaspary    false    218   �       ]          0    24673    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          kaspary    false    220   ��       _          0    24681    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          kaspary    false    222   �       `          0    24687    finances_earnings 
   TABLE DATA           o   COPY public.finances_earnings (id, title, description, value, date, fixed, created_at, updated_at) FROM stdin;
    public          kaspary    false    223   ��       b          0    24692    finances_expense 
   TABLE DATA           {   COPY public.finances_expense (id, title, description, value, date, fixed, created_at, updated_at, category_id) FROM stdin;
    public          kaspary    false    225   H�       d          0    24697    finances_expensescategory 
   TABLE DATA           c   COPY public.finances_expensescategory (id, title, description, created_at, updated_at) FROM stdin;
    public          kaspary    false    227         |           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          kaspary    false    197            }           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          kaspary    false    199            ~           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);
          public          kaspary    false    201                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          kaspary    false    204            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          kaspary    false    205            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          kaspary    false    207            �           0    0    core_systemuser_earnings_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_systemuser_earnings_id_seq', 172, true);
          public          kaspary    false    210            �           0    0 '   core_systemuser_expense_category_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.core_systemuser_expense_category_id_seq', 39, true);
          public          kaspary    false    213            �           0    0    core_systemuser_expense_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.core_systemuser_expense_id_seq', 286, true);
          public          kaspary    false    214            �           0    0    core_systemuser_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.core_systemuser_id_seq', 5, true);
          public          kaspary    false    215            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 95, true);
          public          kaspary    false    217            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);
          public          kaspary    false    219            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);
          public          kaspary    false    221            �           0    0    finances_earnings_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.finances_earnings_id_seq', 195, true);
          public          kaspary    false    224            �           0    0    finances_expense_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.finances_expense_id_seq', 285, true);
          public          kaspary    false    226            �           0    0     finances_expensescategory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.finances_expensescategory_id_seq', 39, true);
          public          kaspary    false    228            q           2606    24719    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            kaspary    false    196            v           2606    24721 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            kaspary    false    198    198            y           2606    24723 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            kaspary    false    198            s           2606    24725    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            kaspary    false    196            |           2606    24727 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            kaspary    false    200    200            ~           2606    24729 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            kaspary    false    200            �           2606    24731 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            kaspary    false    203            �           2606    24733 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            kaspary    false    203    203            �           2606    24735    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            kaspary    false    202            �           2606    24737 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            kaspary    false    206            �           2606    24739 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            kaspary    false    206    206            �           2606    24741     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            kaspary    false    202            �           2606    24743 6   core_systemuser_earnings core_systemuser_earnings_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.core_systemuser_earnings
    ADD CONSTRAINT core_systemuser_earnings_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.core_systemuser_earnings DROP CONSTRAINT core_systemuser_earnings_pkey;
       public            kaspary    false    209            �           2606    24745 X   core_systemuser_earnings core_systemuser_earnings_systemuser_id_earnings_i_8da857e4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_earnings
    ADD CONSTRAINT core_systemuser_earnings_systemuser_id_earnings_i_8da857e4_uniq UNIQUE (systemuser_id, earnings_id);
 �   ALTER TABLE ONLY public.core_systemuser_earnings DROP CONSTRAINT core_systemuser_earnings_systemuser_id_earnings_i_8da857e4_uniq;
       public            kaspary    false    209    209            �           2606    24747 `   core_systemuser_expense_category core_systemuser_expense__systemuser_id_expensesca_1ab6565c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense_category
    ADD CONSTRAINT core_systemuser_expense__systemuser_id_expensesca_1ab6565c_uniq UNIQUE (systemuser_id, expensescategory_id);
 �   ALTER TABLE ONLY public.core_systemuser_expense_category DROP CONSTRAINT core_systemuser_expense__systemuser_id_expensesca_1ab6565c_uniq;
       public            kaspary    false    212    212            �           2606    24749 F   core_systemuser_expense_category core_systemuser_expense_category_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense_category
    ADD CONSTRAINT core_systemuser_expense_category_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.core_systemuser_expense_category DROP CONSTRAINT core_systemuser_expense_category_pkey;
       public            kaspary    false    212            �           2606    24751 4   core_systemuser_expense core_systemuser_expense_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_systemuser_expense
    ADD CONSTRAINT core_systemuser_expense_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_systemuser_expense DROP CONSTRAINT core_systemuser_expense_pkey;
       public            kaspary    false    211            �           2606    24753 V   core_systemuser_expense core_systemuser_expense_systemuser_id_expense_id_8e2a3ded_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense
    ADD CONSTRAINT core_systemuser_expense_systemuser_id_expense_id_8e2a3ded_uniq UNIQUE (systemuser_id, expense_id);
 �   ALTER TABLE ONLY public.core_systemuser_expense DROP CONSTRAINT core_systemuser_expense_systemuser_id_expense_id_8e2a3ded_uniq;
       public            kaspary    false    211    211            �           2606    24755 $   core_systemuser core_systemuser_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_systemuser
    ADD CONSTRAINT core_systemuser_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_systemuser DROP CONSTRAINT core_systemuser_pkey;
       public            kaspary    false    208            �           2606    24757 +   core_systemuser core_systemuser_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.core_systemuser
    ADD CONSTRAINT core_systemuser_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.core_systemuser DROP CONSTRAINT core_systemuser_user_id_key;
       public            kaspary    false    208            �           2606    24759 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            kaspary    false    216            �           2606    24761 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            kaspary    false    218    218            �           2606    24763 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            kaspary    false    218            �           2606    24765 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            kaspary    false    220            �           2606    24767 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            kaspary    false    222            �           2606    24769 (   finances_earnings finances_earnings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.finances_earnings
    ADD CONSTRAINT finances_earnings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.finances_earnings DROP CONSTRAINT finances_earnings_pkey;
       public            kaspary    false    223            �           2606    24771 &   finances_expense finances_expense_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.finances_expense
    ADD CONSTRAINT finances_expense_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.finances_expense DROP CONSTRAINT finances_expense_pkey;
       public            kaspary    false    225            �           2606    24773 8   finances_expensescategory finances_expensescategory_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.finances_expensescategory
    ADD CONSTRAINT finances_expensescategory_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.finances_expensescategory DROP CONSTRAINT finances_expensescategory_pkey;
       public            kaspary    false    227            o           1259    24774    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            kaspary    false    196            t           1259    24775 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            kaspary    false    198            w           1259    24776 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            kaspary    false    198            z           1259    24777 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            kaspary    false    200            �           1259    24778 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            kaspary    false    203            �           1259    24779 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            kaspary    false    203            �           1259    24780 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            kaspary    false    206            �           1259    24781 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            kaspary    false    206            �           1259    24782     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            kaspary    false    202            �           1259    24783 -   core_systemuser_earnings_earnings_id_10a5fe6e    INDEX     y   CREATE INDEX core_systemuser_earnings_earnings_id_10a5fe6e ON public.core_systemuser_earnings USING btree (earnings_id);
 A   DROP INDEX public.core_systemuser_earnings_earnings_id_10a5fe6e;
       public            kaspary    false    209            �           1259    24784 /   core_systemuser_earnings_systemuser_id_22fe9297    INDEX     }   CREATE INDEX core_systemuser_earnings_systemuser_id_22fe9297 ON public.core_systemuser_earnings USING btree (systemuser_id);
 C   DROP INDEX public.core_systemuser_earnings_systemuser_id_22fe9297;
       public            kaspary    false    209            �           1259    24785 =   core_systemuser_expense_category_expensescategory_id_392a83af    INDEX     �   CREATE INDEX core_systemuser_expense_category_expensescategory_id_392a83af ON public.core_systemuser_expense_category USING btree (expensescategory_id);
 Q   DROP INDEX public.core_systemuser_expense_category_expensescategory_id_392a83af;
       public            kaspary    false    212            �           1259    24786 7   core_systemuser_expense_category_systemuser_id_f47e21f0    INDEX     �   CREATE INDEX core_systemuser_expense_category_systemuser_id_f47e21f0 ON public.core_systemuser_expense_category USING btree (systemuser_id);
 K   DROP INDEX public.core_systemuser_expense_category_systemuser_id_f47e21f0;
       public            kaspary    false    212            �           1259    24787 +   core_systemuser_expense_expense_id_4e0597d4    INDEX     u   CREATE INDEX core_systemuser_expense_expense_id_4e0597d4 ON public.core_systemuser_expense USING btree (expense_id);
 ?   DROP INDEX public.core_systemuser_expense_expense_id_4e0597d4;
       public            kaspary    false    211            �           1259    24788 .   core_systemuser_expense_systemuser_id_391b7176    INDEX     {   CREATE INDEX core_systemuser_expense_systemuser_id_391b7176 ON public.core_systemuser_expense USING btree (systemuser_id);
 B   DROP INDEX public.core_systemuser_expense_systemuser_id_391b7176;
       public            kaspary    false    211            �           1259    24789 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            kaspary    false    216            �           1259    24790 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            kaspary    false    216            �           1259    24791 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            kaspary    false    222            �           1259    24792 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            kaspary    false    222            �           1259    24793 %   finances_expense_category_id_07cb4b0d    INDEX     i   CREATE INDEX finances_expense_category_id_07cb4b0d ON public.finances_expense USING btree (category_id);
 9   DROP INDEX public.finances_expense_category_id_07cb4b0d;
       public            kaspary    false    225            �           2606    24794 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          kaspary    false    198    2942    200            �           2606    24799 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          kaspary    false    2931    196    198            �           2606    24804 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          kaspary    false    200    2989    218            �           2606    24809 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          kaspary    false    196    203    2931            �           2606    24814 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          kaspary    false    202    2944    203            �           2606    24819 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          kaspary    false    2942    200    206            �           2606    24824 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          kaspary    false    202    2944    206            �           2606    24829 O   core_systemuser_earnings core_systemuser_earn_earnings_id_10a5fe6e_fk_finances_    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_earnings
    ADD CONSTRAINT core_systemuser_earn_earnings_id_10a5fe6e_fk_finances_ FOREIGN KEY (earnings_id) REFERENCES public.finances_earnings(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.core_systemuser_earnings DROP CONSTRAINT core_systemuser_earn_earnings_id_10a5fe6e_fk_finances_;
       public          kaspary    false    209    223    2997            �           2606    24834 Q   core_systemuser_earnings core_systemuser_earn_systemuser_id_22fe9297_fk_core_syst    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_earnings
    ADD CONSTRAINT core_systemuser_earn_systemuser_id_22fe9297_fk_core_syst FOREIGN KEY (systemuser_id) REFERENCES public.core_systemuser(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.core_systemuser_earnings DROP CONSTRAINT core_systemuser_earn_systemuser_id_22fe9297_fk_core_syst;
       public          kaspary    false    209    208    2961            �           2606    24839 M   core_systemuser_expense core_systemuser_expe_expense_id_4e0597d4_fk_finances_    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense
    ADD CONSTRAINT core_systemuser_expe_expense_id_4e0597d4_fk_finances_ FOREIGN KEY (expense_id) REFERENCES public.finances_expense(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.core_systemuser_expense DROP CONSTRAINT core_systemuser_expe_expense_id_4e0597d4_fk_finances_;
       public          kaspary    false    3000    211    225            �           2606    24844 _   core_systemuser_expense_category core_systemuser_expe_expensescategory_id_392a83af_fk_finances_    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense_category
    ADD CONSTRAINT core_systemuser_expe_expensescategory_id_392a83af_fk_finances_ FOREIGN KEY (expensescategory_id) REFERENCES public.finances_expensescategory(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.core_systemuser_expense_category DROP CONSTRAINT core_systemuser_expe_expensescategory_id_392a83af_fk_finances_;
       public          kaspary    false    212    3002    227            �           2606    24849 P   core_systemuser_expense core_systemuser_expe_systemuser_id_391b7176_fk_core_syst    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense
    ADD CONSTRAINT core_systemuser_expe_systemuser_id_391b7176_fk_core_syst FOREIGN KEY (systemuser_id) REFERENCES public.core_systemuser(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_systemuser_expense DROP CONSTRAINT core_systemuser_expe_systemuser_id_391b7176_fk_core_syst;
       public          kaspary    false    208    2961    211            �           2606    24854 Y   core_systemuser_expense_category core_systemuser_expe_systemuser_id_f47e21f0_fk_core_syst    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser_expense_category
    ADD CONSTRAINT core_systemuser_expe_systemuser_id_f47e21f0_fk_core_syst FOREIGN KEY (systemuser_id) REFERENCES public.core_systemuser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.core_systemuser_expense_category DROP CONSTRAINT core_systemuser_expe_systemuser_id_f47e21f0_fk_core_syst;
       public          kaspary    false    2961    208    212            �           2606    24859 @   core_systemuser core_systemuser_user_id_6123ded8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_systemuser
    ADD CONSTRAINT core_systemuser_user_id_6123ded8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_systemuser DROP CONSTRAINT core_systemuser_user_id_6123ded8_fk_auth_user_id;
       public          kaspary    false    208    2944    202            �           2606    24864 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          kaspary    false    216    2989    218            �           2606    24869 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          kaspary    false    216    202    2944            �           2606    24874 C   finances_expense finances_expense_category_id_07cb4b0d_fk_finances_    FK CONSTRAINT     �   ALTER TABLE ONLY public.finances_expense
    ADD CONSTRAINT finances_expense_category_id_07cb4b0d_fk_finances_ FOREIGN KEY (category_id) REFERENCES public.finances_expensescategory(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.finances_expense DROP CONSTRAINT finances_expense_category_id_07cb4b0d_fk_finances_;
       public          kaspary    false    3002    227    225            E      x������ � �      G      x������ � �      I   #  x�}�[n�0E��Ud΃�w�Q���JQ!Aqh��k��̌1����D��z�Ce��4���馌
�ϰ����١w��[6 ����[� �ݯ��u���M���qP5�ц^s9�c7�O�(��-)
�[,�i�^T��͊˥s�B�p���"5�$ ,�Y��M����6-�O��t�v����n<����f�y?s�j�|�8Ձn�w��r�F!��Wƣ��if4�
�,��ů�a\�Z��\0�v�Po�X�	���;;ǡ�jJi�ksF��"�D-Y�bQ����ީm�+݈���&RNX�JK:AQ)!Mn䫽�]?�_�w�i[7mAR�I]6��Ť|6�~x1�_�MQ�����K~G ���kD�26��O�Kx���1��6��+�;�ϺEJ�h	ѡD�P$X}�98����Xej���by ���b���B��%
�C���Zݕ���f K]Rf1��u�g/P/�ة0��T0��Va�u�`�I���j�h�\V�i��$o      K   �  x�m�[��@�g�>�f�sf�&u]��U�*i� �����/7q�=s�$g�_�C�f��1��%>���Kr�ָrM�n+���(����ή0����b�uW��fj)����w�F�� @�c�I�B,���W��ש?�{
��~�"��c�#��f��[[z]'Fܞ�E�]ً��BO|GO���"�-���w��Γ� �r�dL���:�E�et��ϰ�H�55o>����}��l��2rRH����i��߼�N��g�����lr��i�ԡ�h#���9�2%�Jﱝ�6>G�GH@���;"���g�E���l�#B�M�yd93�nw�q���J_��]7�K��hU���|�P��8DA��)���'e?29��O4�n��Q�2��J՛�,��?.ҡ�      L      x������ � �      O      x������ � �      Q   �   x�u�1�0��9E.�(6N�d�bf�(C*�a� �� �!y�m�U��You�a�.��ހ,��.
�%�J�Ž���^Q1,�|M�U���g��4�hmD4�4���{+0���Ec�'���ʠNl�=T�#ON)�3��0��V�A��(����@9      R   �   x���1Cѳ)&��K��#B'��z�<p��y����;~�����9�w﵈�a����U%k?zq3�T�L-U��Vm���*g��㫢W��Uр����nӀ��M2�d�%ch���Q2&��1�?�U+}      T   �  x��ɍ#Q��V0����K��P<����7{�>�ܱ�/��~��q�~�8�W����~�8��7������͸��w�s��{���;��K��ן�?�*��爷�9��߿��sG~}���ƍ�{��}p~1��̘}pV�>8G�>8g�>8��8��А
�Ҁ�4�-����Ε����� �#u$�ԑ8RG�H�#u$�ԑ8RG�H��t$��Q8JG�(��t��Q8JG�(��t��Q8���1tC��1tC��1tC��1tC����cG��ؐ�`�
ِ�b�ِ�d�*����1qL��1q,�ұp,�ұp,�ұp,�ұp,�ұpl�ֱql�ֱql�ֱqlė[����!$��ˇ��ˇ��ˇ��ˇ��ˇ��ˇ��˄��ˤ���ě�oO�yu\�̆ts^��qqX8�qqX;�qqX>�A�i�lH? �/ ���@�+��t����p<�F�������JJhHMi@K�Жt�=��6͆�L�e�l��4]6͆�L�e�l��4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A�e�lHM�M�!4]6͆t�t�4�A���U6���˺ِ�i�l�y��˦ِ�i�l�e�l��4]6͆�L�e�l�˔��/"�0�4�      U   [   x�ͱ�@A�	�K���rQ�q<8����9149MjZ��9�õ�K��"�Z�赉��̙䫣Xg[V&�\�Z��F�>�]/��?��      Y   �  x��Xˎ7<��B�c�6ɹH�A��1��j�V��3Z;��	r�?�?��!%͋k#A�
U�&���h �0��lemT��:���ũ�NMAE�
��.ڊL�V�C_ �M�h1$~@+���F�d�`�[a�
`�Kp�� xg�����T��3pc8 pF�ځ��T�d��F� H8��=��&�炲��KgBpCp��0�4��E��񧚺
�B)�����Ov���-G�8#�*�2%a��M{����[�
��R"[�������7�S���ӟG��է�z�kv7����ϯ� 5����ʸR�����m}�������1��$X��[M������y�Y�P�s6�ŏǶ����|K%B`��맿w�= ����P4!��X[��LZ2�i+	6D���3o�Շ�Ƚy�o�w�~|�����P�on����ף?���C7���>5w�������}�l�'	�ʨB�(�Ӓі�sO�s����p�b)~z<��.wr2�
�4�(�๭�Y�!��Bt�+��h��c�e%x�cc�/�M�*#��r�e��>>���v�����Gu��H����\�}��;�o����??>4�c״�e`����$x�7�ˌmt��9*���=�������wu{��ͳ���n�,��d3^r%���4o�Ӳ�,�$6IB�����]Ӿϕ�k��7��*��aB{<��ʜc�;
��ۘ����C}XkM�M��2Fe*�8����/4�� ��a��ߟ��Zރ���^�QM)�����.-_� ܰ����4ϐ�{q��8��*^��t`���M�x;�:���a�uq3��0�L����� -�؂��.�`-�Ȑc]h���{�X�Z�p�O	v]kt��1���:�E��уOk�N�xFo2>�C:�g�&)���Q�t��n���32���vctFb6�e���茼�O�(/M��f�e��B<�KF[���hRȒQ�L#~RȒ�բO�Ҥ�%#��`�a�	>����2�a��H��ѥ����3ڊ	�
�,4�g���"\&����/�hL����?���B�h,!��XG�9�e�v�>��6�)��c>]\�2���Ҟ`I���A"�%)#��!?�K�@R�^Lr�����|�;;�ܒ��B 9��eI�8B�F��t��8"8�Ҟ����pƠDqa���gίa��#��#���L$A������n�?\�	uΙs����F�ua��N�`���n��s�ȸg���s�Ȃ�n��9v�Yw�Cұ.�9�;�B�
��f�?[)d�@��)vm���Q�2:�zJ�5]G�zE�>�ԁ��ѕF_1�/<4��<��-�f�MkK:���m!�U�AR�ɲ-�Rn6� nRl      [   �   x�u���0���� ���w��P*XZ5��ޞjb��-�d�vķ!(��-yBC<�%�C0Q�.��8&t�M2�G-5V�$�8�ɜ��݃���)�5�7�W�DMp� 빈�u��ג,d�������	�l{�ݼ����Ÿ� | �c1      ]   9  x���ݒ� ���S����'�g�*�R�Im�pJ�~�8�h,�&I�����@���`�.��!t7v�3}�Ԏ��-��BKi-�Q"��V�>�+U )heC7�B�P���IP��16�.��a��:֟�9�
���ozcD�6��M����Q�?�nxf���K<م��\?��E�f��(�����������:=[7tާ��^�{;�_�(&�b	%�^Q'v0]��"���
��C�#w3��;E�����������N���Y	�)(��w�\17���e/ ����[:�k+_��&L���[�&��9�;�"��DN����d`T�$VH�ɣ_���$�R�}�N�FA�*i*os�ޮz�5J�U��G7�q��`�ߢ�f�e���T.���s�$�-@�X` 9�HʡpY��ܚF��cxPӖc,�T�C� �u�<���-,��찬�y���94�'w�ad:<F�T-h�%���u�G7���;�-��G!n$o�1%, �4��Z=��|��*�:C�{fi�����y�5"g�`D��O��l�Iʪ,      _   �  x���Ko�F�u�)���̋�.��8rT�ٗ`uc��_���w U����BH�8gΟ��H#L�~x���K=�O�x����Ì?Y'_N~�$&q�Kt|3���sk�&�G�mb��GG�35����{A�T�LF��g�E~N����j���0�>��{�ߢ���2/��c[��f�!)��[�����[�[|�W��p�~����s��,f��{��V��#���{�<������"��o��8�(?�̴ϓc_���c��+>�@�p��蒘�I8���C�~{���-&$B��� `�����y^�"�Q4Tu!$�� z��3(,�����g��У}F��e��Wf���Lf�LtI������_����=���rl���D��=����Te���e�^��y4.�WU"�G����� � HƳ���qT�P���,��R����j�El|� ``�$�\��Q�b`�W^�2L*���r�m��	��I�bl&gj���žd�S��6&�:v�9S�.�g���Ѳ?zG�����;Ps:�s+:ɋZ��X�} N�A����Ӌ�</�ޜ��|�ǿ�a<��M��ӗ�%e��2����X�IշYȪ�[U��b�o@7�4���D��b
L�),�.�&K�2��|���������o;���&'ꖲ��8�.)�2kG}��(Ƀ�5ȸ��`�[�����<*՘�,��k�㔋�(���UH��"
��n���󬠠R����`K����̅�Z��nT��*�Q/e�j7�a�l d`ճ��$��j=��j4P�����#/ch�z���j��nhҠj\M��%�-	y2�kԏj�M��{{��9����l��FYնXj1��QZ���P���ָ��ᘺ��s��m�؂�w�P1�c�~�ٲ��o�>M���w^�Eqt���j7ۑ�g	1�(`K��4QI8M����a����Xs�r$��m��b>�,S��&)��Rw�L�G�F������ݭozՄW��M��[X���B�p �]^@�~�D^�%�Ԗ��T�{���[�f�9���A��#��2g��6]M�0�Цu n7�n ��D�j��3
V�N4]`}��<�@�D"d����.]�yn��t3�wD�hnY&u��vG��᰾�Ô��$tNG����G�=��N�5-6���(D�t��\�H7�܃�.��`��)
�^q��(���*���2L5�	ї��?���� �k      `   O  x���An1E��)�HQ�(-��A[tՍ�E�"'�uz�� +5���I��������������xc�q�i^?����-��qx@�3���ɧ���ѩ����Ǉ�ao�!]o!�m�er6�4��J�B�\�����U���3$0z��I�T0�JL�����!�^�����I�8B�\�>v����`�(��w�*5Iͻ��w���`d�Hٻ!��D���+&�ϻ_O��@��V�9��Y��Njc�[�SQ�,��[�\g���R'��#��)��:�Q���M*U\��o	��
��%J�u��� ��X��|�����-p�vϯ�J�8�#�aO�L����Q�,�E������bcP�;κX��3v��T��Ұ�?�h<}u�=ب�����*D�ME;Z��q�륔i+SЊ��O�G�[�*OX�-��M��J�ڼ-�T�"��ld�I[R3��i-oǐ�dK�����:�M�s6Y;[;�:]{�vvi��Ը:R��ɼ�������YP����T��C&!���N=Yxy���n��@���Gc'љu���S�I,}kW�7�/Epf-�����Tǳ�I/�G�b��y�yy7kEp�kI�u��ԙj��]
Ǝ��`�Ym�W���ɥQ*��9���l���jm!�!�Jur&0�o��������_H4�2�թA3�L}������W�G);e�C���Q�>�\����G����2�L�,YԹsN�N�?�J�W
ԕtN���M�85�^����%c���0F�s�t���A�K������V�j�t�
����"�0km��W�x��q<�7��l�h<o�      b      x��\�r�r^SO�e�0��?��bOnʮ뺾�"�G:3sIgr$M��]�u�&Uy�l�b�&	 �!��)Wy>�4��n4�Tsݿ�Ҿ�o��n��cӀ�����mP��F(��"����ټ_ ݂<�8h�#�Ќo����ͧ���x�4:����=��w>��@��<6?/7���i:�xd�� �A��W ݁��c̛��44��^����_�?�zj�|罈����@���0� ��xe,������rn�����Dk*�������A��NZ�:g��0N׼��?����ޞ�Oh��wN�cUMoy<Vk�@P/�y����&��VӸ�NYc�hfT�TW#���`Y�e6�spP�`�L�&Ai��8/���߽���ti9^z��{t��@�e������䨴��6�+H���R�"Ʉ�@�������׾��x߿���o�!���<�R�UaMR�K������76I��3�H'�-�Ĵ�mޒ;�HNLĖ�a��%o���gMj�����a����hG-_c���L	��h���8&%yL��[��F���QuZK�:E�?����+���);�����f���b;'�q�Af�]$\9���wl�:���ҫKM~�\�Y HQ�5W^4��7绞pd{��Q�F>]M@N�硹>��􏴻.������tRv(��E�	4~�1Ğp��KQ��Cܒls���h��u*�b����G
�Ii�E"���J��о���k@U�@���x�����vI B�jb�[̣R�P=ym"V�/��D�r݀���Xni�d�k��2L�n����o���_h�v"���z��%}'h��(�B'�Ԧ���y��V3�b���|Y�v`�W�5�H-�����f/d:k�����ם�j��Ҁ��P''�"���SJC�@)Q��P�|���i�#�EnH8a]�8�0N���$C/�'�E*3+%kY��
 ����e�Ѝ�M���/O���c{sy�r{z�@�C9	�{`���{d�4C��-�w����ڟpz6D(0/��7��e�[�L�a������9mh1]��24�/ʁE.���f��>�uH'���*CG媮 DdT�g�Y�W+G���"�qS31����F����w*��8Y�*DC�s����?3��;P�� ������`�zf��i9g��{J)�?��>�-��0��(��(2N���2V�f+c��U�)�L�wFu��A�r���͉�;��~����G�B���J1/���0�:BB�
^e�
U�P�W5/���o�|"���l�Jr�V* ���<h�����`F����.����A%S@�0/�c#Ѓ�B;p�VZ�s��fJq��S��A.�|O��Lr�)EIC��sI�;������O���o4�-� � H8X^9�ݒ��
�0�7��H炉)�]^)d��1��ExY_��Gn�XT�jb��e5=!]Y�m�>�~6g�㐩W/��T�yڕ���A/à�����A?�%��C��`�$����j`�A�9c���ϣ��iN2?�5��_!M!9^�H�
�)�Q|���B��*���!
�����fE٤Nܣ�*�^;��Ν����.��BA�L�Fb��A�JBgkTBXi�\�?O�s��7��~�G�aɤ�.�踟x��2�ۥ���(���@M���ҟ}N�9m@'U�sFuH3ѯ�8כ����(p��u'���2��j̀@F=9�Ĕ"^��b(��=�X��P���%4�tz����e,�'���I��Nzcҹ�Q=e_ 1�m��i�NY�Djf"�L-�H�U��Z���	��:�C�c��f��lx�3����ԑ"�Z�0��^K�q�~kF�4e�Rߗ�sT�����d)W&�C��h8�r�`RTM�|"r�t�Y�n~��6+��� D� HۓS?I����O�UQ�V�zv'лx�W�eh�*rG������\M�[����z�5�֓�l�~*�P6[���q8��B�xFCT��A>��^�"̈́���<2�k*a$6T��p}���efK:֤Ș�n嶆�lA;��X�FU�J7o�����	)�-+�}b�a�PjjL�xF��')3�S�ZҲe7|���4�!�?�9Gmسʎ�����]V�!�o��'ÚuA�]�v�O�S� (4T�rQ�Σ�ހJ��)H����!�ϟO��r��$�
��Ջ��*>�&�E>v��>E'�f�t�	C(x�!��@S����g�x�(��O�m�;�.��0���Ҽ�S�8�	��ܣ)[|~�=����'�䫩ȕ�G��@5�6$����j����J���#j�1�����r�����f�gl�[>�f �vC�V.٠��	*��g�V,Τ, �BZ>��|���{��3t�)xe�d�r4�M�|Z۟4�Ak�*�
uc�������W����^Av.���Q�o~~~�Bљ�7��tY}'��i�����:�HGơ�*�!�T[��&E��@�2f4�$Z&�2=��0H%h�X7rBCOh�����+o�pb�4µ
.}uhuRe]�ᜏL��>_��}����)r�X�|h��P��Q�B��Z�_~Kr!eȇ��`�6[�]��G>��7������%�J	\/���ĵNMq+�� @�VF�jx:@����!A2PY:٥�}��\S/��
ܓ�v�t2?9�E�� 	|r�گ�n��� ����M�SԄ:�QIA�aR��u���iAi��q�f�ή����l{��TT��Oi�ՀcTO�`�,k����c>r"�l+tj�y�Q�����w�y,K)c��ռ����[e���Kn���Ue�
2Ia.U��B�Vּ���"
t�;������,6�v>=|����&r܁Kn�Y �љG&�Q�� jh�SUH��5JV��37%������$�hK���6����	$�i���8�`�qWi�{�h�{�B}�kX]�轷B��E��Y��:
��4?M��N��i�Jn^*���qulW>��]^v��u�.����<\J*^~ʭ&۫Ճ�u��>GmpS�a�0g��ˏ���k,\�T�����Ȅ֨!G�>�R���`5�.��H]��Q�N4?�>_��?XʄϏ�ù}:�;>�#�J���D��΢-�N�	"��y|�ot��-�����v3t�]JL6�O��QBa��Z>O�8K3;�2�&(;2�o%�~Hwq(mRή��/�ѹ�������xn���p��7�}o�ONY��8 �ik�I	3t�����Y�(�y�۷���~���+hiG[AA�i'Ԅ���:���l����<_��v�5�&�%C��E'�<}E�q��h��e�ר�]����HE��K�uY?`��)#Af&���˴���r�`�4'�,��-�Ì�]羮�o��1@�cU`1'�Q��>O��V���1>y��He)u61K�� B)M�#�������Dr8N�LKD3:jR�}$	�z��d� z�Ys}�J�
�c	���T������h�|�7�K��GE.�A�~������&ԅ �MM ����$���pS���?�yS��K{��H~��ş�4j�%;z��HYx�ա��]$��˪N��� �ERuZ�vޟ~T/�QG��*�{���i ��Ym\�2t*�������9�B���"���}jց�2#K�p'
�|�yQ.�R��������u�tʩN��Cd��.?�N��(�Jǖ�/&]�K�[��a*h�ߴ(�h��Ӧ@��O�m:3��]�����0EJ�U�vFmH?1����@�B����D�֨WQ��e��b����$F;��Z��&�MX���{��/���vB�JdIY���p��Q�%���T�����vH17�g��$��`����Mh�D�����?��.0@�A�Aجn��^��"���Ǉۡ�I��3j��*��F�B�p�hX
�+RO��r�^�I��+��^�S�4��j����l(��/c	Cc!��>��.�$�N�����j��ф �   g
l�	^��/|�}oj��\AeXV�z24T�l���7&�iXA�|N�hf44�"���c�XJ^�
�3$�V_��~�.-gRb�`!������^$.��e��'� ���-߉�6���a�P�]4y��(�jg`�Q�C�!i3��9GC�Rt����t<]��=VW3�p�
���4��M�?�F�U��7�B�"�ʠ���ԡ+��IF0X��NO��ϗ~��Gd9�4�/x�.�E�	U2��7?����%w��_��Ѭ����$����d�(�4����~��bv�6����\��rTO�9(a*,��O��˥]	�^��U�-9�'T�s)�6��OO��<U\�Q���4 e�2R6o(�ܞO���t�OQ��7�+S�)3:��H��%�j2�®���y��I�)��\�C�5,)�Y Uh�GiH�޿����t�_.�'M�2�8 '��`a2T�`�����x�����t�j�=*��	X�%���P�ġ�;�Zѫ��6���г��n)J��rr5��Co�lA�̈�ϴ��LI���N�t����Y't��
�,"?�t�+��/>��4AB����s�D�X�ʸ��r��͒:>S.�j:�A%�R��B�^A�7�@Z]&�P+��萛P�u\WV\Z�(?��J3T�-OsX���	r��!�2 �HB@��yBY���.}����twn�>?��zR�Y��"���F�W"��l��d*Q����S'��E5�4��H����Ҕ��W�ؚᅲR���uA)W��N�^�.�񗌐;��RF�9�B�*_�&)�5��	e�0>�r'�[J��7C/ j����T����
��o�%M�mtr�F���a����O�ǒt��ѱo�S/�7���C��(T��JE}=pL@h���(G2��j^�g&Ry�&6E��X�NQ�m��U�g� �Tkԅ���򾺍�g��\��^[`С�%d���]E��˫��JZ ̚wA���?>?U"�}�(�X�UN��`l�t䑜KM+E��9#��ϗ�ǧc;��~�|����
YS U�F�Q<���2MR����|��&J鷱6��� .f[$���Ӭa����5A��bdZ�Nx�X���K�kt:f"bEr��H�Ͷr����=��N ��Q
KODE��w``��D?|l��&ن�D�x�$����[���Cl
��dsT�vJ���B��G�_���t�Q�H7�S�Dt�A�n*�\5�e���x:7���YKCe����k�;w�Z���7�I��3|�,�p�ݦ
$CgbE͍�m��|V���p����FQt\�a�t|�	�أ��?OU'J��r���P �l�6��=����8�{a
#]��Ǯ��n��}j3~���*Pt��ڪsT;��5��F���1������u�ʼ88Q�� �g�
h!$�����r��-[���d��L�֨��Y�tW|���z�-�:�G��0�3j��%���w�c���p�b4n�)q(D�a_����&�jB�$i���<�R��'�q[�>�[�c����}<�s�}��m�"-HY�VE�	�E�r�w/��=A���nl��CT�᥏���y��͛KG���F.7Z,��u�\�J��5�d R�*w$��V�*N^�:Vހz���ŧ����pK����|���ݠ�,O�)�ͨ���������}4V.      d   �  x�}����0�g�)�DR�Dmz@�-ڎ]��C���`�n��t�;t͋U��D��N��ӟD��z�x��>�����n�d�i�~& �
	�����!��X}훧��Om�����vʡ�L�Uk�/?.g�^W?)r����ub��Ks�{h��*ڒ"�,E�$:���ǗS��#�vA�`P!#�Y�r�Mճ3���;� >XTNm2֪`���]`��"'lp��U�����c��Չn*j�	��[d�m �����M��#�&Mv��q�2�(rG�W	S��4�`Ա�E_D]��?)�O��ώ@���M��훷#�D,jW<�E�.ah};8n}֬����S���j}چ��.�bj�@�4G6U���M�n�+�2�a�O�0t��L�=� ��ĉ�QV�`*���5ߏs�>t}s86��q�<���UM�v���W�Wo��m?,�����Ż������~j(�>�Cۿ6s/ �!FJ�Z����r
�O��M�u�+�h�     