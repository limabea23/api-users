PGDMP                      }            apiusuarios    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16387    apiusuarios    DATABASE     q   CREATE DATABASE apiusuarios WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE apiusuarios;
                     postgres    false            �            1259    16411    posts    TABLE     �   CREATE TABLE public.posts (
    id_post integer NOT NULL,
    id_user integer NOT NULL,
    conteudo_post text NOT NULL,
    anexo text,
    data_publicacao date
);
    DROP TABLE public.posts;
       public         heap r       postgres    false            �            1259    16410    posts_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.posts_id_post_seq;
       public               postgres    false    220                       0    0    posts_id_post_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.posts_id_post_seq OWNED BY public.posts.id_post;
          public               postgres    false    219            �            1259    16400    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    photo text
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16399    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public               postgres    false    218                       0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public               postgres    false    217            ]           2604    16414    posts id_post    DEFAULT     n   ALTER TABLE ONLY public.posts ALTER COLUMN id_post SET DEFAULT nextval('public.posts_id_post_seq'::regclass);
 <   ALTER TABLE public.posts ALTER COLUMN id_post DROP DEFAULT;
       public               postgres    false    220    219    220            \           2604    16403    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16411    posts 
   TABLE DATA           X   COPY public.posts (id_post, id_user, conteudo_post, anexo, data_publicacao) FROM stdin;
    public               postgres    false    220   �       �          0    16400    users 
   TABLE DATA           F   COPY public.users (id_user, name, username, email, photo) FROM stdin;
    public               postgres    false    218   �                  0    0    posts_id_post_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.posts_id_post_seq', 5, true);
          public               postgres    false    219                       0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 50, true);
          public               postgres    false    217            e           2606    16418    posts posts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id_post);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public                 postgres    false    220            _           2606    16409    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            a           2606    16405    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            c           2606    16407    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    218            f           2606    16419    posts fk_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 7   ALTER TABLE ONLY public.posts DROP CONSTRAINT fk_user;
       public               postgres    false    4705    220    218            �   (  x�U�Kj�0@��)��c_�����B(�Ml5��������%�N ���R,�3�
e��A$8����=�N��49��M#<Yo<ƨD��c�(�5�]�}���R��
G�u0`=�!�l,�cD0�Dk���&H�#_�s�k�����o�J�ĺzU�! �����+
^r�{��Х+w 2J|��wW�{���D'���~2�=!LN�:�Y^���
>�o��ǿЙ�3�ڝ�E/,3ꢹ��V�y����4Q�tU�Ǚ��S�+��Q�qW}�z�UR�朖D      �   �  x�m��r�8��;O�X*�rG~�Be��Tة�ݚ����YrI6���{d�|>�O��Z-i��5bU5Zz���X�Aj���fDo������!��wP��(nL�`D��V[���jE��&�C��bi2A�� CQ��l����Zo����1���#ˌ%WN}�7U0%����v'�0�ṯM@ʅ,X��?�M���t4��'X#���\���ɺ�=J&���İ��MfM�����Wk8�z8V�6�H_;����FI-V�w���%C�kH��n��N��6�|R=�#�R���t����ϲ'~L�/�8�]7ĦYǰ0v_U������tN2���z����DK��^[�-��㻣-����X|b�\���c�a[|���:�C-o����洔��{^�5k�[�D��sO��ֳTF��< ���ctK�\���8lZ�Y�?py�=V�E�80[.��I`}�=�=��e��l(ieqR=�cZ��VFm�ɇ���=�	����I��J���K��N�Y�?�X5Z3e-�FU��eX;��2�b�P��z<3Z�=�U���r`sA=�9��_)6��$�G���㻧7���9�����e|K�W�ɢ;Q	]�墨�JO�Czpx1�t�L�����@-���г<%A'�	E�G���o�	("�	��k�e@U2��6-%1tS4]-Ūt��m6t�^pZY�O�w��B���S�,�,4�<���uF���[�a�<-p���9{̮�[d������;���S(�8PC�3���:k�
����A�g���M���y���	�]b�8�'v�Su(���#�����C6
�)�#d0���kB�N�d��>A7��(�bDu`]E�(���ܜwap[=��V#�i��v�襆� ��u�$�����/�ϗ�p_(T���pm���\዇]��K��,�§8��[t�_0%dyR�C�ߡ�777�nx     