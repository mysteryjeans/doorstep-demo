--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO doorsale;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO doorsale;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO doorsale;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO doorsale;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO doorsale;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO doorsale;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: catalog_category; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE catalog_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    pic character varying(100),
    parent_id integer,
    tags character varying(100),
    display_order integer NOT NULL,
    is_active boolean NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.catalog_category OWNER TO doorsale;

--
-- Name: catalog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE catalog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_category_id_seq OWNER TO doorsale;

--
-- Name: catalog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE catalog_category_id_seq OWNED BY catalog_category.id;


--
-- Name: catalog_manufacturer; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE catalog_manufacturer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.catalog_manufacturer OWNER TO doorsale;

--
-- Name: catalog_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE catalog_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_manufacturer_id_seq OWNER TO doorsale;

--
-- Name: catalog_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE catalog_manufacturer_id_seq OWNED BY catalog_manufacturer.id;


--
-- Name: catalog_product; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE catalog_product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    brand_id integer NOT NULL,
    part_number character varying(50),
    sku character varying(50),
    gtin character varying(50),
    gist character varying(500),
    description text,
    price numeric(9,2) NOT NULL,
    cost numeric(9,2) NOT NULL,
    old_price numeric(9,2) NOT NULL,
    quantity integer NOT NULL,
    is_active boolean NOT NULL,
    is_bestseller boolean NOT NULL,
    is_featured boolean NOT NULL,
    is_free_shipping boolean NOT NULL,
    tax_rate_id integer,
    tags character varying(250),
    weight double precision NOT NULL,
    length double precision NOT NULL,
    width double precision NOT NULL,
    height double precision NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL,
    shipping_cost numeric(9,2) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.catalog_product OWNER TO doorsale;

--
-- Name: catalog_product_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE catalog_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_product_id_seq OWNER TO doorsale;

--
-- Name: catalog_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE catalog_product_id_seq OWNED BY catalog_product.id;


--
-- Name: catalog_product_pic; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE catalog_product_pic (
    id integer NOT NULL,
    product_id integer NOT NULL,
    url character varying(100) NOT NULL,
    display_order integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.catalog_product_pic OWNER TO doorsale;

--
-- Name: catalog_product_pic_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE catalog_product_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_product_pic_id_seq OWNER TO doorsale;

--
-- Name: catalog_product_pic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE catalog_product_pic_id_seq OWNED BY catalog_product_pic.id;


--
-- Name: catalog_product_spec; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE catalog_product_spec (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    value character varying(250) NOT NULL,
    product_id integer NOT NULL,
    display_order integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.catalog_product_spec OWNER TO doorsale;

--
-- Name: catalog_product_spec_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE catalog_product_spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_product_spec_id_seq OWNER TO doorsale;

--
-- Name: catalog_product_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE catalog_product_spec_id_seq OWNED BY catalog_product_spec.id;


--
-- Name: common_address; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE common_address (
    id integer NOT NULL,
    customer_id integer,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(75) NOT NULL,
    company character varying(100) NOT NULL,
    country_id integer,
    state_id integer,
    city character varying(100) NOT NULL,
    address1 character varying(250) NOT NULL,
    address2 character varying(250),
    zip_or_postal_code character varying(10) NOT NULL,
    phone_number character varying(20) NOT NULL,
    fax_number character varying(20),
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.common_address OWNER TO doorsale;

--
-- Name: common_address_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE common_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_address_id_seq OWNER TO doorsale;

--
-- Name: common_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE common_address_id_seq OWNED BY common_address.id;


--
-- Name: common_user; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE common_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    birthday date,
    gender character varying(1) NOT NULL,
    billing_address_id integer,
    shipping_adress_id integer,
    is_verified boolean NOT NULL,
    verification_code character varying(512),
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.common_user OWNER TO doorsale;

--
-- Name: common_user_groups; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE common_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.common_user_groups OWNER TO doorsale;

--
-- Name: common_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE common_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_user_groups_id_seq OWNER TO doorsale;

--
-- Name: common_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE common_user_groups_id_seq OWNED BY common_user_groups.id;


--
-- Name: common_user_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE common_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_user_id_seq OWNER TO doorsale;

--
-- Name: common_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE common_user_id_seq OWNED BY common_user.id;


--
-- Name: common_user_user_permissions; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE common_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.common_user_user_permissions OWNER TO doorsale;

--
-- Name: common_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE common_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_user_user_permissions_id_seq OWNER TO doorsale;

--
-- Name: common_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE common_user_user_permissions_id_seq OWNED BY common_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO doorsale;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO doorsale;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO doorsale;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO doorsale;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO doorsale;

--
-- Name: financial_currency; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE financial_currency (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(3) NOT NULL,
    is_active boolean NOT NULL,
    is_primary boolean NOT NULL,
    exchange_rate double precision NOT NULL,
    display_format character varying(100) NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL,
    locale character varying(10) NOT NULL
);


ALTER TABLE public.financial_currency OWNER TO doorsale;

--
-- Name: financial_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE financial_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.financial_currency_id_seq OWNER TO doorsale;

--
-- Name: financial_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE financial_currency_id_seq OWNED BY financial_currency.id;


--
-- Name: financial_tax_rate; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE financial_tax_rate (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    method character varying(2) NOT NULL,
    rate double precision NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.financial_tax_rate OWNER TO doorsale;

--
-- Name: financial_tax_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE financial_tax_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.financial_tax_rate_id_seq OWNER TO doorsale;

--
-- Name: financial_tax_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE financial_tax_rate_id_seq OWNED BY financial_tax_rate.id;


--
-- Name: geo_country; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE geo_country (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    allow_billing boolean NOT NULL,
    allow_shipping boolean NOT NULL,
    iso_code2 character varying(2) NOT NULL,
    iso_code3 character varying(3) NOT NULL,
    iso_numeric integer NOT NULL,
    subject_to_vat boolean NOT NULL,
    display_order integer NOT NULL,
    is_active boolean NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.geo_country OWNER TO doorsale;

--
-- Name: geo_country_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE geo_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_country_id_seq OWNER TO doorsale;

--
-- Name: geo_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE geo_country_id_seq OWNED BY geo_country.id;


--
-- Name: geo_state; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE geo_state (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    country_id integer NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.geo_state OWNER TO doorsale;

--
-- Name: geo_state_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE geo_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_state_id_seq OWNER TO doorsale;

--
-- Name: geo_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE geo_state_id_seq OWNED BY geo_state.id;


--
-- Name: sales_cart; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE sales_cart (
    id integer NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.sales_cart OWNER TO doorsale;

--
-- Name: sales_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE sales_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_cart_id_seq OWNER TO doorsale;

--
-- Name: sales_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE sales_cart_id_seq OWNED BY sales_cart.id;


--
-- Name: sales_cart_item; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE sales_cart_item (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.sales_cart_item OWNER TO doorsale;

--
-- Name: sales_cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE sales_cart_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_cart_item_id_seq OWNER TO doorsale;

--
-- Name: sales_cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE sales_cart_item_id_seq OWNED BY sales_cart_item.id;


--
-- Name: sales_order; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE sales_order (
    id integer NOT NULL,
    customer_id integer,
    currency_id integer NOT NULL,
    sub_total numeric(9,2) NOT NULL,
    taxes numeric(9,2) NOT NULL,
    total numeric(9,2) NOT NULL,
    refunded_amount numeric(9,2) NOT NULL,
    currency_rate double precision NOT NULL,
    order_status character varying(2) NOT NULL,
    payment_status character varying(2) NOT NULL,
    shipping_status character varying(2) NOT NULL,
    billing_address_id integer NOT NULL,
    shipping_address_id integer,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.sales_order OWNER TO doorsale;

--
-- Name: sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE sales_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_id_seq OWNER TO doorsale;

--
-- Name: sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE sales_order_id_seq OWNED BY sales_order.id;


--
-- Name: sales_order_item; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE sales_order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    price numeric(9,2) NOT NULL,
    quantity integer NOT NULL,
    taxes numeric(9,2) NOT NULL,
    sub_total numeric(9,2) NOT NULL,
    total numeric(9,2) NOT NULL,
    tax_rate double precision NOT NULL,
    tax_method character varying(2) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.sales_order_item OWNER TO doorsale;

--
-- Name: sales_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE sales_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_item_id_seq OWNER TO doorsale;

--
-- Name: sales_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE sales_order_item_id_seq OWNED BY sales_order_item.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_category ALTER COLUMN id SET DEFAULT nextval('catalog_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_manufacturer ALTER COLUMN id SET DEFAULT nextval('catalog_manufacturer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product ALTER COLUMN id SET DEFAULT nextval('catalog_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product_pic ALTER COLUMN id SET DEFAULT nextval('catalog_product_pic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product_spec ALTER COLUMN id SET DEFAULT nextval('catalog_product_spec_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_address ALTER COLUMN id SET DEFAULT nextval('common_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user ALTER COLUMN id SET DEFAULT nextval('common_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_groups ALTER COLUMN id SET DEFAULT nextval('common_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('common_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY financial_currency ALTER COLUMN id SET DEFAULT nextval('financial_currency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY financial_tax_rate ALTER COLUMN id SET DEFAULT nextval('financial_tax_rate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_country ALTER COLUMN id SET DEFAULT nextval('geo_country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_state ALTER COLUMN id SET DEFAULT nextval('geo_state_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_cart ALTER COLUMN id SET DEFAULT nextval('sales_cart_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_cart_item ALTER COLUMN id SET DEFAULT nextval('sales_cart_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order ALTER COLUMN id SET DEFAULT nextval('sales_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order_item ALTER COLUMN id SET DEFAULT nextval('sales_order_item_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add country	6	add_country
17	Can change country	6	change_country
18	Can delete country	6	delete_country
19	Can add state	7	add_state
20	Can change state	7	change_state
21	Can delete state	7	delete_state
22	Can add address	8	add_address
23	Can change address	8	change_address
24	Can delete address	8	delete_address
25	Can add user	9	add_user
26	Can change user	9	change_user
27	Can delete user	9	delete_user
28	Can add manufacturer	10	add_manufacturer
29	Can change manufacturer	10	change_manufacturer
30	Can delete manufacturer	10	delete_manufacturer
31	Can add category	11	add_category
32	Can change category	11	change_category
33	Can delete category	11	delete_category
34	Can add product	12	add_product
35	Can change product	12	change_product
36	Can delete product	12	delete_product
37	Can add product spec	13	add_productspec
38	Can change product spec	13	change_productspec
39	Can delete product spec	13	delete_productspec
40	Can add product pic	14	add_productpic
41	Can change product pic	14	change_productpic
42	Can delete product pic	14	delete_productpic
43	Can add cart	15	add_cart
44	Can change cart	15	change_cart
45	Can delete cart	15	delete_cart
46	Can add cart item	16	add_cartitem
47	Can change cart item	16	change_cartitem
48	Can delete cart item	16	delete_cartitem
49	Can add order	17	add_order
50	Can change order	17	change_order
51	Can delete order	17	delete_order
52	Can add order item	18	add_orderitem
53	Can change order item	18	change_orderitem
54	Can delete order item	18	delete_orderitem
55	Can add currency	19	add_currency
56	Can change currency	19	change_currency
57	Can delete currency	19	delete_currency
58	Can add tax rate	20	add_taxrate
59	Can change tax rate	20	change_taxrate
60	Can delete tax rate	20	delete_taxrate
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- Data for Name: catalog_category; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY catalog_category (id, name, slug, description, pic, parent_id, tags, display_order, is_active, updated_by, updated_on, created_on, created_by) FROM stdin;
1	Books	books			\N	Books	0	t	mysteryjeans	2014-04-13 05:21:05.700238+05	2014-04-13 05:21:05.700274+05	mysteryjeans
8	Electronics	electronics			\N		8	t	mysteryjeans	2014-04-13 05:27:30.631035+05	2014-04-13 05:27:30.631076+05	mysteryjeans
4	Notebooks	notebooks		images/catalog/categories/0000004_notebooks_125.jpg	2		4	t	mysteryjeans	2014-04-13 05:35:53.488355+05	2014-04-13 05:23:48.15332+05	mysteryjeans
5	Accessories	accessories		images/catalog/categories/0001535-zubehor-125.jpg	2		5	t	mysteryjeans	2014-04-13 05:36:07.047365+05	2014-04-13 05:25:27.87635+05	mysteryjeans
3	Desktops	desktops		images/catalog/categories/0000862-desktops-125.jpg	2		3	t	mysteryjeans	2014-04-13 05:36:52.113099+05	2014-04-13 05:23:29.115538+05	mysteryjeans
6	Games	games		images/catalog/categories/0000866-games-125.jpg	2		6	t	mysteryjeans	2014-04-13 05:37:03.346134+05	2014-04-13 05:25:47.768686+05	mysteryjeans
7	Softwares	softwares		images/catalog/categories/0000865-software-125.jpg	2		7	t	mysteryjeans	2014-04-13 05:37:46.800442+05	2014-04-13 05:25:58.920567+05	mysteryjeans
11	MP3 Player	mp3-player		images/catalog/categories/0001536-mp3-player-125.jpg	8		11	t	mysteryjeans	2014-04-13 05:38:55.870343+05	2014-04-13 05:38:55.870376+05	mysteryjeans
9	Camera	camera		images/catalog/categories/camera.jpg	8		9	t	mysteryjeans	2014-04-13 05:42:15.962559+05	2014-04-13 05:27:50.359979+05	mysteryjeans
10	Mobile	mobile		images/catalog/categories/mobile-pic.jpeg	8		10	t	mysteryjeans	2014-04-13 05:42:27.370231+05	2014-04-13 05:28:12.449213+05	mysteryjeans
12	Apparel & Shoes	apparel-shoes			\N		12	t	mysteryjeans	2014-04-13 05:44:16.326349+05	2014-04-13 05:44:16.326386+05	mysteryjeans
13	Shirts	shirts		images/catalog/categories/shirt.jpg	12		13	t	mysteryjeans	2014-04-13 05:52:47.583242+05	2014-04-13 05:47:00.976791+05	mysteryjeans
14	Jeans	jeans		images/catalog/categories/25-jeans.jpg	12		14	t	mysteryjeans	2014-04-13 05:52:53.110508+05	2014-04-13 05:48:21.216238+05	mysteryjeans
15	Shoes	shoes		images/catalog/categories/supra-muska-skytop-skate-shoes-black-white-red.jpg	12		15	t	mysteryjeans	2014-04-13 05:52:58.590387+05	2014-04-13 05:52:23.522664+05	mysteryjeans
16	Jewelry	jewelry			\N		16	t	mysteryjeans	2014-04-13 05:54:15.711036+05	2014-04-13 05:54:15.711071+05	mysteryjeans
17	Speakers	speakers			8		0	t	mysteryjeans	2014-04-18 05:01:21.461268+05	2014-04-18 05:01:21.461327+05	mysteryjeans
18	Tablet	tablet			8	iPad, Surface, Android, iOS	0	t	mysteryjeans	2014-04-18 05:08:23.865222+05	2014-04-18 05:08:23.865259+05	mysteryjeans
2	Computers	computers			\N	Laptops, PC, Macbook	1	t	mysteryjeans	2014-04-25 12:15:56.751212+05	2014-04-13 05:22:33.071737+05	mysteryjeans
19	PS4	ps4			6		0	t	mysteryjeans	2014-04-25 13:03:19.853861+05	2014-04-25 13:03:19.853895+05	mysteryjeans
20	XBox	xbox			6		0	t	mysteryjeans	2014-04-25 13:03:33.660308+05	2014-04-25 13:03:33.660345+05	mysteryjeans
\.


--
-- Name: catalog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('catalog_category_id_seq', 20, true);


--
-- Data for Name: catalog_manufacturer; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY catalog_manufacturer (id, name, slug, description, is_active, updated_by, updated_on, created_on, created_by) FROM stdin;
4	ASUS	asus	ASUS is a worldwide top-three consumer notebook vendor and maker of the world's best-selling, most award-winning, motherboards	t	mysteryjeans	2014-04-13 05:12:34.763226+05	2014-04-13 05:12:34.763257+05	mysteryjeans
5	Lenovo	lenovo	Lenovo Group Ltd. is a Chinese multinational technology company with headquarters in Beijing, China, and Morrisville, North Carolina, United States. It designs	t	mysteryjeans	2014-04-15 00:54:52.751148+05	2014-04-15 00:54:52.75118+05	mysteryjeans
6	Toshiba	toshiba	Toshiba Corporation (株式会社東芝, Kabushiki-gaisha Tōshiba) is a Japanese multinational engineering and electronics conglomerate corporation	t	mysteryjeans	2014-04-15 01:05:22.244336+05	2014-04-15 01:05:22.244394+05	mysteryjeans
2	Dell	dell	Official Dell site covering the personal computers and technology related products they manufacture, support and sell.	t	mysteryjeans	2014-04-15 02:07:20.251314+05	2014-04-13 05:07:02.00372+05	mysteryjeans
1	Apple	apple	Apple designs and creates iPod and iTunes, Mac laptop and desktop computers, the OS X operating system, and the revolutionary iPhone and iPad.	t	mysteryjeans	2014-04-15 02:08:25.592952+05	2014-04-13 05:06:10.461952+05	mysteryjeans
3	HP	hp	Hewlett-Packard Company or HP is an American multinational information technology corporation headquartered in Palo Alto, California, United States.	t	mysteryjeans	2014-04-15 02:08:56.084945+05	2014-04-13 05:08:27.068082+05	mysteryjeans
7	Acer	acer		t	mysteryjeans	2014-04-18 02:42:25.004112+05	2014-04-18 02:42:25.00417+05	mysteryjeans
8	Microsoft	microsoft		t	mysteryjeans	2014-04-18 04:34:25.387466+05	2014-04-18 04:34:25.387537+05	mysteryjeans
9	Logitech	logitech		t	mysteryjeans	2014-04-18 05:00:24.133596+05	2014-04-18 05:00:24.133632+05	mysteryjeans
10	Miscellaneous	miscellaneous		t	mysteryjeans	2014-04-18 05:20:34.37619+05	2014-04-18 05:20:34.376247+05	mysteryjeans
11	Mcafee	mcafee		t	mysteryjeans	2014-04-18 05:53:17.63721+05	2014-04-18 05:53:17.637253+05	mysteryjeans
12	NOD32	nod32		t	mysteryjeans	2014-04-18 05:59:23.928312+05	2014-04-18 05:57:00.480537+05	mysteryjeans
\.


--
-- Name: catalog_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('catalog_manufacturer_id_seq', 12, true);


--
-- Data for Name: catalog_product; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY catalog_product (id, name, slug, brand_id, part_number, sku, gtin, gist, description, price, cost, old_price, quantity, is_active, is_bestseller, is_featured, is_free_shipping, tax_rate_id, tags, weight, length, width, height, updated_by, updated_on, created_on, created_by, shipping_cost, category_id) FROM stdin;
2	HP 15-d008se Notebook PC	hp-15-d008se-notebook	3				Intel Core i5 3230M Processor. 4GB RAM. 1TB Hard Drive. 15.6" LED Display. 1GB Dedicated Graphic Card. Windows 8.1 (64 bits).	Intel Core i5 3230M Processor. \r\n4GB RAM. 1TB Hard Drive. \r\n15.6" LED Display. \r\n1GB Dedicated Graphic Card. \r\nWindows 8.1 (64 bits). 	595.00	6.00	0.00	50	t	f	f	f	1	Ultrabook, Envy 15	0	0	0	0	mysteryjeans	2014-04-26 17:27:51.09288+05	2014-04-15 01:30:18.542023+05	mysteryjeans	0.00	4
5	Acer Aspire E1-570G	acer-aspire-e1-570g	7						439.00	0.00	0.00	50	t	f	f	f	1		0	0	0	0	mysteryjeans	2014-04-26 17:29:03.017805+05	2014-04-18 02:44:30.934033+05	mysteryjeans	0.00	4
3	HP Pavilion 15-n242se Notebook PC	hp-pavilion-15-n242se-notebook-pc	3				Intel® Core™ i5-4200U.  4 GB 1600 MHz DDR3 Memory.  750 GB 5400 rpm SATA Hard Drive.  NVIDIA GeForce GT 740M (2 GB DDR3 dedicated).  Pearl white color. 	Intel® Core™ i5-4200U. \r\n4 GB 1600 MHz DDR3 Memory. \r\n750 GB 5400 rpm SATA Hard Drive. \r\nNVIDIA GeForce GT 740M (2 GB DDR3 dedicated). \r\nPearl white color. 	610.00	0.00	0.00	50	t	f	f	f	1	Pavilion	0	0	0	0	mysteryjeans	2014-04-26 17:28:03.296843+05	2014-04-15 01:42:13.758533+05	mysteryjeans	0.00	4
6	Dell Inspiron One 23	dell-inspiron-one-23	2				Interact and entertain with the new Inspiron One 23 all-in-one. It features an optional 23" touchscreen and up to 3rd Gen Intel® Core™ processors	Make your home entertainment experience riveting. Choose the unrelenting speed of up to 3rd Gen Intel® Core™ i7 processors and be efficient with the new Windows 8 operating system. With up to 8GB DDR3 memory7, you can easily:\r\n\r\nPower your HD entertainment: enjoy a cinema-like experience.\r\n\r\nEnjoy non-stop action: fast photo and video editing8, stunning movies and seamless multitasking.\r\n\r\nExperience smooth apps and games: everyone’s favorite applications work the way they were intended to.	800.00	0.00	0.00	50	t	f	f	f	1	All-in-One	0	0	0	0	mysteryjeans	2014-04-26 17:29:14.62433+05	2014-04-18 03:01:12.516931+05	mysteryjeans	0.00	3
7	Dell Optiplex 3010 DT Base	dell-optiplex-3010-dt-base	2				SPECIAL: additional 50 € discount on all Dell OptiPlex desktops from a value of 549 €. Online Coupon:? W8DWQ0ZRKTM1, valid until 12.04.2012.	Also included in this system\r\nTo change these selections "Next" to continue the button to the next page.\r\n\r\n1Yr Basic Service - No Upgrade Selected - on-site service, NBD\r\nNo asset tag required\r\n\r\nThe following options are default selections included with your order.\r\n\r\nGerman (QWERTY) Dell KB212-B USB Keyboard Black QuietKey\r\nX11301001\r\nWINDOWS LIVE\r\nOptiPlex ™ order - Germany\r\nOptiPlex ™ Intel ® Core ™ i3 sticker\r\nOptical software is not required, operating system software sufficiently	478.76	0.00	0.00	10	t	f	f	f	1	Tower	0	0	0	0	mysteryjeans	2014-04-26 17:29:21.852466+05	2014-04-18 03:17:59.480641+05	mysteryjeans	0.00	3
8	HP IQ506 TouchSmart Desktop PC 	hp-iq506-touchsmart-desktop-pc	3					Redesigned with a next-generation, touch-enabled 22-inch high-definition LCD screen, the HP TouchSmart IQ506 all-in-one desktop PC is designed to fit wherever life happens: in the kitchen, family room, or living room. With one touch you can check the weather, download your e-mail, or watch your favorite TV show. It's also designed to maximize energy, with a power-saving Intel Core 2 Duo processor and advanced power management technology, as well as material efficiency--right down to the packaging. It has a sleek piano black design with elegant espresso side-panel highlights, and the HP Ambient Light lets you set a mood--or see your keyboard in the dark.	1199.00	0.00	0.00	10	t	f	f	f	1	All-in-One	0	0	0	0	mysteryjeans	2014-04-26 17:29:31.887263+05	2014-04-18 03:21:21.074223+05	mysteryjeans	0.00	3
10	Logitech X100 Mobile Wireless Speaker	logitech-x100-mobile-wireless-speaker	9				Go-anywhere mobile speaker that delivers rocking sound. Wireless speaker for smartphones and tablets. Connect and play. Take it anywhere. 5 hour Battery. 	Rocking sound\r\nCrystal clear sound. Pump up the volume and enjoy!\r\nRocking Sound\r\nConnect and play\r\n\r\nWirelessly connect, stream music, manage phone calls and control volume.\r\nTake it anywhere\r\n\r\nPerfect for life on the go. Take it on the road or relax and listen at home.\r\nDesign\r\n\r\nIn five bold colors, this unique design is sure to turn some heads.\r\n5 hour Battery\r\n\r\nEnjoy 5 hours of continuous play without recharging. Recharge the built-in lithium-ion battery with the convenience of the included micro-USB cable and rock on.	43.00	0.00	0.00	10	t	f	f	f	1		0	0	0	0	mysteryjeans	2014-04-26 17:30:31.882576+05	2014-04-18 05:03:10.414147+05	mysteryjeans	0.00	17
11	Acer Iconia A1-810	acer-iconia-a1-810	7				MediaTek 1.2 Ghz Quad-Core Processor. 16GB Flash Memory. 1GB RAM. 7.9" XGA IPS multi-touch screen. Android 4.2 Jelly Bean. Dual Camera. Bluetooth. 	MediaTek 1.2 Ghz Quad-Core Processor.\r\n16GB Flash Memory. 1GB RAM.\r\n7.9" XGA IPS multi-touch screen.\r\nAndroid 4.2 Jelly Bean.\r\nDual Camera. Bluetooth.	175.00	0.00	0.00	10	t	f	f	t	1	Android	0	0	0	0	mysteryjeans	2014-04-26 17:31:25.518625+05	2014-04-18 05:09:25.45253+05	mysteryjeans	0.00	18
1	Lenovo G510 Laptop	lenovo-g510-laptop	5				Super Hybrid Engine offers a choice of performance and power consumption modes for easy adjustments according to various needs	15.6-inch HD Widescreen Display\r\nThe 15.6" LED-backlit HD display (1366 x 768) delivers bright, crisp visuals in 16:9 widescreen on the G510.\r\nAbundant Multimedia Features\r\nThe G510 offers stunning, stutter-free visuals and immersive sound for a fuller, more satisfying home entertainment experience.\r\nAccuType Keyboard\r\nThe acclaimed AccuType keyboard is ergonomically designed to make typing more comfortable and to reduce errors.\r\nFast Data Transfer\r\nMove data between the G510 and other devices quickly with USB 3.0. It's up to 10 times faster than previous USB technologies.\r\nBattery-Saving Technology\r\nLenovo Energy Management protects the long-term durability of the battery and uses advanced energy-saving technology to increase time spent between charges to up to 5 hours, giving you flexibility on the go.\r\nSimple Maintenance\r\nWith OneKey Recovery, recovering from viruses or other technical difficulties is a snap.\r\nConnectivity\r\nWith 802.11 b/g/n WiFi connectivity, 10/100 LAN, and Bluetooth®, you'll be able to connect to the internet wherever you go.\r\nIntegrated Webcam\r\nThe optional 720p HD High-Sense webcam will help you enjoy web conferences or online video chats like you’re really there.\r\nHDMI Output\r\nFor easy connection to a television or other display.\r\nAmple storage\r\nWith 500GB HDD storage on the G510, you won't have to worry about where to put all your data, videos, music or photos.\r\nLenovo Cloud Storage\r\nProtect your important files and data, while also making access to information and file-sharing quick and convenient. Automatically back-up and synchronize data across your home, while enabling access from multiple devices. Data is encrypted on transfer for an extra level of security.	428.00	0.00	0.00	50	t	f	f	f	1	Laptop, G510	0	0	0	0	mysteryjeans	2014-04-26 17:59:00.945661+05	2014-04-15 01:11:50.502752+05	mysteryjeans	0.00	4
13	Cooking for Two	cooking-two	10				 More Than 200 Foolproof Recipes for Weeknights and Special Occasions (Hardcover) 	Hardcover: 352 pages\r\nPublisher: America's Test Kitchen (May 2009)\r\nLanguage: English\r\nISBN-10: 1933615435\r\nISBN-13: 978-1933615431	19.00	0.00	0.00	10	t	f	f	t	2	Cooking, Recipies	0	0	0	0	mysteryjeans	2014-04-26 17:31:44.491804+05	2014-04-18 05:24:29.774523+05	mysteryjeans	0.00	1
4	Toshiba Satellite C50-A539	toshiba-satellite-c50-a539	6				Intel Core i3 3110M Processor. 4GB RAM - 500GB Hard Drive. 1GB Dedicated Graphic Card. Gloss Luxe White Pearl Color. International Warranty.	Intel Core i3 3110M Processor.\r\n4GB RAM - 500GB Hard Drive.\r\n1GB Dedicated Graphic Card.\r\nGloss Luxe White Pearl Color.\r\nInternational Warranty.	500.00	0.00	525.00	50	t	f	t	f	1	Satellite	2.29999999999999982	0	0	0	mysteryjeans	2014-04-26 17:28:15.979226+05	2014-04-18 02:13:40.623315+05	mysteryjeans	0.00	4
9	Microsoft Windows 8.1 Pro x64 English	microsoft-windows-81-pro-x64-english	8				Your familiar desktop. Enhanced data protection. Your own unique start screen. The best of work and play. Your Office, your way. 	The best of work and play\r\n\r\nWith the new Windows, you get the best of work and play. Windows 8.1 Pro includes everything in Windows 8.1, plus enhanced features that help you easily connect to company networks, manage your devices, access one PC from another, encrypt your data, and more.\r\n	145.00	0.00	0.00	10	t	f	f	f	1	Windows8	0	0	0	0	mysteryjeans	2014-04-26 17:30:13.871397+05	2014-04-18 04:41:29.384885+05	mysteryjeans	0.00	7
12	Best Grilling Recipes	best-grilling-recipes	10				 More Than 100 Regional Favorites Tested and Perfected for the Outdoor Cook (Hardcover)	Take a winding cross-country trip and you'll discover barbecue shacks with offerings like tender-smoky Baltimore pit beef and saucy St. Louis pork steaks. To bring you the best of these hidden gems, along with all the classics, the editors of Cook's Country magazine scoured the country, then tested and perfected their favorites. HEre traditions large and small are brought into the backyard, from Hawaii's rotisserie favorite, the golden-hued Huli Huli Chicken, to fall-off-the-bone Chicago Barbecued Ribs. In Kansas City, they're all about the sauce, and for our saucy Kansas City Sticky Ribs, we found a surprise ingredient-root beer. We also tackle all the best sides.\r\n\r\nNot sure where or how to start? This cookbook kicks off with an easy-to-follow primer that will get newcomers all fired up. Whether you want to entertain a crowd or just want to learn to make perfect burgers, Best Grilling Recipes shows you the way.	27.00	0.00	0.00	20	t	f	f	f	2	Recipes	0	0	0	0	mysteryjeans	2014-04-26 17:31:34.331917+05	2014-04-18 05:22:29.069673+05	mysteryjeans	0.00	1
16	ESET NOD32 Antivirus 5	eset-nod32-antivirus-5	12				Intercept and eliminate viruses, worms, trojans, spyware and other Internet threats with our award-winning heuristic technology. ESET NOD32® Antivirus 5 protects you from known and emerging threats when competing products can’t and keeps your system running fast. Get ESET NOD32 Antivirus 5 for advanced security. 	Intercept and eliminate viruses, worms, trojans, spyware and other Internet threats with our award-winning heuristic technology. ESET NOD32® Antivirus 5 protects you from known and emerging threats when competing products can’t and keeps your system running fast. Get ESET NOD32 Antivirus 5 for advanced security. 	13.50	0.00	0.00	10	t	f	f	t	1		0	0	0	0	mysteryjeans	2014-04-26 17:32:12.763994+05	2014-04-18 05:58:27.137776+05	mysteryjeans	0.00	7
14	iPhone 5s	iphone-5s	1				Apple iPhone 5 32 GB	New design .\r\n\r\nWith 7.6 mm and 112 g3 the iPhone 5 has a remarkably thin and light design . It is made of anodized aluminum. The beveled edges have been precisely cut with a diamond.\r\n\r\nBrilliant 4 " Retina Display .\r\n\r\nNow you can see everything more vivid and detailed. And even though the display is bigger, it has the same width as the iPhone 4S and can be just as easily operated with one hand , therefore .\r\n\r\nPowerful A6 chip.\r\n\r\nCompared with the A5 chip , he has up to twice the CPU and graphics performance . And despite its speed , the iPhone 5 is an amazing battery life .\r\n\r\nUltra-fast mobile data .\r\n\r\nThe iPhone 5 supports the latest wireless technologies and can thus even more networks around the world verbinden.4Und also Wi -Fi is faster.\r\n\r\nScope of delivery\r\n\r\niPhone 5 with iOS 6 Apple EarPods with Remote and Mic Lightning to USB Cable USB Power Adapter (power supply)\r\n\r\nChoose the iPhone that suits you. 16 GB, 32 GB or 64 GB capacity ?\r\n\r\nThe iPhone is available in three capacities : 16, 32 and 64 GB. "GB" stands for gigabytes. The more gigabytes has your iPhone , the more space you have for content such as apps , games, photos , HD videos, music, movies and more. On a large music or photo library or if you load frequently HD movies, an iPhone with a larger storage is recommended . If your music or photo library is rather small and you rarely make films or buy an iPhone with a smaller amount of memory for you enough. With time comes Some of content together on your iPhone . Therefore, you should consider your growing storage needs with the iPhone purchase.\r\n\r\nThe unlocked iPhone\r\n\r\nThe unlocked iPhone is not bound to a cellular network , which means you can select your any supported GSM network worldwide . Buy an iPhone without a contract at the Apple Online Store , then look for a tariff for the iPhone, which only covers the SIM card. Or contact to your current provider if you want to keep your current tariff.\r\n\r\nPrePaid\r\n\r\nIf you do not want a contract , you can choose one of the " prepaid " Starter Packages of available network operators at the Apple Online Store. With " PrePaid " you get your iPhone ready for use with a compatible SIM card. A credit check is not required. You pay just online for what you consume , and you can change the network operator at any time. " PrePaid " is a good option if you would rather want to use a local provider when traveling abroad.	799.77	0.00	0.00	10	t	t	f	t	1	iPhone, SmartPhone	0	0	0	0	mysteryjeans	2014-04-26 17:31:52.85477+05	2014-04-18 05:47:39.106744+05	mysteryjeans	0.00	10
15	McAfee AntiVirus Plus - 1 PC for 1 Year	mcafee-antivirus-plus-1-pc-1-year	11				 Confidently surf, shop, and socialize online as our essential antivirus, antimalware, and firewall protect your PC and data. 	\r\n\r\nOur powerful combination of performance, accuracy, and reinforcing protections keeps criminals away from your PC and data.\r\n\r\n    NEW Unobtrusive, High Speed Scanning Engine—From startup to on-access scans, get high performance to minimize scan times and extend battery life.\r\n\r\n    NEW Vulnerability Scanner—Find and seal up holes in Windows and your favorite browsers and applications.\r\n\r\n    Real-time Antimalware—Block threats like viruses, Trojans, and spyware in your files, email, and web downloads using instant risk assessments through the cloud.\r\n\r\n    Adaptive Two-Way Firewall—Let our advanced firewall with buffer overflow protection prevent software from exploiting your OS or stealing information, even in hotspots.\r\n\r\n    NEW Malicious Ad Protection—Block cybercrime networks and their malicious ads and hidden iFrame code from loading and infecting your PC.\r\n\r\n    ENHANCED Digital Data Shredder—Destroy sensitive data and erase cookies, memory, cache, browser history, and more.\r\n\r\n    IMPROVED Safe Socializing, Searching, and Shopping—Click with confidence because you know which sites are safe.\r\n\r\n    BETTER Anti-bot Protection—Block contact with criminals’ computers based on the very latest research and reputation.\r\n\r\n    NEW Home Screen—Navigate easily through common security tasks with a redesigned home screen that supports touch-friendly devices.\r\n\r\n    ENHANCED Reports—Quickly understand how your protections are securing your data and system.\r\n\r\n    PC Tune-up—Remove unused applications, cached browser files, and other junk to speed up your PC.\r\n\r\n	6.50	0.00	0.00	10	t	f	t	f	1	Antivirus	0	0	0	0	mysteryjeans	2014-04-26 17:32:01.488042+05	2014-04-18 05:55:24.879139+05	mysteryjeans	0.00	7
\.


--
-- Name: catalog_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('catalog_product_id_seq', 16, true);


--
-- Data for Name: catalog_product_pic; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY catalog_product_pic (id, product_id, url, display_order, created_on, created_by) FROM stdin;
2	1	images/catalog/products/DUP-2373-10012014052336_1.jpg	0	2014-04-15 01:19:06.042898+05	mysteryjeans
3	1	images/catalog/products/DUP-2373-10012014052358.jpg	0	2014-04-15 01:20:42.349454+05	mysteryjeans
4	1	images/catalog/products/DUP-2373-10012014052424.jpg	0	2014-04-15 01:21:57.15895+05	mysteryjeans
5	1	images/catalog/products/DUP-2373-10012014052424-2.jpg	0	2014-04-15 01:22:04.747474+05	mysteryjeans
6	1	images/catalog/products/DUP-2373-10012014052444.jpg	0	2014-04-15 01:22:11.035306+05	mysteryjeans
7	2	images/catalog/products/2527-12032014041705.jpg	0	2014-04-15 01:45:48.665493+05	mysteryjeans
8	2	images/catalog/products/2527-12032014041718.jpg	0	2014-04-15 01:45:56.083965+05	mysteryjeans
9	2	images/catalog/products/2527-12032014041728.jpg	0	2014-04-15 01:46:06.807751+05	mysteryjeans
10	3	images/catalog/products/2578-10042014123959.jpg	0	2014-04-15 01:46:16.469075+05	mysteryjeans
11	3	images/catalog/products/2578-10042014124036.jpg	0	2014-04-15 01:46:27.128324+05	mysteryjeans
12	3	images/catalog/products/2578-10042014124125.jpg	0	2014-04-15 01:46:49.215692+05	mysteryjeans
13	3	images/catalog/products/2578-10042014124210.jpg	0	2014-04-15 01:46:56.547976+05	mysteryjeans
14	4	images/catalog/products/2532-15032014122600.jpg	0	2014-04-18 02:15:36.6025+05	mysteryjeans
15	4	images/catalog/products/2532-15032014122644.jpg	0	2014-04-18 02:15:49.226314+05	mysteryjeans
16	4	images/catalog/products/2532-15032014122738.jpeg	0	2014-04-18 02:15:56.535827+05	mysteryjeans
17	4	images/catalog/products/2532-15032014122838.jpg	0	2014-04-18 02:16:04.611387+05	mysteryjeans
18	5	images/catalog/products/2530-13032014020713.jpg	0	2014-04-18 02:45:20.537049+05	mysteryjeans
19	5	images/catalog/products/2530-13032014020804.jpg	0	2014-04-18 02:45:28.34175+05	mysteryjeans
20	5	images/catalog/products/2530-13032014020830.jpg	0	2014-04-18 02:45:36.609997+05	mysteryjeans
21	5	images/catalog/products/2530-13032014020922.jpg	0	2014-04-18 02:45:45.438976+05	mysteryjeans
22	6	images/catalog/products/0000953-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:02:33.28521+05	mysteryjeans
23	6	images/catalog/products/0000954-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:02:41.43355+05	mysteryjeans
24	6	images/catalog/products/0000955-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:02:51.586995+05	mysteryjeans
25	6	images/catalog/products/0000956-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:02:59.789296+05	mysteryjeans
26	6	images/catalog/products/0000957-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:03:11.042195+05	mysteryjeans
27	6	images/catalog/products/0000958-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:03:24.741527+05	mysteryjeans
28	6	images/catalog/products/0000959-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:03:32.998695+05	mysteryjeans
29	6	images/catalog/products/0000960-dell-inspiron-one-23-70.jpg	0	2014-04-18 03:03:40.485372+05	mysteryjeans
30	7	images/catalog/products/0000952-dell-optiplex-3010-dt-base.jpg	0	2014-04-18 03:22:19.371211+05	mysteryjeans
31	8	images/catalog/products/0000055_hp-iq506-touchsmart-desktop-pc_300.jpeg	0	2014-04-18 03:22:35.366454+05	mysteryjeans
32	9	images/catalog/products/2590-15042014010512.jpg	0	2014-04-18 05:04:23.326892+05	mysteryjeans
33	10	images/catalog/products/2593-17042014014316.jpg	0	2014-04-18 05:05:36.33623+05	mysteryjeans
34	10	images/catalog/products/2593-17042014014531.jpg	0	2014-04-18 05:05:46.090679+05	mysteryjeans
35	10	images/catalog/products/2593-17042014014629.jpg	0	2014-04-18 05:05:57.476751+05	mysteryjeans
36	10	images/catalog/products/2593-17042014014703.jpg	0	2014-04-18 05:06:06.988615+05	mysteryjeans
37	11	images/catalog/products/2591-15042014015650.jpg	0	2014-04-18 05:10:19.413676+05	mysteryjeans
38	11	images/catalog/products/2591-15042014015710.jpg	0	2014-04-18 05:10:31.206894+05	mysteryjeans
39	11	images/catalog/products/2591-15042014015925.jpg	0	2014-04-18 05:10:38.810019+05	mysteryjeans
40	11	images/catalog/products/2591-15042014020034.jpg	0	2014-04-18 05:10:51.693925+05	mysteryjeans
41	12	images/catalog/products/0000033_best-grilling-recipes_300.jpeg	0	2014-04-18 05:23:10.377787+05	mysteryjeans
42	13	images/catalog/products/0000045_cooking-for-two_300.jpeg	0	2014-04-18 05:25:04.557828+05	mysteryjeans
43	14	images/catalog/products/0001209-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:49:19.876107+05	mysteryjeans
44	14	images/catalog/products/0000785-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:49:29.307124+05	mysteryjeans
45	14	images/catalog/products/0000787-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:49:40.984871+05	mysteryjeans
46	14	images/catalog/products/0000788-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:49:51.048987+05	mysteryjeans
47	14	images/catalog/products/0000788-apple-iphone-5-32-gb-70_1.jpg	0	2014-04-18 05:49:59.946245+05	mysteryjeans
48	14	images/catalog/products/0000786-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:50:08.540255+05	mysteryjeans
49	14	images/catalog/products/0000789-apple-iphone-5-32-gb-70.jpg	0	2014-04-18 05:50:16.815913+05	mysteryjeans
50	15	images/catalog/products/2068-20082013022614.jpg	0	2014-04-18 05:56:00.968796+05	mysteryjeans
51	16	images/catalog/products/1487.jpg	0	2014-04-18 05:58:55.714915+05	mysteryjeans
\.


--
-- Name: catalog_product_pic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('catalog_product_pic_id_seq', 51, true);


--
-- Data for Name: catalog_product_spec; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY catalog_product_spec (id, name, value, product_id, display_order, created_on, created_by) FROM stdin;
1	Processor	Intel Core i5-4200U with Intel HD Graphics 4400 (1.6 GHz, 3 MB cache, 2 cores)	3	0	2014-04-15 01:49:43.792073+05	mysteryjeans
2	Memory	4 GB 1600 MHz DDR3L SDRAM (1 x 4 GB)	3	0	2014-04-15 01:53:15.899507+05	mysteryjeans
3	Hard Drive	750 GB 5400 rpm SATA	3	0	2014-04-15 01:54:14.077736+05	mysteryjeans
4	Display	39.6 cm (15.6") diagonal HD BrightView LED-backlit (1366 x 768)	3	0	2014-04-15 01:54:33.540771+05	mysteryjeans
5	Operating System	FreeDOS	3	0	2014-04-15 01:55:14.810362+05	mysteryjeans
6	Optical Drive	SuperMulti DVD burner	3	0	2014-04-15 01:55:37.726782+05	mysteryjeans
7	LAN	Integrated 10/100 BASE-T Ethernet LAN	3	0	2014-04-15 01:56:40.331922+05	mysteryjeans
8	Wireless LAN - WiFi	802.11b/g/n	3	0	2014-04-15 01:57:46.694998+05	mysteryjeans
9	Bluetooth	Bluetooth 4.0	3	0	2014-04-15 01:59:02.615183+05	mysteryjeans
10	Card Reader	1 multi-format SD media card reader	3	0	2014-04-16 02:11:59.832775+05	mysteryjeans
11	Webcam	HP TrueVision HD Webcam (front-facing) with integrated dual array digital microphone	3	0	2014-04-18 01:24:09.204735+05	mysteryjeans
12	Graphic Card	 NVIDIA GeForce GT 740M (2 GB DDR3 dedicated)	3	0	2014-04-18 01:24:38.969725+05	mysteryjeans
13	Sound	DTS Sound+ with 2 speakers	3	0	2014-04-18 01:25:02.602123+05	mysteryjeans
14	Keyboard	Full-size island-style with numeric keypad	3	0	2014-04-18 01:25:21.127426+05	mysteryjeans
15	Dimensions	38.56 x 25.8 x 2.26 cm	3	0	2014-04-18 01:25:41.142581+05	mysteryjeans
16	Weight	2.3 kg	3	0	2014-04-18 01:26:05.013306+05	mysteryjeans
17	USB	1 USB 2.0 - 2 USB 3.0	3	0	2014-04-18 01:26:34.192544+05	mysteryjeans
18	HDMI	1 HDMI	3	0	2014-04-18 01:27:00.902861+05	mysteryjeans
19	Audiojack	1 headphone/microphone combo	3	0	2014-04-18 01:28:25.354623+05	mysteryjeans
20	Processor	Intel Core i5-3230M with Intel HD Graphics 4000 (2.6 GHz, 3 MB cache, 2 cores)	2	0	2014-04-18 01:43:44.756071+05	mysteryjeans
21	Memory	4 GB 1600 MHz DDR3L SDRAM (1 x 4 GB)	2	0	2014-04-18 01:43:44.818786+05	mysteryjeans
22	Hard Drive	1 TB 5400 rpm SATA	2	0	2014-04-18 01:43:44.840555+05	mysteryjeans
23	Display	39.6 cm (15.6") diagonal HD BrightView LED-backlit (1366 x 768)	2	0	2014-04-18 01:43:44.862179+05	mysteryjeans
24	Operating System	Windows 8.1 (64 bits)	2	0	2014-04-18 01:43:44.883819+05	mysteryjeans
25	Optical Drive	SuperMulti DVD burner	2	0	2014-04-18 01:43:44.906136+05	mysteryjeans
26	LAN	Integrated 10/100 BASE-T Ethernet LAN	2	0	2014-04-18 01:43:44.927276+05	mysteryjeans
27	Wireless LAN - WiFi	802.11b/g/n	2	0	2014-04-18 01:43:44.948922+05	mysteryjeans
28	Bluetooth	Bluetooth 4.0	2	0	2014-04-18 01:43:44.969525+05	mysteryjeans
29	Card Reader	1 multi-format SD media card reader	2	0	2014-04-18 01:43:44.991557+05	mysteryjeans
30	Webcam	HP TrueVision HD Webcam (front-facing) with integrated digital microphone	2	0	2014-04-18 01:43:45.013088+05	mysteryjeans
31	Graphic Card	NVIDIA GeForce 820M (1 GB DDR3 dedicated)	2	0	2014-04-18 01:43:45.03522+05	mysteryjeans
32	Sound	Dual speakers	2	0	2014-04-18 01:43:45.057781+05	mysteryjeans
33	Keyboard	Full-size island-style	2	0	2014-04-18 01:43:45.079574+05	mysteryjeans
34	Dimensions	37.8 x 26 x 2.8 cm	2	0	2014-04-18 01:43:45.101246+05	mysteryjeans
35	Weight	2.5 kg	2	0	2014-04-18 01:43:45.123643+05	mysteryjeans
36	USB	2 USB 2.0 - 1 USB 3.0	2	0	2014-04-18 01:43:45.144914+05	mysteryjeans
37	HDMI	1 HDMI	2	0	2014-04-18 01:43:45.166859+05	mysteryjeans
38	VGA	1 VGA	2	0	2014-04-18 01:43:45.189184+05	mysteryjeans
39	Audiojack	1 headphone/microphone combo	2	0	2014-04-18 01:43:45.210967+05	mysteryjeans
40	Processor	Intel® Core™ i3-4000M Processor (3M Cache, 2.40 GHz)	1	0	2014-04-18 02:01:09.162669+05	mysteryjeans
41	Memory	4GB	1	0	2014-04-18 02:01:09.184379+05	mysteryjeans
42	Hard Drive	500GB	1	0	2014-04-18 02:01:09.206285+05	mysteryjeans
43	Display	15.6" high-definition (1366 x 768) / 200 nit display, 16:9 widescreen	1	0	2014-04-18 02:01:09.227412+05	mysteryjeans
44	Optical Drive	DVDRW	1	0	2014-04-18 02:01:09.249783+05	mysteryjeans
45	LAN	10 / 100 Mbps LAN	1	0	2014-04-18 02:01:09.271406+05	mysteryjeans
46	Wireless LAN - WiFi	802.11 b/g/n	1	0	2014-04-18 02:01:09.293164+05	mysteryjeans
47	Bluetooth	Bluetooth® 4.0	1	0	2014-04-18 02:01:09.314384+05	mysteryjeans
48	Card Reader	2 x 1 (SD / MMC) card reader	1	0	2014-04-18 02:01:09.335458+05	mysteryjeans
49	Webcam	Integrated HD 720p camera	1	0	2014-04-18 02:01:09.35697+05	mysteryjeans
50	Graphic Card	Intel® HD Graphics 4600	1	0	2014-04-18 02:01:09.400619+05	mysteryjeans
51	Sound	Integrated Stereo speakers with Dolby® - Advanced Audio™ certification	1	0	2014-04-18 02:01:09.422123+05	mysteryjeans
52	Keyboard	Full Size with Numeric Keys	1	0	2014-04-18 02:01:09.443652+05	mysteryjeans
53	Dimensions	14.84" x 9.84" x 1.33"	1	0	2014-04-18 02:01:09.464994+05	mysteryjeans
54	Weight	5.73 lbs Approx	1	0	2014-04-18 02:01:09.486617+05	mysteryjeans
55	USB	USB 3.0 x 2, USB 2.0 x 1	1	0	2014-04-18 02:01:09.508181+05	mysteryjeans
56	HDMI	HDMI-out	1	0	2014-04-18 02:01:09.530204+05	mysteryjeans
57	VGA	VGA connector	1	0	2014-04-18 02:01:09.551403+05	mysteryjeans
58	Audiojack	2-in-1 Audio jack (headphone and mic)	1	0	2014-04-18 02:01:09.572697+05	mysteryjeans
59	Processor	Intel® Core™ i3-3110M Processor (3M Cache, 2.40 GHz)	4	0	2014-04-18 02:27:56.757942+05	mysteryjeans
60	Memory	4GB DDR3 1600Mhz	4	0	2014-04-18 02:27:56.779136+05	mysteryjeans
61	Hard Drive	500GB 5400 RPM	4	0	2014-04-18 02:27:56.801117+05	mysteryjeans
62	Optical Drive	DVDRW	4	0	2014-04-18 02:27:56.845099+05	mysteryjeans
63	LAN	Fast Ethernet LAN 10BASE-T/100BASE-TX	4	0	2014-04-18 02:27:56.865957+05	mysteryjeans
64	Wireless LAN - WiFi	802.11b/g/n (up to 150 Mbps)	4	0	2014-04-18 02:27:56.887836+05	mysteryjeans
65	Bluetooth	Bluetooth® 4.0	4	0	2014-04-18 02:27:56.910016+05	mysteryjeans
66	Webcam	1 x integrated 0.9MP HD Web Camera (1,280 x 720) with built-in microphone	4	0	2014-04-18 02:27:56.952275+05	mysteryjeans
137	Optical Drive	DVD-Writer	5	0	2014-04-18 02:48:58.130359+05	mysteryjeans
67	Graphic Card	NVIDIA® GeForce® 710M with CUDA™ Technology and NVIDIA® Optimus™ Technology 1,024 MB dedicated VRAM.	4	0	2014-04-18 02:27:56.973813+05	mysteryjeans
68	Sound	Built-in stereo speaker - HD Audio supporting	4	0	2014-04-18 02:27:57.019132+05	mysteryjeans
69	Keyboard	Flat matt keyboard and 10-digit numeric keypad	4	0	2014-04-18 02:27:57.039573+05	mysteryjeans
70	Dimensions	W x L x H : 380.0 x 242.0 x 30.8 (front) / 33.35 (rear) mm	4	0	2014-04-18 02:27:57.060837+05	mysteryjeans
71	Weight	starting at 2.3 kg	4	0	2014-04-18 02:27:57.082569+05	mysteryjeans
72	USB	2 x USB 2.0 & 1 x USB 3.0	4	0	2014-04-18 02:27:57.104517+05	mysteryjeans
73	HDMI	1 x HDMI-out supporting 1080p signal format	4	0	2014-04-18 02:27:57.126182+05	mysteryjeans
74	VGA	1 x external monitor	4	0	2014-04-18 02:27:57.14699+05	mysteryjeans
75	Audiojack	1 x headphone (stereo)	4	0	2014-04-18 02:27:57.168606+05	mysteryjeans
79	Resolution	1,366 x 768	4	0	2014-04-18 02:34:46.787818+05	mysteryjeans
115	Display	39.6cm (15.6") Toshiba TruBrite®	4	0	2014-04-18 02:38:23.013385+05	mysteryjeans
121	Card Reader	1 x Multi-Card Reader (supports SD™ Card up to 2 GB, miniSD™/microSD™ Card with adapter up to 2 GB, SDHC™ Card up to 32 GB, SDXC™ Card up to 64 GB and MultiMedia Card™ up to 2 GB)	4	0	2014-04-18 02:38:23.143178+05	mysteryjeans
132	Processor	Intel® Core™ i3-3217U Processor (3M Cache, 1.80 GHz)	5	0	2014-04-18 02:48:58.022653+05	mysteryjeans
133	Memory	4 GB DDR3 SDRAM	5	0	2014-04-18 02:48:58.044434+05	mysteryjeans
134	Hard Drive	500 GB Serial ATA	5	0	2014-04-18 02:48:58.065945+05	mysteryjeans
135	Display	39.6 cm (15.6") WXGA Acer CineCrystal LED	5	0	2014-04-18 02:48:58.087463+05	mysteryjeans
136	Operating System	Windows 8.1 Single Language 64-bit	5	0	2014-04-18 02:48:58.109442+05	mysteryjeans
138	LAN	Gigabit Ethernet	5	0	2014-04-18 02:48:58.152401+05	mysteryjeans
139	Wireless LAN - WiFi	IEEE 802.11b/g/n	5	0	2014-04-18 02:48:58.174029+05	mysteryjeans
140	Bluetooth	Yes	5	0	2014-04-18 02:48:58.195746+05	mysteryjeans
141	Card Reader	Secure Digital (SD) Card	5	0	2014-04-18 02:48:58.217215+05	mysteryjeans
142	Webcam	Acer Crystal Eye HD Webcam	5	0	2014-04-18 02:48:58.238751+05	mysteryjeans
143	Graphic Card	Intel HD Graphics 4000	5	0	2014-04-18 02:48:58.259847+05	mysteryjeans
144	CPU-manufacturer	Intel	6	0	2014-04-18 03:08:58.07919+05	mysteryjeans
145	RAM	4 GB	6	0	2014-04-18 03:09:26.589554+05	mysteryjeans
146	Mass Storage Type 	HDD	6	0	2014-04-18 03:09:56.796401+05	mysteryjeans
147	Color	Black	6	0	2014-04-18 03:10:14.240396+05	mysteryjeans
148	OS	Windows 7 32 Bit	6	0	2014-04-18 03:10:29.520014+05	mysteryjeans
149	Frequency	1.2 Ghz	11	0	2014-04-18 05:15:53.507087+05	mysteryjeans
150	CPU	MediaTek Quad-Core	11	0	2014-04-18 05:15:53.528592+05	mysteryjeans
151	Graphics Processing	PowerVR SGX544	11	0	2014-04-18 05:15:53.550163+05	mysteryjeans
152	Screen Size	7.9"	11	0	2014-04-18 05:15:53.571887+05	mysteryjeans
153	Screen Resolution	1024 x 768	11	0	2014-04-18 05:15:53.594381+05	mysteryjeans
154	Screen Type	XGA TFT Capacitive multi-touch with IPS technology	11	0	2014-04-18 05:15:53.615048+05	mysteryjeans
155	Internal Storage	16 GB	11	0	2014-04-18 05:15:53.63687+05	mysteryjeans
156	RAM	1 GB	11	0	2014-04-18 05:15:53.658482+05	mysteryjeans
157	Exapandable	microSD, up to 32 GB	11	0	2014-04-18 05:15:53.679379+05	mysteryjeans
158	WiFi	IEEE 802.11 b/g/n	11	0	2014-04-18 05:15:53.700909+05	mysteryjeans
159	Bluetooth	Bluetooth 4.0	11	0	2014-04-18 05:15:53.722566+05	mysteryjeans
160	HDMI	HDMI port	11	0	2014-04-18 05:15:53.744156+05	mysteryjeans
161	Camera	5 MP Rear & 0.3 MP Front Camera	11	0	2014-04-18 05:15:53.766101+05	mysteryjeans
162	Operating System	Android OS, v4.2 (Jelly Bean)	11	0	2014-04-18 05:15:53.787795+05	mysteryjeans
\.


--
-- Name: catalog_product_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('catalog_product_spec_id_seq', 162, true);


--
-- Data for Name: common_address; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY common_address (id, customer_id, first_name, last_name, email, company, country_id, state_id, city, address1, address2, zip_or_postal_code, phone_number, fax_number, updated_on, updated_by, created_on, created_by) FROM stdin;
\.


--
-- Name: common_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('common_address_id_seq', 1, false);


--
-- Data for Name: common_user; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY common_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, birthday, gender, billing_address_id, shipping_adress_id, is_verified, verification_code, updated_on, updated_by, created_on, created_by) FROM stdin;
1	pbkdf2_sha256$12000$adgKWsDV5clx$7xr0vIvOdXxf8RItZzQENVxw6WX4HIXhgJyDETqNqkg=	2014-04-25 12:15:48.015587+05	t	mysteryjeans			mk.faraz@gmail.com	t	t	2014-04-13 04:51:50.059959+05	\N		\N	\N	t	\N	2014-04-13 04:51:50.15636+05	faraz	2014-04-13 04:51:50.156387+05	faraz
\.


--
-- Data for Name: common_user_groups; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY common_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: common_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('common_user_groups_id_seq', 1, false);


--
-- Name: common_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('common_user_id_seq', 1, true);


--
-- Data for Name: common_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY common_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: common_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('common_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-04-13 05:06:10.494564+05	1	10	1	Apple	1	
2	2014-04-13 05:07:02.005059+05	1	10	2	Dell	1	
3	2014-04-13 05:08:27.069537+05	1	10	3	HP	1	
4	2014-04-13 05:12:34.764798+05	1	10	4	ASUS	1	
5	2014-04-13 05:21:05.702208+05	1	11	1	Books	1	
6	2014-04-13 05:22:33.07303+05	1	11	2	Computer	1	
7	2014-04-13 05:23:29.116839+05	1	11	3	Computer > Desktops	1	
8	2014-04-13 05:23:48.154636+05	1	11	4	Computer > Notebooks	1	
9	2014-04-13 05:25:27.877814+05	1	11	5	Computer > Accessories	1	
10	2014-04-13 05:25:47.769967+05	1	11	6	Computer > Games	1	
11	2014-04-13 05:25:58.92201+05	1	11	7	Computer > Softwares	1	
12	2014-04-13 05:27:30.632596+05	1	11	8	Electronics	1	
13	2014-04-13 05:27:50.361466+05	1	11	9	Camera	1	
14	2014-04-13 05:28:12.450517+05	1	11	10	Electronics > Mobile	1	
15	2014-04-13 05:28:18.01658+05	1	11	9	Electronics > Camera	2	Changed parent.
16	2014-04-13 05:33:22.300841+05	1	11	3	Computer > Desktops	2	Changed pic.
17	2014-04-13 05:35:53.490525+05	1	11	4	Computer > Notebooks	2	Changed pic.
18	2014-04-13 05:36:07.049559+05	1	11	5	Computer > Accessories	2	Changed pic.
19	2014-04-13 05:36:52.115197+05	1	11	3	Computer > Desktops	2	Changed pic.
20	2014-04-13 05:37:03.348348+05	1	11	6	Computer > Games	2	Changed pic.
21	2014-04-13 05:37:46.802724+05	1	11	7	Computer > Softwares	2	Changed pic.
22	2014-04-13 05:38:55.871837+05	1	11	11	Electronics > MP3 Player	1	
23	2014-04-13 05:42:15.964816+05	1	11	9	Electronics > Camera	2	Changed pic.
24	2014-04-13 05:42:27.372447+05	1	11	10	Electronics > Mobile	2	Changed pic.
25	2014-04-13 05:44:16.327857+05	1	11	12	Apparel & Shoes	1	
26	2014-04-13 05:47:00.978564+05	1	11	13	Apparel & Shoes > Shirts	1	
27	2014-04-13 05:48:21.21768+05	1	11	14	Apparel & Shoes > Jeans	1	
28	2014-04-13 05:52:23.524135+05	1	11	15	Apparel & Shoes > Shoes	1	
29	2014-04-13 05:52:47.585171+05	1	11	13	Apparel & Shoes > Shirts	2	Changed display_order.
30	2014-04-13 05:52:53.11252+05	1	11	14	Apparel & Shoes > Jeans	2	Changed display_order.
31	2014-04-13 05:52:58.592334+05	1	11	15	Apparel & Shoes > Shoes	2	Changed display_order.
32	2014-04-13 05:54:15.712418+05	1	11	16	Jewelry	1	
33	2014-04-15 00:54:52.752725+05	1	10	5	Lenovo	1	
34	2014-04-15 01:05:22.246826+05	1	10	6	Toshiba	1	
35	2014-04-15 01:11:10.586591+05	1	20	1	Computers & Electronics [PE]: 0.02	1	
36	2014-04-15 01:11:50.585011+05	1	12	1	Lenovo G510 Laptop	1	
37	2014-04-15 01:19:06.046108+05	1	14	2	Lenovo G510 Laptop [Pic 2]	1	
38	2014-04-15 01:20:42.351444+05	1	14	3	Lenovo G510 Laptop [Pic 3]	1	
39	2014-04-15 01:21:57.160364+05	1	14	4	Lenovo G510 Laptop [Pic #id 4]	1	
40	2014-04-15 01:22:04.748811+05	1	14	5	Lenovo G510 Laptop [Pic #id 5]	1	
41	2014-04-15 01:22:11.036774+05	1	14	6	Lenovo G510 Laptop [Pic #id 6]	1	
42	2014-04-15 01:30:18.548318+05	1	12	2	HP 15-d008se Notebook	1	
43	2014-04-15 01:40:09.840706+05	1	12	2	HP 15-d008se Notebook	2	No fields changed.
44	2014-04-15 01:40:39.401254+05	1	12	2	HP 15-d008se Notebook	2	Changed cost.
45	2014-04-15 01:42:13.764136+05	1	12	3	HP Pavilion 15-n242se Notebook PC	1	
46	2014-04-15 01:44:02.276375+05	1	12	3	HP Pavilion 15-n242se Notebook PC	2	Changed tags.
47	2014-04-15 01:44:13.477345+05	1	12	2	HP 15-d008se Notebook-PC	2	Changed name.
48	2014-04-15 01:44:19.959899+05	1	12	2	HP 15-d008se Notebook PC	2	Changed name.
49	2014-04-15 01:45:48.666881+05	1	14	7	HP 15-d008se Notebook PC [Pic #id 7]	1	
50	2014-04-15 01:45:56.085896+05	1	14	8	HP 15-d008se Notebook PC [Pic #id 8]	1	
51	2014-04-15 01:46:06.809303+05	1	14	9	HP 15-d008se Notebook PC [Pic #id 9]	1	
52	2014-04-15 01:46:16.470425+05	1	14	10	HP Pavilion 15-n242se Notebook PC [Pic #id 10]	1	
53	2014-04-15 01:46:27.129731+05	1	14	11	HP Pavilion 15-n242se Notebook PC [Pic #id 11]	1	
54	2014-04-15 01:46:49.217144+05	1	14	12	HP Pavilion 15-n242se Notebook PC [Pic #id 12]	1	
55	2014-04-15 01:46:56.54943+05	1	14	13	HP Pavilion 15-n242se Notebook PC [Pic #id 13]	1	
56	2014-04-15 01:49:43.793602+05	1	13	1	Processor: Intel Core i5-4200U with Intel HD Graphics 4400 (1.6 GHz, 3 MB cache, 2 cores)	1	
57	2014-04-15 01:53:15.901072+05	1	13	2	Memory: 4 GB 1600 MHz DDR3L SDRAM (1 x 4 GB)	1	
58	2014-04-15 01:54:14.078856+05	1	13	3	Hard Drive: 750 GB 5400 rpm SATA	1	
59	2014-04-15 01:54:33.542423+05	1	13	4	Display: 39.6 cm (15.6") diagonal HD BrightView LED-backlit (1366 x 768)	1	
60	2014-04-15 01:55:14.811535+05	1	13	5	Operating System: FreeDOS	1	
61	2014-04-15 01:55:37.727888+05	1	13	6	Optical Drive: SuperMulti DVD burner	1	
62	2014-04-15 01:56:40.333252+05	1	13	7	LAN: Integrated 10/100 BASE-T Ethernet LAN	1	
63	2014-04-15 01:57:46.69609+05	1	13	8	Wireless LAN - WiFi: 802.11b/g/n	1	
64	2014-04-15 01:59:02.616789+05	1	13	9	Bluetooth: Bluetooth 4.0	1	
65	2014-04-15 02:07:20.25335+05	1	10	2	Dell	2	Changed pic.
66	2014-04-15 02:07:47.59689+05	1	10	1	Apple	2	Changed pic.
67	2014-04-15 02:08:25.595192+05	1	10	1	Apple	2	Changed pic.
68	2014-04-15 02:08:56.086826+05	1	10	3	HP	2	Changed pic.
69	2014-04-16 02:11:59.883724+05	1	13	10	Card Reader: 1 multi-format SD media card reader	1	
70	2014-04-18 01:24:09.205921+05	1	13	11	Webcam: HP TrueVision HD Webcam (front-facing) with integrated dual array digital microphone	1	
71	2014-04-18 01:24:38.970829+05	1	13	12	Graphic Card:  NVIDIA GeForce GT 740M (2 GB DDR3 dedicated)	1	
72	2014-04-18 01:25:02.603241+05	1	13	13	Sound: DTS Sound+ with 2 speakers	1	
73	2014-04-18 01:25:21.12874+05	1	13	14	Keyboard: Full-size island-style with numeric keypad	1	
74	2014-04-18 01:25:41.143888+05	1	13	15	Dimensions: 38.56 x 25.8 x 2.26 cm	1	
75	2014-04-18 01:26:05.014433+05	1	13	16	Weight: 2.3 kg	1	
76	2014-04-18 01:26:34.194125+05	1	13	17	USB: 1 USB 2.0 - 2 USB 3.0	1	
77	2014-04-18 01:27:00.90396+05	1	13	18	HDMI: 1 HDMI	1	
78	2014-04-18 01:28:25.355911+05	1	13	19	Audiojack: 1 headphone/microphone combo	1	
79	2014-04-18 02:13:40.68291+05	1	12	4	Toshiba Satellite C50-A539	1	
80	2014-04-18 02:15:36.629747+05	1	14	14	Toshiba Satellite C50-A539 [Pic #id 14]	1	
81	2014-04-18 02:15:49.227704+05	1	14	15	Toshiba Satellite C50-A539 [Pic #id 15]	1	
82	2014-04-18 02:15:56.537516+05	1	14	16	Toshiba Satellite C50-A539 [Pic #id 16]	1	
83	2014-04-18 02:16:04.612973+05	1	14	17	Toshiba Satellite C50-A539 [Pic #id 17]	1	
84	2014-04-18 02:42:25.03977+05	1	10	7	Acer	1	
85	2014-04-18 02:44:30.941556+05	1	12	5	Acer Aspire E1-570G	1	
86	2014-04-18 02:45:20.539431+05	1	14	18	Acer Aspire E1-570G [Pic #id 18]	1	
87	2014-04-18 02:45:28.343331+05	1	14	19	Acer Aspire E1-570G [Pic #id 19]	1	
88	2014-04-18 02:45:36.613414+05	1	14	20	Acer Aspire E1-570G [Pic #id 20]	1	
89	2014-04-18 02:45:45.44063+05	1	14	21	Acer Aspire E1-570G [Pic #id 21]	1	
90	2014-04-18 03:01:12.523471+05	1	12	6	Dell Inspiron One 23	1	
91	2014-04-18 03:02:33.286696+05	1	14	22	Dell Inspiron One 23 [Pic #id 22]	1	
92	2014-04-18 03:02:41.435104+05	1	14	23	Dell Inspiron One 23 [Pic #id 23]	1	
93	2014-04-18 03:02:51.588593+05	1	14	24	Dell Inspiron One 23 [Pic #id 24]	1	
94	2014-04-18 03:02:59.791008+05	1	14	25	Dell Inspiron One 23 [Pic #id 25]	1	
95	2014-04-18 03:03:11.044202+05	1	14	26	Dell Inspiron One 23 [Pic #id 26]	1	
96	2014-04-18 03:03:24.743073+05	1	14	27	Dell Inspiron One 23 [Pic #id 27]	1	
97	2014-04-18 03:03:33.000143+05	1	14	28	Dell Inspiron One 23 [Pic #id 28]	1	
98	2014-04-18 03:03:40.487058+05	1	14	29	Dell Inspiron One 23 [Pic #id 29]	1	
99	2014-04-18 03:08:58.080484+05	1	13	144	CPU-manufacturer: Intel	1	
100	2014-04-18 03:09:26.591114+05	1	13	145	RAM: 4 GB	1	
101	2014-04-18 03:09:56.797624+05	1	13	146	Mass Storage Type : HDD	1	
102	2014-04-18 03:10:14.241805+05	1	13	147	Color: Black	1	
103	2014-04-18 03:10:29.521933+05	1	13	148	OS: Windows 7 32 Bit	1	
104	2014-04-18 03:17:59.486176+05	1	12	7	Dell Optiplex 3010 DT Base	1	
105	2014-04-18 03:21:21.080098+05	1	12	8	HP IQ506 TouchSmart Desktop PC 	1	
106	2014-04-18 03:22:19.374858+05	1	14	30	Dell Optiplex 3010 DT Base [Pic #id 30]	1	
107	2014-04-18 03:22:35.367913+05	1	14	31	HP IQ506 TouchSmart Desktop PC  [Pic #id 31]	1	
108	2014-04-18 04:34:25.392197+05	1	10	8	Microsoft	1	
109	2014-04-18 04:41:29.392451+05	1	12	9	Microsoft Windows 8.1 Pro x64 English	1	
110	2014-04-18 04:41:49.979382+05	1	12	9	Microsoft Windows 8.1 Pro x64 English	2	Changed tags.
111	2014-04-18 05:00:24.135153+05	1	10	9	Logitech	1	
112	2014-04-18 05:01:21.509472+05	1	11	17	Electronics > Speakers	1	
113	2014-04-18 05:03:10.420223+05	1	12	10	Logitech X100 Mobile Wireless Speaker	1	
114	2014-04-18 05:04:23.329782+05	1	14	32	Microsoft Windows 8.1 Pro x64 English [Pic #id 32]	1	
115	2014-04-18 05:05:36.337896+05	1	14	33	Logitech X100 Mobile Wireless Speaker [Pic #id 33]	1	
116	2014-04-18 05:05:46.092692+05	1	14	34	Logitech X100 Mobile Wireless Speaker [Pic #id 34]	1	
117	2014-04-18 05:05:57.478141+05	1	14	35	Logitech X100 Mobile Wireless Speaker [Pic #id 35]	1	
118	2014-04-18 05:06:06.990818+05	1	14	36	Logitech X100 Mobile Wireless Speaker [Pic #id 36]	1	
119	2014-04-18 05:08:23.866917+05	1	11	18	Electronics > Tablet	1	
120	2014-04-18 05:09:25.458494+05	1	12	11	Acer Iconia A1-810	1	
121	2014-04-18 05:10:19.415147+05	1	14	37	Acer Iconia A1-810 [Pic #id 37]	1	
122	2014-04-18 05:10:31.208364+05	1	14	38	Acer Iconia A1-810 [Pic #id 38]	1	
123	2014-04-18 05:10:38.811551+05	1	14	39	Acer Iconia A1-810 [Pic #id 39]	1	
124	2014-04-18 05:10:51.696117+05	1	14	40	Acer Iconia A1-810 [Pic #id 40]	1	
125	2014-04-18 05:20:34.378119+05	1	10	10	Miscellaneous	1	
126	2014-04-18 05:22:10.451153+05	1	20	2	Books [PE]: 0.02	1	
127	2014-04-18 05:22:29.075165+05	1	12	12	Best Grilling Recipes	1	
128	2014-04-18 05:23:10.379399+05	1	14	41	Best Grilling Recipes [Pic #id 41]	1	
129	2014-04-18 05:24:29.805495+05	1	12	13	Cooking for Two	1	
130	2014-04-18 05:25:04.561511+05	1	14	42	Cooking for Two [Pic #id 42]	1	
131	2014-04-18 05:25:30.931035+05	1	12	13	Cooking for Two	2	Changed description.
132	2014-04-18 05:47:39.115188+05	1	12	14	iPhone 5s	1	
133	2014-04-18 05:49:19.87832+05	1	14	43	iPhone 5s [Pic #id 43]	1	
134	2014-04-18 05:49:29.308893+05	1	14	44	iPhone 5s [Pic #id 44]	1	
135	2014-04-18 05:49:40.986541+05	1	14	45	iPhone 5s [Pic #id 45]	1	
136	2014-04-18 05:49:51.050705+05	1	14	46	iPhone 5s [Pic #id 46]	1	
137	2014-04-18 05:49:59.947809+05	1	14	47	iPhone 5s [Pic #id 47]	1	
138	2014-04-18 05:50:08.542432+05	1	14	48	iPhone 5s [Pic #id 48]	1	
139	2014-04-18 05:50:16.817666+05	1	14	49	iPhone 5s [Pic #id 49]	1	
140	2014-04-18 05:51:24.6456+05	1	12	14	iPhone 5S	2	Changed name.
141	2014-04-18 05:51:40.325941+05	1	12	14	iPhone 5s	2	Changed name.
142	2014-04-18 05:53:17.638785+05	1	10	11	Mcafee	1	
143	2014-04-18 05:55:24.886024+05	1	12	15	McAfee AntiVirus Plus - 1 PC for 1 Year	1	
144	2014-04-18 05:56:00.970865+05	1	14	50	McAfee AntiVirus Plus - 1 PC for 1 Year [Pic #id 50]	1	
145	2014-04-18 05:57:00.481789+05	1	10	12	Node 32	1	
146	2014-04-18 05:58:27.14351+05	1	12	16	ESET NOD32 Antivirus 5	1	
147	2014-04-18 05:58:55.716734+05	1	14	51	ESET NOD32 Antivirus 5 [Pic #id 51]	1	
148	2014-04-18 05:59:23.930359+05	1	10	12	NOD32	2	Changed name and slug.
149	2014-04-25 12:15:56.75587+05	1	11	2	Computers	2	Changed name and slug.
150	2014-04-25 13:03:19.856763+05	1	11	19	Computers > Games > PS4	1	
151	2014-04-25 13:03:33.663682+05	1	11	20	Computers > Games > XBox	1	
152	2014-04-25 21:03:12.850261+05	1	19	1	Currency object	2	Changed price_format.
153	2014-04-25 21:04:55.013477+05	1	19	1	Currency object	2	Changed price_format.
154	2014-04-25 21:09:53.021991+05	1	19	1	Currency object	2	Changed price_format.
155	2014-04-26 02:29:16.801177+05	1	12	4	Toshiba Satellite C50-A539	2	Changed old_price.
156	2014-04-26 04:16:24.525494+05	1	12	9	Microsoft Windows 8.1 Pro x64 English This is the world class windows you will really like it	2	Changed name.
157	2014-04-26 04:16:57.326276+05	1	12	1	Lenovo G510 Laptop  This is the world class windows you will really like it	2	Changed name.
158	2014-04-26 17:27:40.876551+05	1	12	1	Lenovo G510 Laptop  This is the world class windows you will really like it	2	Changed category.
159	2014-04-26 17:27:51.096276+05	1	12	2	HP 15-d008se Notebook PC	2	Changed category.
160	2014-04-26 17:28:03.300963+05	1	12	3	HP Pavilion 15-n242se Notebook PC	2	Changed category.
161	2014-04-26 17:28:15.982904+05	1	12	4	Toshiba Satellite C50-A539	2	Changed category.
162	2014-04-26 17:29:03.021207+05	1	12	5	Acer Aspire E1-570G	2	Changed category.
163	2014-04-26 17:29:14.628036+05	1	12	6	Dell Inspiron One 23	2	Changed category.
164	2014-04-26 17:29:21.855792+05	1	12	7	Dell Optiplex 3010 DT Base	2	Changed category.
165	2014-04-26 17:29:31.891333+05	1	12	8	HP IQ506 TouchSmart Desktop PC 	2	Changed category.
166	2014-04-26 17:30:13.875646+05	1	12	9	Microsoft Windows 8.1 Pro x64 English	2	Changed name and category.
167	2014-04-26 17:30:31.886379+05	1	12	10	Logitech X100 Mobile Wireless Speaker	2	Changed category.
168	2014-04-26 17:31:25.522515+05	1	12	11	Acer Iconia A1-810	2	Changed category.
169	2014-04-26 17:31:34.336193+05	1	12	12	Best Grilling Recipes	2	Changed category.
170	2014-04-26 17:31:44.495802+05	1	12	13	Cooking for Two	2	Changed category.
171	2014-04-26 17:31:52.860176+05	1	12	14	iPhone 5s	2	Changed category.
172	2014-04-26 17:32:01.491983+05	1	12	15	McAfee AntiVirus Plus - 1 PC for 1 Year	2	Changed category.
173	2014-04-26 17:32:12.7677+05	1	12	16	ESET NOD32 Antivirus 5	2	Changed category.
174	2014-04-26 17:59:00.950759+05	1	12	1	Lenovo G510 Laptop	2	Changed name.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 174, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	content type	contenttypes	contenttype
5	session	sessions	session
6	country	geo	country
7	state	geo	state
8	address	common	address
9	user	common	user
10	manufacturer	catalog	manufacturer
11	category	catalog	category
12	product	catalog	product
13	product spec	catalog	productspec
14	product pic	catalog	productpic
15	cart	sales	cart
16	cart item	sales	cartitem
17	order	sales	order
18	order item	sales	orderitem
19	currency	financial	currency
20	tax rate	financial	taxrate
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
mzbijqdky6zju9j3ftnp6jvvggl7eoj1	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-27 04:52:17.740841+05
ht305fo3zb2100r3n43tl92ipty8ein1	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-30 02:10:14.99748+05
wyq0l7kcuq276nz6go7f9olb2o56tatz	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-05-02 01:21:38.747505+05
zmt4bmlqpl6zpqcqbq3ic2vbnnqz918y	Yzk0MGViMTY5YTU2M2QyZDQ5NWQyYmRkNmRlNjk2NjRmYmY3NDljYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-05-06 00:21:14.985442+05
qjw9d7mt29f0nf0i7xiq2qkjibx9plqa	Yzk0MGViMTY5YTU2M2QyZDQ5NWQyYmRkNmRlNjk2NjRmYmY3NDljYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-05-09 12:15:48.019365+05
\.


--
-- Data for Name: financial_currency; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY financial_currency (id, name, code, is_active, is_primary, exchange_rate, display_format, updated_by, updated_on, created_on, created_by, locale) FROM stdin;
13	US Dollar	USD	t	t	1	$%.2f	system	2014-04-26 01:59:31.276756+05	2014-04-26 01:59:31.276756+05	system	en-US
14	Pakistani Rupee	PKR	t	f	0.0100000000000000002	Rs.%.2f	system	2014-04-26 01:59:31.333433+05	2014-04-26 01:59:31.333433+05	system	ur-PK
15	Australian Dollar	AUD	f	f	0.939999999999999947	A$%.2f	system	2014-04-26 01:59:31.376474+05	2014-04-26 01:59:31.376474+05	system	en-AU
16	British Pound	GBP	f	f	0.609999999999999987	€%.2f	system	2014-04-26 01:59:31.3974+05	2014-04-26 01:59:31.3974+05	system	en-GB
17	Canadian Dollar	CAD	f	f	0.979999999999999982	C$%.2f	system	2014-04-26 01:59:31.419044+05	2014-04-26 01:59:31.419044+05	system	en-CA
18	Chinese Yuan Renminbi	CNY	f	f	6.48000000000000043	￥%.2f	system	2014-04-26 01:59:31.440077+05	2014-04-26 01:59:31.440077+05	system	zh-CN
19	Euro	EUR	t	f	0.790000000000000036	€.2f	system	2014-04-26 01:59:31.462553+05	2014-04-26 01:59:31.462553+05	system	
20	Hong Kong Dollar	HKD	f	f	7.75	HK$%.2f	system	2014-04-26 01:59:31.807515+05	2014-04-26 01:59:31.807515+05	system	zh-HK
21	Japanese Yen	JPY	f	f	80.0699999999999932	￥%.2f	system	2014-04-26 01:59:31.850331+05	2014-04-26 01:59:31.850331+05	system	ja-JP
22	Russian Rouble	RUB	f	f	27.6999999999999993	RUB%.2f	system	2014-04-26 01:59:31.871968+05	2014-04-26 01:59:31.871968+05	system	ru-RU
23	Swedish Krona	SEK	f	f	6.19000000000000039	kr%.2f	system	2014-04-26 01:59:31.89285+05	2014-04-26 01:59:31.89285+05	system	sv-SE
24	Romanian Leu	RON	f	f	2.85000000000000009	%.2f lei	system	2014-04-26 01:59:31.915354+05	2014-04-26 01:59:31.915354+05	system	ro-RO
\.


--
-- Name: financial_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('financial_currency_id_seq', 24, true);


--
-- Data for Name: financial_tax_rate; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY financial_tax_rate (id, name, method, rate, updated_by, updated_on, created_on, created_by) FROM stdin;
1	Computers & Electronics	PE	0.0200000000000000004	mysteryjeans	2014-04-15 01:11:10.584838+05	2014-04-15 01:11:10.584874+05	mysteryjeans
2	Books	PE	0.0200000000000000004	mysteryjeans	2014-04-18 05:22:10.362108+05	2014-04-18 05:22:10.362189+05	mysteryjeans
\.


--
-- Name: financial_tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('financial_tax_rate_id_seq', 2, true);


--
-- Data for Name: geo_country; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY geo_country (id, name, allow_billing, allow_shipping, iso_code2, iso_code3, iso_numeric, subject_to_vat, display_order, is_active, updated_on, updated_by, created_on, created_by) FROM stdin;
1	United States	t	t	US	USA	840	f	0	t	2014-04-13 04:52:38.144332+05	system	2014-04-13 04:52:38.144332+05	system
2	Canada	t	t	CA	CAN	124	f	0	t	2014-04-13 04:52:38.165838+05	system	2014-04-13 04:52:38.165838+05	system
3	Argentina	t	t	AR	ARG	32	f	0	t	2014-04-13 04:52:38.187452+05	system	2014-04-13 04:52:38.187452+05	system
4	Armenia	t	t	AM	ARM	51	f	0	t	2014-04-13 04:52:38.210009+05	system	2014-04-13 04:52:38.210009+05	system
5	Aruba	t	t	AW	ABW	533	f	0	t	2014-04-13 04:52:38.230902+05	system	2014-04-13 04:52:38.230902+05	system
6	Australia	t	t	AU	AUS	36	f	0	t	2014-04-13 04:52:38.253308+05	system	2014-04-13 04:52:38.253308+05	system
7	Austria	t	t	AT	AUT	40	t	0	t	2014-04-13 04:52:38.27566+05	system	2014-04-13 04:52:38.27566+05	system
8	Azerbaijan	t	t	AZ	AZE	31	f	0	t	2014-04-13 04:52:38.296965+05	system	2014-04-13 04:52:38.296965+05	system
9	Bahamas	t	t	BS	BHS	44	f	0	t	2014-04-13 04:52:38.319509+05	system	2014-04-13 04:52:38.319509+05	system
10	Bangladesh	t	t	BD	BGD	50	f	0	t	2014-04-13 04:52:38.340831+05	system	2014-04-13 04:52:38.340831+05	system
11	Belarus	t	t	BY	BLR	112	f	0	t	2014-04-13 04:52:38.363094+05	system	2014-04-13 04:52:38.363094+05	system
12	Belgium	t	t	BE	BEL	56	t	0	t	2014-04-13 04:52:38.384562+05	system	2014-04-13 04:52:38.384562+05	system
13	Belize	t	t	BZ	BLZ	84	f	0	t	2014-04-13 04:52:38.406303+05	system	2014-04-13 04:52:38.406303+05	system
14	Bermuda	t	t	BM	BMU	60	f	0	t	2014-04-13 04:52:38.4282+05	system	2014-04-13 04:52:38.4282+05	system
15	Bolivia	t	t	BO	BOL	68	f	0	t	2014-04-13 04:52:38.450111+05	system	2014-04-13 04:52:38.450111+05	system
16	Bosnia and Herzegowina	t	t	BA	BIH	70	f	0	t	2014-04-13 04:52:38.471761+05	system	2014-04-13 04:52:38.471761+05	system
17	Brazil	t	t	BR	BRA	76	f	0	t	2014-04-13 04:52:38.492663+05	system	2014-04-13 04:52:38.492663+05	system
18	Bulgaria	t	t	BG	BGR	100	t	0	t	2014-04-13 04:52:38.515148+05	system	2014-04-13 04:52:38.515148+05	system
19	Cayman Islands	t	t	KY	CYM	136	f	0	t	2014-04-13 04:52:38.536714+05	system	2014-04-13 04:52:38.536714+05	system
20	Chile	t	t	CL	CHL	152	f	0	t	2014-04-13 04:52:38.559247+05	system	2014-04-13 04:52:38.559247+05	system
21	China	t	t	CN	CHN	156	f	0	t	2014-04-13 04:52:38.58151+05	system	2014-04-13 04:52:38.58151+05	system
22	Colombia	t	t	CO	COL	170	f	0	t	2014-04-13 04:52:38.602392+05	system	2014-04-13 04:52:38.602392+05	system
23	Costa Rica	t	t	CR	CRI	188	f	0	t	2014-04-13 04:52:38.623849+05	system	2014-04-13 04:52:38.623849+05	system
24	Croatia	t	t	HR	HRV	191	f	0	t	2014-04-13 04:52:38.646035+05	system	2014-04-13 04:52:38.646035+05	system
25	Cuba	t	t	CU	CUB	192	f	0	t	2014-04-13 04:52:38.66858+05	system	2014-04-13 04:52:38.66858+05	system
26	Cyprus	t	t	CY	CYP	196	t	0	t	2014-04-13 04:52:38.690963+05	system	2014-04-13 04:52:38.690963+05	system
27	Czech Republic	t	t	CZ	CZE	203	t	0	t	2014-04-13 04:52:38.713282+05	system	2014-04-13 04:52:38.713282+05	system
28	Denmark	t	t	DK	DNK	208	t	0	t	2014-04-13 04:52:38.734924+05	system	2014-04-13 04:52:38.734924+05	system
29	Dominican Republic	t	t	DO	DOM	214	f	0	t	2014-04-13 04:52:38.757403+05	system	2014-04-13 04:52:38.757403+05	system
30	Ecuador	t	t	EC	ECU	218	f	0	t	2014-04-13 04:52:38.779095+05	system	2014-04-13 04:52:38.779095+05	system
31	Egypt	t	t	EG	EGY	818	f	0	t	2014-04-13 04:52:38.800755+05	system	2014-04-13 04:52:38.800755+05	system
32	Finland	t	t	FI	FIN	246	t	0	t	2014-04-13 04:52:38.823071+05	system	2014-04-13 04:52:38.823071+05	system
33	France	t	t	FR	FRA	250	t	0	t	2014-04-13 04:52:38.844167+05	system	2014-04-13 04:52:38.844167+05	system
34	Georgia	t	t	GE	GEO	268	f	0	t	2014-04-13 04:52:38.865276+05	system	2014-04-13 04:52:38.865276+05	system
35	Germany	t	t	DE	DEU	276	t	0	t	2014-04-13 04:52:38.886636+05	system	2014-04-13 04:52:38.886636+05	system
36	Gibraltar	t	t	GI	GIB	292	f	0	t	2014-04-13 04:52:38.908293+05	system	2014-04-13 04:52:38.908293+05	system
37	Greece	t	t	GR	GRC	300	t	0	t	2014-04-13 04:52:38.929839+05	system	2014-04-13 04:52:38.929839+05	system
38	Guatemala	t	t	GT	GTM	320	f	0	t	2014-04-13 04:52:38.95227+05	system	2014-04-13 04:52:38.95227+05	system
39	Hong Kong	t	t	HK	HKG	344	f	0	t	2014-04-13 04:52:38.973436+05	system	2014-04-13 04:52:38.973436+05	system
40	Hungary	t	t	HU	HUN	348	t	0	t	2014-04-13 04:52:38.99404+05	system	2014-04-13 04:52:38.99404+05	system
41	India	t	t	IN	IND	356	f	0	t	2014-04-13 04:52:39.016391+05	system	2014-04-13 04:52:39.016391+05	system
42	Indonesia	t	t	ID	IDN	360	f	0	t	2014-04-13 04:52:39.038947+05	system	2014-04-13 04:52:39.038947+05	system
43	Ireland	t	t	IE	IRL	372	t	0	t	2014-04-13 04:52:39.060127+05	system	2014-04-13 04:52:39.060127+05	system
44	Israel	t	t	IL	ISR	376	f	0	t	2014-04-13 04:52:39.081562+05	system	2014-04-13 04:52:39.081562+05	system
45	Italy	t	t	IT	ITA	380	t	0	t	2014-04-13 04:52:39.103113+05	system	2014-04-13 04:52:39.103113+05	system
46	Jamaica	t	t	JM	JAM	388	f	0	t	2014-04-13 04:52:39.124816+05	system	2014-04-13 04:52:39.124816+05	system
47	Japan	t	t	JP	JPN	392	f	0	t	2014-04-13 04:52:39.14638+05	system	2014-04-13 04:52:39.14638+05	system
48	Jordan	t	t	JO	JOR	400	f	0	t	2014-04-13 04:52:39.168378+05	system	2014-04-13 04:52:39.168378+05	system
49	Kazakhstan	t	t	KZ	KAZ	398	f	0	t	2014-04-13 04:52:39.190845+05	system	2014-04-13 04:52:39.190845+05	system
50	Korea, Democratic People's Republic of	t	t	KP	PRK	408	f	0	t	2014-04-13 04:52:39.213227+05	system	2014-04-13 04:52:39.213227+05	system
51	Kuwait	t	t	KW	KWT	414	f	0	t	2014-04-13 04:52:39.235188+05	system	2014-04-13 04:52:39.235188+05	system
52	Malaysia	t	t	MY	MYS	458	f	0	t	2014-04-13 04:52:39.257062+05	system	2014-04-13 04:52:39.257062+05	system
53	Mexico	t	t	MX	MEX	484	f	0	t	2014-04-13 04:52:39.277692+05	system	2014-04-13 04:52:39.277692+05	system
54	Netherlands	t	t	NL	NLD	528	t	0	t	2014-04-13 04:52:39.299902+05	system	2014-04-13 04:52:39.299902+05	system
55	New Zealand	t	t	NZ	NZL	554	f	0	t	2014-04-13 04:52:39.321826+05	system	2014-04-13 04:52:39.321826+05	system
56	Norway	t	t	NO	NOR	578	f	0	t	2014-04-13 04:52:39.343497+05	system	2014-04-13 04:52:39.343497+05	system
57	Pakistan	t	t	PK	PAK	586	f	0	t	2014-04-13 04:52:39.364627+05	system	2014-04-13 04:52:39.364627+05	system
58	Paraguay	t	t	PY	PRY	600	f	0	t	2014-04-13 04:52:39.386314+05	system	2014-04-13 04:52:39.386314+05	system
59	Peru	t	t	PE	PER	604	f	0	t	2014-04-13 04:52:39.407133+05	system	2014-04-13 04:52:39.407133+05	system
60	Philippines	t	t	PH	PHL	608	f	0	t	2014-04-13 04:52:39.429602+05	system	2014-04-13 04:52:39.429602+05	system
61	Poland	t	t	PL	POL	616	t	0	t	2014-04-13 04:52:39.450851+05	system	2014-04-13 04:52:39.450851+05	system
62	Portugal	t	t	PT	PRT	620	t	0	t	2014-04-13 04:52:39.473404+05	system	2014-04-13 04:52:39.473404+05	system
63	Puerto Rico	t	t	PR	PRI	630	f	0	t	2014-04-13 04:52:39.49529+05	system	2014-04-13 04:52:39.49529+05	system
64	Qatar	t	t	QA	QAT	634	f	0	t	2014-04-13 04:52:39.516973+05	system	2014-04-13 04:52:39.516973+05	system
65	Romania	t	t	RO	ROM	642	t	0	t	2014-04-13 04:52:39.538466+05	system	2014-04-13 04:52:39.538466+05	system
66	Russia	t	t	RU	RUS	643	f	0	t	2014-04-13 04:52:39.561069+05	system	2014-04-13 04:52:39.561069+05	system
67	Saudi Arabia	t	t	SA	SAU	682	f	0	t	2014-04-13 04:52:39.582878+05	system	2014-04-13 04:52:39.582878+05	system
68	Singapore	t	t	SG	SGP	702	f	0	t	2014-04-13 04:52:39.60492+05	system	2014-04-13 04:52:39.60492+05	system
69	Slovakia (Slovak Republic)	t	t	SK	SVK	703	t	0	t	2014-04-13 04:52:39.626345+05	system	2014-04-13 04:52:39.626345+05	system
70	Slovenia	t	t	SI	SVN	705	t	0	t	2014-04-13 04:52:39.648113+05	system	2014-04-13 04:52:39.648113+05	system
71	South Africa	t	t	ZA	ZAF	710	f	0	t	2014-04-13 04:52:39.669697+05	system	2014-04-13 04:52:39.669697+05	system
72	Spain	t	t	ES	ESP	724	t	0	t	2014-04-13 04:52:39.691621+05	system	2014-04-13 04:52:39.691621+05	system
73	Sweden	t	t	SE	SWE	752	t	0	t	2014-04-13 04:52:39.713984+05	system	2014-04-13 04:52:39.713984+05	system
74	Switzerland	t	t	CH	CHE	756	f	0	t	2014-04-13 04:52:39.7348+05	system	2014-04-13 04:52:39.7348+05	system
75	Taiwan	t	t	TW	TWN	158	f	0	t	2014-04-13 04:52:39.757273+05	system	2014-04-13 04:52:39.757273+05	system
76	Thailand	t	t	TH	THA	764	f	0	t	2014-04-13 04:52:39.777951+05	system	2014-04-13 04:52:39.777951+05	system
77	Turkey	t	t	TR	TUR	792	f	0	t	2014-04-13 04:52:39.800876+05	system	2014-04-13 04:52:39.800876+05	system
78	Ukraine	t	t	UA	UKR	804	f	0	t	2014-04-13 04:52:39.823265+05	system	2014-04-13 04:52:39.823265+05	system
79	United Arab Emirates	t	t	AE	ARE	784	f	0	t	2014-04-13 04:52:39.844737+05	system	2014-04-13 04:52:39.844737+05	system
158	Macau	t	t	MO	MAC	446	f	0	t	2014-04-13 04:52:41.574712+05	system	2014-04-13 04:52:41.574712+05	system
80	United Kingdom	t	t	GB	GBR	826	t	0	t	2014-04-13 04:52:39.868375+05	system	2014-04-13 04:52:39.868375+05	system
81	United States minor outlying islands	t	t	UM	UMI	581	f	0	t	2014-04-13 04:52:39.889952+05	system	2014-04-13 04:52:39.889952+05	system
82	Uruguay	t	t	UY	URY	858	f	0	t	2014-04-13 04:52:39.911611+05	system	2014-04-13 04:52:39.911611+05	system
83	Uzbekistan	t	t	UZ	UZB	860	f	0	t	2014-04-13 04:52:39.933306+05	system	2014-04-13 04:52:39.933306+05	system
84	Venezuela	t	t	VE	VEN	862	f	0	t	2014-04-13 04:52:39.955717+05	system	2014-04-13 04:52:39.955717+05	system
85	Serbia	t	t	RS	SRB	688	f	0	t	2014-04-13 04:52:39.977369+05	system	2014-04-13 04:52:39.977369+05	system
86	Afghanistan	t	t	AF	AFG	4	f	0	t	2014-04-13 04:52:39.998723+05	system	2014-04-13 04:52:39.998723+05	system
87	Albania	t	t	AL	ALB	8	f	0	t	2014-04-13 04:52:40.02062+05	system	2014-04-13 04:52:40.02062+05	system
88	Algeria	t	t	DZ	DZA	12	f	0	t	2014-04-13 04:52:40.042242+05	system	2014-04-13 04:52:40.042242+05	system
89	American Samoa	t	t	AS	ASM	16	f	0	t	2014-04-13 04:52:40.063973+05	system	2014-04-13 04:52:40.063973+05	system
90	Andorra	t	t	AD	AND	20	f	0	t	2014-04-13 04:52:40.086386+05	system	2014-04-13 04:52:40.086386+05	system
91	Angola	t	t	AO	AGO	24	f	0	t	2014-04-13 04:52:40.107518+05	system	2014-04-13 04:52:40.107518+05	system
92	Anguilla	t	t	AI	AIA	660	f	0	t	2014-04-13 04:52:40.129041+05	system	2014-04-13 04:52:40.129041+05	system
93	Antarctica	t	t	AQ	ATA	10	f	0	t	2014-04-13 04:52:40.15143+05	system	2014-04-13 04:52:40.15143+05	system
94	Antigua and Barbuda	t	t	AG	ATG	28	f	0	t	2014-04-13 04:52:40.173079+05	system	2014-04-13 04:52:40.173079+05	system
95	Bahrain	t	t	BH	BHR	48	f	0	t	2014-04-13 04:52:40.195018+05	system	2014-04-13 04:52:40.195018+05	system
96	Barbados	t	t	BB	BRB	52	f	0	t	2014-04-13 04:52:40.217305+05	system	2014-04-13 04:52:40.217305+05	system
97	Benin	t	t	BJ	BEN	204	f	0	t	2014-04-13 04:52:40.239239+05	system	2014-04-13 04:52:40.239239+05	system
98	Bhutan	t	t	BT	BTN	64	f	0	t	2014-04-13 04:52:40.260812+05	system	2014-04-13 04:52:40.260812+05	system
99	Botswana	t	t	BW	BWA	72	f	0	t	2014-04-13 04:52:40.282446+05	system	2014-04-13 04:52:40.282446+05	system
100	Bouvet Island	t	t	BV	BVT	74	f	0	t	2014-04-13 04:52:40.304046+05	system	2014-04-13 04:52:40.304046+05	system
101	British Indian Ocean Territory	t	t	IO	IOT	86	f	0	t	2014-04-13 04:52:40.326263+05	system	2014-04-13 04:52:40.326263+05	system
102	Brunei Darussalam	t	t	BN	BRN	96	f	0	t	2014-04-13 04:52:40.347062+05	system	2014-04-13 04:52:40.347062+05	system
103	Burkina Faso	t	t	BF	BFA	854	f	0	t	2014-04-13 04:52:40.369032+05	system	2014-04-13 04:52:40.369032+05	system
104	Burundi	t	t	BI	BDI	108	f	0	t	2014-04-13 04:52:40.391128+05	system	2014-04-13 04:52:40.391128+05	system
105	Cambodia	t	t	KH	KHM	116	f	0	t	2014-04-13 04:52:40.412692+05	system	2014-04-13 04:52:40.412692+05	system
106	Cameroon	t	t	CM	CMR	120	f	0	t	2014-04-13 04:52:40.4352+05	system	2014-04-13 04:52:40.4352+05	system
107	Cape Verde	t	t	CV	CPV	132	f	0	t	2014-04-13 04:52:40.455832+05	system	2014-04-13 04:52:40.455832+05	system
108	Central African Republic	t	t	CF	CAF	140	f	0	t	2014-04-13 04:52:40.478252+05	system	2014-04-13 04:52:40.478252+05	system
109	Chad	t	t	TD	TCD	148	f	0	t	2014-04-13 04:52:40.500598+05	system	2014-04-13 04:52:40.500598+05	system
110	Christmas Island	t	t	CX	CXR	162	f	0	t	2014-04-13 04:52:40.522122+05	system	2014-04-13 04:52:40.522122+05	system
111	Cocos (Keeling) Islands	t	t	CC	CCK	166	f	0	t	2014-04-13 04:52:40.543581+05	system	2014-04-13 04:52:40.543581+05	system
112	Comoros	t	t	KM	COM	174	f	0	t	2014-04-13 04:52:40.564971+05	system	2014-04-13 04:52:40.564971+05	system
113	Congo	t	t	CG	COG	178	f	0	t	2014-04-13 04:52:40.58654+05	system	2014-04-13 04:52:40.58654+05	system
114	Cook Islands	t	t	CK	COK	184	f	0	t	2014-04-13 04:52:40.607612+05	system	2014-04-13 04:52:40.607612+05	system
115	Cote D'Ivoire	t	t	CI	CIV	384	f	0	t	2014-04-13 04:52:40.629621+05	system	2014-04-13 04:52:40.629621+05	system
116	Djibouti	t	t	DJ	DJI	262	f	0	t	2014-04-13 04:52:40.651954+05	system	2014-04-13 04:52:40.651954+05	system
117	Dominica	t	t	DM	DMA	212	f	0	t	2014-04-13 04:52:40.673853+05	system	2014-04-13 04:52:40.673853+05	system
118	El Salvador	t	t	SV	SLV	222	f	0	t	2014-04-13 04:52:40.695787+05	system	2014-04-13 04:52:40.695787+05	system
119	Equatorial Guinea	t	t	GQ	GNQ	226	f	0	t	2014-04-13 04:52:40.717404+05	system	2014-04-13 04:52:40.717404+05	system
120	Eritrea	t	t	ER	ERI	232	f	0	t	2014-04-13 04:52:40.739383+05	system	2014-04-13 04:52:40.739383+05	system
121	Estonia	t	t	EE	EST	233	t	0	t	2014-04-13 04:52:40.761582+05	system	2014-04-13 04:52:40.761582+05	system
122	Ethiopia	t	t	ET	ETH	231	f	0	t	2014-04-13 04:52:40.7832+05	system	2014-04-13 04:52:40.7832+05	system
123	Falkland Islands (Malvinas)	t	t	FK	FLK	238	f	0	t	2014-04-13 04:52:40.804324+05	system	2014-04-13 04:52:40.804324+05	system
124	Faroe Islands	t	t	FO	FRO	234	f	0	t	2014-04-13 04:52:40.826331+05	system	2014-04-13 04:52:40.826331+05	system
125	Fiji	t	t	FJ	FJI	242	f	0	t	2014-04-13 04:52:40.848084+05	system	2014-04-13 04:52:40.848084+05	system
126	French Guiana	t	t	GF	GUF	254	f	0	t	2014-04-13 04:52:40.87006+05	system	2014-04-13 04:52:40.87006+05	system
127	French Polynesia	t	t	PF	PYF	258	f	0	t	2014-04-13 04:52:40.891035+05	system	2014-04-13 04:52:40.891035+05	system
128	French Southern Territories	t	t	TF	ATF	260	f	0	t	2014-04-13 04:52:40.912383+05	system	2014-04-13 04:52:40.912383+05	system
129	Gabon	t	t	GA	GAB	266	f	0	t	2014-04-13 04:52:40.933842+05	system	2014-04-13 04:52:40.933842+05	system
130	Gambia	t	t	GM	GMB	270	f	0	t	2014-04-13 04:52:40.956208+05	system	2014-04-13 04:52:40.956208+05	system
131	Ghana	t	t	GH	GHA	288	f	0	t	2014-04-13 04:52:40.977936+05	system	2014-04-13 04:52:40.977936+05	system
132	Greenland	t	t	GL	GRL	304	f	0	t	2014-04-13 04:52:40.999807+05	system	2014-04-13 04:52:40.999807+05	system
133	Grenada	t	t	GD	GRD	308	f	0	t	2014-04-13 04:52:41.020792+05	system	2014-04-13 04:52:41.020792+05	system
134	Guadeloupe	t	t	GP	GLP	312	f	0	t	2014-04-13 04:52:41.041604+05	system	2014-04-13 04:52:41.041604+05	system
135	Guam	t	t	GU	GUM	316	f	0	t	2014-04-13 04:52:41.063631+05	system	2014-04-13 04:52:41.063631+05	system
136	Guinea	t	t	GN	GIN	324	f	0	t	2014-04-13 04:52:41.094085+05	system	2014-04-13 04:52:41.094085+05	system
137	Guinea-bissau	t	t	GW	GNB	624	f	0	t	2014-04-13 04:52:41.119316+05	system	2014-04-13 04:52:41.119316+05	system
138	Guyana	t	t	GY	GUY	328	f	0	t	2014-04-13 04:52:41.141292+05	system	2014-04-13 04:52:41.141292+05	system
139	Haiti	t	t	HT	HTI	332	f	0	t	2014-04-13 04:52:41.163326+05	system	2014-04-13 04:52:41.163326+05	system
140	Heard and Mc Donald Islands	t	t	HM	HMD	334	f	0	t	2014-04-13 04:52:41.184964+05	system	2014-04-13 04:52:41.184964+05	system
141	Honduras	t	t	HN	HND	340	f	0	t	2014-04-13 04:52:41.206723+05	system	2014-04-13 04:52:41.206723+05	system
142	Iceland	t	t	IS	ISL	352	f	0	t	2014-04-13 04:52:41.228328+05	system	2014-04-13 04:52:41.228328+05	system
143	Iran (Islamic Republic of)	t	t	IR	IRN	364	f	0	t	2014-04-13 04:52:41.250288+05	system	2014-04-13 04:52:41.250288+05	system
144	Iraq	t	t	IQ	IRQ	368	f	0	t	2014-04-13 04:52:41.272021+05	system	2014-04-13 04:52:41.272021+05	system
145	Kenya	t	t	KE	KEN	404	f	0	t	2014-04-13 04:52:41.293547+05	system	2014-04-13 04:52:41.293547+05	system
146	Kiribati	t	t	KI	KIR	296	f	0	t	2014-04-13 04:52:41.315421+05	system	2014-04-13 04:52:41.315421+05	system
147	Korea	t	t	KR	KOR	410	f	0	t	2014-04-13 04:52:41.336525+05	system	2014-04-13 04:52:41.336525+05	system
148	Kyrgyzstan	t	t	KG	KGZ	417	f	0	t	2014-04-13 04:52:41.358941+05	system	2014-04-13 04:52:41.358941+05	system
149	Lao People's Democratic Republic	t	t	LA	LAO	418	f	0	t	2014-04-13 04:52:41.379689+05	system	2014-04-13 04:52:41.379689+05	system
150	Latvia	t	t	LV	LVA	428	t	0	t	2014-04-13 04:52:41.402189+05	system	2014-04-13 04:52:41.402189+05	system
151	Lebanon	t	t	LB	LBN	422	f	0	t	2014-04-13 04:52:41.42355+05	system	2014-04-13 04:52:41.42355+05	system
152	Lesotho	t	t	LS	LSO	426	f	0	t	2014-04-13 04:52:41.445293+05	system	2014-04-13 04:52:41.445293+05	system
153	Liberia	t	t	LR	LBR	430	f	0	t	2014-04-13 04:52:41.467204+05	system	2014-04-13 04:52:41.467204+05	system
154	Libyan Arab Jamahiriya	t	t	LY	LBY	434	f	0	t	2014-04-13 04:52:41.488678+05	system	2014-04-13 04:52:41.488678+05	system
155	Liechtenstein	t	t	LI	LIE	438	f	0	t	2014-04-13 04:52:41.510339+05	system	2014-04-13 04:52:41.510339+05	system
156	Lithuania	t	t	LT	LTU	440	t	0	t	2014-04-13 04:52:41.53116+05	system	2014-04-13 04:52:41.53116+05	system
157	Luxembourg	t	t	LU	LUX	442	t	0	t	2014-04-13 04:52:41.552985+05	system	2014-04-13 04:52:41.552985+05	system
159	Macedonia	t	t	MK	MKD	807	f	0	t	2014-04-13 04:52:41.596937+05	system	2014-04-13 04:52:41.596937+05	system
160	Madagascar	t	t	MG	MDG	450	f	0	t	2014-04-13 04:52:41.619225+05	system	2014-04-13 04:52:41.619225+05	system
161	Malawi	t	t	MW	MWI	454	f	0	t	2014-04-13 04:52:41.641041+05	system	2014-04-13 04:52:41.641041+05	system
162	Maldives	t	t	MV	MDV	462	f	0	t	2014-04-13 04:52:41.663229+05	system	2014-04-13 04:52:41.663229+05	system
163	Mali	t	t	ML	MLI	466	f	0	t	2014-04-13 04:52:41.68384+05	system	2014-04-13 04:52:41.68384+05	system
164	Malta	t	t	MT	MLT	470	t	0	t	2014-04-13 04:52:41.705308+05	system	2014-04-13 04:52:41.705308+05	system
165	Marshall Islands	t	t	MH	MHL	584	f	0	t	2014-04-13 04:52:41.727299+05	system	2014-04-13 04:52:41.727299+05	system
166	Martinique	t	t	MQ	MTQ	474	f	0	t	2014-04-13 04:52:41.749802+05	system	2014-04-13 04:52:41.749802+05	system
167	Mauritania	t	t	MR	MRT	478	f	0	t	2014-04-13 04:52:41.771717+05	system	2014-04-13 04:52:41.771717+05	system
168	Mauritius	t	t	MU	MUS	480	f	0	t	2014-04-13 04:52:41.793777+05	system	2014-04-13 04:52:41.793777+05	system
169	Mayotte	t	t	YT	MYT	175	f	0	t	2014-04-13 04:52:41.814575+05	system	2014-04-13 04:52:41.814575+05	system
170	Micronesia	t	t	FM	FSM	583	f	0	t	2014-04-13 04:52:41.836188+05	system	2014-04-13 04:52:41.836188+05	system
171	Moldova	t	t	MD	MDA	498	f	0	t	2014-04-13 04:52:41.858002+05	system	2014-04-13 04:52:41.858002+05	system
172	Monaco	t	t	MC	MCO	492	f	0	t	2014-04-13 04:52:41.878714+05	system	2014-04-13 04:52:41.878714+05	system
173	Mongolia	t	t	MN	MNG	496	f	0	t	2014-04-13 04:52:41.900936+05	system	2014-04-13 04:52:41.900936+05	system
174	Montenegro	t	t	ME	MNE	499	f	0	t	2014-04-13 04:52:41.922814+05	system	2014-04-13 04:52:41.922814+05	system
175	Montserrat	t	t	MS	MSR	500	f	0	t	2014-04-13 04:52:41.943803+05	system	2014-04-13 04:52:41.943803+05	system
176	Morocco	t	t	MA	MAR	504	f	0	t	2014-04-13 04:52:41.965402+05	system	2014-04-13 04:52:41.965402+05	system
177	Mozambique	t	t	MZ	MOZ	508	f	0	t	2014-04-13 04:52:41.989381+05	system	2014-04-13 04:52:41.989381+05	system
178	Myanmar	t	t	MM	MMR	104	f	0	t	2014-04-13 04:52:42.011268+05	system	2014-04-13 04:52:42.011268+05	system
179	Namibia	t	t	NA	NAM	516	f	0	t	2014-04-13 04:52:42.033727+05	system	2014-04-13 04:52:42.033727+05	system
180	Nauru	t	t	NR	NRU	520	f	0	t	2014-04-13 04:52:42.055343+05	system	2014-04-13 04:52:42.055343+05	system
181	Nepal	t	t	NP	NPL	524	f	0	t	2014-04-13 04:52:42.076894+05	system	2014-04-13 04:52:42.076894+05	system
182	Netherlands Antilles	t	t	AN	ANT	530	f	0	t	2014-04-13 04:52:42.098753+05	system	2014-04-13 04:52:42.098753+05	system
183	New Caledonia	t	t	NC	NCL	540	f	0	t	2014-04-13 04:52:42.120367+05	system	2014-04-13 04:52:42.120367+05	system
184	Nicaragua	t	t	NI	NIC	558	f	0	t	2014-04-13 04:52:42.142129+05	system	2014-04-13 04:52:42.142129+05	system
185	Niger	t	t	NE	NER	562	f	0	t	2014-04-13 04:52:42.163677+05	system	2014-04-13 04:52:42.163677+05	system
186	Nigeria	t	t	NG	NGA	566	f	0	t	2014-04-13 04:52:42.184797+05	system	2014-04-13 04:52:42.184797+05	system
187	Niue	t	t	NU	NIU	570	f	0	t	2014-04-13 04:52:42.206345+05	system	2014-04-13 04:52:42.206345+05	system
188	Norfolk Island	t	t	NF	NFK	574	f	0	t	2014-04-13 04:52:42.227246+05	system	2014-04-13 04:52:42.227246+05	system
189	Northern Mariana Islands	t	t	MP	MNP	580	f	0	t	2014-04-13 04:52:42.248269+05	system	2014-04-13 04:52:42.248269+05	system
190	Oman	t	t	OM	OMN	512	f	0	t	2014-04-13 04:52:42.270571+05	system	2014-04-13 04:52:42.270571+05	system
191	Palau	t	t	PW	PLW	585	f	0	t	2014-04-13 04:52:42.292875+05	system	2014-04-13 04:52:42.292875+05	system
192	Panama	t	t	PA	PAN	591	f	0	t	2014-04-13 04:52:42.314038+05	system	2014-04-13 04:52:42.314038+05	system
193	Papua New Guinea	t	t	PG	PNG	598	f	0	t	2014-04-13 04:52:42.336503+05	system	2014-04-13 04:52:42.336503+05	system
194	Pitcairn	t	t	PN	PCN	612	f	0	t	2014-04-13 04:52:42.358049+05	system	2014-04-13 04:52:42.358049+05	system
195	Reunion	t	t	RE	REU	638	f	0	t	2014-04-13 04:52:42.380892+05	system	2014-04-13 04:52:42.380892+05	system
196	Rwanda	t	t	RW	RWA	646	f	0	t	2014-04-13 04:52:42.402558+05	system	2014-04-13 04:52:42.402558+05	system
197	Saint Kitts and Nevis	t	t	KN	KNA	659	f	0	t	2014-04-13 04:52:42.42375+05	system	2014-04-13 04:52:42.42375+05	system
198	Saint Lucia	t	t	LC	LCA	662	f	0	t	2014-04-13 04:52:42.44508+05	system	2014-04-13 04:52:42.44508+05	system
199	Saint Vincent and the Grenadines	t	t	VC	VCT	670	f	0	t	2014-04-13 04:52:42.467064+05	system	2014-04-13 04:52:42.467064+05	system
200	Samoa	t	t	WS	WSM	882	f	0	t	2014-04-13 04:52:42.489522+05	system	2014-04-13 04:52:42.489522+05	system
201	San Marino	t	t	SM	SMR	674	f	0	t	2014-04-13 04:52:42.511305+05	system	2014-04-13 04:52:42.511305+05	system
202	Sao Tome and Principe	t	t	ST	STP	678	f	0	t	2014-04-13 04:52:42.53374+05	system	2014-04-13 04:52:42.53374+05	system
203	Senegal	t	t	SN	SEN	686	f	0	t	2014-04-13 04:52:42.554945+05	system	2014-04-13 04:52:42.554945+05	system
204	Seychelles	t	t	SC	SYC	690	f	0	t	2014-04-13 04:52:42.576706+05	system	2014-04-13 04:52:42.576706+05	system
205	Sierra Leone	t	t	SL	SLE	694	f	0	t	2014-04-13 04:52:42.597515+05	system	2014-04-13 04:52:42.597515+05	system
206	Solomon Islands	t	t	SB	SLB	90	f	0	t	2014-04-13 04:52:42.619993+05	system	2014-04-13 04:52:42.619993+05	system
207	Somalia	t	t	SO	SOM	706	f	0	t	2014-04-13 04:52:42.641863+05	system	2014-04-13 04:52:42.641863+05	system
208	South Georgia & South Sandwich Islands	t	t	GS	SGS	239	f	0	t	2014-04-13 04:52:42.663106+05	system	2014-04-13 04:52:42.663106+05	system
209	Sri Lanka	t	t	LK	LKA	144	f	0	t	2014-04-13 04:52:42.685039+05	system	2014-04-13 04:52:42.685039+05	system
210	St. Helena	t	t	SH	SHN	654	f	0	t	2014-04-13 04:52:42.707338+05	system	2014-04-13 04:52:42.707338+05	system
211	St. Pierre and Miquelon	t	t	PM	SPM	666	f	0	t	2014-04-13 04:52:42.728395+05	system	2014-04-13 04:52:42.728395+05	system
212	Sudan	t	t	SD	SDN	736	f	0	t	2014-04-13 04:52:42.749756+05	system	2014-04-13 04:52:42.749756+05	system
213	Suriname	t	t	SR	SUR	740	f	0	t	2014-04-13 04:52:42.772231+05	system	2014-04-13 04:52:42.772231+05	system
214	Svalbard and Jan Mayen Islands	t	t	SJ	SJM	744	f	0	t	2014-04-13 04:52:42.793994+05	system	2014-04-13 04:52:42.793994+05	system
215	Swaziland	t	t	SZ	SWZ	748	f	0	t	2014-04-13 04:52:42.815604+05	system	2014-04-13 04:52:42.815604+05	system
216	Syrian Arab Republic	t	t	SY	SYR	760	f	0	t	2014-04-13 04:52:42.838131+05	system	2014-04-13 04:52:42.838131+05	system
217	Tajikistan	t	t	TJ	TJK	762	f	0	t	2014-04-13 04:52:42.85972+05	system	2014-04-13 04:52:42.85972+05	system
218	Tanzania	t	t	TZ	TZA	834	f	0	t	2014-04-13 04:52:42.880837+05	system	2014-04-13 04:52:42.880837+05	system
219	Togo	t	t	TG	TGO	768	f	0	t	2014-04-13 04:52:42.902853+05	system	2014-04-13 04:52:42.902853+05	system
220	Tokelau	t	t	TK	TKL	772	f	0	t	2014-04-13 04:52:42.924365+05	system	2014-04-13 04:52:42.924365+05	system
221	Tonga	t	t	TO	TON	776	f	0	t	2014-04-13 04:52:42.946351+05	system	2014-04-13 04:52:42.946351+05	system
222	Trinidad and Tobago	t	t	TT	TTO	780	f	0	t	2014-04-13 04:52:42.968387+05	system	2014-04-13 04:52:42.968387+05	system
223	Tunisia	t	t	TN	TUN	788	f	0	t	2014-04-13 04:52:42.9908+05	system	2014-04-13 04:52:42.9908+05	system
224	Turkmenistan	t	t	TM	TKM	795	f	0	t	2014-04-13 04:52:43.011951+05	system	2014-04-13 04:52:43.011951+05	system
225	Turks and Caicos Islands	t	t	TC	TCA	796	f	0	t	2014-04-13 04:52:43.034483+05	system	2014-04-13 04:52:43.034483+05	system
226	Tuvalu	t	t	TV	TUV	798	f	0	t	2014-04-13 04:52:43.055949+05	system	2014-04-13 04:52:43.055949+05	system
227	Uganda	t	t	UG	UGA	800	f	0	t	2014-04-13 04:52:43.078227+05	system	2014-04-13 04:52:43.078227+05	system
228	Vanuatu	t	t	VU	VUT	548	f	0	t	2014-04-13 04:52:43.099829+05	system	2014-04-13 04:52:43.099829+05	system
229	Vatican City State (Holy See)	t	t	VA	VAT	336	f	0	t	2014-04-13 04:52:43.120987+05	system	2014-04-13 04:52:43.120987+05	system
230	Viet Nam	t	t	VN	VNM	704	f	0	t	2014-04-13 04:52:43.143048+05	system	2014-04-13 04:52:43.143048+05	system
231	Virgin Islands (British)	t	t	VG	VGB	92	f	0	t	2014-04-13 04:52:43.163894+05	system	2014-04-13 04:52:43.163894+05	system
232	Virgin Islands (U.S.)	t	t	VI	VIR	850	f	0	t	2014-04-13 04:52:43.185023+05	system	2014-04-13 04:52:43.185023+05	system
233	Wallis and Futuna Islands	t	t	WF	WLF	876	f	0	t	2014-04-13 04:52:43.207274+05	system	2014-04-13 04:52:43.207274+05	system
234	Western Sahara	t	t	EH	ESH	732	f	0	t	2014-04-13 04:52:43.22791+05	system	2014-04-13 04:52:43.22791+05	system
235	Yemen	t	t	YE	YEM	887	f	0	t	2014-04-13 04:52:43.249548+05	system	2014-04-13 04:52:43.249548+05	system
236	Zambia	t	t	ZM	ZMB	894	f	0	t	2014-04-13 04:52:43.270335+05	system	2014-04-13 04:52:43.270335+05	system
237	Zimbabwe	t	t	ZW	ZWE	716	f	0	t	2014-04-13 04:52:43.291975+05	system	2014-04-13 04:52:43.291975+05	system
\.


--
-- Name: geo_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('geo_country_id_seq', 237, true);


--
-- Data for Name: geo_state; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY geo_state (id, name, code, country_id, is_active, display_order, updated_on, updated_by, created_on, created_by) FROM stdin;
1	AA (Armed Forces Americas)	AA	1	t	0	2014-04-13 04:52:43.313706+05	system	2014-04-13 04:52:43.313706+05	system
2	AE (Armed Forces Europe)	AE	1	t	0	2014-04-13 04:52:43.335714+05	system	2014-04-13 04:52:43.335714+05	system
3	Alabama	AL	1	t	0	2014-04-13 04:52:43.357145+05	system	2014-04-13 04:52:43.357145+05	system
4	Alaska	AK	1	t	0	2014-04-13 04:52:43.377872+05	system	2014-04-13 04:52:43.377872+05	system
5	American Samoa	AS	1	t	0	2014-04-13 04:52:43.39959+05	system	2014-04-13 04:52:43.39959+05	system
6	AP (Armed Forces Pacific)	AP	1	t	0	2014-04-13 04:52:43.420814+05	system	2014-04-13 04:52:43.420814+05	system
7	Arizona	AZ	1	t	0	2014-04-13 04:52:43.442795+05	system	2014-04-13 04:52:43.442795+05	system
8	Arkansas	AR	1	t	0	2014-04-13 04:52:43.464383+05	system	2014-04-13 04:52:43.464383+05	system
9	California	CA	1	t	0	2014-04-13 04:52:43.486403+05	system	2014-04-13 04:52:43.486403+05	system
10	Colorado	CO	1	t	0	2014-04-13 04:52:43.507787+05	system	2014-04-13 04:52:43.507787+05	system
11	Connecticut	CT	1	t	0	2014-04-13 04:52:43.530349+05	system	2014-04-13 04:52:43.530349+05	system
12	Delaware	DE	1	t	0	2014-04-13 04:52:43.55232+05	system	2014-04-13 04:52:43.55232+05	system
13	District of Columbia	DC	1	t	0	2014-04-13 04:52:43.59552+05	system	2014-04-13 04:52:43.59552+05	system
14	Federated States of Micronesia	FM	1	t	0	2014-04-13 04:52:43.616413+05	system	2014-04-13 04:52:43.616413+05	system
15	Florida	FL	1	t	0	2014-04-13 04:52:43.638812+05	system	2014-04-13 04:52:43.638812+05	system
16	Georgia	GA	1	t	0	2014-04-13 04:52:43.660467+05	system	2014-04-13 04:52:43.660467+05	system
17	Guam	GU	1	t	0	2014-04-13 04:52:43.68118+05	system	2014-04-13 04:52:43.68118+05	system
18	Hawaii	HI	1	t	0	2014-04-13 04:52:43.703603+05	system	2014-04-13 04:52:43.703603+05	system
19	Idaho	ID	1	t	0	2014-04-13 04:52:43.725246+05	system	2014-04-13 04:52:43.725246+05	system
20	Illinois	IL	1	t	0	2014-04-13 04:52:43.747+05	system	2014-04-13 04:52:43.747+05	system
21	Indiana	IN	1	t	0	2014-04-13 04:52:43.768594+05	system	2014-04-13 04:52:43.768594+05	system
22	Iowa	IA	1	t	0	2014-04-13 04:52:43.79111+05	system	2014-04-13 04:52:43.79111+05	system
23	Kansas	KS	1	t	0	2014-04-13 04:52:43.812668+05	system	2014-04-13 04:52:43.812668+05	system
24	Kentucky	KY	1	t	0	2014-04-13 04:52:43.835248+05	system	2014-04-13 04:52:43.835248+05	system
25	Louisiana	LA	1	t	0	2014-04-13 04:52:43.857492+05	system	2014-04-13 04:52:43.857492+05	system
26	Maine	ME	1	t	0	2014-04-13 04:52:43.879348+05	system	2014-04-13 04:52:43.879348+05	system
27	Marshall Islands	MH	1	t	0	2014-04-13 04:52:43.900306+05	system	2014-04-13 04:52:43.900306+05	system
28	Maryland	MD	1	t	0	2014-04-13 04:52:43.92203+05	system	2014-04-13 04:52:43.92203+05	system
29	Massachusetts	MA	1	t	0	2014-04-13 04:52:43.943731+05	system	2014-04-13 04:52:43.943731+05	system
30	Michigan	MI	1	t	0	2014-04-13 04:52:43.965041+05	system	2014-04-13 04:52:43.965041+05	system
31	Minnesota	MN	1	t	0	2014-04-13 04:52:43.9867+05	system	2014-04-13 04:52:43.9867+05	system
32	Mississippi	MS	1	t	0	2014-04-13 04:52:44.008273+05	system	2014-04-13 04:52:44.008273+05	system
33	Missouri	MO	1	t	0	2014-04-13 04:52:44.029792+05	system	2014-04-13 04:52:44.029792+05	system
34	Montana	MT	1	t	0	2014-04-13 04:52:44.051491+05	system	2014-04-13 04:52:44.051491+05	system
35	Nebraska	NE	1	t	0	2014-04-13 04:52:44.073091+05	system	2014-04-13 04:52:44.073091+05	system
36	Nevada	NV	1	t	0	2014-04-13 04:52:44.093663+05	system	2014-04-13 04:52:44.093663+05	system
37	New Hampshire	NH	1	t	0	2014-04-13 04:52:44.115361+05	system	2014-04-13 04:52:44.115361+05	system
38	New Jersey	NJ	1	t	0	2014-04-13 04:52:44.136228+05	system	2014-04-13 04:52:44.136228+05	system
39	New Mexico	NM	1	t	0	2014-04-13 04:52:44.158122+05	system	2014-04-13 04:52:44.158122+05	system
40	New York	NY	1	t	0	2014-04-13 04:52:44.18083+05	system	2014-04-13 04:52:44.18083+05	system
41	North Carolina	NC	1	t	0	2014-04-13 04:52:44.201391+05	system	2014-04-13 04:52:44.201391+05	system
42	North Dakota	ND	1	t	0	2014-04-13 04:52:44.223081+05	system	2014-04-13 04:52:44.223081+05	system
43	Northern Mariana Islands	MP	1	t	0	2014-04-13 04:52:44.244573+05	system	2014-04-13 04:52:44.244573+05	system
44	Ohio	OH	1	t	0	2014-04-13 04:52:44.266157+05	system	2014-04-13 04:52:44.266157+05	system
45	Oklahoma	OK	1	t	0	2014-04-13 04:52:44.288349+05	system	2014-04-13 04:52:44.288349+05	system
46	Oregon	OR	1	t	0	2014-04-13 04:52:44.310505+05	system	2014-04-13 04:52:44.310505+05	system
47	Palau	PW	1	t	0	2014-04-13 04:52:44.332905+05	system	2014-04-13 04:52:44.332905+05	system
48	Pennsylvania	PA	1	t	0	2014-04-13 04:52:44.353775+05	system	2014-04-13 04:52:44.353775+05	system
49	Puerto Rico	PR	1	t	0	2014-04-13 04:52:44.375547+05	system	2014-04-13 04:52:44.375547+05	system
50	Rhode Island	RI	1	t	0	2014-04-13 04:52:44.397522+05	system	2014-04-13 04:52:44.397522+05	system
51	South Carolina	SC	1	t	0	2014-04-13 04:52:44.419015+05	system	2014-04-13 04:52:44.419015+05	system
52	South Dakota	SD	1	t	0	2014-04-13 04:52:44.441457+05	system	2014-04-13 04:52:44.441457+05	system
53	Tennessee	TN	1	t	0	2014-04-13 04:52:44.46327+05	system	2014-04-13 04:52:44.46327+05	system
54	Texas	TX	1	t	0	2014-04-13 04:52:44.484799+05	system	2014-04-13 04:52:44.484799+05	system
55	Utah	UT	1	t	0	2014-04-13 04:52:44.506789+05	system	2014-04-13 04:52:44.506789+05	system
56	Vermont	VT	1	t	0	2014-04-13 04:52:44.528677+05	system	2014-04-13 04:52:44.528677+05	system
57	Virgin Islands	VI	1	t	0	2014-04-13 04:52:44.550482+05	system	2014-04-13 04:52:44.550482+05	system
58	Virginia	VA	1	t	0	2014-04-13 04:52:44.571975+05	system	2014-04-13 04:52:44.571975+05	system
59	Washington	WA	1	t	0	2014-04-13 04:52:44.593566+05	system	2014-04-13 04:52:44.593566+05	system
60	West Virginia	WV	1	t	0	2014-04-13 04:52:44.61509+05	system	2014-04-13 04:52:44.61509+05	system
61	Wisconsin	WI	1	t	0	2014-04-13 04:52:44.637596+05	system	2014-04-13 04:52:44.637596+05	system
62	Wyoming	WY	1	t	0	2014-04-13 04:52:44.658983+05	system	2014-04-13 04:52:44.658983+05	system
63	Alberta	AB	2	t	0	2014-04-13 04:52:44.681045+05	system	2014-04-13 04:52:44.681045+05	system
64	British Columbia	BC	2	t	0	2014-04-13 04:52:44.703443+05	system	2014-04-13 04:52:44.703443+05	system
65	Manitoba	MB	2	t	0	2014-04-13 04:52:44.725826+05	system	2014-04-13 04:52:44.725826+05	system
66	New Brunswick	NB	2	t	0	2014-04-13 04:52:44.747366+05	system	2014-04-13 04:52:44.747366+05	system
67	Newfoundland and Labrador	NL	2	t	0	2014-04-13 04:52:44.769353+05	system	2014-04-13 04:52:44.769353+05	system
68	Northwest Territories	NT	2	t	0	2014-04-13 04:52:44.790875+05	system	2014-04-13 04:52:44.790875+05	system
69	Nova Scotia	NS	2	t	0	2014-04-13 04:52:44.811628+05	system	2014-04-13 04:52:44.811628+05	system
70	Nunavut	NU	2	t	0	2014-04-13 04:52:44.834114+05	system	2014-04-13 04:52:44.834114+05	system
71	Ontario	ON	2	t	0	2014-04-13 04:52:44.856428+05	system	2014-04-13 04:52:44.856428+05	system
72	Prince Edward Island	PE	2	t	0	2014-04-13 04:52:44.877118+05	system	2014-04-13 04:52:44.877118+05	system
73	Quebec	QC	2	t	0	2014-04-13 04:52:44.89962+05	system	2014-04-13 04:52:44.89962+05	system
74	Saskatchewan	SK	2	t	0	2014-04-13 04:52:44.920584+05	system	2014-04-13 04:52:44.920584+05	system
75	Yukon Territory	YU	2	t	0	2014-04-13 04:52:44.94288+05	system	2014-04-13 04:52:44.94288+05	system
76	Sindh	SI	57	t	0	2014-04-14 02:18:47.012364+05	system	2014-04-14 02:18:47.012364+05	system
77	Punjab	PU	57	t	0	2014-04-14 02:18:47.055487+05	system	2014-04-14 02:18:47.055487+05	system
78	Balochistan	BA	57	t	0	2014-04-14 02:18:47.077166+05	system	2014-04-14 02:18:47.077166+05	system
79	Khyber Pakhtunkhwa	KP	57	t	0	2014-04-14 02:18:47.098774+05	system	2014-04-14 02:18:47.098774+05	system
80	FATA	FA	57	t	0	2014-04-14 02:18:47.120354+05	system	2014-04-14 02:18:47.120354+05	system
\.


--
-- Name: geo_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('geo_state_id_seq', 80, true);


--
-- Data for Name: sales_cart; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_cart (id, updated_on, updated_by, created_on, created_by) FROM stdin;
\.


--
-- Name: sales_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_cart_id_seq', 1, false);


--
-- Data for Name: sales_cart_item; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_cart_item (id, cart_id, product_id, quantity, updated_on, updated_by, created_on, created_by) FROM stdin;
\.


--
-- Name: sales_cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_cart_item_id_seq', 1, false);


--
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_order (id, customer_id, currency_id, sub_total, taxes, total, refunded_amount, currency_rate, order_status, payment_status, shipping_status, billing_address_id, shipping_address_id, updated_on, updated_by, created_on, created_by) FROM stdin;
\.


--
-- Name: sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_order_id_seq', 1, false);


--
-- Data for Name: sales_order_item; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_order_item (id, order_id, product_id, price, quantity, taxes, sub_total, total, tax_rate, tax_method, updated_on, updated_by, created_on, created_by) FROM stdin;
\.


--
-- Name: sales_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_order_item_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: catalog_category_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_category
    ADD CONSTRAINT catalog_category_name_key UNIQUE (name);


--
-- Name: catalog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_category
    ADD CONSTRAINT catalog_category_pkey PRIMARY KEY (id);


--
-- Name: catalog_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_category
    ADD CONSTRAINT catalog_category_slug_key UNIQUE (slug);


--
-- Name: catalog_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_manufacturer
    ADD CONSTRAINT catalog_manufacturer_name_key UNIQUE (name);


--
-- Name: catalog_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_manufacturer
    ADD CONSTRAINT catalog_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: catalog_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_manufacturer
    ADD CONSTRAINT catalog_manufacturer_slug_key UNIQUE (slug);


--
-- Name: catalog_product_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT catalog_product_name_key UNIQUE (name);


--
-- Name: catalog_product_pic_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product_pic
    ADD CONSTRAINT catalog_product_pic_pkey PRIMARY KEY (id);


--
-- Name: catalog_product_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT catalog_product_pkey PRIMARY KEY (id);


--
-- Name: catalog_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT catalog_product_slug_key UNIQUE (slug);


--
-- Name: catalog_product_spec_name_product_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product_spec
    ADD CONSTRAINT catalog_product_spec_name_product_id_key UNIQUE (name, product_id);


--
-- Name: catalog_product_spec_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY catalog_product_spec
    ADD CONSTRAINT catalog_product_spec_pkey PRIMARY KEY (id);


--
-- Name: common_address_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_address
    ADD CONSTRAINT common_address_pkey PRIMARY KEY (id);


--
-- Name: common_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user_groups
    ADD CONSTRAINT common_user_groups_pkey PRIMARY KEY (id);


--
-- Name: common_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user_groups
    ADD CONSTRAINT common_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: common_user_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user
    ADD CONSTRAINT common_user_pkey PRIMARY KEY (id);


--
-- Name: common_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user_user_permissions
    ADD CONSTRAINT common_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: common_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user_user_permissions
    ADD CONSTRAINT common_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: common_user_username_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY common_user
    ADD CONSTRAINT common_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: financial_currency_code_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_currency
    ADD CONSTRAINT financial_currency_code_key UNIQUE (code);


--
-- Name: financial_currency_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_currency
    ADD CONSTRAINT financial_currency_name_key UNIQUE (name);


--
-- Name: financial_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_currency
    ADD CONSTRAINT financial_currency_pkey PRIMARY KEY (id);


--
-- Name: financial_tax_rate_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_tax_rate
    ADD CONSTRAINT financial_tax_rate_name_key UNIQUE (name);


--
-- Name: financial_tax_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_tax_rate
    ADD CONSTRAINT financial_tax_rate_pkey PRIMARY KEY (id);


--
-- Name: geo_country_iso_code2_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_country
    ADD CONSTRAINT geo_country_iso_code2_key UNIQUE (iso_code2);


--
-- Name: geo_country_iso_code3_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_country
    ADD CONSTRAINT geo_country_iso_code3_key UNIQUE (iso_code3);


--
-- Name: geo_country_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_country
    ADD CONSTRAINT geo_country_name_key UNIQUE (name);


--
-- Name: geo_country_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_country
    ADD CONSTRAINT geo_country_pkey PRIMARY KEY (id);


--
-- Name: geo_state_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_state
    ADD CONSTRAINT geo_state_name_key UNIQUE (name);


--
-- Name: geo_state_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_state
    ADD CONSTRAINT geo_state_pkey PRIMARY KEY (id);


--
-- Name: sales_cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_cart_item
    ADD CONSTRAINT sales_cart_item_pkey PRIMARY KEY (id);


--
-- Name: sales_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_cart
    ADD CONSTRAINT sales_cart_pkey PRIMARY KEY (id);


--
-- Name: sales_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_order_item
    ADD CONSTRAINT sales_order_item_pkey PRIMARY KEY (id);


--
-- Name: sales_order_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: catalog_category_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_category_name_like ON catalog_category USING btree (name varchar_pattern_ops);


--
-- Name: catalog_category_parent_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_category_parent_id ON catalog_category USING btree (parent_id);


--
-- Name: catalog_category_slug_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_category_slug_like ON catalog_category USING btree (slug varchar_pattern_ops);


--
-- Name: catalog_manufacturer_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_manufacturer_name_like ON catalog_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: catalog_manufacturer_slug_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_manufacturer_slug_like ON catalog_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: catalog_product_brand_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_brand_id ON catalog_product USING btree (brand_id);


--
-- Name: catalog_product_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_name_like ON catalog_product USING btree (name varchar_pattern_ops);


--
-- Name: catalog_product_pic_product_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_pic_product_id ON catalog_product_pic USING btree (product_id);


--
-- Name: catalog_product_slug_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_slug_like ON catalog_product USING btree (slug varchar_pattern_ops);


--
-- Name: catalog_product_spec_product_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_spec_product_id ON catalog_product_spec USING btree (product_id);


--
-- Name: catalog_product_tax_rate_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX catalog_product_tax_rate_id ON catalog_product USING btree (tax_rate_id);


--
-- Name: common_address_country_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_address_country_id ON common_address USING btree (country_id);


--
-- Name: common_address_customer_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_address_customer_id ON common_address USING btree (customer_id);


--
-- Name: common_address_state_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_address_state_id ON common_address USING btree (state_id);


--
-- Name: common_user_billing_address_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_billing_address_id ON common_user USING btree (billing_address_id);


--
-- Name: common_user_groups_group_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_groups_group_id ON common_user_groups USING btree (group_id);


--
-- Name: common_user_groups_user_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_groups_user_id ON common_user_groups USING btree (user_id);


--
-- Name: common_user_shipping_adress_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_shipping_adress_id ON common_user USING btree (shipping_adress_id);


--
-- Name: common_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_user_permissions_permission_id ON common_user_user_permissions USING btree (permission_id);


--
-- Name: common_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_user_permissions_user_id ON common_user_user_permissions USING btree (user_id);


--
-- Name: common_user_username_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX common_user_username_like ON common_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: financial_currency_code_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX financial_currency_code_like ON financial_currency USING btree (code varchar_pattern_ops);


--
-- Name: financial_currency_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX financial_currency_name_like ON financial_currency USING btree (name varchar_pattern_ops);


--
-- Name: financial_tax_rate_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX financial_tax_rate_name_like ON financial_tax_rate USING btree (name varchar_pattern_ops);


--
-- Name: geo_country_iso_code2_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_country_iso_code2_like ON geo_country USING btree (iso_code2 varchar_pattern_ops);


--
-- Name: geo_country_iso_code3_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_country_iso_code3_like ON geo_country USING btree (iso_code3 varchar_pattern_ops);


--
-- Name: geo_country_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_country_name_like ON geo_country USING btree (name varchar_pattern_ops);


--
-- Name: geo_state_country_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_state_country_id ON geo_state USING btree (country_id);


--
-- Name: geo_state_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_state_name_like ON geo_state USING btree (name varchar_pattern_ops);


--
-- Name: sales_cart_item_cart_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_cart_item_cart_id ON sales_cart_item USING btree (cart_id);


--
-- Name: sales_cart_item_product_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_cart_item_product_id ON sales_cart_item USING btree (product_id);


--
-- Name: sales_order_billing_address_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_billing_address_id ON sales_order USING btree (billing_address_id);


--
-- Name: sales_order_currency_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_currency_id ON sales_order USING btree (currency_id);


--
-- Name: sales_order_customer_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_customer_id ON sales_order USING btree (customer_id);


--
-- Name: sales_order_item_order_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_item_order_id ON sales_order_item USING btree (order_id);


--
-- Name: sales_order_item_product_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_item_product_id ON sales_order_item USING btree (product_id);


--
-- Name: sales_order_shipping_address_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_shipping_address_id ON sales_order USING btree (shipping_address_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_category_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_category
    ADD CONSTRAINT catalog_category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES catalog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_product_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT catalog_product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES catalog_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT catalog_product_category_id_fkey FOREIGN KEY (category_id) REFERENCES catalog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_product_pic_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product_pic
    ADD CONSTRAINT catalog_product_pic_product_id_fkey FOREIGN KEY (product_id) REFERENCES catalog_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_product_spec_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product_spec
    ADD CONSTRAINT catalog_product_spec_product_id_fkey FOREIGN KEY (product_id) REFERENCES catalog_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_address_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_address
    ADD CONSTRAINT common_address_country_id_fkey FOREIGN KEY (country_id) REFERENCES geo_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_address_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_address
    ADD CONSTRAINT common_address_state_id_fkey FOREIGN KEY (state_id) REFERENCES geo_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_user_billing_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user
    ADD CONSTRAINT common_user_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES common_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_groups
    ADD CONSTRAINT common_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_user_shipping_adress_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user
    ADD CONSTRAINT common_user_shipping_adress_id_fkey FOREIGN KEY (shipping_adress_id) REFERENCES common_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_user_permissions
    ADD CONSTRAINT common_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: currency_id_refs_id_caeef03d; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT currency_id_refs_id_caeef03d FOREIGN KEY (currency_id) REFERENCES financial_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_3f0004db; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_address
    ADD CONSTRAINT customer_id_refs_id_3f0004db FOREIGN KEY (customer_id) REFERENCES common_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_state_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_state
    ADD CONSTRAINT geo_state_country_id_fkey FOREIGN KEY (country_id) REFERENCES geo_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_cart_item_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_cart_item
    ADD CONSTRAINT sales_cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES sales_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_cart_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_cart_item
    ADD CONSTRAINT sales_cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES catalog_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_billing_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES common_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES common_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order_item
    ADD CONSTRAINT sales_order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES sales_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order_item
    ADD CONSTRAINT sales_order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES catalog_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_shipping_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_shipping_address_id_fkey FOREIGN KEY (shipping_address_id) REFERENCES common_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tax_rate_id_refs_id_504c9250; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT tax_rate_id_refs_id_504c9250 FOREIGN KEY (tax_rate_id) REFERENCES financial_tax_rate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_04bf1098; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_groups
    ADD CONSTRAINT user_id_refs_id_04bf1098 FOREIGN KEY (user_id) REFERENCES common_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_0ca682cd; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_0ca682cd FOREIGN KEY (user_id) REFERENCES common_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_fa37a31b; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY common_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_fa37a31b FOREIGN KEY (user_id) REFERENCES common_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

