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
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE accounts_user (
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
    birth_date date,
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


ALTER TABLE public.accounts_user OWNER TO doorsale;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE accounts_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO doorsale;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO doorsale;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE accounts_user_groups_id_seq OWNED BY accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO doorsale;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE accounts_user_id_seq OWNED BY accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE accounts_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO doorsale;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO doorsale;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE accounts_user_user_permissions_id_seq OWNED BY accounts_user_user_permissions.id;


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
    tax_id integer,
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
-- Name: financial_tax; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE financial_tax (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    method character varying(2) NOT NULL,
    rate double precision NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.financial_tax OWNER TO doorsale;

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

ALTER SEQUENCE financial_tax_rate_id_seq OWNED BY financial_tax.id;


--
-- Name: geo_address; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE geo_address (
    id integer NOT NULL,
    customer_id integer,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(75) NOT NULL,
    company character varying(100),
    country_id integer NOT NULL,
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


ALTER TABLE public.geo_address OWNER TO doorsale;

--
-- Name: geo_address_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE geo_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_address_id_seq OWNER TO doorsale;

--
-- Name: geo_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE geo_address_id_seq OWNED BY geo_address.id;


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
-- Name: payments_card_issuer; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE payments_card_issuer (
    descriptor character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.payments_card_issuer OWNER TO doorsale;

--
-- Name: payments_gateway; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE payments_gateway (
    name character varying(10) NOT NULL,
    account character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    is_sandbox boolean NOT NULL,
    accept_credit_card boolean NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.payments_gateway OWNER TO doorsale;

--
-- Name: payments_gateway_param; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE payments_gateway_param (
    id integer NOT NULL,
    gateway_id character varying(10) NOT NULL,
    name character varying(250) NOT NULL,
    value character varying(500) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.payments_gateway_param OWNER TO doorsale;

--
-- Name: payments_gateway_param_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE payments_gateway_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_gateway_param_id_seq OWNER TO doorsale;

--
-- Name: payments_gateway_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE payments_gateway_param_id_seq OWNED BY payments_gateway_param.id;


--
-- Name: payments_transaction; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE payments_transaction (
    id integer NOT NULL,
    gateway_id character varying(10) NOT NULL,
    order_id integer NOT NULL,
    description character varying(250) NOT NULL,
    error_message character varying(1000) NOT NULL,
    status character varying(100) NOT NULL,
    currency character varying(3) NOT NULL,
    amount numeric(9,2) NOT NULL,
    refund_amount numeric(9,2),
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.payments_transaction OWNER TO doorsale;

--
-- Name: payments_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE payments_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_transaction_id_seq OWNER TO doorsale;

--
-- Name: payments_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE payments_transaction_id_seq OWNED BY payments_transaction.id;


--
-- Name: payments_transaction_param; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE payments_transaction_param (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    name character varying(100) NOT NULL,
    value character varying(250) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.payments_transaction_param OWNER TO doorsale;

--
-- Name: payments_transaction_param_id_seq; Type: SEQUENCE; Schema: public; Owner: doorsale
--

CREATE SEQUENCE payments_transaction_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_transaction_param_id_seq OWNER TO doorsale;

--
-- Name: payments_transaction_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doorsale
--

ALTER SEQUENCE payments_transaction_param_id_seq OWNED BY payments_transaction_param.id;


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
    refunded_amount numeric(9,2),
    exchange_rate double precision NOT NULL,
    exchange_value numeric(9,2) NOT NULL,
    order_status character varying(2) NOT NULL,
    payment_method_code character varying(2) NOT NULL,
    payment_status character varying(2) NOT NULL,
    po_number character varying(100),
    shipping_status character varying(2) NOT NULL,
    billing_address_id integer NOT NULL,
    shipping_address_id integer,
    receipt_code character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    updated_by character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL,
    shipping_cost numeric(9,2) NOT NULL
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
-- Name: sales_payment_method; Type: TABLE; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE TABLE sales_payment_method (
    code character varying(2) NOT NULL,
    name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    updated_by character varying(100) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL,
    created_by character varying(100) NOT NULL
);


ALTER TABLE public.sales_payment_method OWNER TO doorsale;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user ALTER COLUMN id SET DEFAULT nextval('accounts_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('accounts_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('accounts_user_user_permissions_id_seq'::regclass);


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

ALTER TABLE ONLY financial_tax ALTER COLUMN id SET DEFAULT nextval('financial_tax_rate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_address ALTER COLUMN id SET DEFAULT nextval('geo_address_id_seq'::regclass);


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

ALTER TABLE ONLY payments_gateway_param ALTER COLUMN id SET DEFAULT nextval('payments_gateway_param_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_transaction ALTER COLUMN id SET DEFAULT nextval('payments_transaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_transaction_param ALTER COLUMN id SET DEFAULT nextval('payments_transaction_param_id_seq'::regclass);


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
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, birth_date, gender, billing_address_id, shipping_adress_id, is_verified, verification_code, updated_on, updated_by, created_on, created_by) FROM stdin;
1	pbkdf2_sha256$12000$J25OPTB58fJe$8d5X9ox3VTDEDDbVqvavdaQ5tkyWeiZAPbXtldGpXDc=	2014-09-12 02:36:44.038054+05	t	mysteryjeans	Faraz	Masood Khan	faraz@fanaticlab.com	t	t	2014-05-01 19:13:06.219876+05	\N	M	\N	\N	f	3776b902d00aaec77ceba965995f2265	2014-05-01 19:13:06.314491+05	mysteryjeans	2014-05-01 19:13:06.314519+05	mysteryjeans
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('accounts_user_id_seq', 1, true);


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('accounts_user_user_permissions_id_seq', 1, false);


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
22	Can add address	21	add_address
23	Can change address	21	change_address
24	Can delete address	21	delete_address
25	Can add user	22	add_user
26	Can change user	22	change_user
27	Can delete user	22	delete_user
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
61	Can add payment method	24	add_paymentmethod
62	Can change payment method	24	change_paymentmethod
63	Can delete payment method	24	delete_paymentmethod
64	Can add tax	25	add_tax
65	Can change tax	25	change_tax
66	Can delete tax	25	delete_tax
67	Can add site	26	add_site
68	Can change site	26	change_site
69	Can delete site	26	delete_site
70	Can add gateway	27	add_gateway
71	Can change gateway	27	change_gateway
72	Can delete gateway	27	delete_gateway
73	Can add gateway param	28	add_gatewayparam
74	Can change gateway param	28	change_gatewayparam
75	Can delete gateway param	28	delete_gatewayparam
76	Can add transaction	29	add_transaction
77	Can change transaction	29	change_transaction
78	Can delete transaction	29	delete_transaction
79	Can add transaction param	30	add_transactionparam
80	Can change transaction param	30	change_transactionparam
81	Can delete transaction param	30	delete_transactionparam
82	Can add card issuer	31	add_cardissuer
83	Can change card issuer	31	change_cardissuer
84	Can delete card issuer	31	delete_cardissuer
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('auth_permission_id_seq', 84, true);


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

COPY catalog_product (id, name, slug, brand_id, part_number, sku, gtin, gist, description, price, cost, old_price, quantity, is_active, is_bestseller, is_featured, is_free_shipping, tax_id, tags, weight, length, width, height, updated_by, updated_on, created_on, created_by, shipping_cost, category_id) FROM stdin;
5	Acer Aspire E1-570G	acer-aspire-e1-570g	7						439.00	0.00	0.00	50	t	f	f	f	1		0	0	0	0	mysteryjeans	2014-04-26 17:29:03.017805+05	2014-04-18 02:44:30.934033+05	mysteryjeans	0.00	4
1	Lenovo G510 Laptop	lenovo-g510-laptop	5				Super Hybrid Engine offers a choice of performance and power consumption modes for easy adjustments according to various needs	15.6-inch HD Widescreen Display\r\nThe 15.6" LED-backlit HD display (1366 x 768) delivers bright, crisp visuals in 16:9 widescreen on the G510.\r\nAbundant Multimedia Features\r\nThe G510 offers stunning, stutter-free visuals and immersive sound for a fuller, more satisfying home entertainment experience.\r\nAccuType Keyboard\r\nThe acclaimed AccuType keyboard is ergonomically designed to make typing more comfortable and to reduce errors.\r\nFast Data Transfer\r\nMove data between the G510 and other devices quickly with USB 3.0. It's up to 10 times faster than previous USB technologies.\r\nBattery-Saving Technology\r\nLenovo Energy Management protects the long-term durability of the battery and uses advanced energy-saving technology to increase time spent between charges to up to 5 hours, giving you flexibility on the go.\r\nSimple Maintenance\r\nWith OneKey Recovery, recovering from viruses or other technical difficulties is a snap.\r\nConnectivity\r\nWith 802.11 b/g/n WiFi connectivity, 10/100 LAN, and Bluetooth®, you'll be able to connect to the internet wherever you go.\r\nIntegrated Webcam\r\nThe optional 720p HD High-Sense webcam will help you enjoy web conferences or online video chats like you’re really there.\r\nHDMI Output\r\nFor easy connection to a television or other display.\r\nAmple storage\r\nWith 500GB HDD storage on the G510, you won't have to worry about where to put all your data, videos, music or photos.\r\nLenovo Cloud Storage\r\nProtect your important files and data, while also making access to information and file-sharing quick and convenient. Automatically back-up and synchronize data across your home, while enabling access from multiple devices. Data is encrypted on transfer for an extra level of security.	428.00	0.00	500.00	50	t	f	f	t	1	Laptop, G510	0	0	0	0	mysteryjeans	2014-05-15 06:40:42.350756+05	2014-04-15 01:11:50.502752+05	mysteryjeans	0.00	4
3	HP Pavilion 15-n242se Notebook PC	hp-pavilion-15-n242se-notebook-pc	3				Intel® Core™ i5-4200U.  4 GB 1600 MHz DDR3 Memory.  750 GB 5400 rpm SATA Hard Drive.  NVIDIA GeForce GT 740M (2 GB DDR3 dedicated).  Pearl white color. 	Intel® Core™ i5-4200U. \r\n4 GB 1600 MHz DDR3 Memory. \r\n750 GB 5400 rpm SATA Hard Drive. \r\nNVIDIA GeForce GT 740M (2 GB DDR3 dedicated). \r\nPearl white color. 	610.00	0.00	0.00	50	t	f	f	f	1	Pavilion	0	0	0	0	mysteryjeans	2014-04-26 17:28:03.296843+05	2014-04-15 01:42:13.758533+05	mysteryjeans	0.00	4
6	Dell Inspiron One 23	dell-inspiron-one-23	2				Interact and entertain with the new Inspiron One 23 all-in-one. It features an optional 23" touchscreen and up to 3rd Gen Intel® Core™ processors	Make your home entertainment experience riveting. Choose the unrelenting speed of up to 3rd Gen Intel® Core™ i7 processors and be efficient with the new Windows 8 operating system. With up to 8GB DDR3 memory7, you can easily:\r\n\r\nPower your HD entertainment: enjoy a cinema-like experience.\r\n\r\nEnjoy non-stop action: fast photo and video editing8, stunning movies and seamless multitasking.\r\n\r\nExperience smooth apps and games: everyone’s favorite applications work the way they were intended to.	800.00	0.00	0.00	50	t	f	f	f	1	All-in-One	0	0	0	0	mysteryjeans	2014-04-26 17:29:14.62433+05	2014-04-18 03:01:12.516931+05	mysteryjeans	0.00	3
8	HP IQ506 TouchSmart Desktop PC 	hp-iq506-touchsmart-desktop-pc	3					Redesigned with a next-generation, touch-enabled 22-inch high-definition LCD screen, the HP TouchSmart IQ506 all-in-one desktop PC is designed to fit wherever life happens: in the kitchen, family room, or living room. With one touch you can check the weather, download your e-mail, or watch your favorite TV show. It's also designed to maximize energy, with a power-saving Intel Core 2 Duo processor and advanced power management technology, as well as material efficiency--right down to the packaging. It has a sleek piano black design with elegant espresso side-panel highlights, and the HP Ambient Light lets you set a mood--or see your keyboard in the dark.	1199.00	0.00	0.00	10	t	f	f	f	1	All-in-One	0	0	0	0	mysteryjeans	2014-04-26 17:29:31.887263+05	2014-04-18 03:21:21.074223+05	mysteryjeans	0.00	3
10	Logitech X100 Mobile Wireless Speaker	logitech-x100-mobile-wireless-speaker	9				Go-anywhere mobile speaker that delivers rocking sound. Wireless speaker for smartphones and tablets. Connect and play. Take it anywhere. 5 hour Battery. 	Rocking sound\r\nCrystal clear sound. Pump up the volume and enjoy!\r\nRocking Sound\r\nConnect and play\r\n\r\nWirelessly connect, stream music, manage phone calls and control volume.\r\nTake it anywhere\r\n\r\nPerfect for life on the go. Take it on the road or relax and listen at home.\r\nDesign\r\n\r\nIn five bold colors, this unique design is sure to turn some heads.\r\n5 hour Battery\r\n\r\nEnjoy 5 hours of continuous play without recharging. Recharge the built-in lithium-ion battery with the convenience of the included micro-USB cable and rock on.	43.00	0.00	0.00	10	t	f	f	f	1		0	0	0	0	mysteryjeans	2014-04-26 17:30:31.882576+05	2014-04-18 05:03:10.414147+05	mysteryjeans	0.00	17
11	Acer Iconia A1-810	acer-iconia-a1-810	7				MediaTek 1.2 Ghz Quad-Core Processor. 16GB Flash Memory. 1GB RAM. 7.9" XGA IPS multi-touch screen. Android 4.2 Jelly Bean. Dual Camera. Bluetooth. 	MediaTek 1.2 Ghz Quad-Core Processor.\r\n16GB Flash Memory. 1GB RAM.\r\n7.9" XGA IPS multi-touch screen.\r\nAndroid 4.2 Jelly Bean.\r\nDual Camera. Bluetooth.	175.00	0.00	0.00	10	t	f	f	t	1	Android	0	0	0	0	mysteryjeans	2014-04-26 17:31:25.518625+05	2014-04-18 05:09:25.45253+05	mysteryjeans	0.00	18
7	Dell Optiplex 3010 DT Base	dell-optiplex-3010-dt-base	2				SPECIAL: additional 50 € discount on all Dell OptiPlex desktops from a value of 549 €. Online Coupon:? W8DWQ0ZRKTM1, valid until 12.04.2012.	Also included in this system\r\nTo change these selections "Next" to continue the button to the next page.\r\n\r\n1Yr Basic Service - No Upgrade Selected - on-site service, NBD\r\nNo asset tag required\r\n\r\nThe following options are default selections included with your order.\r\n\r\nGerman (QWERTY) Dell KB212-B USB Keyboard Black QuietKey\r\nX11301001\r\nWINDOWS LIVE\r\nOptiPlex ™ order - Germany\r\nOptiPlex ™ Intel ® Core ™ i3 sticker\r\nOptical software is not required, operating system software sufficiently	478.76	0.00	0.00	10	t	f	t	f	1	Tower	0	0	0	0	mysteryjeans	2014-05-15 05:35:56.355803+05	2014-04-18 03:17:59.480641+05	mysteryjeans	0.00	3
2	HP 15-d008se Notebook PC	hp-15-d008se-notebook	3				Intel Core i5 3230M Processor. 4GB RAM. 1TB Hard Drive. 15.6" LED Display. 1GB Dedicated Graphic Card. Windows 8.1 (64 bits).	Intel Core i5 3230M Processor. \r\n4GB RAM. 1TB Hard Drive. \r\n15.6" LED Display. \r\n1GB Dedicated Graphic Card. \r\nWindows 8.1 (64 bits). 	595.00	6.00	0.00	50	t	f	t	f	1	Ultrabook, Envy 15	0	0	0	0	mysteryjeans	2014-05-15 05:53:41.509336+05	2014-04-15 01:30:18.542023+05	mysteryjeans	0.00	4
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
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-05-01 19:14:17.216877+05	1	19	19	Euro	2	Changed display_format.
2	2014-05-01 19:19:55.368456+05	1	19	14	Pakistani Rupee	2	Changed exchange_rate.
3	2014-05-01 19:21:23.611971+05	1	19	14	Pakistani Rupee	2	Changed display_format.
4	2014-05-01 19:21:39.17047+05	1	19	14	Pakistani Rupee	2	Changed display_format.
5	2014-05-01 19:21:54.119114+05	1	19	14	Pakistani Rupee	2	Changed display_format.
6	2014-05-01 19:22:03.084964+05	1	19	14	Pakistani Rupee	2	Changed display_format.
7	2014-05-01 19:57:55.694511+05	1	19	13	US Dollar	2	Changed display_format.
8	2014-05-01 19:59:06.579493+05	1	19	14	Pakistani Rupee	2	Changed display_format.
9	2014-05-01 19:59:30.56433+05	1	19	15	Australian Dollar	2	Changed display_format.
10	2014-05-01 20:01:02.268404+05	1	19	16	British Pound	2	Changed display_format.
11	2014-05-01 20:01:14.171148+05	1	19	17	Canadian Dollar	2	Changed display_format.
12	2014-05-01 20:01:24.605284+05	1	19	18	Chinese Yuan Renminbi	2	Changed display_format.
13	2014-05-01 20:01:41.017782+05	1	19	19	Euro	2	Changed display_format.
14	2014-05-01 20:02:01.764983+05	1	19	20	Hong Kong Dollar	2	Changed display_format.
15	2014-05-01 20:02:17.050323+05	1	19	21	Japanese Yen	2	Changed display_format.
16	2014-05-01 20:02:49.382507+05	1	19	22	Russian Rouble	2	Changed display_format.
17	2014-05-01 20:03:00.795163+05	1	19	23	Swedish Krona	2	Changed display_format.
18	2014-05-01 20:03:11.934963+05	1	19	24	Romanian Leu	2	Changed display_format.
19	2014-05-01 20:18:07.41809+05	1	19	74	Pakistani Rupee	2	Changed display_format.
20	2014-05-01 20:21:37.845973+05	1	19	74	Pakistani Rupee	2	Changed display_format.
21	2014-05-01 21:10:28.128789+05	1	19	97	US Dollar	2	Changed is_primary.
22	2014-05-01 21:22:16.804163+05	1	19	97	US Dollar	2	Changed is_primary.
23	2014-05-01 21:22:49.722477+05	1	19	99	Australian Dollar	2	No fields changed.
24	2014-05-15 05:35:56.36835+05	1	12	7	Dell Optiplex 3010 DT Base	2	Changed is_featured.
25	2014-05-15 05:53:41.513444+05	1	12	2	HP 15-d008se Notebook PC	2	Changed is_featured.
26	2014-05-15 06:39:21.369932+05	1	12	1	Lenovo G510 Laptop	2	Changed old_price.
27	2014-05-15 06:40:42.355327+05	1	12	1	Lenovo G510 Laptop	2	Changed is_free_shipping.
28	2014-07-22 21:56:11.169908+05	1	26	1	127.0.0.1:8000	2	Changed domain and name.
29	2014-07-24 21:10:10.777604+05	1	21	1	Faraz Masood Khan Sugarland parklane, Houston, Texas, United States	2	Changed last_name.
30	2014-08-26 04:48:03.898195+05	1	27	PP	Doorsale PP	1	
31	2014-08-26 05:04:56.115929+05	1	27	Doorsale	Doorsale PP	1	
32	2014-08-26 05:05:48.736611+05	1	28	1	GatewayParam object	1	
33	2014-08-26 05:06:22.688605+05	1	28	2	GatewayParam object	1	
34	2014-08-26 05:24:32.937334+05	1	28	2	GatewayParam object	2	Changed name.
35	2014-08-26 05:27:14.662338+05	1	28	2	GatewayParam object	2	Changed name.
36	2014-09-08 21:35:02.903114+05	1	27	PP	PP	1	
37	2014-09-13 00:42:37.780232+05	1	28	1	GatewayParam object	1	
38	2014-09-13 00:44:19.414824+05	1	28	2	GatewayParam object	1	
39	2014-09-13 00:45:15.605979+05	1	28	1	GatewayParam object	2	Changed value.
40	2014-09-13 00:45:21.940535+05	1	28	2	GatewayParam object	2	Changed value.
41	2014-09-13 00:45:38.369149+05	1	28	1	GatewayParam object	2	No fields changed.
42	2014-09-13 06:09:29.898475+05	1	27	PP	mk.faraz-facilitator@gmail.com	2	Changed account.
43	2014-09-13 06:46:07.861875+05	1	27	PP	Doorsale	2	Changed account.
44	2014-09-15 03:46:38.082483+05	1	27	PP	PayPal[Doorsale]	1	
45	2014-09-15 03:48:10.547716+05	1	28	1	client_id: ASA_RxADuk6R7v_gi0ESsdJ5c8BvSNAnEg3-cIy_Vbwq9CxlFk38vTvwXuRG	1	
46	2014-09-15 03:48:44.108086+05	1	28	2	client_secret: EHqdhBDt2RM5OdHrXSMWuMxN7EUvrerd4YognpjBNygJBsCtNTaX7JKn_mH_	1	
47	2014-09-15 04:18:51.632999+05	1	27	ST	Doorsale[Stripe]	1	
48	2014-09-15 04:27:05.333875+05	1	28	3	secret_key: sk_test_aKouHRz8WCdPXANV3VTskPUk	1	
49	2014-09-15 04:36:38.39453+05	1	28	3	api_key: sk_test_aKouHRz8WCdPXANV3VTskPUk	2	Changed name.
50	2014-09-15 05:59:16.062265+05	1	27	PP	Doorsale[PayPal]	2	Changed accept_credit_card.
51	2014-09-15 05:59:44.761127+05	1	27	PP	Doorsale[PayPal]	2	Changed accept_credit_card.
52	2014-09-15 05:59:56.735883+05	1	27	PP	Doorsale[PayPal]	2	Changed accept_credit_card.
53	2014-09-15 06:00:04.732444+05	1	27	ST	Doorsale[Stripe]	2	Changed accept_credit_card.
54	2014-09-15 06:40:52.977848+05	1	27	PP	Doorsale[PayPal]	2	Changed is_active.
55	2014-09-15 06:41:13.391647+05	1	27	PP	Doorsale[PayPal]	2	Changed is_active.
56	2014-09-15 06:51:25.319778+05	1	28	2	client_secret: <Put PayPal client secret here>	2	Changed value.
57	2014-09-15 06:51:41.840835+05	1	28	1	client_id: <Put PayPal client id here>	2	Changed value.
58	2014-09-15 06:52:21.827588+05	1	28	3	api_key: <Put Stripe api key here>	2	Changed value.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 58, true);


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
21	address	geo	address
22	user	accounts	user
24	payment method	sales	paymentmethod
25	tax	financial	tax
26	site	sites	site
27	gateway	payments	gateway
28	gateway param	payments	gatewayparam
29	transaction	payments	transaction
30	transaction param	payments	transactionparam
31	card issuer	payments	cardissuer
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('django_content_type_id_seq', 31, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
mzbijqdky6zju9j3ftnp6jvvggl7eoj1	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-27 04:52:17.740841+05
ht305fo3zb2100r3n43tl92ipty8ein1	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-30 02:10:14.99748+05
mf1j90ntwm1x0uxewqpddly16pvgnr14	NzliYTY5MDgxMDYwNTE4NGNlOTNkZWI4OWQxMmVhMTA4MDhlNmQ1Mzp7ImNhcnRfaWQiOjU2LCJkZWZhdWx0X2N1cnJlbmN5IjoiUEtSIn0=	2014-05-18 01:09:42.08378+05
726s5c7yai1l8hgg4qnkiwkkiqsl839j	NzEwMDZlMjdlZWE4ZTU3ZmFiZDZiZjU5YmZjNDViMGE3OGJmYTQ3ZTp7ImNhcnRfaWQiOjU3fQ==	2014-05-18 02:36:27.969879+05
hkea3yezqklqdoh8sqgb9xod811wnzqn	MjFlMWY3ODU0MzNkZGYwNjAwYWQ1YmNiNDg2MGI4Y2JmNWI4M2ZhOTp7ImNhcnRfaWQiOjU4LCJkZWZhdWx0X2N1cnJlbmN5IjoiUEtSIn0=	2014-05-22 00:48:45.960686+05
9kbcacazv71pc16cdt7vpr7ajexzo8gw	ZjA1YTg5MTQxMGVjMzhhNDE2YjZmYzA1NDBjNjg4MWMxMGZmODQzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiY2FydF9pZCI6NjUsIl9hdXRoX3VzZXJfaWQiOjF9	2014-05-30 05:43:00.916486+05
wyq0l7kcuq276nz6go7f9olb2o56tatz	ODY4ZjkyMmQ3Y2NmY2E3YWU3MGRiYjg1OTZjMWY1ZTg1NTNlNzZkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-05-02 01:21:38.747505+05
zmt4bmlqpl6zpqcqbq3ic2vbnnqz918y	Yzk0MGViMTY5YTU2M2QyZDQ5NWQyYmRkNmRlNjk2NjRmYmY3NDljYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-05-06 00:21:14.985442+05
r8jc5hkn18exzl0vyvnmzcukxf69uzqc	MzkzODJjNzMxOWZiNGVhN2NlMGY5YWZlZjQ3MDRmODE3NmNmMzM0NTp7ImNhcnRfaWQiOjYxfQ==	2014-05-30 02:07:33.666879+05
si0mjwgqazmlt2hfemtnbdtl75q2cneq	ZDdkYjRiODZjN2U3NjAwNTQxMmEwZWI2YTFiZmYyZTNjYTg1ZTdlZTp7InVzZXJfY3VycmVuY3kiOiJFVVIifQ==	2014-05-15 21:30:11.115768+05
hnptb5es5bc0mrwd86y26t63txvpjc4q	ODM1OTQ2ODQ4YjFhYzQyNmI0MjlkNGIzNjE1NWQ5OTY3YmI1MGY5NTp7InNoaXBwaW5nX2FkZHJlc3MiOjEsImJpbGxpbmdfYWRkcmVzcyI6MSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJjYXJ0X2lkIjo2N30=	2014-05-30 06:35:51.819895+05
0znk27rxkoxmp40q8gua8gn6gtmb3zdv	NjZkZDE0ZjcxZGUzMDRlNjVjMzY4ZDQ3ODIxNTlmZTVkNDE4NTQ1Yjp7ImRlZmF1bHRfY3VycmVuY3kiOiJQS1IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-09-29 06:44:44.53342+05
u59erxxtueu3w0q1v0fzseauq4l6jfia	MzIxMjZlODcxYWU2ODUyY2Y4NzkyMTRlNjVkOWM3YjcxOWI0OTA0ODp7fQ==	2014-07-30 21:54:40.643132+05
0jqdao3prt8zwgjeh182nllra3xk8ln6	ZWRiZDY2ZGU3ZDk1MGE2NGMxNmE3NmVkNDkwMmQ0NzhmODc2NjQ1MDp7ImJpbGxpbmdfYWRkcmVzcyI6MSwiX2F1dGhfdXNlcl9pZCI6MSwicGF5bWVudF9tZXRob2QiOiJDQyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwib3JkZXJfY29uZmlybWVkIjp0cnVlLCJzaGlwcGluZ19hZGRyZXNzIjoxLCJjYXJ0X2lkIjo5NX0=	2014-09-26 03:08:47.427966+05
ef0n5pz1cp97eyn4v1sht2ee3g05tl3x	NWU3NDM2ZTZkZmE0YzAwMjUxYmQwZThlYjMyZGQyMDUzMzNkYzZmYTp7ImJpbGxpbmdfYWRkcmVzcyI6MSwiX2F1dGhfdXNlcl9pZCI6MSwicGF5bWVudF9tZXRob2QiOiJDQyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwib3JkZXJfY29uZmlybWVkIjp0cnVlLCJzaGlwcGluZ19hZGRyZXNzIjoxLCJjYXJ0X2lkIjo4OX0=	2014-09-25 20:30:09.499822+05
f6f7q0pm4j54m8l1msxfcw6r70t3t154	Nzc5OTc2MmU1NDBlMjczYjZhZDNhMDQ5OGZlOTBiYzhmNzQ4NDEzNDp7ImJpbGxpbmdfYWRkcmVzcyI6MSwiX2F1dGhfdXNlcl9pZCI6MSwicGF5bWVudF9tZXRob2QiOiJDTyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwic2hpcHBpbmdfYWRkcmVzcyI6MSwiY2FydF9pZCI6ODQsImRlZmF1bHRfY3VycmVuY3kiOiJQS1IifQ==	2014-08-16 02:31:56.400263+05
qw54im3j5eq00oupo1kvrvm6zj0xaf20	N2U3ODcwZjIxYjkzMzdkZjcyM2EwNDk3NWM4YjQ2ZjVmM2ZkOTY0Yjp7ImJpbGxpbmdfYWRkcmVzcyI6MSwiX2F1dGhfdXNlcl9pZCI6MSwicGF5bWVudF9tZXRob2QiOiJDQyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwic2hpcHBpbmdfYWRkcmVzcyI6MSwiY2FydF9pZCI6OTR9	2014-09-27 06:35:36.08738+05
\.


--
-- Data for Name: financial_currency; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY financial_currency (id, name, code, is_active, is_primary, exchange_rate, display_format, updated_by, updated_on, created_on, created_by, locale) FROM stdin;
98	Pakistani Rupee	PKR	t	f	98.6500000000000057	Rs. {0:,.0f}	system	2014-05-01 20:55:42.864477+05	2014-05-01 20:55:42.864477+05	system	ur-PK
100	British Pound	GBP	t	f	0.609999999999999987	£{0:,.2f}	system	2014-05-01 20:55:42.90866+05	2014-05-01 20:55:42.90866+05	system	en-GB
101	Canadian Dollar	CAD	t	f	0.979999999999999982	C${0:,.2f}	system	2014-05-01 20:55:42.930064+05	2014-05-01 20:55:42.930064+05	system	en-CA
102	Chinese Yuan Renminbi	CNY	t	f	6.48000000000000043	￥{0:,.2f}	system	2014-05-01 20:55:42.952291+05	2014-05-01 20:55:42.952291+05	system	zh-CN
103	Euro	EUR	t	f	0.790000000000000036	€{0:,.2f}	system	2014-05-01 20:55:42.973859+05	2014-05-01 20:55:42.973859+05	system	
104	Hong Kong Dollar	HKD	t	f	7.75	HK${0:,.2f}	system	2014-05-01 20:55:42.995289+05	2014-05-01 20:55:42.995289+05	system	zh-HK
105	Japanese Yen	JPY	t	f	80.0699999999999932	￥{0:,.2f}	system	2014-05-01 20:55:43.016973+05	2014-05-01 20:55:43.016973+05	system	ja-JP
106	Russian Rouble	RUB	t	f	27.6999999999999993	RUB{0:,.2f}	system	2014-05-01 20:55:43.038536+05	2014-05-01 20:55:43.038536+05	system	ru-RU
107	Swedish Krona	SEK	t	f	6.19000000000000039	kr{0:,.2f}	system	2014-05-01 20:55:43.060298+05	2014-05-01 20:55:43.060298+05	system	sv-SE
108	Romanian Leu	RON	t	f	2.85000000000000009	{0:,.2f} lei	system	2014-05-01 20:55:43.082875+05	2014-05-01 20:55:43.082875+05	system	ro-RO
97	US Dollar	USD	t	t	1	${0:,.2f}	mysteryjeans	2014-05-01 21:22:16.802245+05	2014-05-01 20:55:42.842669+05	system	en-US
99	Australian Dollar	AUD	t	f	0.939999999999999947	A${0:,.2f}	mysteryjeans	2014-05-01 21:22:49.720598+05	2014-05-01 20:55:42.886994+05	system	en-AU
\.


--
-- Name: financial_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('financial_currency_id_seq', 108, true);


--
-- Data for Name: financial_tax; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY financial_tax (id, name, method, rate, updated_by, updated_on, created_on, created_by) FROM stdin;
1	Computers & Electronics	PE	0.0200000000000000004	mysteryjeans	2014-04-15 01:11:10.584838+05	2014-04-15 01:11:10.584874+05	mysteryjeans
2	Books	PE	0.0200000000000000004	mysteryjeans	2014-04-18 05:22:10.362108+05	2014-04-18 05:22:10.362189+05	mysteryjeans
\.


--
-- Name: financial_tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('financial_tax_rate_id_seq', 2, true);


--
-- Data for Name: geo_address; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY geo_address (id, customer_id, first_name, last_name, email, company, country_id, state_id, city, address1, address2, zip_or_postal_code, phone_number, fax_number, updated_on, updated_by, created_on, created_by) FROM stdin;
1	1	Faraz	Masood Khan	mk.faraz@gmail.com		1	54	Houston	Sugarland parklane		23456	123456789		2014-07-24 21:10:10.775262+05	mysteryjeans	2014-05-16 06:33:02.047478+05	mysteryjeans
\.


--
-- Name: geo_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('geo_address_id_seq', 1, true);


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

SELECT pg_catalog.setval('geo_country_id_seq', 474, true);


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

SELECT pg_catalog.setval('geo_state_id_seq', 160, true);


--
-- Data for Name: payments_card_issuer; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY payments_card_issuer (descriptor, name, is_active, updated_on, updated_by, created_on, created_by) FROM stdin;
visa	Visa	t	2014-08-29 21:49:24.179527+05	system	2014-08-29 21:49:24.179527+05	system
mastercard	MasterCard	t	2014-08-29 21:49:24.293776+05	system	2014-08-29 21:49:24.293776+05	system
maestro	Maestro	t	2014-08-29 21:49:24.33552+05	system	2014-08-29 21:49:24.33552+05	system
discover	Discover Card	t	2014-08-29 21:49:24.369384+05	system	2014-08-29 21:49:24.369384+05	system
amex	American Express	t	2014-08-29 21:49:24.391218+05	system	2014-08-29 21:49:24.391218+05	system
diners_club_carte_blanche	Diners Club Carte Blanche	t	2014-08-29 21:49:24.412523+05	system	2014-08-29 21:49:24.412523+05	system
jcb	JCB	t	2014-08-29 21:49:24.43352+05	system	2014-08-29 21:49:24.43352+05	system
laser	Laser	t	2014-08-29 21:49:24.454924+05	system	2014-08-29 21:49:24.454924+05	system
visa_electron	Visa Electron	t	2014-08-29 21:49:24.477327+05	system	2014-08-29 21:49:24.477327+05	system
\.


--
-- Data for Name: payments_gateway; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY payments_gateway (name, account, is_active, is_sandbox, accept_credit_card, updated_on, created_on, updated_by, created_by) FROM stdin;
ST	Doorsale	t	t	t	2014-09-15 06:00:04.729539+05	2014-09-15 04:18:51.632086+05	mysteryjeans	mysteryjeans
PP	Doorsale	t	t	f	2014-09-15 06:41:13.388195+05	2014-09-15 03:46:38.078974+05	mysteryjeans	mysteryjeans
\.


--
-- Data for Name: payments_gateway_param; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY payments_gateway_param (id, gateway_id, name, value, updated_on, created_on, updated_by, created_by) FROM stdin;
2	PP	client_secret	<Put PayPal client secret here>	2014-09-15 06:51:25.318021+05	2014-09-15 03:48:44.106912+05	mysteryjeans	mysteryjeans
1	PP	client_id	<Put PayPal client id here>	2014-09-15 06:51:41.838426+05	2014-09-15 03:48:10.531378+05	mysteryjeans	mysteryjeans
3	ST	api_key	<Put Stripe api key here>	2014-09-15 06:52:21.825529+05	2014-09-15 04:27:05.331966+05	mysteryjeans	mysteryjeans
\.


--
-- Name: payments_gateway_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('payments_gateway_param_id_seq', 3, true);


--
-- Data for Name: payments_transaction; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY payments_transaction (id, gateway_id, order_id, description, error_message, status, currency, amount, refund_amount, updated_on, created_on, updated_by, created_by) FROM stdin;
1	ST	392	Transaction for order #392		PR	EUR	606.90	\N	2014-09-15 06:05:19.418921+05	2014-09-15 06:05:19.41898+05	mysteryjeans	mysteryjeans
2	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:06:24.366837+05	2014-09-15 06:06:24.366895+05	mysteryjeans	mysteryjeans
3	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:09:09.977151+05	2014-09-15 06:09:09.97722+05	mysteryjeans	mysteryjeans
4	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:11:44.10961+05	2014-09-15 06:11:44.109663+05	mysteryjeans	mysteryjeans
5	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:12:44.525391+05	2014-09-15 06:12:44.525443+05	mysteryjeans	mysteryjeans
6	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:14:45.685198+05	2014-09-15 06:14:45.685253+05	mysteryjeans	mysteryjeans
7	ST	393	Transaction for order #393		PR	EUR	606.90	\N	2014-09-15 06:20:42.940649+05	2014-09-15 06:20:42.940707+05	mysteryjeans	mysteryjeans
8	ST	395	Transaction for order #395		PR	USD	606.90	\N	2014-09-15 06:21:36.223714+05	2014-09-15 06:21:36.223769+05	mysteryjeans	mysteryjeans
9	ST	395	Transaction for order #395		PR	USD	606.90	\N	2014-09-15 06:24:33.341659+05	2014-09-15 06:24:33.341723+05	mysteryjeans	mysteryjeans
10	ST	395	Transaction for order #395	Your card was declined.	FA	USD	606.90	\N	2014-09-15 06:24:52.906779+05	2014-09-15 06:24:49.908362+05	mysteryjeans	mysteryjeans
11	ST	395	Transaction for order #395	Your card was declined.	FA	USD	606.90	\N	2014-09-15 06:27:32.80883+05	2014-09-15 06:27:28.362834+05	mysteryjeans	mysteryjeans
12	ST	395	Transaction for order #395	Your card's security code is incorrect.	FA	USD	606.90	\N	2014-09-15 06:32:55.448382+05	2014-09-15 06:32:51.888421+05	mysteryjeans	mysteryjeans
13	ST	395	Transaction for order #395	An error occurred while processing your card. Try again in a little bit.	FA	USD	606.90	\N	2014-09-15 06:33:38.706968+05	2014-09-15 06:33:35.047343+05	mysteryjeans	mysteryjeans
14	ST	395	Transaction for order #395		AP	USD	606.90	\N	2014-09-15 06:33:57.042458+05	2014-09-15 06:33:54.071694+05	mysteryjeans	mysteryjeans
15	ST	396	Transaction for order #396		AP	USD	606.90	\N	2014-09-15 06:34:39.194024+05	2014-09-15 06:34:35.494148+05	mysteryjeans	mysteryjeans
16	ST	397	Transaction for order #397		AP	USD	606.90	\N	2014-09-15 06:35:07.647844+05	2014-09-15 06:35:03.699651+05	mysteryjeans	mysteryjeans
17	ST	400	Transaction for order #400		AP	PKR	1213.80	\N	2014-09-15 06:44:35.79043+05	2014-09-15 06:44:31.488008+05	mysteryjeans	mysteryjeans
\.


--
-- Name: payments_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('payments_transaction_id_seq', 17, true);


--
-- Data for Name: payments_transaction_param; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY payments_transaction_param (id, transaction_id, name, value, created_on, created_by) FROM stdin;
1	14	id	ch_14coNKINluqxVyytk38fiK4R	2014-09-15 06:33:57.035622+05	mysteryjeans
2	14	created	1410744834	2014-09-15 06:33:57.037733+05	mysteryjeans
3	14	amount	60690	2014-09-15 06:33:57.038795+05	mysteryjeans
4	14	card_id	card_14coNKINluqxVyytJMzUsk4P	2014-09-15 06:33:57.039588+05	mysteryjeans
5	14	card_last4	0010	2014-09-15 06:33:57.040289+05	mysteryjeans
6	14	card_country	US	2014-09-15 06:33:57.040999+05	mysteryjeans
7	14	card_brand	Visa	2014-09-15 06:33:57.041689+05	mysteryjeans
8	15	id	ch_14coO1INluqxVyytrBLINy6n	2014-09-15 06:34:39.186369+05	mysteryjeans
9	15	created	1410744877	2014-09-15 06:34:39.188528+05	mysteryjeans
10	15	amount	60690	2014-09-15 06:34:39.189897+05	mysteryjeans
11	15	card_id	card_14coO1INluqxVyytTZ9WAenV	2014-09-15 06:34:39.190973+05	mysteryjeans
12	15	card_last4	0010	2014-09-15 06:34:39.191828+05	mysteryjeans
13	15	card_country	US	2014-09-15 06:34:39.19254+05	mysteryjeans
14	15	card_brand	Visa	2014-09-15 06:34:39.193281+05	mysteryjeans
15	16	id	ch_14coOTINluqxVyytSPeAsEvq	2014-09-15 06:35:07.638304+05	mysteryjeans
16	16	created	1410744905	2014-09-15 06:35:07.64048+05	mysteryjeans
17	16	amount	60690	2014-09-15 06:35:07.641909+05	mysteryjeans
18	16	card_id	card_14coOTINluqxVyyt5uCQXVXJ	2014-09-15 06:35:07.643098+05	mysteryjeans
19	16	card_last4	0010	2014-09-15 06:35:07.644564+05	mysteryjeans
20	16	card_country	US	2014-09-15 06:35:07.645896+05	mysteryjeans
21	16	card_brand	Visa	2014-09-15 06:35:07.646969+05	mysteryjeans
22	17	id	ch_14coXdINluqxVyytLRiCaQSu	2014-09-15 06:44:35.780861+05	mysteryjeans
23	17	created	1410745473	2014-09-15 06:44:35.783143+05	mysteryjeans
24	17	amount	121380	2014-09-15 06:44:35.784426+05	mysteryjeans
25	17	card_id	card_14coXdINluqxVyythiPOnSvR	2014-09-15 06:44:35.785696+05	mysteryjeans
26	17	card_last4	0010	2014-09-15 06:44:35.787136+05	mysteryjeans
27	17	card_country	US	2014-09-15 06:44:35.788453+05	mysteryjeans
28	17	card_brand	Visa	2014-09-15 06:44:35.789487+05	mysteryjeans
\.


--
-- Name: payments_transaction_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('payments_transaction_param_id_seq', 28, true);


--
-- Data for Name: sales_cart; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_cart (id, updated_on, updated_by, created_on, created_by) FROM stdin;
1	2014-05-02 02:58:49.090394+05		2014-05-02 02:58:49.09044+05	
2	2014-05-02 03:00:14.655416+05		2014-05-02 03:00:14.655455+05	
3	2014-05-02 03:00:31.76979+05		2014-05-02 03:00:31.769874+05	
4	2014-05-02 03:00:47.840181+05		2014-05-02 03:00:47.840242+05	
5	2014-05-02 03:02:48.568611+05		2014-05-02 03:02:48.568661+05	
6	2014-05-02 03:03:17.399342+05		2014-05-02 03:03:17.399391+05	
7	2014-05-02 03:03:46.503285+05		2014-05-02 03:03:46.503344+05	
8	2014-05-02 03:12:42.008636+05		2014-05-02 03:12:41.964999+05	
10	2014-05-02 03:14:51.371227+05		2014-05-02 03:14:51.371284+05	
11	2014-05-02 03:19:23.056222+05		2014-05-02 03:19:23.056278+05	
12	2014-05-02 03:19:31.184452+05		2014-05-02 03:19:31.184534+05	
13	2014-05-02 03:19:32.063093+05		2014-05-02 03:19:32.06315+05	
14	2014-05-02 03:20:51.486115+05		2014-05-02 03:20:51.486168+05	
15	2014-05-02 03:21:51.858264+05		2014-05-02 03:21:51.858404+05	
16	2014-05-02 03:23:59.91921+05		2014-05-02 03:23:59.919308+05	
17	2014-05-02 03:24:20.942312+05		2014-05-02 03:24:20.942364+05	
18	2014-05-02 03:25:28.078958+05		2014-05-02 03:25:28.07902+05	
9	2014-05-03 22:23:36.875261+05		2014-05-02 03:14:42.42784+05	
55	2014-05-04 00:58:59.208646+05		2014-05-04 00:58:59.208688+05	
56	2014-05-04 01:09:42.05717+05		2014-05-04 01:09:42.057209+05	
57	2014-05-04 02:36:27.885401+05		2014-05-04 02:36:27.885479+05	
58	2014-05-08 00:41:00.81637+05		2014-05-08 00:41:00.81642+05	
59	2014-05-14 21:52:39.777204+05		2014-05-14 21:52:39.777242+05	
60	2014-05-16 01:20:09.015404+05		2014-05-16 01:20:09.015441+05	
61	2014-05-16 02:07:33.657659+05		2014-05-16 02:07:33.657707+05	
62	2014-05-16 04:30:31.582745+05		2014-05-16 04:30:31.582784+05	
63	2014-05-16 04:57:52.720795+05		2014-05-16 04:57:52.720839+05	
64	2014-05-16 05:09:02.773656+05		2014-05-16 05:09:02.773703+05	
65	2014-05-16 05:35:31.410052+05		2014-05-16 05:35:31.41012+05	
66	2014-05-16 05:38:33.862137+05		2014-05-16 05:38:33.862187+05	
67	2014-05-16 06:35:42.797227+05		2014-05-16 06:35:42.797267+05	
68	2014-07-21 21:11:03.402665+05		2014-07-21 21:11:03.402734+05	
69	2014-07-22 05:44:49.515206+05		2014-07-22 05:44:49.515278+05	
70	2014-07-22 08:25:14.511118+05		2014-07-22 08:25:14.511158+05	
71	2014-07-22 18:42:38.768802+05		2014-07-22 18:42:38.768841+05	
72	2014-07-22 21:36:05.90553+05		2014-07-22 21:36:05.905568+05	
73	2014-07-22 22:02:52.493549+05		2014-07-22 22:02:52.493589+05	
74	2014-07-22 22:31:45.603667+05		2014-07-22 22:31:45.603736+05	
75	2014-07-22 22:39:04.019526+05		2014-07-22 22:39:04.019569+05	
76	2014-07-22 22:40:18.803078+05		2014-07-22 22:40:18.803116+05	
77	2014-07-22 22:50:12.550059+05		2014-07-22 22:50:12.5501+05	
78	2014-07-22 23:02:03.546052+05		2014-07-22 23:02:03.546099+05	
79	2014-07-22 23:11:04.651996+05		2014-07-22 23:11:04.65204+05	
80	2014-07-22 23:14:30.128317+05		2014-07-22 23:14:30.128359+05	
81	2014-07-22 23:58:46.351429+05		2014-07-22 23:58:46.351523+05	
82	2014-07-23 00:52:18.061218+05		2014-07-23 00:52:18.061262+05	
83	2014-07-23 00:55:15.091788+05		2014-07-23 00:55:15.091839+05	
84	2014-07-24 04:47:25.754252+05		2014-07-24 04:47:25.754293+05	
85	2014-07-24 16:47:29.503624+05		2014-07-24 16:47:29.503681+05	
86	2014-07-24 20:38:08.611777+05		2014-07-24 20:38:08.61182+05	
87	2014-07-25 00:20:41.370722+05		2014-07-25 00:20:41.370762+05	
88	2014-08-30 03:51:48.529427+05		2014-08-30 03:51:48.529485+05	
89	2014-09-06 04:20:43.967483+05		2014-09-06 04:20:43.967527+05	
90	2014-09-06 05:16:32.949717+05		2014-09-06 05:16:32.949757+05	
91	2014-09-11 20:36:47.293178+05		2014-09-11 20:36:47.293223+05	
92	2014-09-11 21:12:28.785452+05		2014-09-11 21:12:28.785492+05	
93	2014-09-11 21:38:08.643007+05		2014-09-11 21:38:08.643049+05	
94	2014-09-11 21:41:35.72369+05		2014-09-11 21:41:35.72373+05	
95	2014-09-12 02:36:48.4921+05		2014-09-12 02:36:48.492143+05	
96	2014-09-13 03:47:14.177524+05		2014-09-13 03:47:14.17758+05	
97	2014-09-13 04:05:28.322616+05		2014-09-13 04:05:28.322659+05	
98	2014-09-13 04:11:12.923147+05		2014-09-13 04:11:12.923185+05	
99	2014-09-13 04:14:16.175621+05		2014-09-13 04:14:16.175661+05	
100	2014-09-13 04:26:59.997059+05		2014-09-13 04:26:59.9971+05	
101	2014-09-13 04:44:50.978792+05		2014-09-13 04:44:50.978892+05	
102	2014-09-13 05:30:59.348083+05		2014-09-13 05:30:59.348129+05	
103	2014-09-13 05:49:09.028529+05		2014-09-13 05:49:09.02857+05	
104	2014-09-13 05:58:17.874947+05		2014-09-13 05:58:17.874992+05	
105	2014-09-13 06:00:40.731157+05		2014-09-13 06:00:40.7312+05	
106	2014-09-13 06:12:09.313407+05		2014-09-13 06:12:09.313446+05	
107	2014-09-13 06:14:02.326973+05		2014-09-13 06:14:02.327054+05	
108	2014-09-13 06:24:01.87465+05		2014-09-13 06:24:01.874693+05	
109	2014-09-13 06:28:28.934464+05		2014-09-13 06:28:28.93451+05	
110	2014-09-13 06:31:44.812418+05		2014-09-13 06:31:44.812478+05	
111	2014-09-13 06:36:14.005134+05		2014-09-13 06:36:14.005172+05	
112	2014-09-13 06:36:51.94291+05		2014-09-13 06:36:51.942989+05	
113	2014-09-13 06:37:42.513856+05		2014-09-13 06:37:42.513897+05	
114	2014-09-13 06:40:39.037596+05		2014-09-13 06:40:39.037636+05	
115	2014-09-14 23:52:37.364952+05		2014-09-14 23:52:37.364995+05	
116	2014-09-15 04:01:36.116349+05		2014-09-15 04:01:36.116397+05	
117	2014-09-15 04:02:41.395212+05		2014-09-15 04:02:41.39528+05	
118	2014-09-15 04:21:20.415293+05		2014-09-15 04:21:20.415336+05	
119	2014-09-15 05:58:56.479833+05		2014-09-15 05:58:56.479898+05	
\.


--
-- Name: sales_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_cart_id_seq', 119, true);


--
-- Data for Name: sales_cart_item; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_cart_item (id, cart_id, product_id, quantity, updated_on, updated_by, created_on, created_by) FROM stdin;
36	9	15	6	2014-05-04 00:52:40.956496+05	mysteryjeans	2014-05-04 00:52:34.481251+05	mysteryjeans
97	58	4	2	2014-05-08 08:33:55.993572+05	AnonymousUser	2014-05-08 08:33:55.993613+05	AnonymousUser
102	58	15	4	2014-05-09 03:27:41.119781+05	AnonymousUser	2014-05-09 03:14:27.997439+05	AnonymousUser
108	59	1	1	2014-05-15 17:35:29.21418+05	mysteryjeans	2014-05-15 17:35:29.214238+05	mysteryjeans
107	59	2	4	2014-05-15 17:39:32.214666+05	mysteryjeans	2014-05-15 05:48:29.799596+05	mysteryjeans
109	59	3	1	2014-05-15 23:54:52.36913+05	mysteryjeans	2014-05-15 23:54:52.369172+05	mysteryjeans
106	59	4	800	2014-05-15 18:38:10.193432+05	mysteryjeans	2014-05-15 05:23:51.683363+05	mysteryjeans
110	60	4	1	2014-05-16 01:20:09.021278+05	AnonymousUser	2014-05-16 01:20:09.021345+05	AnonymousUser
111	61	2	1	2014-05-16 02:07:33.662632+05	AnonymousUser	2014-05-16 02:07:33.662677+05	AnonymousUser
112	62	4	1	2014-05-16 04:30:31.588934+05	AnonymousUser	2014-05-16 04:30:31.589014+05	AnonymousUser
113	63	2	1	2014-05-16 04:57:52.725393+05	AnonymousUser	2014-05-16 04:57:52.725433+05	AnonymousUser
114	64	7	1	2014-05-16 05:09:02.780674+05	AnonymousUser	2014-05-16 05:09:02.780749+05	AnonymousUser
115	64	1	1	2014-05-16 05:16:07.720098+05	mysteryjeans	2014-05-16 05:16:07.720149+05	mysteryjeans
116	65	2	1	2014-05-16 05:35:31.415775+05	AnonymousUser	2014-05-16 05:35:31.415815+05	AnonymousUser
73	55	4	1	2014-05-04 00:58:59.214528+05	AnonymousUser	2014-05-04 00:58:59.214591+05	AnonymousUser
118	65	1	4	2014-05-16 05:42:08.080315+05	AnonymousUser	2014-05-16 05:42:05.586532+05	AnonymousUser
117	66	4	2	2014-05-16 05:46:11.163771+05	AnonymousUser	2014-05-16 05:38:33.867625+05	AnonymousUser
78	57	4	3	2014-05-04 02:37:09.202029+05	AnonymousUser	2014-05-04 02:37:05.808549+05	AnonymousUser
119	67	2	1	2014-05-16 06:35:42.804959+05	mysteryjeans	2014-05-16 06:35:42.805004+05	mysteryjeans
92	56	15	1	2014-05-04 03:46:13.840045+05	AnonymousUser	2014-05-04 03:46:13.840086+05	AnonymousUser
93	56	14	1	2014-05-04 03:46:24.677163+05	AnonymousUser	2014-05-04 03:46:24.677204+05	AnonymousUser
35	9	4	14	2014-05-03 22:50:01.436071+05	mysteryjeans	2014-05-03 22:49:56.320663+05	mysteryjeans
120	68	4	1	2014-07-21 21:11:03.444782+05	mysteryjeans	2014-07-21 21:11:03.44482+05	mysteryjeans
121	68	2	1	2014-07-21 21:31:58.42477+05	mysteryjeans	2014-07-21 21:31:58.424843+05	mysteryjeans
122	69	3	1	2014-07-22 05:44:49.525454+05	mysteryjeans	2014-07-22 05:44:49.525498+05	mysteryjeans
123	70	2	1	2014-07-22 08:25:14.518952+05	mysteryjeans	2014-07-22 08:25:14.518991+05	mysteryjeans
124	70	3	2	2014-07-22 08:25:21.095666+05	mysteryjeans	2014-07-22 08:25:20.010869+05	mysteryjeans
125	71	4	2	2014-07-22 18:42:39.591525+05	mysteryjeans	2014-07-22 18:42:38.776077+05	mysteryjeans
126	72	2	2	2014-07-22 21:36:06.724835+05	mysteryjeans	2014-07-22 21:36:05.912231+05	mysteryjeans
127	73	3	1	2014-07-22 22:02:52.500923+05	mysteryjeans	2014-07-22 22:02:52.500966+05	mysteryjeans
128	74	7	1	2014-07-22 22:31:45.612161+05	mysteryjeans	2014-07-22 22:31:45.612201+05	mysteryjeans
129	75	2	1	2014-07-22 22:39:04.027148+05	mysteryjeans	2014-07-22 22:39:04.027188+05	mysteryjeans
130	76	1	1	2014-07-22 22:40:18.81109+05	mysteryjeans	2014-07-22 22:40:18.811136+05	mysteryjeans
131	77	1	1	2014-07-22 22:50:12.55878+05	mysteryjeans	2014-07-22 22:50:12.558819+05	mysteryjeans
132	78	11	1	2014-07-22 23:02:03.55483+05	mysteryjeans	2014-07-22 23:02:03.554868+05	mysteryjeans
133	79	10	1	2014-07-22 23:11:04.661237+05	mysteryjeans	2014-07-22 23:11:04.661275+05	mysteryjeans
134	80	10	1	2014-07-22 23:14:30.137386+05	mysteryjeans	2014-07-22 23:14:30.137447+05	mysteryjeans
135	81	2	1	2014-07-22 23:58:46.358984+05	mysteryjeans	2014-07-22 23:58:46.359022+05	mysteryjeans
136	82	2	1	2014-07-23 00:52:18.069109+05	mysteryjeans	2014-07-23 00:52:18.069148+05	mysteryjeans
137	83	7	1	2014-07-23 00:55:15.10119+05	mysteryjeans	2014-07-23 00:55:15.101277+05	mysteryjeans
138	84	2	1	2014-07-24 04:47:25.804203+05	mysteryjeans	2014-07-24 04:47:25.804257+05	mysteryjeans
139	85	12	1	2014-07-24 16:47:29.50977+05	AnonymousUser	2014-07-24 16:47:29.50981+05	AnonymousUser
140	86	2	1	2014-07-24 20:38:08.619781+05	mysteryjeans	2014-07-24 20:38:08.619823+05	mysteryjeans
142	87	7	1	2014-07-25 00:20:54.625463+05	mysteryjeans	2014-07-25 00:20:54.625533+05	mysteryjeans
143	87	4	1	2014-08-08 22:21:14.930782+05	mysteryjeans	2014-08-08 22:21:14.930821+05	mysteryjeans
144	88	4	1	2014-08-30 03:51:48.57699+05	AnonymousUser	2014-08-30 03:51:48.577048+05	AnonymousUser
145	87	6	1	2014-08-30 04:41:42.727751+05	mysteryjeans	2014-08-30 04:41:42.72779+05	mysteryjeans
146	89	7	1	2014-09-06 04:20:43.975313+05	mysteryjeans	2014-09-06 04:20:43.975357+05	mysteryjeans
147	90	2	1	2014-09-06 05:16:32.956455+05	mysteryjeans	2014-09-06 05:16:32.956498+05	mysteryjeans
148	90	4	1	2014-09-07 01:45:18.950451+05	mysteryjeans	2014-09-07 01:45:18.950496+05	mysteryjeans
149	91	2	2	2014-09-11 20:36:56.84019+05	AnonymousUser	2014-09-11 20:36:47.338081+05	AnonymousUser
150	92	2	1	2014-09-11 21:12:28.793396+05	mysteryjeans	2014-09-11 21:12:28.793446+05	mysteryjeans
152	94	2	1	2014-09-11 21:41:35.731835+05	mysteryjeans	2014-09-11 21:41:35.73188+05	mysteryjeans
153	95	2	1	2014-09-12 02:36:48.5013+05	mysteryjeans	2014-09-12 02:36:48.501345+05	mysteryjeans
173	113	2	1	2014-09-13 06:37:42.524551+05	mysteryjeans	2014-09-13 06:37:42.524618+05	mysteryjeans
155	93	2	1	2014-09-13 00:28:24.836761+05	mysteryjeans	2014-09-13 00:28:24.836816+05	mysteryjeans
156	96	2	1	2014-09-13 03:47:14.185431+05	mysteryjeans	2014-09-13 03:47:14.185473+05	mysteryjeans
157	97	2	1	2014-09-13 04:05:28.332041+05	mysteryjeans	2014-09-13 04:05:28.332079+05	mysteryjeans
158	98	2	1	2014-09-13 04:11:12.932376+05	mysteryjeans	2014-09-13 04:11:12.932477+05	mysteryjeans
159	99	2	1	2014-09-13 04:14:16.183797+05	mysteryjeans	2014-09-13 04:14:16.183841+05	mysteryjeans
160	100	2	1	2014-09-13 04:27:00.006201+05	mysteryjeans	2014-09-13 04:27:00.006272+05	mysteryjeans
161	101	2	1	2014-09-13 04:44:50.992145+05	mysteryjeans	2014-09-13 04:44:50.992191+05	mysteryjeans
162	102	2	1	2014-09-13 05:30:59.356735+05	mysteryjeans	2014-09-13 05:30:59.356774+05	mysteryjeans
163	103	2	1	2014-09-13 05:49:09.039518+05	mysteryjeans	2014-09-13 05:49:09.039564+05	mysteryjeans
164	104	2	1	2014-09-13 05:58:17.883783+05	mysteryjeans	2014-09-13 05:58:17.883841+05	mysteryjeans
165	105	2	1	2014-09-13 06:00:40.739944+05	mysteryjeans	2014-09-13 06:00:40.739983+05	mysteryjeans
166	106	2	1	2014-09-13 06:12:09.320696+05	mysteryjeans	2014-09-13 06:12:09.320735+05	mysteryjeans
167	107	2	1	2014-09-13 06:14:02.335864+05	mysteryjeans	2014-09-13 06:14:02.335912+05	mysteryjeans
168	108	4	1	2014-09-13 06:24:01.882782+05	mysteryjeans	2014-09-13 06:24:01.882823+05	mysteryjeans
169	109	15	1	2014-09-13 06:28:28.943149+05	mysteryjeans	2014-09-13 06:28:28.943192+05	mysteryjeans
170	110	4	1	2014-09-13 06:31:44.821001+05	mysteryjeans	2014-09-13 06:31:44.821039+05	mysteryjeans
171	111	2	1	2014-09-13 06:36:14.014222+05	mysteryjeans	2014-09-13 06:36:14.014299+05	mysteryjeans
172	112	2	1	2014-09-13 06:36:51.952123+05	mysteryjeans	2014-09-13 06:36:51.952168+05	mysteryjeans
174	114	2	1	2014-09-13 06:40:39.04588+05	mysteryjeans	2014-09-13 06:40:39.045923+05	mysteryjeans
175	115	4	1	2014-09-14 23:52:37.375779+05	mysteryjeans	2014-09-14 23:52:37.375848+05	mysteryjeans
176	116	2	1	2014-09-15 04:01:36.124559+05	mysteryjeans	2014-09-15 04:01:36.124619+05	mysteryjeans
177	117	16	1	2014-09-15 04:02:41.40356+05	mysteryjeans	2014-09-15 04:02:41.403601+05	mysteryjeans
178	118	2	1	2014-09-15 04:21:20.425701+05	mysteryjeans	2014-09-15 04:21:20.425745+05	mysteryjeans
179	119	2	2	2014-09-15 06:38:39.001656+05	mysteryjeans	2014-09-15 05:58:56.492632+05	mysteryjeans
\.


--
-- Name: sales_cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_cart_item_id_seq', 179, true);


--
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_order (id, customer_id, currency_id, sub_total, taxes, total, refunded_amount, exchange_rate, exchange_value, order_status, payment_method_code, payment_status, po_number, shipping_status, billing_address_id, shipping_address_id, receipt_code, updated_on, updated_by, created_on, created_by, shipping_cost) FROM stdin;
1	1	97	610.00	12.20	622.20	0.00	1	622.20	PE	CH	PE	\N	PE	1	1	Uidf5kmIQyTa	2014-07-22 06:20:48.235234+05	mysteryjeans	2014-07-22 06:20:48.235276+05	mysteryjeans	0.00
2	1	98	1815.00	36.30	1851.30	0.00	98.6500000000000057	182630.74	PE	CO	PE	\N	PE	1	1	pNWKcZ8T4rqNPMfvwebp	2014-07-22 08:26:05.179865+05	mysteryjeans	2014-07-22 08:26:05.179933+05	mysteryjeans	0.00
3	1	98	1000.00	20.00	1020.00	0.00	98.6500000000000057	100623.00	PE	CO	PE	\N	PE	1	1	lq38SPbgPmQCrddw1lD3	2014-07-22 21:33:53.735728+05	mysteryjeans	2014-07-22 21:33:53.735775+05	mysteryjeans	0.00
4	1	98	1000.00	20.00	1020.00	0.00	98.6500000000000057	100623.00	PE	CO	PE	\N	PE	1	1	PbBM3O54KcgnC4YtkrMK	2014-07-22 21:34:52.174148+05	mysteryjeans	2014-07-22 21:34:52.174184+05	mysteryjeans	0.00
5	1	98	1000.00	20.00	1020.00	0.00	98.6500000000000057	100623.00	PE	CO	PE	\N	PE	1	1	V3q9Ldse0CMoK62DH6Wx	2014-07-22 21:35:31.612184+05	mysteryjeans	2014-07-22 21:35:31.612224+05	mysteryjeans	0.00
6	1	98	1190.00	23.80	1213.80	0.00	98.6500000000000057	119741.37	PE	CO	PE	\N	PE	1	1	5dzwYQQo9CK4Xb4GvBC1	2014-07-22 21:57:39.784526+05	mysteryjeans	2014-07-22 21:57:39.784563+05	mysteryjeans	0.00
7	1	98	1190.00	23.80	1213.80	0.00	98.6500000000000057	119741.37	PE	CO	PE	\N	PE	1	1	Xo1wkdg7qIme2zXPWeU8	2014-07-22 21:59:56.401201+05	mysteryjeans	2014-07-22 21:59:56.401238+05	mysteryjeans	0.00
8	1	98	610.00	12.20	622.20	0.00	98.6500000000000057	61380.03	PE	CO	PE	\N	PE	1	1	HTlP12VBK1WDxdBCkcXr	2014-07-22 22:03:29.983199+05	mysteryjeans	2014-07-22 22:03:29.983234+05	mysteryjeans	0.00
9	1	98	610.00	12.20	622.20	0.00	98.6500000000000057	61380.03	PE	CO	PE	\N	PE	1	1	tTnye15twcpzDk6642bR	2014-07-22 22:03:48.155964+05	mysteryjeans	2014-07-22 22:03:48.156013+05	mysteryjeans	0.00
10	1	98	610.00	12.20	622.20	0.00	98.6500000000000057	61380.03	PE	CO	PE	\N	PE	1	1	NdHAb2UwaxpZ1OSe17Nq	2014-07-22 22:26:08.832218+05	mysteryjeans	2014-07-22 22:26:08.83226+05	mysteryjeans	0.00
11	1	98	610.00	12.20	622.20	0.00	98.6500000000000057	61380.03	PE	CO	PE	\N	PE	1	1	0lAX00Qq0PxdU3Acuyy8	2014-07-22 22:26:36.246577+05	mysteryjeans	2014-07-22 22:26:36.246612+05	mysteryjeans	0.00
12	1	98	478.76	9.58	488.34	0.00	98.6500000000000057	48174.27	PE	CO	PE	\N	PE	1	1	OZFpAhYi2hsW0q7opPhY	2014-07-22 22:31:56.265174+05	mysteryjeans	2014-07-22 22:31:56.26521+05	mysteryjeans	0.00
13	1	98	595.00	11.90	606.90	0.00	98.6500000000000057	59870.68	PE	CO	PE	\N	PE	1	1	da0SYcrfO2Z6L94twZAm	2014-07-22 22:39:14.539587+05	mysteryjeans	2014-07-22 22:39:14.539623+05	mysteryjeans	0.00
14	1	98	428.00	8.56	436.56	0.00	98.6500000000000057	43066.64	PE	CO	PE	\N	PE	1	1	jnY3eePQdCjMzALaxkZm	2014-07-22 22:40:32.805758+05	mysteryjeans	2014-07-22 22:40:32.805795+05	mysteryjeans	0.00
15	1	98	428.00	8.56	436.56	0.00	98.6500000000000057	43066.64	PE	CO	PE	\N	PE	1	1	ZdfycJvjKlv1P2Q3w6GF	2014-07-22 22:50:23.022878+05	mysteryjeans	2014-07-22 22:50:23.022914+05	mysteryjeans	0.00
16	1	98	428.00	8.56	436.56	0.00	98.6500000000000057	43066.64	PE	CO	PE	\N	PE	1	1	doPTbqKet46XCjdeRp2I	2014-07-22 22:51:26.490299+05	mysteryjeans	2014-07-22 22:51:26.490336+05	mysteryjeans	0.00
17	1	98	175.00	3.50	178.50	0.00	98.6500000000000057	17609.03	PE	CO	PE	\N	PE	1	1	RLw7dv35OyOvhBBBbnZy	2014-07-22 23:05:44.055349+05	mysteryjeans	2014-07-22 23:05:44.055414+05	mysteryjeans	0.00
18	1	98	43.00	0.86	43.86	0.00	98.6500000000000057	4326.79	PE	CO	PE	\N	PE	1	1	BxfMViomZbuiixmJtYFl	2014-07-22 23:11:26.371117+05	mysteryjeans	2014-07-22 23:11:26.371162+05	mysteryjeans	0.00
19	1	98	43.00	0.86	43.86	0.00	98.6500000000000057	4326.79	PE	CO	PE	\N	PE	1	1	BKz3REV3W9yuReuNgTIi	2014-07-22 23:14:43.198828+05	mysteryjeans	2014-07-22 23:14:43.198869+05	mysteryjeans	0.00
20	1	97	595.00	11.90	606.90	0.00	1	606.90	PE	CO	PE	\N	PE	1	1	3YSl25r6zx2KFhftCSUv	2014-07-22 23:59:00.600831+05	mysteryjeans	2014-07-22 23:59:00.600867+05	mysteryjeans	0.00
21	1	97	595.00	11.90	606.90	0.00	1	606.90	PE	CH	PE	\N	PE	1	1	GPAJzJppryKJ0r4y3ZvT	2014-07-23 00:54:30.993284+05	mysteryjeans	2014-07-23 00:54:30.993325+05	mysteryjeans	0.00
22	1	97	478.76	9.58	488.34	0.00	1	488.34	PE	CO	PE	\N	PE	1	1	tz9ru02qGlgMRVSueBSq	2014-07-23 01:12:44.792204+05	mysteryjeans	2014-07-23 01:12:44.792242+05	mysteryjeans	0.00
23	1	97	27.00	0.54	27.54	0.00	1	27.54	PE	CO	PE	\N	PE	1	1	Z2hqOfk9m4A3nKWEklKf	2014-07-24 20:08:54.004375+05	mysteryjeans	2014-07-24 20:08:54.004412+05	mysteryjeans	0.00
24	1	97	595.00	11.90	606.90	0.00	1	606.90	PE	CO	PE	\N	PE	1	1	rOip5SQRNkAdBxJUrZMn	2014-07-24 21:15:48.332888+05	mysteryjeans	2014-07-24 21:15:48.332925+05	mysteryjeans	0.00
32	1	98	1778.76	35.58	1814.34	\N	98.6500000000000057	178984.17	PE	CC	PE	\N	PE	1	1	yXkYSy2TwWrznLb4QDIN	2014-09-06 04:17:29.032182+05	mysteryjeans	2014-09-06 04:17:29.032219+05	mysteryjeans	0.00
33	1	97	500.00	10.00	510.00	\N	1	510.00	PE	CC	PE	\N	PE	1	1	3PTPmft9A63cgOr6Y1Qa	2014-09-06 04:19:11.631735+05	mysteryjeans	2014-09-06 04:19:11.631773+05	mysteryjeans	0.00
34	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	hBvMZekoD2xeFBCqaMTB	2014-09-06 04:21:40.643947+05	mysteryjeans	2014-09-06 04:21:40.643985+05	mysteryjeans	0.00
35	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	yXGi9wFYITcJooRa4Qrz	2014-09-06 04:22:25.064479+05	mysteryjeans	2014-09-06 04:22:25.064555+05	mysteryjeans	0.00
36	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	MbhdK3zppbrqwFjTHklI	2014-09-06 04:24:31.832917+05	mysteryjeans	2014-09-06 04:24:31.832953+05	mysteryjeans	0.00
37	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	WeZ5UFtsVN1K6C8FyzEy	2014-09-06 04:24:51.110252+05	mysteryjeans	2014-09-06 04:24:51.110288+05	mysteryjeans	0.00
38	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	GZvbkHu9UIJDEzNvWe4G	2014-09-06 04:26:26.418991+05	mysteryjeans	2014-09-06 04:26:26.419027+05	mysteryjeans	0.00
39	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	IIS0k4niF3m230pwHsq7	2014-09-06 04:29:13.311636+05	mysteryjeans	2014-09-06 04:29:13.311674+05	mysteryjeans	0.00
40	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	EGZPWDRyM1XHujcNqs8t	2014-09-06 04:29:23.579297+05	mysteryjeans	2014-09-06 04:29:23.579346+05	mysteryjeans	0.00
41	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	lacwGkxKSnoFzJKDzTwl	2014-09-06 04:29:50.001489+05	mysteryjeans	2014-09-06 04:29:50.001525+05	mysteryjeans	0.00
42	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QzMqmKuM8SRqUpSDsybC	2014-09-06 04:30:06.364555+05	mysteryjeans	2014-09-06 04:30:06.364625+05	mysteryjeans	0.00
43	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	MRVk3mt3UICHQ8yR5ATX	2014-09-06 04:30:15.979815+05	mysteryjeans	2014-09-06 04:30:15.979851+05	mysteryjeans	0.00
44	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Cbf5KMX14E5WJxQpBWno	2014-09-06 04:38:13.053278+05	mysteryjeans	2014-09-06 04:38:13.053315+05	mysteryjeans	0.00
45	1	98	595.00	11.90	606.90	\N	98.6500000000000057	59870.68	PE	CC	PE	\N	PE	1	1	FSRpfPGOH9sZ08qz8C8S	2014-09-06 05:16:43.527788+05	mysteryjeans	2014-09-06 05:16:43.527825+05	mysteryjeans	0.00
46	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	I7XLeEVncQZqoJikXq2N	2014-09-06 05:16:58.59776+05	mysteryjeans	2014-09-06 05:16:58.597797+05	mysteryjeans	0.00
47	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	FFiyzReVXJ4bxI8G2Ylm	2014-09-06 05:17:06.374973+05	mysteryjeans	2014-09-06 05:17:06.375015+05	mysteryjeans	0.00
48	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	p44k3ku2yUpGwLGtNmjp	2014-09-06 05:18:40.572741+05	mysteryjeans	2014-09-06 05:18:40.572784+05	mysteryjeans	0.00
49	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	h8mitQ0617OWOeQEVDrJ	2014-09-06 05:19:00.520973+05	mysteryjeans	2014-09-06 05:19:00.521011+05	mysteryjeans	0.00
50	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	T78JSqB9ldXafJLLiHwr	2014-09-06 05:22:52.200249+05	mysteryjeans	2014-09-06 05:22:52.200287+05	mysteryjeans	0.00
51	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	xPER1X8mGrWIeAYHOCsj	2014-09-06 05:22:55.029116+05	mysteryjeans	2014-09-06 05:22:55.029154+05	mysteryjeans	0.00
52	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	F7fRpPs37D8NHbqhEZzi	2014-09-06 05:23:23.769383+05	mysteryjeans	2014-09-06 05:23:23.769419+05	mysteryjeans	0.00
53	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QYETZ3JMgSjJ9JuZMsRX	2014-09-06 05:24:43.724501+05	mysteryjeans	2014-09-06 05:24:43.724538+05	mysteryjeans	0.00
54	1	98	595.00	11.90	606.90	\N	98.6500000000000057	59870.68	PE	CC	PE	\N	PE	1	1	6W5sxp5f0w7yRrcPNUpd	2014-09-07 01:41:11.116832+05	mysteryjeans	2014-09-07 01:41:11.116869+05	mysteryjeans	0.00
55	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	USNY7DJApxzSMvTk2Pwm	2014-09-07 01:45:54.412768+05	mysteryjeans	2014-09-07 01:45:54.412805+05	mysteryjeans	0.00
56	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	5Pd6Ngisw5HRMdgtBYeB	2014-09-08 20:57:51.395766+05	mysteryjeans	2014-09-08 20:57:51.395802+05	mysteryjeans	0.00
57	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	BdBaQLFisnY9gJj6FlEl	2014-09-08 20:59:14.607739+05	mysteryjeans	2014-09-08 20:59:14.607777+05	mysteryjeans	0.00
58	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	SoqrJIYXDOS35ouhXvOP	2014-09-08 21:07:18.552806+05	mysteryjeans	2014-09-08 21:07:18.552844+05	mysteryjeans	0.00
59	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	a6lhhAiXKIm6lwQCWQuf	2014-09-08 21:31:57.484427+05	mysteryjeans	2014-09-08 21:31:57.484464+05	mysteryjeans	0.00
60	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	n1Vd1DLEkcNRApee3NQA	2014-09-08 21:31:59.601918+05	mysteryjeans	2014-09-08 21:31:59.601955+05	mysteryjeans	0.00
61	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	ubXh6fybQodMFHir0sDr	2014-09-08 21:32:01.548176+05	mysteryjeans	2014-09-08 21:32:01.548212+05	mysteryjeans	0.00
62	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	TXrGjqJM04qp3WonimAj	2014-09-08 21:32:01.83878+05	mysteryjeans	2014-09-08 21:32:01.838817+05	mysteryjeans	0.00
63	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	ZtMSs1ZpICR6NSyZpADB	2014-09-08 21:32:20.202297+05	mysteryjeans	2014-09-08 21:32:20.202333+05	mysteryjeans	0.00
64	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	lqtFUZ9NbQAHoAqyaJnz	2014-09-08 21:32:20.625439+05	mysteryjeans	2014-09-08 21:32:20.625479+05	mysteryjeans	0.00
65	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Jgy9TfkbhJVslDCKgBsM	2014-09-08 21:32:27.542561+05	mysteryjeans	2014-09-08 21:32:27.542602+05	mysteryjeans	0.00
66	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	J9Bre1LmZmXUO31ZWvkc	2014-09-08 21:32:28.35893+05	mysteryjeans	2014-09-08 21:32:28.358968+05	mysteryjeans	0.00
67	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	VnWvst6YWxQaTe5mXAnT	2014-09-08 21:32:28.531184+05	mysteryjeans	2014-09-08 21:32:28.531221+05	mysteryjeans	0.00
68	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	3N3SIeqHTif0p5GJhral	2014-09-08 21:32:28.696897+05	mysteryjeans	2014-09-08 21:32:28.696936+05	mysteryjeans	0.00
69	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	KNkk6Lvb1Xs0B4TArU00	2014-09-08 21:34:33.219592+05	mysteryjeans	2014-09-08 21:34:33.219633+05	mysteryjeans	0.00
70	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	rQnBssso4cYpa4e8TYPS	2014-09-08 21:35:21.783209+05	mysteryjeans	2014-09-08 21:35:21.783246+05	mysteryjeans	0.00
71	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	94McEYgcwtkN3STeDptu	2014-09-09 01:51:22.634355+05	mysteryjeans	2014-09-09 01:51:22.634394+05	mysteryjeans	0.00
72	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	7ScKJ5hflBJZNKmCexrP	2014-09-09 01:59:34.586615+05	mysteryjeans	2014-09-09 01:59:34.586684+05	mysteryjeans	0.00
73	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Gd5DYOlR0R3LuAchMnSu	2014-09-09 02:00:10.641903+05	mysteryjeans	2014-09-09 02:00:10.64194+05	mysteryjeans	0.00
74	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	4v01VFfw7aG7Rbiux7Lp	2014-09-09 02:01:07.774814+05	mysteryjeans	2014-09-09 02:01:07.77485+05	mysteryjeans	0.00
75	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	O2X8qJxopdd54xY4oiq6	2014-09-09 02:04:24.725533+05	mysteryjeans	2014-09-09 02:04:24.725569+05	mysteryjeans	0.00
76	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	gHRG5hbVrZ2yaZ4pU4X7	2014-09-09 02:08:45.395909+05	mysteryjeans	2014-09-09 02:08:45.395946+05	mysteryjeans	0.00
77	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	lufTTNYIVTJs2NQqxWr4	2014-09-09 02:15:23.103056+05	mysteryjeans	2014-09-09 02:15:23.103093+05	mysteryjeans	0.00
78	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	ewmm1jL13vLJEU6ms0Xq	2014-09-09 02:17:11.196694+05	mysteryjeans	2014-09-09 02:17:11.196732+05	mysteryjeans	0.00
79	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	IlGl59bOShgDIvqjyXeq	2014-09-09 02:18:09.285677+05	mysteryjeans	2014-09-09 02:18:09.285714+05	mysteryjeans	0.00
80	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	z5aETSqw0kOYZDXnxN6J	2014-09-09 02:18:18.736299+05	mysteryjeans	2014-09-09 02:18:18.736338+05	mysteryjeans	0.00
81	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	UJbHw4KGkjrlEVTaBmwG	2014-09-09 02:19:06.266485+05	mysteryjeans	2014-09-09 02:19:06.266521+05	mysteryjeans	0.00
82	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	lzoXDxpcXOMGdMo0myUs	2014-09-09 02:20:20.313281+05	mysteryjeans	2014-09-09 02:20:20.313318+05	mysteryjeans	0.00
83	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	AuqL5rBVxULh3ZMzkNJb	2014-09-09 02:30:12.594317+05	mysteryjeans	2014-09-09 02:30:12.594357+05	mysteryjeans	0.00
84	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QfTtflCVAlRCB9utPtlW	2014-09-09 02:34:44.740849+05	mysteryjeans	2014-09-09 02:34:44.740886+05	mysteryjeans	0.00
85	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	vjrPVEpf674nv9fPlkal	2014-09-09 02:36:39.859425+05	mysteryjeans	2014-09-09 02:36:39.859463+05	mysteryjeans	0.00
86	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	RSynVqZqQEkwTVaLksgm	2014-09-09 02:38:54.029194+05	mysteryjeans	2014-09-09 02:38:54.029261+05	mysteryjeans	0.00
87	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	ssJkfsrEPwMBsajMVu99	2014-09-09 02:39:46.690237+05	mysteryjeans	2014-09-09 02:39:46.690273+05	mysteryjeans	0.00
88	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	GpbPkPrvyX7ZbxpNVKdt	2014-09-09 02:40:35.253628+05	mysteryjeans	2014-09-09 02:40:35.253666+05	mysteryjeans	0.00
89	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	soZ9KhIrkLCweuDnrBF9	2014-09-09 02:41:10.051819+05	mysteryjeans	2014-09-09 02:41:10.051855+05	mysteryjeans	0.00
90	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	b7kEdOwn3c8nWDGXx39e	2014-09-09 02:51:53.007328+05	mysteryjeans	2014-09-09 02:51:53.00737+05	mysteryjeans	0.00
91	1	98	1095.00	21.90	1116.90	\N	98.6500000000000057	110182.19	PE	CC	PE	\N	PE	1	1	UlBm4a5xglKPEGalCZUt	2014-09-09 17:34:06.934329+05	mysteryjeans	2014-09-09 17:34:06.934366+05	mysteryjeans	0.00
92	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	QFm1ogejieY31De5tFBA	2014-09-09 19:27:59.983153+05	mysteryjeans	2014-09-09 19:27:59.983191+05	mysteryjeans	0.00
93	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	yCICRs7RLI4RHGMrk7pv	2014-09-09 19:40:50.810582+05	mysteryjeans	2014-09-09 19:40:50.81062+05	mysteryjeans	0.00
94	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QsDqmduL0EKE34fEXuKT	2014-09-09 19:41:04.790029+05	mysteryjeans	2014-09-09 19:41:04.790067+05	mysteryjeans	0.00
95	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	Oxgxc17Pq4SgWHAvMgQd	2014-09-09 19:41:47.452724+05	mysteryjeans	2014-09-09 19:41:47.452784+05	mysteryjeans	0.00
96	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	waSoPF3bEoWgmyrjKgq3	2014-09-09 19:41:56.243798+05	mysteryjeans	2014-09-09 19:41:56.243859+05	mysteryjeans	0.00
97	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	bcWzinSPqxdOE6QQ8MKS	2014-09-09 19:42:22.459498+05	mysteryjeans	2014-09-09 19:42:22.459568+05	mysteryjeans	0.00
98	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	JftnJa3BDWbdERNW3Wi9	2014-09-09 19:42:45.238456+05	mysteryjeans	2014-09-09 19:42:45.238526+05	mysteryjeans	0.00
99	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Af6WAkTFYv9D9LD9mgaN	2014-09-09 19:43:40.599749+05	mysteryjeans	2014-09-09 19:43:40.599789+05	mysteryjeans	0.00
100	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	mut4IaKtq6wNE2KgDj51	2014-09-09 19:48:45.256153+05	mysteryjeans	2014-09-09 19:48:45.25619+05	mysteryjeans	0.00
101	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	HSRKqHXZbIfTDpTGmmdi	2014-09-09 19:48:57.819135+05	mysteryjeans	2014-09-09 19:48:57.819174+05	mysteryjeans	0.00
102	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QncRSrt5Ux40Gs6kEPQN	2014-09-09 19:49:26.692354+05	mysteryjeans	2014-09-09 19:49:26.692392+05	mysteryjeans	0.00
103	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	LXtAvh2KecIqM53ccXaF	2014-09-09 19:51:45.331123+05	mysteryjeans	2014-09-09 19:51:45.331183+05	mysteryjeans	0.00
104	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	it6mFBp597y6Mxv9piDs	2014-09-09 19:52:04.067712+05	mysteryjeans	2014-09-09 19:52:04.067752+05	mysteryjeans	0.00
105	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	BHe8bIH62a5WxqubsnHY	2014-09-09 19:54:49.241569+05	mysteryjeans	2014-09-09 19:54:49.241625+05	mysteryjeans	0.00
106	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	jNiJovm4h6Vj7Mc5aZMO	2014-09-09 19:54:58.780735+05	mysteryjeans	2014-09-09 19:54:58.780782+05	mysteryjeans	0.00
107	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	TpRrYa7tkimup6IAccXF	2014-09-09 19:56:12.783366+05	mysteryjeans	2014-09-09 19:56:12.783404+05	mysteryjeans	0.00
108	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	I8puW2yiVDl9XVuqJU93	2014-09-09 19:56:22.508801+05	mysteryjeans	2014-09-09 19:56:22.508842+05	mysteryjeans	0.00
109	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	fVngtHGexRzTTkUGieQD	2014-09-09 19:57:47.099281+05	mysteryjeans	2014-09-09 19:57:47.099357+05	mysteryjeans	0.00
110	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	IMRbM6xCiQIS7ffvTXkv	2014-09-09 20:02:42.977214+05	mysteryjeans	2014-09-09 20:02:42.977284+05	mysteryjeans	0.00
111	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	2M6yyUM2TH4c6Z9I898U	2014-09-09 20:08:08.666885+05	mysteryjeans	2014-09-09 20:08:08.666945+05	mysteryjeans	0.00
112	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	ipgaxQlHkFkSZGte7upA	2014-09-09 21:00:17.626848+05	mysteryjeans	2014-09-09 21:00:17.626886+05	mysteryjeans	0.00
113	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	RR3KaOTcsxtvWmHSNN9Y	2014-09-09 21:00:39.506038+05	mysteryjeans	2014-09-09 21:00:39.506107+05	mysteryjeans	0.00
114	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	ypMR7tp3oaKem0P3ZOz9	2014-09-09 21:00:57.595565+05	mysteryjeans	2014-09-09 21:00:57.595603+05	mysteryjeans	0.00
115	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	rb4FBu9UDsyym5hzpblg	2014-09-09 21:01:18.280061+05	mysteryjeans	2014-09-09 21:01:18.280099+05	mysteryjeans	0.00
116	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	9yHFSnLjyIMiaiWc92Gl	2014-09-09 21:01:25.58008+05	mysteryjeans	2014-09-09 21:01:25.580118+05	mysteryjeans	0.00
117	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	uVeiF87BlxNydfRI3laf	2014-09-09 21:01:30.146835+05	mysteryjeans	2014-09-09 21:01:30.14688+05	mysteryjeans	0.00
118	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	S8coYmreT1GEqHepM3Fx	2014-09-09 21:01:31.049313+05	mysteryjeans	2014-09-09 21:01:31.049351+05	mysteryjeans	0.00
119	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	FaHzPBt6aujYlRe8L4ST	2014-09-09 21:01:31.269809+05	mysteryjeans	2014-09-09 21:01:31.269848+05	mysteryjeans	0.00
120	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	6TPpbyuRgvbLlOoRP9In	2014-09-09 21:01:33.344521+05	mysteryjeans	2014-09-09 21:01:33.34456+05	mysteryjeans	0.00
121	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	wXsMosHxdYPsaFqmFdSw	2014-09-09 21:16:04.319312+05	mysteryjeans	2014-09-09 21:16:04.319373+05	mysteryjeans	0.00
122	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	UahCSeTgreXUd96OBysK	2014-09-09 21:16:06.435032+05	mysteryjeans	2014-09-09 21:16:06.435072+05	mysteryjeans	0.00
123	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	mG8LyV9SXZFt7MLLOulN	2014-09-09 21:16:09.194906+05	mysteryjeans	2014-09-09 21:16:09.194973+05	mysteryjeans	0.00
124	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	QrVJRccyPK0pon5f9KuZ	2014-09-09 21:17:27.46163+05	mysteryjeans	2014-09-09 21:17:27.46171+05	mysteryjeans	0.00
125	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	385ncYZ42NvuoUqkrGSU	2014-09-09 21:23:56.061503+05	mysteryjeans	2014-09-09 21:23:56.061543+05	mysteryjeans	0.00
126	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	sXwGDrJb9H2GNEERff5H	2014-09-09 21:24:03.555253+05	mysteryjeans	2014-09-09 21:24:03.555292+05	mysteryjeans	0.00
127	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	a7nPhWvmsxOnjqGe6wyz	2014-09-09 21:24:37.089782+05	mysteryjeans	2014-09-09 21:24:37.089853+05	mysteryjeans	0.00
128	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Inb67Oghw5KlW8nOHsgZ	2014-09-09 21:25:38.388028+05	mysteryjeans	2014-09-09 21:25:38.388067+05	mysteryjeans	0.00
129	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	xNWQVWBF100R7WdD8gZc	2014-09-09 21:25:43.761011+05	mysteryjeans	2014-09-09 21:25:43.761075+05	mysteryjeans	0.00
130	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	gHhB9e6neZ4oo8uXPx5O	2014-09-09 21:26:51.030824+05	mysteryjeans	2014-09-09 21:26:51.030866+05	mysteryjeans	0.00
131	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	iGsIbLoHco2CQIIZar6l	2014-09-09 21:27:18.983903+05	mysteryjeans	2014-09-09 21:27:18.983942+05	mysteryjeans	0.00
132	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	KvYOV9bz2xSoaALTGUDw	2014-09-09 21:27:57.374467+05	mysteryjeans	2014-09-09 21:27:57.374506+05	mysteryjeans	0.00
133	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	GnYVrAsYnXt7JXvcbQfl	2014-09-09 21:30:08.002455+05	mysteryjeans	2014-09-09 21:30:08.002493+05	mysteryjeans	0.00
134	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	Qp6INRaGbENceliDG9Qw	2014-09-09 21:30:24.034471+05	mysteryjeans	2014-09-09 21:30:24.034509+05	mysteryjeans	0.00
135	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	IbOyUDOKzc0Eh2UZawzx	2014-09-09 21:44:16.558945+05	mysteryjeans	2014-09-09 21:44:16.558984+05	mysteryjeans	0.00
136	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	4NtvpUhlE1cuxznipqqk	2014-09-09 21:44:23.332266+05	mysteryjeans	2014-09-09 21:44:23.332303+05	mysteryjeans	0.00
137	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	7nrCUeVgoH492Z1FUJol	2014-09-09 21:45:07.843236+05	mysteryjeans	2014-09-09 21:45:07.8433+05	mysteryjeans	0.00
138	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	bqTki2S6DAqmArlZwIZI	2014-09-09 21:45:27.271034+05	mysteryjeans	2014-09-09 21:45:27.271072+05	mysteryjeans	0.00
139	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	N8uZiEqI2LV10Qbsmh2i	2014-09-09 21:45:46.147755+05	mysteryjeans	2014-09-09 21:45:46.147793+05	mysteryjeans	0.00
140	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	6ZPB3ijz4vNVukXCTiLK	2014-09-09 21:47:03.673949+05	mysteryjeans	2014-09-09 21:47:03.673988+05	mysteryjeans	0.00
141	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	5zxVpImc2jj8ou8vWjhk	2014-09-09 21:49:42.826277+05	mysteryjeans	2014-09-09 21:49:42.826331+05	mysteryjeans	0.00
142	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	oHWAC7FSGxafIFkLs7ZV	2014-09-10 01:07:23.762038+05	mysteryjeans	2014-09-10 01:07:23.762095+05	mysteryjeans	0.00
143	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	CdVrDgOmkjMY8BUSECyc	2014-09-10 01:08:29.257727+05	mysteryjeans	2014-09-10 01:08:29.257764+05	mysteryjeans	0.00
144	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	0MVUe2ly3mykrU1qyo99	2014-09-11 18:33:07.925346+05	mysteryjeans	2014-09-11 18:33:07.925384+05	mysteryjeans	0.00
145	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	wFhGdcIRScyvXo7MlgOu	2014-09-11 18:33:48.816964+05	mysteryjeans	2014-09-11 18:33:48.817002+05	mysteryjeans	0.00
146	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	ntdvEObWXmpTLCrxmHXf	2014-09-11 18:37:27.438441+05	mysteryjeans	2014-09-11 18:37:27.438478+05	mysteryjeans	0.00
147	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	cLrWcK8RHB2bxQNB6VRh	2014-09-11 18:54:13.416055+05	mysteryjeans	2014-09-11 18:54:13.416091+05	mysteryjeans	0.00
148	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	U2EDS9AyDoerwJwS0FBN	2014-09-11 18:54:28.671697+05	mysteryjeans	2014-09-11 18:54:28.671736+05	mysteryjeans	0.00
149	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	B6Eg1WSG3vUmAfWvkMn7	2014-09-11 18:54:36.696784+05	mysteryjeans	2014-09-11 18:54:36.696821+05	mysteryjeans	0.00
150	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	xaJVUu7RHwpuUqZPHqUU	2014-09-11 19:50:47.101403+05	mysteryjeans	2014-09-11 19:50:47.101439+05	mysteryjeans	0.00
151	1	97	1095.00	21.90	1116.90	\N	1	1116.90	PE	CC	PE	\N	PE	1	1	AEREexWRkMg8cOaIUrgG	2014-09-11 19:54:43.20953+05	mysteryjeans	2014-09-11 19:54:43.209568+05	mysteryjeans	0.00
152	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	kxPJRfNMjHqqnNDICqTa	2014-09-11 19:59:40.335652+05	mysteryjeans	2014-09-11 19:59:40.335689+05	mysteryjeans	0.00
153	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	sypFsMBOpjj6UZzHKFWn	2014-09-11 20:01:37.55133+05	mysteryjeans	2014-09-11 20:01:37.551367+05	mysteryjeans	0.00
154	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	DcFILK7tpiLz3w4dRKvQ	2014-09-11 20:01:56.418956+05	mysteryjeans	2014-09-11 20:01:56.418993+05	mysteryjeans	0.00
155	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	mpkXapwS1OvVup0s2jwi	2014-09-11 20:08:27.840839+05	mysteryjeans	2014-09-11 20:08:27.840876+05	mysteryjeans	0.00
156	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	WMCojNOKvn1OvIDm07gb	2014-09-11 20:12:21.713543+05	mysteryjeans	2014-09-11 20:12:21.713606+05	mysteryjeans	0.00
157	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	8Zyq84OxCILqUSSpBYUN	2014-09-11 20:13:30.670858+05	mysteryjeans	2014-09-11 20:13:30.670895+05	mysteryjeans	0.00
158	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	jV9r9Uc8yRbEFrzTy3QL	2014-09-11 20:15:12.747587+05	mysteryjeans	2014-09-11 20:15:12.747649+05	mysteryjeans	0.00
159	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	tUZSYUfPQzCwRI6nujpN	2014-09-11 20:15:37.524415+05	mysteryjeans	2014-09-11 20:15:37.524452+05	mysteryjeans	0.00
160	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	WdWmdfTUviXT76LszwFV	2014-09-11 20:15:48.126602+05	mysteryjeans	2014-09-11 20:15:48.126644+05	mysteryjeans	0.00
161	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	DbAwBkPsyf7mQiE7z0fZ	2014-09-11 20:16:34.101436+05	mysteryjeans	2014-09-11 20:16:34.101474+05	mysteryjeans	0.00
162	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	sB94Ub5gGPmd4QijDomL	2014-09-11 20:16:42.936992+05	mysteryjeans	2014-09-11 20:16:42.937029+05	mysteryjeans	0.00
163	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	7OinaVflaT0neqDrJY4l	2014-09-11 20:18:39.245038+05	mysteryjeans	2014-09-11 20:18:39.245075+05	mysteryjeans	0.00
164	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	OzLmjQUHZTiBknOYm1fY	2014-09-11 20:20:26.30122+05	mysteryjeans	2014-09-11 20:20:26.301256+05	mysteryjeans	0.00
165	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	XwDS3X40vetBnZjkXFXh	2014-09-11 20:21:35.036217+05	mysteryjeans	2014-09-11 20:21:35.036253+05	mysteryjeans	0.00
166	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	tjUJ7B0JpmrStRTn7s5z	2014-09-11 20:21:49.906261+05	mysteryjeans	2014-09-11 20:21:49.906299+05	mysteryjeans	0.00
167	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	1CPgCyjGRLrHiwf9Nt3d	2014-09-11 20:26:48.740535+05	mysteryjeans	2014-09-11 20:26:48.740572+05	mysteryjeans	0.00
168	1	97	478.76	9.58	488.34	\N	1	488.34	PE	CC	PE	\N	PE	1	1	yGsLvtvkh5gGCjzopvnw	2014-09-11 20:30:09.444008+05	mysteryjeans	2014-09-11 20:30:09.444045+05	mysteryjeans	0.00
169	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	cxQTyb7tf5gtaJ9yYb0D	2014-09-11 20:37:09.612297+05	mysteryjeans	2014-09-11 20:37:09.612333+05	mysteryjeans	0.00
170	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	L7c35OqmHaueTccTrrzM	2014-09-11 20:37:31.916855+05	mysteryjeans	2014-09-11 20:37:31.91689+05	mysteryjeans	0.00
171	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	7c0FOi803Y7EgariFOlB	2014-09-11 20:43:51.819607+05	mysteryjeans	2014-09-11 20:43:51.819649+05	mysteryjeans	0.00
172	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	YxCE5A7OD9dzyrfXaTE3	2014-09-11 20:53:40.103492+05	mysteryjeans	2014-09-11 20:53:40.10353+05	mysteryjeans	0.00
173	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	lbM5QM4vVDseu3Zv82K8	2014-09-11 20:53:42.28756+05	mysteryjeans	2014-09-11 20:53:42.287603+05	mysteryjeans	0.00
174	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	NzXJGb20jiuXpYubTQVw	2014-09-11 20:53:45.393612+05	mysteryjeans	2014-09-11 20:53:45.393649+05	mysteryjeans	0.00
175	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	8EnWg1CNrCcDzX7wzVKp	2014-09-11 20:54:06.787802+05	mysteryjeans	2014-09-11 20:54:06.787843+05	mysteryjeans	0.00
176	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	ci3V2wH7zRFmk8TxC9h6	2014-09-11 20:54:07.014733+05	mysteryjeans	2014-09-11 20:54:07.014781+05	mysteryjeans	0.00
177	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	EoFJ5xyKdCR1YwBDSaMd	2014-09-11 20:54:07.214102+05	mysteryjeans	2014-09-11 20:54:07.214145+05	mysteryjeans	0.00
178	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	ZX2X6zs18gnVqkIGtfwa	2014-09-11 20:54:07.469261+05	mysteryjeans	2014-09-11 20:54:07.469297+05	mysteryjeans	0.00
179	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	S8qHwFQN766lzxzUTl6N	2014-09-11 20:54:07.665425+05	mysteryjeans	2014-09-11 20:54:07.665494+05	mysteryjeans	0.00
180	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	FupZxzGbDv6JPklAw0c1	2014-09-11 20:54:07.87137+05	mysteryjeans	2014-09-11 20:54:07.871409+05	mysteryjeans	0.00
181	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	r8T2uejghUL4QYOrj3t2	2014-09-11 20:55:14.896991+05	mysteryjeans	2014-09-11 20:55:14.897038+05	mysteryjeans	0.00
182	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	jYyKGPo1HLz3ksysWJK8	2014-09-11 20:56:28.480844+05	mysteryjeans	2014-09-11 20:56:28.480887+05	mysteryjeans	0.00
183	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	M9vgmj0JxAYnQ7kuAPdt	2014-09-11 20:58:18.767475+05	mysteryjeans	2014-09-11 20:58:18.767511+05	mysteryjeans	0.00
184	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	qkbZepvWh26yZiNRn6kA	2014-09-11 21:01:06.5951+05	mysteryjeans	2014-09-11 21:01:06.595148+05	mysteryjeans	0.00
185	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	U8OxGfaZR3f7EiIxTY9i	2014-09-11 21:01:24.545497+05	mysteryjeans	2014-09-11 21:01:24.545533+05	mysteryjeans	0.00
186	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	lWpW0sWXrDVgVfiZfBI4	2014-09-11 21:01:54.474962+05	mysteryjeans	2014-09-11 21:01:54.474999+05	mysteryjeans	0.00
187	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	yog2jPn4XFuZ0rgQdZyt	2014-09-11 21:03:15.486117+05	mysteryjeans	2014-09-11 21:03:15.486154+05	mysteryjeans	0.00
188	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	yYgQ9jvvzydZJX8sB4Pt	2014-09-11 21:03:39.067487+05	mysteryjeans	2014-09-11 21:03:39.067527+05	mysteryjeans	0.00
189	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	r75XIBB5UsFQxjni2PCk	2014-09-11 21:08:51.036112+05	mysteryjeans	2014-09-11 21:08:51.036149+05	mysteryjeans	0.00
190	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	RZDokxDwtSOatIfL5CPr	2014-09-11 21:09:12.340774+05	mysteryjeans	2014-09-11 21:09:12.340811+05	mysteryjeans	0.00
191	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	isXuvOlvdG1iqOIpaRHD	2014-09-11 21:10:34.051397+05	mysteryjeans	2014-09-11 21:10:34.051434+05	mysteryjeans	0.00
192	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	P02ZP8M6NEfhbXnbju3l	2014-09-11 21:12:39.824598+05	mysteryjeans	2014-09-11 21:12:39.824635+05	mysteryjeans	0.00
193	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ux5AYe4Ucc3ZcPe1wIeY	2014-09-11 21:39:19.794791+05	mysteryjeans	2014-09-11 21:39:19.794836+05	mysteryjeans	0.00
194	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	j9kHkhjFOvNijtnVbfWr	2014-09-11 21:39:49.775582+05	mysteryjeans	2014-09-11 21:39:49.775621+05	mysteryjeans	0.00
195	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ZCTSGvhsJlkUFzhKXfSX	2014-09-11 21:40:23.301657+05	mysteryjeans	2014-09-11 21:40:23.301693+05	mysteryjeans	0.00
196	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	X5IwuQNaa0dKs22PzroU	2014-09-11 21:41:46.489171+05	mysteryjeans	2014-09-11 21:41:46.489208+05	mysteryjeans	0.00
197	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	tbAnMGkEcV8lxMuf1hlI	2014-09-12 01:43:12.25544+05	mysteryjeans	2014-09-12 01:43:12.255476+05	mysteryjeans	0.00
198	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	U96RfCydpXsQTuS85QyG	2014-09-12 01:43:28.503315+05	mysteryjeans	2014-09-12 01:43:28.503354+05	mysteryjeans	0.00
199	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	2lUnkQ5GcxMd8zpINnHh	2014-09-12 02:10:02.633876+05	mysteryjeans	2014-09-12 02:10:02.633914+05	mysteryjeans	0.00
200	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	roysHMpxsa4Gc7ArOry2	2014-09-12 02:12:27.756386+05	mysteryjeans	2014-09-12 02:12:27.756423+05	mysteryjeans	0.00
201	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	P7uzheu7BbuIOeiEiGZn	2014-09-12 02:29:49.905851+05	mysteryjeans	2014-09-12 02:29:49.905892+05	mysteryjeans	0.00
202	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	vJXZQFdUIVXzA9Kmrkbf	2014-09-12 02:30:34.105204+05	mysteryjeans	2014-09-12 02:30:34.10524+05	mysteryjeans	0.00
203	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	CpBi1qpNNtbSnNd1E46j	2014-09-12 02:30:42.713759+05	mysteryjeans	2014-09-12 02:30:42.713796+05	mysteryjeans	0.00
204	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ozcZT0sfaUNZ9xn7kXbh	2014-09-12 02:30:45.945498+05	mysteryjeans	2014-09-12 02:30:45.945535+05	mysteryjeans	0.00
205	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	XMxKZYRHXb645FEA1ewS	2014-09-12 02:37:01.735224+05	mysteryjeans	2014-09-12 02:37:01.735262+05	mysteryjeans	0.00
206	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	UM9RWFMUXmY5dQZ6lAdd	2014-09-12 02:40:21.537088+05	mysteryjeans	2014-09-12 02:40:21.537124+05	mysteryjeans	0.00
207	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	zctkEXRhWlkHIZJlhDID	2014-09-12 02:40:30.944506+05	mysteryjeans	2014-09-12 02:40:30.944542+05	mysteryjeans	0.00
208	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Hm8qSPreP1838RdmFvFu	2014-09-12 02:40:42.543451+05	mysteryjeans	2014-09-12 02:40:42.543486+05	mysteryjeans	0.00
209	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lylBW8PZBuhvtfxyZFxf	2014-09-12 02:41:07.307493+05	mysteryjeans	2014-09-12 02:41:07.307528+05	mysteryjeans	0.00
210	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	UASFV7D06buWwJ9CJ47W	2014-09-12 02:41:20.217825+05	mysteryjeans	2014-09-12 02:41:20.217862+05	mysteryjeans	0.00
211	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	4wwzporSw83G3kIqg2x0	2014-09-12 02:41:41.971657+05	mysteryjeans	2014-09-12 02:41:41.971693+05	mysteryjeans	0.00
212	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	EQ186wbthOpOqPYp31ne	2014-09-12 02:41:46.497724+05	mysteryjeans	2014-09-12 02:41:46.49776+05	mysteryjeans	0.00
213	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	SLsysKEkN93sfET4sVlY	2014-09-12 02:42:00.724065+05	mysteryjeans	2014-09-12 02:42:00.724101+05	mysteryjeans	0.00
214	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	QTxTDkU6gmAafF8hkTNr	2014-09-12 02:42:05.106437+05	mysteryjeans	2014-09-12 02:42:05.106478+05	mysteryjeans	0.00
215	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	cW4gxAHxasLyepBdBQhH	2014-09-12 02:42:31.579211+05	mysteryjeans	2014-09-12 02:42:31.579248+05	mysteryjeans	0.00
216	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	RrmKiPNpwn3fuxwZfNu1	2014-09-12 02:42:37.12809+05	mysteryjeans	2014-09-12 02:42:37.128129+05	mysteryjeans	0.00
217	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	rhgmyofMtMjejLo5kiOS	2014-09-12 02:42:47.13196+05	mysteryjeans	2014-09-12 02:42:47.131998+05	mysteryjeans	0.00
218	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Mj38yke240PwsML8JgxK	2014-09-12 02:43:18.596379+05	mysteryjeans	2014-09-12 02:43:18.596415+05	mysteryjeans	0.00
219	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	8mglVfNOesTsgYZ8RdzQ	2014-09-12 03:03:34.87952+05	mysteryjeans	2014-09-12 03:03:34.879559+05	mysteryjeans	0.00
220	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	GfO5xw2yzv57sxsuaxvW	2014-09-12 03:03:44.185551+05	mysteryjeans	2014-09-12 03:03:44.185597+05	mysteryjeans	0.00
221	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	yzQO0ZzUXW3YKUBhZtnY	2014-09-12 03:08:14.416765+05	mysteryjeans	2014-09-12 03:08:14.416805+05	mysteryjeans	0.00
222	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	JAKwe6N6Grkaq8ztBJM5	2014-09-12 03:08:47.414531+05	mysteryjeans	2014-09-12 03:08:47.414568+05	mysteryjeans	0.00
223	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	JQxE5FNQBypJNcVIXWwM	2014-09-12 03:09:38.256781+05	mysteryjeans	2014-09-12 03:09:38.256819+05	mysteryjeans	0.00
224	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	o9aJm0r9uoy1OeBSTOKJ	2014-09-12 03:09:46.151879+05	mysteryjeans	2014-09-12 03:09:46.151916+05	mysteryjeans	0.00
225	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	cChkWCMrw8MunfYTzHcN	2014-09-12 03:10:26.398796+05	mysteryjeans	2014-09-12 03:10:26.398832+05	mysteryjeans	0.00
226	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	DuxKRGdSjZr1rZlbSa6C	2014-09-12 03:11:00.857202+05	mysteryjeans	2014-09-12 03:11:00.857239+05	mysteryjeans	0.00
227	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	RKKzBC51zJgfqqefEwgW	2014-09-12 03:11:25.358315+05	mysteryjeans	2014-09-12 03:11:25.358354+05	mysteryjeans	0.00
228	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Rz9IyfC1Pnj2u5GIdBUA	2014-09-12 03:15:04.803516+05	mysteryjeans	2014-09-12 03:15:04.803553+05	mysteryjeans	0.00
229	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	tGfyBRT27V2OHIT5JImF	2014-09-12 03:16:22.856102+05	mysteryjeans	2014-09-12 03:16:22.85614+05	mysteryjeans	0.00
230	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	vQVVJdW7ucIVqlO8q68G	2014-09-12 03:17:20.290641+05	mysteryjeans	2014-09-12 03:17:20.290678+05	mysteryjeans	0.00
231	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lIZ7hhIS0wKMnXtPo39B	2014-09-12 03:36:18.265174+05	mysteryjeans	2014-09-12 03:36:18.26521+05	mysteryjeans	0.00
232	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	2va6C610PKWDPDBUsKoi	2014-09-12 03:36:48.157679+05	mysteryjeans	2014-09-12 03:36:48.157716+05	mysteryjeans	0.00
233	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	oIyMqSvkd9TSpPHwezd7	2014-09-12 03:37:27.885633+05	mysteryjeans	2014-09-12 03:37:27.88567+05	mysteryjeans	0.00
234	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	oWLLRO3obSRRgAxMrlRz	2014-09-12 03:37:41.910459+05	mysteryjeans	2014-09-12 03:37:41.910497+05	mysteryjeans	0.00
235	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	UQY43VUziON9X9M8oeaf	2014-09-12 03:38:40.523115+05	mysteryjeans	2014-09-12 03:38:40.523151+05	mysteryjeans	0.00
236	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	9C0rC3yQCOxsAELL0x85	2014-09-12 03:40:40.09433+05	mysteryjeans	2014-09-12 03:40:40.094365+05	mysteryjeans	0.00
237	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Q8W94Bvaj1LZzmedy4kE	2014-09-12 03:41:59.183873+05	mysteryjeans	2014-09-12 03:41:59.18391+05	mysteryjeans	0.00
238	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	2l39FUj2y2Y7fMYzHbjf	2014-09-12 03:42:41.991512+05	mysteryjeans	2014-09-12 03:42:41.99155+05	mysteryjeans	0.00
239	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	BATcWdy8i5QjjCDTmUJq	2014-09-12 03:43:10.158999+05	mysteryjeans	2014-09-12 03:43:10.159035+05	mysteryjeans	0.00
240	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	fAUqj7d1atNpTm5mc8il	2014-09-12 03:43:21.82796+05	mysteryjeans	2014-09-12 03:43:21.827995+05	mysteryjeans	0.00
241	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	AIiDGmIFXnmzhsanUxEP	2014-09-12 03:43:56.349397+05	mysteryjeans	2014-09-12 03:43:56.349437+05	mysteryjeans	0.00
242	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	DOvCUpY8QgSPJJvwPzKI	2014-09-12 03:44:29.387596+05	mysteryjeans	2014-09-12 03:44:29.387673+05	mysteryjeans	0.00
243	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	jq9LuSL6RgFFoT41M97e	2014-09-12 03:44:50.51839+05	mysteryjeans	2014-09-12 03:44:50.518435+05	mysteryjeans	0.00
244	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	m3p8uQz9ifI4vhPiCGmJ	2014-09-12 03:45:15.973629+05	mysteryjeans	2014-09-12 03:45:15.973665+05	mysteryjeans	0.00
245	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lQiUwjresN8CYRqtlQDw	2014-09-12 03:46:36.277471+05	mysteryjeans	2014-09-12 03:46:36.277508+05	mysteryjeans	0.00
246	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	XpI5kRnof1bYmrlfYK81	2014-09-12 03:58:33.829663+05	mysteryjeans	2014-09-12 03:58:33.8297+05	mysteryjeans	0.00
247	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	oB6MZroJ8SxmEtmO3fK7	2014-09-12 03:59:33.718665+05	mysteryjeans	2014-09-12 03:59:33.718708+05	mysteryjeans	0.00
248	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	0uYay9cBuV4TAMKdrjMV	2014-09-12 03:59:51.714498+05	mysteryjeans	2014-09-12 03:59:51.714535+05	mysteryjeans	0.00
249	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	a6me7xAQs1OKJFI01xmg	2014-09-12 04:02:08.999844+05	mysteryjeans	2014-09-12 04:02:08.999882+05	mysteryjeans	0.00
250	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	0zoj0Di32pJeP9isbbhq	2014-09-12 04:02:40.513352+05	mysteryjeans	2014-09-12 04:02:40.513389+05	mysteryjeans	0.00
251	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	EXBHaFJgOGTbtIxOGQYa	2014-09-12 04:04:25.774881+05	mysteryjeans	2014-09-12 04:04:25.77492+05	mysteryjeans	0.00
252	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	RsxNEDhLeh6mmHnbwqjz	2014-09-12 04:06:16.323541+05	mysteryjeans	2014-09-12 04:06:16.323577+05	mysteryjeans	0.00
253	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	FfUILbam30Br5soCLsJP	2014-09-12 04:07:10.537993+05	mysteryjeans	2014-09-12 04:07:10.538076+05	mysteryjeans	0.00
254	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	AIP67GJjdwKLTRQM68G0	2014-09-12 04:08:06.300176+05	mysteryjeans	2014-09-12 04:08:06.300214+05	mysteryjeans	0.00
255	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	SrEUoOFJdkqHOab9rpej	2014-09-12 04:08:21.553785+05	mysteryjeans	2014-09-12 04:08:21.553822+05	mysteryjeans	0.00
256	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	GMPla9Vt7PyPCBzEc3Q6	2014-09-12 04:09:22.324673+05	mysteryjeans	2014-09-12 04:09:22.324711+05	mysteryjeans	0.00
257	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	n6S8zLR82MP2tRmu2rrQ	2014-09-12 04:09:30.827834+05	mysteryjeans	2014-09-12 04:09:30.827877+05	mysteryjeans	0.00
258	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	eAqUjYWYOhVSIZu8yfRI	2014-09-12 04:09:37.624157+05	mysteryjeans	2014-09-12 04:09:37.624198+05	mysteryjeans	0.00
259	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	mznvXHTOgHzAYP9mJL5T	2014-09-12 04:15:56.429429+05	mysteryjeans	2014-09-12 04:15:56.429465+05	mysteryjeans	0.00
260	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	8jkk7Np87G2E6sUFbLsu	2014-09-12 04:20:49.093229+05	mysteryjeans	2014-09-12 04:20:49.093265+05	mysteryjeans	0.00
261	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	c7fUVfUwjFzdNxE1mjSL	2014-09-12 04:23:50.343812+05	mysteryjeans	2014-09-12 04:23:50.343849+05	mysteryjeans	0.00
262	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	zYfWBoIXw4A3QCXTfbYJ	2014-09-12 05:05:13.426825+05	mysteryjeans	2014-09-12 05:05:13.426879+05	mysteryjeans	0.00
263	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	XH9eXt67ZjGNghSNkPiJ	2014-09-12 05:06:47.496826+05	mysteryjeans	2014-09-12 05:06:47.496865+05	mysteryjeans	0.00
264	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	p2GZ1VMdurl7mrKjX15P	2014-09-12 05:09:26.707617+05	mysteryjeans	2014-09-12 05:09:26.707656+05	mysteryjeans	0.00
265	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	OUGqHrh9ukx3MAHj5LNe	2014-09-12 05:11:24.856687+05	mysteryjeans	2014-09-12 05:11:24.856725+05	mysteryjeans	0.00
266	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	JEeBbTZo9INioJA9RJPp	2014-09-12 05:17:56.273581+05	mysteryjeans	2014-09-12 05:17:56.273618+05	mysteryjeans	0.00
267	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	BKbdmsffGwQkJ4k8jfpu	2014-09-12 05:18:43.640573+05	mysteryjeans	2014-09-12 05:18:43.640621+05	mysteryjeans	0.00
268	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	XTL6iUiFvAdazAw9DbSV	2014-09-12 05:22:37.76845+05	mysteryjeans	2014-09-12 05:22:37.768487+05	mysteryjeans	0.00
269	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lv2Ec4AHxCcWRlviP9ki	2014-09-12 05:26:23.686556+05	mysteryjeans	2014-09-12 05:26:23.686592+05	mysteryjeans	0.00
270	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	EPHUGvhzL9gSgeBZ0F23	2014-09-12 05:27:27.50246+05	mysteryjeans	2014-09-12 05:27:27.502495+05	mysteryjeans	0.00
271	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	kA6Wl4FSo1thpiUSNJuH	2014-09-12 05:28:40.051086+05	mysteryjeans	2014-09-12 05:28:40.051124+05	mysteryjeans	0.00
272	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Gif7ixKr5mLMzqn0QDLl	2014-09-12 05:35:05.359674+05	mysteryjeans	2014-09-12 05:35:05.359711+05	mysteryjeans	0.00
273	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	dJJMddqrKfeGawFbk6Ie	2014-09-12 05:36:25.19349+05	mysteryjeans	2014-09-12 05:36:25.193526+05	mysteryjeans	0.00
274	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	BmuRESVoGAna0RzAXYFQ	2014-09-12 05:37:14.473262+05	mysteryjeans	2014-09-12 05:37:14.473318+05	mysteryjeans	0.00
275	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	yS7GBYioG2VRLinJ1iQT	2014-09-12 05:42:27.191863+05	mysteryjeans	2014-09-12 05:42:27.191906+05	mysteryjeans	0.00
276	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	nWR6XxaAT4NcdBJTDjnx	2014-09-12 05:43:12.393207+05	mysteryjeans	2014-09-12 05:43:12.393243+05	mysteryjeans	0.00
277	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	rq0cmhNAygm0Oamip25W	2014-09-12 05:43:26.572584+05	mysteryjeans	2014-09-12 05:43:26.57262+05	mysteryjeans	0.00
278	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	4DTugnuHZtkoteJv1hpH	2014-09-12 05:45:15.077347+05	mysteryjeans	2014-09-12 05:45:15.077399+05	mysteryjeans	0.00
279	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	PvVsmGdxV9qJqotiWbV7	2014-09-12 05:46:24.305789+05	mysteryjeans	2014-09-12 05:46:24.305836+05	mysteryjeans	0.00
280	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	HuAVOiAJUiiCkfXFgGtS	2014-09-12 05:47:03.745401+05	mysteryjeans	2014-09-12 05:47:03.745466+05	mysteryjeans	0.00
281	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	rWVOEN0NhNOEzLZ16aT0	2014-09-12 05:50:05.755967+05	mysteryjeans	2014-09-12 05:50:05.756005+05	mysteryjeans	0.00
282	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	zY6MvKYjYjqMcWTSLvnH	2014-09-12 05:51:25.922456+05	mysteryjeans	2014-09-12 05:51:25.922499+05	mysteryjeans	0.00
283	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	k7QOINKiGbjzdxRX4bb6	2014-09-12 05:52:07.758847+05	mysteryjeans	2014-09-12 05:52:07.758884+05	mysteryjeans	0.00
284	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	0vgGrV2rFpmyG8xZ7FtL	2014-09-12 05:56:01.080476+05	mysteryjeans	2014-09-12 05:56:01.080513+05	mysteryjeans	0.00
285	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	cv2BS7Bo4cTJ17gDftRG	2014-09-12 05:58:48.561111+05	mysteryjeans	2014-09-12 05:58:48.561148+05	mysteryjeans	0.00
286	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Zl88qnLcPU68Zw90u7BG	2014-09-12 06:00:24.653698+05	mysteryjeans	2014-09-12 06:00:24.653737+05	mysteryjeans	0.00
287	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	mrNclW2bEi6p8oHrpjlD	2014-09-12 06:01:55.271457+05	mysteryjeans	2014-09-12 06:01:55.271495+05	mysteryjeans	0.00
288	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	SMT89KmbuEwCGWDvAFg3	2014-09-12 06:04:45.788764+05	mysteryjeans	2014-09-12 06:04:45.7888+05	mysteryjeans	0.00
289	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	xbYl5Ht6NqeIT2vxg4es	2014-09-12 06:07:36.18963+05	mysteryjeans	2014-09-12 06:07:36.189667+05	mysteryjeans	0.00
290	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	3OOD1jEfq4ftY8D3OxCp	2014-09-12 06:07:44.436918+05	mysteryjeans	2014-09-12 06:07:44.436958+05	mysteryjeans	0.00
291	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	p32iZW4aFC2F6YF2rgCb	2014-09-12 06:08:41.122493+05	mysteryjeans	2014-09-12 06:08:41.122539+05	mysteryjeans	0.00
292	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	AxQlkC4dNTRcCiCMtuBg	2014-09-12 06:08:52.704116+05	mysteryjeans	2014-09-12 06:08:52.704172+05	mysteryjeans	0.00
293	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	yaAtDvPHE3Qei1BaszOo	2014-09-12 06:13:54.661483+05	mysteryjeans	2014-09-12 06:13:54.661522+05	mysteryjeans	0.00
294	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	JmBVqRBVsmZEUkLb1y3k	2014-09-12 06:29:10.722545+05	mysteryjeans	2014-09-12 06:29:10.722584+05	mysteryjeans	0.00
295	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	oGNDFDRK26JDbyTWLEgR	2014-09-12 06:31:15.719835+05	mysteryjeans	2014-09-12 06:31:15.719871+05	mysteryjeans	0.00
296	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	c0zHd1f7ZJ8n69sSH1sA	2014-09-12 06:34:18.11583+05	mysteryjeans	2014-09-12 06:34:18.115867+05	mysteryjeans	0.00
297	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	v4yLaK1Q1vi5qFg3wf0s	2014-09-12 06:35:00.283562+05	mysteryjeans	2014-09-12 06:35:00.283607+05	mysteryjeans	0.00
298	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	dhElqZIH07foyoFXsGgi	2014-09-12 06:35:06.782155+05	mysteryjeans	2014-09-12 06:35:06.782199+05	mysteryjeans	0.00
299	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	M32A1Yrr25d37NyvPCVt	2014-09-12 06:37:08.054429+05	mysteryjeans	2014-09-12 06:37:08.054488+05	mysteryjeans	0.00
300	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	wJV7ocDEu15vfsObrFuZ	2014-09-12 06:37:20.955954+05	mysteryjeans	2014-09-12 06:37:20.956009+05	mysteryjeans	0.00
301	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	tPQmMzC5sSxC0AoCakcQ	2014-09-12 06:38:49.325316+05	mysteryjeans	2014-09-12 06:38:49.325352+05	mysteryjeans	0.00
302	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	QQXpwZixChT4ofq1vase	2014-09-12 06:39:54.547045+05	mysteryjeans	2014-09-12 06:39:54.547082+05	mysteryjeans	0.00
303	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	jip66OfgxXksPqWBrbl4	2014-09-12 06:40:06.150569+05	mysteryjeans	2014-09-12 06:40:06.15061+05	mysteryjeans	0.00
304	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	4iWSXBP8etLK3ZSTzVL3	2014-09-12 06:40:56.764563+05	mysteryjeans	2014-09-12 06:40:56.764626+05	mysteryjeans	0.00
305	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	qj9Nt9rDLt9Y7kE8zdQB	2014-09-12 06:41:11.786329+05	mysteryjeans	2014-09-12 06:41:11.786366+05	mysteryjeans	0.00
306	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	LlvthfIwxcXT4aQ7Tt4I	2014-09-12 06:41:22.604595+05	mysteryjeans	2014-09-12 06:41:22.604636+05	mysteryjeans	0.00
307	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	TgZic4yVbb1s42svOMYB	2014-09-12 06:41:30.748134+05	mysteryjeans	2014-09-12 06:41:30.748171+05	mysteryjeans	0.00
308	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ZSLtvs5KUDFWQT7iA7Fr	2014-09-12 06:41:43.550874+05	mysteryjeans	2014-09-12 06:41:43.550914+05	mysteryjeans	0.00
309	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	B1nKP5h8MMZN7dy2NWWr	2014-09-12 06:42:09.661799+05	mysteryjeans	2014-09-12 06:42:09.661841+05	mysteryjeans	0.00
310	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	UZNVTYZ2PfqAaO9Fsinz	2014-09-12 06:42:20.215466+05	mysteryjeans	2014-09-12 06:42:20.215527+05	mysteryjeans	0.00
311	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	wGHEX4CSbRaA4utOE0zO	2014-09-12 06:44:04.670316+05	mysteryjeans	2014-09-12 06:44:04.670357+05	mysteryjeans	0.00
312	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	RttfNSPpjnrE8CJgqn30	2014-09-12 06:46:53.51878+05	mysteryjeans	2014-09-12 06:46:53.518821+05	mysteryjeans	0.00
313	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	qquJYEVfGI2j7Vm0eNZW	2014-09-12 06:48:12.021236+05	mysteryjeans	2014-09-12 06:48:12.021297+05	mysteryjeans	0.00
314	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	yf1UtWcPK74e4DG1MhQF	2014-09-12 06:51:59.809193+05	mysteryjeans	2014-09-12 06:51:59.809239+05	mysteryjeans	0.00
315	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	qhvwMmHeuMAapr4dR2IU	2014-09-12 06:53:21.540691+05	mysteryjeans	2014-09-12 06:53:21.540747+05	mysteryjeans	0.00
316	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Cg6CLTQc9awbH0YjXpgh	2014-09-12 06:54:09.99083+05	mysteryjeans	2014-09-12 06:54:09.990868+05	mysteryjeans	0.00
317	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	26fUBWscSp5cYxs5b2uA	2014-09-12 06:54:31.667043+05	mysteryjeans	2014-09-12 06:54:31.667083+05	mysteryjeans	0.00
318	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	aubwzPyTQjzT86ivisIQ	2014-09-12 06:54:47.066714+05	mysteryjeans	2014-09-12 06:54:47.066751+05	mysteryjeans	0.00
319	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	jzRO5pJcSnzDA05Y10cS	2014-09-12 06:56:12.162855+05	mysteryjeans	2014-09-12 06:56:12.162893+05	mysteryjeans	0.00
320	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Ri7w6gcbfPX4AULHRlO4	2014-09-12 06:56:43.638346+05	mysteryjeans	2014-09-12 06:56:43.638386+05	mysteryjeans	0.00
321	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	BmkNpAsZF7VNMbvWg997	2014-09-12 06:58:00.676065+05	mysteryjeans	2014-09-12 06:58:00.676106+05	mysteryjeans	0.00
322	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	QjOrFb8EK70zvswUh9Wm	2014-09-12 06:58:17.792795+05	mysteryjeans	2014-09-12 06:58:17.792831+05	mysteryjeans	0.00
323	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	DWHy5y8YghJfALHieYL5	2014-09-12 06:59:19.688822+05	mysteryjeans	2014-09-12 06:59:19.688886+05	mysteryjeans	0.00
324	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	sPiymDYCHQ3dVfvzwMey	2014-09-12 06:59:35.589607+05	mysteryjeans	2014-09-12 06:59:35.589675+05	mysteryjeans	0.00
325	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	QYrjJRKiNYLpatCm8yR5	2014-09-12 07:02:54.577207+05	mysteryjeans	2014-09-12 07:02:54.577258+05	mysteryjeans	0.00
326	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	jGWFmcd8RmR2Wth7vWnm	2014-09-12 07:03:18.553257+05	mysteryjeans	2014-09-12 07:03:18.553293+05	mysteryjeans	0.00
327	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	fnx2BwqqGEh00VMugKmk	2014-09-12 07:03:40.777127+05	mysteryjeans	2014-09-12 07:03:40.777166+05	mysteryjeans	0.00
328	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	6S9639hbpRUlgCH2q2r6	2014-09-12 07:04:10.750685+05	mysteryjeans	2014-09-12 07:04:10.750721+05	mysteryjeans	0.00
329	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	4mDnswqo6ZK7Tn86DTd2	2014-09-12 07:04:17.278918+05	mysteryjeans	2014-09-12 07:04:17.278954+05	mysteryjeans	0.00
330	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	0N7qoPdkZVI2h4itrNN9	2014-09-12 07:05:29.025725+05	mysteryjeans	2014-09-12 07:05:29.02579+05	mysteryjeans	0.00
331	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	c97RXjrWEq4d8ez4yghD	2014-09-12 07:05:39.426945+05	mysteryjeans	2014-09-12 07:05:39.426982+05	mysteryjeans	0.00
332	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	roHRUeNnk002xicrJz1z	2014-09-12 07:06:26.471367+05	mysteryjeans	2014-09-12 07:06:26.471404+05	mysteryjeans	0.00
333	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	bnFnXxsuy6mmx4qeDlDA	2014-09-12 07:09:28.509226+05	mysteryjeans	2014-09-12 07:09:28.509278+05	mysteryjeans	0.00
334	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	mQ4MWF9UrG3NbF9GZm6h	2014-09-12 07:09:46.787023+05	mysteryjeans	2014-09-12 07:09:46.78706+05	mysteryjeans	0.00
335	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	1R5eDDWEcTDtaU0nQwy5	2014-09-12 07:10:26.593216+05	mysteryjeans	2014-09-12 07:10:26.593253+05	mysteryjeans	0.00
336	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ARRPD8vJGgPx9LrUu7sP	2014-09-12 07:11:42.44156+05	mysteryjeans	2014-09-12 07:11:42.441599+05	mysteryjeans	0.00
337	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	JfTxYzeFxVZIYZnDGUpU	2014-09-12 07:12:13.390692+05	mysteryjeans	2014-09-12 07:12:13.390771+05	mysteryjeans	0.00
338	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	X9l8h4yV2IVqJLEw3hbj	2014-09-12 07:13:12.86481+05	mysteryjeans	2014-09-12 07:13:12.864848+05	mysteryjeans	0.00
339	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	3VrpiyFLXrH8CndCHYTM	2014-09-12 07:14:12.536556+05	mysteryjeans	2014-09-12 07:14:12.536606+05	mysteryjeans	0.00
340	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	GEFfg8iLN8B3L2IpWFqt	2014-09-12 20:58:43.841585+05	mysteryjeans	2014-09-12 20:58:43.841626+05	mysteryjeans	0.00
341	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	IuPuMPFyPPPC7kQ6oJ0t	2014-09-12 21:11:48.156525+05	mysteryjeans	2014-09-12 21:11:48.156563+05	mysteryjeans	0.00
342	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ghO9BJ9LGJbNoGfhts5q	2014-09-13 00:28:48.135627+05	mysteryjeans	2014-09-13 00:28:48.135664+05	mysteryjeans	0.00
343	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	kpcFsLRmkbRLWxY2FJ75	2014-09-13 01:56:25.017268+05	mysteryjeans	2014-09-13 01:56:25.017305+05	mysteryjeans	0.00
344	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lNzTa2sDAN2KRw7qWyNU	2014-09-13 02:02:44.067922+05	mysteryjeans	2014-09-13 02:02:44.067963+05	mysteryjeans	0.00
345	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	ikA4kD9uyiSlwduFv5mj	2014-09-13 02:05:19.615472+05	mysteryjeans	2014-09-13 02:05:19.615541+05	mysteryjeans	0.00
346	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	jqXWCUiuTca6FGosf5IM	2014-09-13 02:06:14.529254+05	mysteryjeans	2014-09-13 02:06:14.52929+05	mysteryjeans	0.00
347	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	m4Ephljrd7SyraAgJjUw	2014-09-13 02:06:35.022198+05	mysteryjeans	2014-09-13 02:06:35.022242+05	mysteryjeans	0.00
348	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	xFVHsRvYkQ81SIeResyn	2014-09-13 02:07:33.031793+05	mysteryjeans	2014-09-13 02:07:33.031859+05	mysteryjeans	0.00
349	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	M8cqkQhNugAfXMkopby9	2014-09-13 02:08:32.445583+05	mysteryjeans	2014-09-13 02:08:32.445646+05	mysteryjeans	0.00
350	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Bx3PRQBLHtwwuwcLUuf5	2014-09-13 02:14:28.507986+05	mysteryjeans	2014-09-13 02:14:28.508024+05	mysteryjeans	0.00
351	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	GWl34PybOq44jMozwzkP	2014-09-13 02:15:21.629081+05	mysteryjeans	2014-09-13 02:15:21.629119+05	mysteryjeans	0.00
352	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	LqwuoTM9AZ5gFV5d0rJg	2014-09-13 02:19:04.91467+05	mysteryjeans	2014-09-13 02:19:04.914712+05	mysteryjeans	0.00
353	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	AMUsgbN16cvdawyg7nMf	2014-09-13 02:19:21.703211+05	mysteryjeans	2014-09-13 02:19:21.703277+05	mysteryjeans	0.00
354	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	lHiKqIvgyv6FLRJpC9WK	2014-09-13 02:19:40.30852+05	mysteryjeans	2014-09-13 02:19:40.308559+05	mysteryjeans	0.00
355	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	eyqkUm0FFgh2phmK1QFf	2014-09-13 02:22:03.823707+05	mysteryjeans	2014-09-13 02:22:03.823766+05	mysteryjeans	0.00
356	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	L9ALKPUlgFouxg4E6QOh	2014-09-13 02:22:42.716501+05	mysteryjeans	2014-09-13 02:22:42.716568+05	mysteryjeans	0.00
357	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	dgVivKMknUA3mEuPNC4d	2014-09-13 02:26:40.061603+05	mysteryjeans	2014-09-13 02:26:40.061648+05	mysteryjeans	0.00
358	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	k1gAfQXxBwJEQrPSSEv8	2014-09-13 02:28:17.956369+05	mysteryjeans	2014-09-13 02:28:17.956408+05	mysteryjeans	0.00
359	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	nBztahuO33KrSa5GBCB9	2014-09-13 02:28:39.450193+05	mysteryjeans	2014-09-13 02:28:39.45023+05	mysteryjeans	0.00
360	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Ik05zYmgMf0QQ6RUFkoq	2014-09-13 02:29:03.053103+05	mysteryjeans	2014-09-13 02:29:03.053173+05	mysteryjeans	0.00
361	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	6R8MtisXRm9LiWX1LwVU	2014-09-13 02:29:28.435553+05	mysteryjeans	2014-09-13 02:29:28.435605+05	mysteryjeans	0.00
362	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	Xrc0W1D8L5gmKH03HIkz	2014-09-13 02:30:21.4266+05	mysteryjeans	2014-09-13 02:30:21.426637+05	mysteryjeans	0.00
363	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	oL0LEepgkBJD28zjEIZe	2014-09-13 02:30:49.816208+05	mysteryjeans	2014-09-13 02:30:49.816245+05	mysteryjeans	0.00
364	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	qCGOSuxIAAmnrPcEH6Wl	2014-09-13 02:31:57.465523+05	mysteryjeans	2014-09-13 02:31:57.465566+05	mysteryjeans	0.00
365	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	YPhRRNCFfShszqtidoQa	2014-09-13 02:35:19.850287+05	mysteryjeans	2014-09-13 02:35:19.850325+05	mysteryjeans	0.00
366	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	4hMicGn3xjInds7pw0SU	2014-09-13 03:47:24.526233+05	mysteryjeans	2014-09-13 03:47:24.526271+05	mysteryjeans	0.00
367	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	IUP5i7mv6fEoMc3LqxJj	2014-09-13 04:05:38.829161+05	mysteryjeans	2014-09-13 04:05:38.829198+05	mysteryjeans	0.00
368	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	IKjRznnufG3fzV8UVjQm	2014-09-13 04:11:22.817478+05	mysteryjeans	2014-09-13 04:11:22.817514+05	mysteryjeans	0.00
369	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PE	\N	PE	1	1	yFfilM7DEichKQt2wQag	2014-09-13 04:14:27.029789+05	mysteryjeans	2014-09-13 04:14:27.029827+05	mysteryjeans	0.00
370	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	YwpPcXBKyLkry1ZPit3M	2014-09-13 04:28:02.077695+05	mysteryjeans	2014-09-13 04:27:10.629057+05	mysteryjeans	0.00
371	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	ej3TqphqQgPFmqGupsnI	2014-09-13 05:30:14.836518+05	mysteryjeans	2014-09-13 04:45:11.322641+05	mysteryjeans	0.00
388	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	ybXgPDvWDaMUVC4yOGh7	2014-09-15 04:21:31.379421+05	mysteryjeans	2014-09-15 04:21:31.379459+05	mysteryjeans	0.00
389	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	KM3li9Sl0FnBhh8DzTUv	2014-09-15 05:59:06.506286+05	mysteryjeans	2014-09-15 05:59:06.506325+05	mysteryjeans	0.00
390	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	0Db7s2kbdytllq7ufqcI	2014-09-15 05:59:24.056973+05	mysteryjeans	2014-09-15 05:59:24.057012+05	mysteryjeans	0.00
372	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	o0DmjNsS5p0Ude4u8YPY	2014-09-13 05:46:46.579451+05	mysteryjeans	2014-09-13 05:31:14.057958+05	mysteryjeans	0.00
373	1	98	595.00	11.90	606.90	\N	98.6500000000000057	59870.68	PE	CC	PE	\N	PE	1	1	6wMiG7DDfkxsjumgPoZw	2014-09-13 05:49:21.692088+05	mysteryjeans	2014-09-13 05:49:21.692125+05	mysteryjeans	0.00
374	1	98	595.00	11.90	606.90	\N	98.6500000000000057	59870.68	PE	CC	PE	\N	PE	1	1	fHnRRVVFy8HwYtUmVjAJ	2014-09-13 05:58:34.105668+05	mysteryjeans	2014-09-13 05:58:34.105706+05	mysteryjeans	0.00
375	1	98	595.00	11.90	606.90	\N	98.6500000000000057	59870.68	PE	CC	PE	\N	PE	1	1	2OGupCS1YeRbV9YiPyvi	2014-09-13 06:01:06.612132+05	mysteryjeans	2014-09-13 06:01:06.612172+05	mysteryjeans	0.00
376	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PA	\N	PE	1	1	SvN1S3lDVSCilN3qnOdM	2014-09-13 06:13:15.370091+05	mysteryjeans	2014-09-13 06:12:26.785736+05	mysteryjeans	0.00
377	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PA	\N	PE	1	1	MnItkwIH3idGoikFEQQL	2014-09-13 06:15:03.616979+05	mysteryjeans	2014-09-13 06:14:13.008378+05	mysteryjeans	0.00
378	1	103	500.00	10.00	510.00	\N	0.790000000000000036	402.90	PE	CC	PA	\N	PE	1	1	3aneQW1MJ3zzpy1S4m5H	2014-09-13 06:24:57.084992+05	mysteryjeans	2014-09-13 06:24:12.482762+05	mysteryjeans	0.00
379	1	103	6.50	0.13	6.63	\N	0.790000000000000036	5.24	PE	CC	PA	\N	PE	1	1	e5vLtFPwfQbZFmYqyOTL	2014-09-13 06:30:58.182189+05	mysteryjeans	2014-09-13 06:28:38.859724+05	mysteryjeans	0.00
380	1	103	500.00	10.00	510.00	\N	0.790000000000000036	402.90	PE	CC	PA	\N	PE	1	1	XOT8Cxfd28ewhzDVf8W7	2014-09-13 06:32:46.608231+05	mysteryjeans	2014-09-13 06:31:54.333268+05	mysteryjeans	0.00
381	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	ivrrPavVfLFmcZoVucXO	2014-09-13 06:36:24.122645+05	mysteryjeans	2014-09-13 06:36:24.122682+05	mysteryjeans	0.00
382	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	9pY1EDPwKjQltdpLDYpG	2014-09-13 06:37:01.755285+05	mysteryjeans	2014-09-13 06:37:01.755321+05	mysteryjeans	0.00
383	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PA	\N	PE	1	1	MqZuDHidtUnmEJbqOMNg	2014-09-13 06:38:43.745239+05	mysteryjeans	2014-09-13 06:37:53.074358+05	mysteryjeans	0.00
384	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PA	\N	PE	1	1	XC669LBF743LKJcXNhVi	2014-09-13 06:41:40.604214+05	mysteryjeans	2014-09-13 06:40:55.961209+05	mysteryjeans	0.00
385	1	103	500.00	10.00	510.00	\N	0.790000000000000036	402.90	PE	CC	PA	\N	PE	1	1	CDX070a07uOKi5wYm5nw	2014-09-15 00:00:42.279653+05	mysteryjeans	2014-09-14 23:52:57.810324+05	mysteryjeans	0.00
386	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	Y56dG2zwpgNocshE5Jo6	2014-09-15 04:01:46.739553+05	mysteryjeans	2014-09-15 04:01:46.739592+05	mysteryjeans	0.00
387	1	103	13.50	0.27	13.77	\N	0.790000000000000036	10.88	PE	CC	PE	\N	PE	1	1	rEGlLBBIVCJzVGcyDXkT	2014-09-15 04:02:51.282258+05	mysteryjeans	2014-09-15 04:02:51.282317+05	mysteryjeans	0.00
391	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	wRnhHoNAQyCsiI6BE21C	2014-09-15 06:00:09.322253+05	mysteryjeans	2014-09-15 06:00:09.322309+05	mysteryjeans	0.00
392	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	skpqOgY3DqlwZtWmOK0X	2014-09-15 06:05:05.982499+05	mysteryjeans	2014-09-15 06:05:05.982538+05	mysteryjeans	0.00
393	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	VVuMpqXKd7DZIKj1Z1pQ	2014-09-15 06:06:13.110725+05	mysteryjeans	2014-09-15 06:06:13.110781+05	mysteryjeans	0.00
394	1	103	595.00	11.90	606.90	\N	0.790000000000000036	479.45	PE	CC	PE	\N	PE	1	1	25MxrYHMFIiyZrQ2ts7J	2014-09-15 06:19:11.484346+05	mysteryjeans	2014-09-15 06:19:11.484404+05	mysteryjeans	0.00
395	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	9tvJvbz3DMuJ5OD4o7cG	2014-09-15 06:33:57.045141+05	mysteryjeans	2014-09-15 06:21:23.697394+05	mysteryjeans	0.00
396	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	ZRFc6hJn1Tx3SoVgc4zd	2014-09-15 06:34:39.195882+05	mysteryjeans	2014-09-15 06:34:13.563043+05	mysteryjeans	0.00
397	1	97	595.00	11.90	606.90	\N	1	606.90	PE	CC	PA	\N	PE	1	1	ICf6PxEkZqgT0VXX7kiH	2014-09-15 06:35:07.650411+05	mysteryjeans	2014-09-15 06:34:51.443865+05	mysteryjeans	0.00
398	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	2DzOwORWLZ2lvyKFWa5R	2014-09-15 06:38:49.277376+05	mysteryjeans	2014-09-15 06:38:49.277433+05	mysteryjeans	0.00
399	1	97	1190.00	23.80	1213.80	\N	1	1213.80	PE	CC	PE	\N	PE	1	1	CeLXn4lEUOoSvKCRd3D7	2014-09-15 06:41:02.900064+05	mysteryjeans	2014-09-15 06:41:02.900103+05	mysteryjeans	0.00
400	1	98	1190.00	23.80	1213.80	\N	98.6500000000000057	119741.37	PE	CC	PA	\N	PE	1	1	zNsnEVTNbUum5Lw4ctxY	2014-09-15 06:44:35.793051+05	mysteryjeans	2014-09-15 06:44:18.82867+05	mysteryjeans	0.00
\.


--
-- Name: sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_order_id_seq', 400, true);


--
-- Data for Name: sales_order_item; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_order_item (id, order_id, product_id, price, quantity, taxes, sub_total, total, tax_rate, tax_method, updated_on, updated_by, created_on, created_by) FROM stdin;
1	1	3	610.00	1	12.20	610.00	622.20	0.0200000000000000004	PE	2014-07-22 06:20:48.246526+05	mysteryjeans	2014-07-22 06:20:48.246562+05	mysteryjeans
2	2	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-07-22 08:26:05.19135+05	mysteryjeans	2014-07-22 08:26:05.191386+05	mysteryjeans
3	2	3	610.00	2	24.40	1220.00	1244.40	0.0200000000000000004	PE	2014-07-22 08:26:05.194964+05	mysteryjeans	2014-07-22 08:26:05.195+05	mysteryjeans
4	3	4	500.00	2	20.00	1000.00	1020.00	0.0200000000000000004	PE	2014-07-22 21:33:53.746521+05	mysteryjeans	2014-07-22 21:33:53.74656+05	mysteryjeans
5	4	4	500.00	2	20.00	1000.00	1020.00	0.0200000000000000004	PE	2014-07-22 21:34:52.187063+05	mysteryjeans	2014-07-22 21:34:52.1871+05	mysteryjeans
6	5	4	500.00	2	20.00	1000.00	1020.00	0.0200000000000000004	PE	2014-07-22 21:35:31.622707+05	mysteryjeans	2014-07-22 21:35:31.622744+05	mysteryjeans
7	6	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-07-22 21:57:39.794503+05	mysteryjeans	2014-07-22 21:57:39.794549+05	mysteryjeans
8	7	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-07-22 21:59:56.428271+05	mysteryjeans	2014-07-22 21:59:56.428328+05	mysteryjeans
9	8	3	610.00	1	12.20	610.00	622.20	0.0200000000000000004	PE	2014-07-22 22:03:30.022299+05	mysteryjeans	2014-07-22 22:03:30.022337+05	mysteryjeans
10	9	3	610.00	1	12.20	610.00	622.20	0.0200000000000000004	PE	2014-07-22 22:03:48.166069+05	mysteryjeans	2014-07-22 22:03:48.166107+05	mysteryjeans
11	10	3	610.00	1	12.20	610.00	622.20	0.0200000000000000004	PE	2014-07-22 22:26:08.844028+05	mysteryjeans	2014-07-22 22:26:08.844067+05	mysteryjeans
12	11	3	610.00	1	12.20	610.00	622.20	0.0200000000000000004	PE	2014-07-22 22:26:36.272782+05	mysteryjeans	2014-07-22 22:26:36.272827+05	mysteryjeans
13	12	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-07-22 22:31:56.278461+05	mysteryjeans	2014-07-22 22:31:56.278498+05	mysteryjeans
14	13	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-07-22 22:39:14.551429+05	mysteryjeans	2014-07-22 22:39:14.551472+05	mysteryjeans
15	14	1	428.00	1	8.56	428.00	436.56	0.0200000000000000004	PE	2014-07-22 22:40:32.816401+05	mysteryjeans	2014-07-22 22:40:32.816438+05	mysteryjeans
16	15	1	428.00	1	8.56	428.00	436.56	0.0200000000000000004	PE	2014-07-22 22:50:23.089286+05	mysteryjeans	2014-07-22 22:50:23.08936+05	mysteryjeans
17	16	1	428.00	1	8.56	428.00	436.56	0.0200000000000000004	PE	2014-07-22 22:51:26.501297+05	mysteryjeans	2014-07-22 22:51:26.501334+05	mysteryjeans
18	17	11	175.00	1	3.50	175.00	178.50	0.0200000000000000004	PE	2014-07-22 23:05:44.065727+05	mysteryjeans	2014-07-22 23:05:44.065764+05	mysteryjeans
19	18	10	43.00	1	0.86	43.00	43.86	0.0200000000000000004	PE	2014-07-22 23:11:26.381915+05	mysteryjeans	2014-07-22 23:11:26.381952+05	mysteryjeans
20	19	10	43.00	1	0.86	43.00	43.86	0.0200000000000000004	PE	2014-07-22 23:14:43.210617+05	mysteryjeans	2014-07-22 23:14:43.210654+05	mysteryjeans
21	20	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-07-22 23:59:00.608405+05	mysteryjeans	2014-07-22 23:59:00.608443+05	mysteryjeans
22	21	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-07-23 00:54:31.000953+05	mysteryjeans	2014-07-23 00:54:31.00099+05	mysteryjeans
23	22	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-07-23 01:12:44.800813+05	mysteryjeans	2014-07-23 01:12:44.800849+05	mysteryjeans
24	23	12	27.00	1	0.54	27.00	27.54	0.0200000000000000004	PE	2014-07-24 20:08:54.013523+05	mysteryjeans	2014-07-24 20:08:54.013562+05	mysteryjeans
25	24	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-07-24 21:15:48.341308+05	mysteryjeans	2014-07-24 21:15:48.341346+05	mysteryjeans
43	32	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:17:29.040204+05	mysteryjeans	2014-09-06 04:17:29.040242+05	mysteryjeans
44	32	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-06 04:17:29.042159+05	mysteryjeans	2014-09-06 04:17:29.042192+05	mysteryjeans
45	32	6	800.00	1	16.00	800.00	816.00	0.0200000000000000004	PE	2014-09-06 04:17:29.04419+05	mysteryjeans	2014-09-06 04:17:29.044227+05	mysteryjeans
46	33	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-06 04:19:11.643069+05	mysteryjeans	2014-09-06 04:19:11.643134+05	mysteryjeans
47	34	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:21:40.651428+05	mysteryjeans	2014-09-06 04:21:40.651465+05	mysteryjeans
48	35	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:22:25.073948+05	mysteryjeans	2014-09-06 04:22:25.073986+05	mysteryjeans
49	36	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:24:31.84053+05	mysteryjeans	2014-09-06 04:24:31.840566+05	mysteryjeans
50	37	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:24:51.117632+05	mysteryjeans	2014-09-06 04:24:51.117668+05	mysteryjeans
51	38	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:26:26.426282+05	mysteryjeans	2014-09-06 04:26:26.426318+05	mysteryjeans
52	39	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:29:13.319159+05	mysteryjeans	2014-09-06 04:29:13.319195+05	mysteryjeans
53	40	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:29:23.586903+05	mysteryjeans	2014-09-06 04:29:23.586938+05	mysteryjeans
54	41	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:29:50.008954+05	mysteryjeans	2014-09-06 04:29:50.008989+05	mysteryjeans
55	42	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:30:06.373403+05	mysteryjeans	2014-09-06 04:30:06.373446+05	mysteryjeans
56	43	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:30:15.987254+05	mysteryjeans	2014-09-06 04:30:15.987289+05	mysteryjeans
57	44	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 04:38:13.061918+05	mysteryjeans	2014-09-06 04:38:13.061955+05	mysteryjeans
58	45	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-06 05:16:43.535595+05	mysteryjeans	2014-09-06 05:16:43.535632+05	mysteryjeans
59	46	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:16:58.605428+05	mysteryjeans	2014-09-06 05:16:58.605466+05	mysteryjeans
60	47	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:17:06.383011+05	mysteryjeans	2014-09-06 05:17:06.383051+05	mysteryjeans
61	48	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:18:40.581084+05	mysteryjeans	2014-09-06 05:18:40.58112+05	mysteryjeans
62	49	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:19:00.529896+05	mysteryjeans	2014-09-06 05:19:00.529934+05	mysteryjeans
63	50	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:22:52.208084+05	mysteryjeans	2014-09-06 05:22:52.208121+05	mysteryjeans
64	51	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:22:55.03767+05	mysteryjeans	2014-09-06 05:22:55.037712+05	mysteryjeans
65	52	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:23:23.777022+05	mysteryjeans	2014-09-06 05:23:23.777059+05	mysteryjeans
66	53	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-06 05:24:43.732262+05	mysteryjeans	2014-09-06 05:24:43.7323+05	mysteryjeans
67	54	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-07 01:41:11.124405+05	mysteryjeans	2014-09-07 01:41:11.124441+05	mysteryjeans
68	55	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-07 01:45:54.420697+05	mysteryjeans	2014-09-07 01:45:54.420733+05	mysteryjeans
69	56	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 20:57:51.446123+05	mysteryjeans	2014-09-08 20:57:51.446189+05	mysteryjeans
70	56	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 20:57:51.450033+05	mysteryjeans	2014-09-08 20:57:51.450092+05	mysteryjeans
71	57	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 20:59:14.616025+05	mysteryjeans	2014-09-08 20:59:14.616061+05	mysteryjeans
72	57	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 20:59:14.61802+05	mysteryjeans	2014-09-08 20:59:14.618053+05	mysteryjeans
73	58	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:07:18.560628+05	mysteryjeans	2014-09-08 21:07:18.560665+05	mysteryjeans
74	59	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:31:57.492228+05	mysteryjeans	2014-09-08 21:31:57.492264+05	mysteryjeans
75	59	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:31:57.494268+05	mysteryjeans	2014-09-08 21:31:57.494301+05	mysteryjeans
76	60	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:31:59.609522+05	mysteryjeans	2014-09-08 21:31:59.60956+05	mysteryjeans
77	60	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:31:59.611484+05	mysteryjeans	2014-09-08 21:31:59.611518+05	mysteryjeans
78	61	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:32:01.555797+05	mysteryjeans	2014-09-08 21:32:01.555833+05	mysteryjeans
79	61	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:32:01.557753+05	mysteryjeans	2014-09-08 21:32:01.557786+05	mysteryjeans
80	62	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:32:01.846413+05	mysteryjeans	2014-09-08 21:32:01.84645+05	mysteryjeans
81	62	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:32:01.848382+05	mysteryjeans	2014-09-08 21:32:01.848415+05	mysteryjeans
82	63	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:32:20.210203+05	mysteryjeans	2014-09-08 21:32:20.210239+05	mysteryjeans
83	63	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:32:20.212292+05	mysteryjeans	2014-09-08 21:32:20.212326+05	mysteryjeans
84	64	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-08 21:32:20.63381+05	mysteryjeans	2014-09-08 21:32:20.633851+05	mysteryjeans
85	64	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-08 21:32:20.635901+05	mysteryjeans	2014-09-08 21:32:20.635935+05	mysteryjeans
86	65	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:32:27.552875+05	mysteryjeans	2014-09-08 21:32:27.552913+05	mysteryjeans
87	66	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:32:28.366566+05	mysteryjeans	2014-09-08 21:32:28.366603+05	mysteryjeans
88	67	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:32:28.538697+05	mysteryjeans	2014-09-08 21:32:28.538734+05	mysteryjeans
89	68	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:32:28.704748+05	mysteryjeans	2014-09-08 21:32:28.704786+05	mysteryjeans
90	69	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:34:33.227273+05	mysteryjeans	2014-09-08 21:34:33.22731+05	mysteryjeans
91	70	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-08 21:35:21.791022+05	mysteryjeans	2014-09-08 21:35:21.791059+05	mysteryjeans
92	71	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 01:51:22.642079+05	mysteryjeans	2014-09-09 01:51:22.642117+05	mysteryjeans
93	72	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 01:59:34.600341+05	mysteryjeans	2014-09-09 01:59:34.600383+05	mysteryjeans
94	73	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:00:10.651073+05	mysteryjeans	2014-09-09 02:00:10.651112+05	mysteryjeans
95	74	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:01:07.78326+05	mysteryjeans	2014-09-09 02:01:07.783302+05	mysteryjeans
96	75	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:04:24.734348+05	mysteryjeans	2014-09-09 02:04:24.734388+05	mysteryjeans
97	76	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:08:45.403662+05	mysteryjeans	2014-09-09 02:08:45.403699+05	mysteryjeans
98	77	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:15:23.111678+05	mysteryjeans	2014-09-09 02:15:23.111721+05	mysteryjeans
99	78	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:17:11.204326+05	mysteryjeans	2014-09-09 02:17:11.204365+05	mysteryjeans
100	79	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:18:09.293242+05	mysteryjeans	2014-09-09 02:18:09.293279+05	mysteryjeans
101	80	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:18:18.744027+05	mysteryjeans	2014-09-09 02:18:18.744067+05	mysteryjeans
102	81	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:19:06.274331+05	mysteryjeans	2014-09-09 02:19:06.274367+05	mysteryjeans
103	82	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:20:20.320878+05	mysteryjeans	2014-09-09 02:20:20.320917+05	mysteryjeans
104	83	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:30:12.603871+05	mysteryjeans	2014-09-09 02:30:12.60391+05	mysteryjeans
105	84	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:34:44.748913+05	mysteryjeans	2014-09-09 02:34:44.748951+05	mysteryjeans
106	85	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:36:39.867059+05	mysteryjeans	2014-09-09 02:36:39.867095+05	mysteryjeans
107	86	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:38:54.03763+05	mysteryjeans	2014-09-09 02:38:54.037666+05	mysteryjeans
108	87	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:39:46.697813+05	mysteryjeans	2014-09-09 02:39:46.69785+05	mysteryjeans
109	88	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:40:35.261094+05	mysteryjeans	2014-09-09 02:40:35.26113+05	mysteryjeans
110	89	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:41:10.059411+05	mysteryjeans	2014-09-09 02:41:10.059447+05	mysteryjeans
111	90	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 02:51:53.0164+05	mysteryjeans	2014-09-09 02:51:53.016468+05	mysteryjeans
112	91	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 17:34:06.942426+05	mysteryjeans	2014-09-09 17:34:06.942463+05	mysteryjeans
113	91	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 17:34:06.944613+05	mysteryjeans	2014-09-09 17:34:06.944647+05	mysteryjeans
114	92	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 19:27:59.993171+05	mysteryjeans	2014-09-09 19:27:59.993236+05	mysteryjeans
115	92	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 19:27:59.995757+05	mysteryjeans	2014-09-09 19:27:59.995794+05	mysteryjeans
116	93	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 19:40:50.818966+05	mysteryjeans	2014-09-09 19:40:50.819004+05	mysteryjeans
117	93	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 19:40:50.821404+05	mysteryjeans	2014-09-09 19:40:50.82144+05	mysteryjeans
118	94	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:41:04.799459+05	mysteryjeans	2014-09-09 19:41:04.799516+05	mysteryjeans
119	95	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 19:41:47.461036+05	mysteryjeans	2014-09-09 19:41:47.461082+05	mysteryjeans
120	95	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 19:41:47.463168+05	mysteryjeans	2014-09-09 19:41:47.463205+05	mysteryjeans
121	96	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:41:56.256495+05	mysteryjeans	2014-09-09 19:41:56.256557+05	mysteryjeans
122	97	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:42:22.473308+05	mysteryjeans	2014-09-09 19:42:22.473377+05	mysteryjeans
123	98	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:42:45.24992+05	mysteryjeans	2014-09-09 19:42:45.249961+05	mysteryjeans
124	99	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:43:40.609256+05	mysteryjeans	2014-09-09 19:43:40.609295+05	mysteryjeans
125	100	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 19:48:45.265066+05	mysteryjeans	2014-09-09 19:48:45.265103+05	mysteryjeans
126	100	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 19:48:45.268186+05	mysteryjeans	2014-09-09 19:48:45.268238+05	mysteryjeans
127	101	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:48:57.82883+05	mysteryjeans	2014-09-09 19:48:57.828871+05	mysteryjeans
128	102	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:49:26.700764+05	mysteryjeans	2014-09-09 19:49:26.700802+05	mysteryjeans
129	103	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:51:45.344262+05	mysteryjeans	2014-09-09 19:51:45.34433+05	mysteryjeans
130	104	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:52:04.080452+05	mysteryjeans	2014-09-09 19:52:04.080496+05	mysteryjeans
131	105	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:54:49.250331+05	mysteryjeans	2014-09-09 19:54:49.25039+05	mysteryjeans
132	106	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:54:58.790435+05	mysteryjeans	2014-09-09 19:54:58.790474+05	mysteryjeans
133	107	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-09 19:56:12.819051+05	mysteryjeans	2014-09-09 19:56:12.81909+05	mysteryjeans
134	107	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-09 19:56:12.821266+05	mysteryjeans	2014-09-09 19:56:12.8213+05	mysteryjeans
135	108	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:56:22.518098+05	mysteryjeans	2014-09-09 19:56:22.518154+05	mysteryjeans
136	109	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 19:57:47.109761+05	mysteryjeans	2014-09-09 19:57:47.109804+05	mysteryjeans
137	110	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 20:02:42.990895+05	mysteryjeans	2014-09-09 20:02:42.990975+05	mysteryjeans
138	111	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 20:08:08.680235+05	mysteryjeans	2014-09-09 20:08:08.6803+05	mysteryjeans
139	112	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:00:17.636105+05	mysteryjeans	2014-09-09 21:00:17.636144+05	mysteryjeans
140	113	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:00:39.515786+05	mysteryjeans	2014-09-09 21:00:39.515864+05	mysteryjeans
141	114	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:00:57.605901+05	mysteryjeans	2014-09-09 21:00:57.605959+05	mysteryjeans
142	115	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:18.297999+05	mysteryjeans	2014-09-09 21:01:18.298063+05	mysteryjeans
143	116	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:25.588855+05	mysteryjeans	2014-09-09 21:01:25.588894+05	mysteryjeans
144	117	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:30.159397+05	mysteryjeans	2014-09-09 21:01:30.159463+05	mysteryjeans
145	118	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:31.058168+05	mysteryjeans	2014-09-09 21:01:31.058207+05	mysteryjeans
146	119	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:31.277757+05	mysteryjeans	2014-09-09 21:01:31.277797+05	mysteryjeans
147	120	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:01:33.355474+05	mysteryjeans	2014-09-09 21:01:33.355531+05	mysteryjeans
148	121	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:16:04.335421+05	mysteryjeans	2014-09-09 21:16:04.335493+05	mysteryjeans
149	122	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:16:06.445741+05	mysteryjeans	2014-09-09 21:16:06.445783+05	mysteryjeans
150	123	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:16:09.206193+05	mysteryjeans	2014-09-09 21:16:09.206253+05	mysteryjeans
151	124	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:17:27.472876+05	mysteryjeans	2014-09-09 21:17:27.472916+05	mysteryjeans
152	125	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:23:56.073177+05	mysteryjeans	2014-09-09 21:23:56.073255+05	mysteryjeans
153	126	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:24:03.563952+05	mysteryjeans	2014-09-09 21:24:03.563993+05	mysteryjeans
154	127	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:24:37.102388+05	mysteryjeans	2014-09-09 21:24:37.102442+05	mysteryjeans
155	128	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:25:38.397641+05	mysteryjeans	2014-09-09 21:25:38.39768+05	mysteryjeans
156	129	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:25:43.77258+05	mysteryjeans	2014-09-09 21:25:43.772648+05	mysteryjeans
157	130	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:26:51.039835+05	mysteryjeans	2014-09-09 21:26:51.039874+05	mysteryjeans
158	131	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:27:18.992886+05	mysteryjeans	2014-09-09 21:27:18.992942+05	mysteryjeans
159	132	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:27:57.38339+05	mysteryjeans	2014-09-09 21:27:57.383429+05	mysteryjeans
160	133	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:30:08.011543+05	mysteryjeans	2014-09-09 21:30:08.011582+05	mysteryjeans
161	134	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:30:24.043104+05	mysteryjeans	2014-09-09 21:30:24.043144+05	mysteryjeans
162	135	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:44:16.567479+05	mysteryjeans	2014-09-09 21:44:16.567517+05	mysteryjeans
163	136	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:44:23.340023+05	mysteryjeans	2014-09-09 21:44:23.340062+05	mysteryjeans
164	137	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:45:07.852919+05	mysteryjeans	2014-09-09 21:45:07.852958+05	mysteryjeans
165	138	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:45:27.279586+05	mysteryjeans	2014-09-09 21:45:27.279646+05	mysteryjeans
166	139	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:45:46.156541+05	mysteryjeans	2014-09-09 21:45:46.15658+05	mysteryjeans
167	140	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:47:03.682305+05	mysteryjeans	2014-09-09 21:47:03.682343+05	mysteryjeans
168	141	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-09 21:49:42.83894+05	mysteryjeans	2014-09-09 21:49:42.838991+05	mysteryjeans
169	142	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-10 01:07:23.771159+05	mysteryjeans	2014-09-10 01:07:23.771199+05	mysteryjeans
170	143	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-10 01:08:29.266058+05	mysteryjeans	2014-09-10 01:08:29.266102+05	mysteryjeans
171	144	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 18:33:08.002215+05	mysteryjeans	2014-09-11 18:33:08.002263+05	mysteryjeans
172	144	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-11 18:33:08.011862+05	mysteryjeans	2014-09-11 18:33:08.01191+05	mysteryjeans
173	145	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 18:33:48.824357+05	mysteryjeans	2014-09-11 18:33:48.824393+05	mysteryjeans
174	146	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 18:37:27.446016+05	mysteryjeans	2014-09-11 18:37:27.446052+05	mysteryjeans
175	147	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 18:54:13.423956+05	mysteryjeans	2014-09-11 18:54:13.423993+05	mysteryjeans
176	148	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 18:54:28.679452+05	mysteryjeans	2014-09-11 18:54:28.679489+05	mysteryjeans
177	149	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 18:54:36.704401+05	mysteryjeans	2014-09-11 18:54:36.704437+05	mysteryjeans
178	150	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 19:50:47.109177+05	mysteryjeans	2014-09-11 19:50:47.109214+05	mysteryjeans
179	151	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 19:54:43.217693+05	mysteryjeans	2014-09-11 19:54:43.21773+05	mysteryjeans
180	151	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-11 19:54:43.219803+05	mysteryjeans	2014-09-11 19:54:43.219836+05	mysteryjeans
181	152	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 19:59:40.343298+05	mysteryjeans	2014-09-11 19:59:40.343334+05	mysteryjeans
182	153	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:01:37.559207+05	mysteryjeans	2014-09-11 20:01:37.559244+05	mysteryjeans
183	154	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:01:56.427355+05	mysteryjeans	2014-09-11 20:01:56.427392+05	mysteryjeans
184	155	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:08:27.85339+05	mysteryjeans	2014-09-11 20:08:27.85346+05	mysteryjeans
185	156	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:12:21.721618+05	mysteryjeans	2014-09-11 20:12:21.721655+05	mysteryjeans
186	157	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:13:30.678417+05	mysteryjeans	2014-09-11 20:13:30.678454+05	mysteryjeans
187	158	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:15:12.756254+05	mysteryjeans	2014-09-11 20:15:12.756291+05	mysteryjeans
188	159	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:15:37.532077+05	mysteryjeans	2014-09-11 20:15:37.532114+05	mysteryjeans
189	160	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:15:48.136022+05	mysteryjeans	2014-09-11 20:15:48.136059+05	mysteryjeans
190	161	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:16:34.109823+05	mysteryjeans	2014-09-11 20:16:34.109866+05	mysteryjeans
191	162	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:16:42.945346+05	mysteryjeans	2014-09-11 20:16:42.9454+05	mysteryjeans
192	163	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:18:39.252385+05	mysteryjeans	2014-09-11 20:18:39.252421+05	mysteryjeans
193	164	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:20:26.312477+05	mysteryjeans	2014-09-11 20:20:26.312543+05	mysteryjeans
194	165	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:21:35.045252+05	mysteryjeans	2014-09-11 20:21:35.045289+05	mysteryjeans
195	166	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:21:49.913855+05	mysteryjeans	2014-09-11 20:21:49.913892+05	mysteryjeans
196	167	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:26:48.748263+05	mysteryjeans	2014-09-11 20:26:48.748302+05	mysteryjeans
197	168	7	478.76	1	9.58	478.76	488.34	0.0200000000000000004	PE	2014-09-11 20:30:09.451995+05	mysteryjeans	2014-09-11 20:30:09.452032+05	mysteryjeans
198	169	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:37:09.621068+05	mysteryjeans	2014-09-11 20:37:09.621112+05	mysteryjeans
199	170	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:37:31.924597+05	mysteryjeans	2014-09-11 20:37:31.924637+05	mysteryjeans
200	171	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:43:51.828093+05	mysteryjeans	2014-09-11 20:43:51.82814+05	mysteryjeans
201	172	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:53:40.11151+05	mysteryjeans	2014-09-11 20:53:40.111546+05	mysteryjeans
202	173	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:53:42.297412+05	mysteryjeans	2014-09-11 20:53:42.297449+05	mysteryjeans
203	174	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:53:45.401827+05	mysteryjeans	2014-09-11 20:53:45.401867+05	mysteryjeans
204	175	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:06.795877+05	mysteryjeans	2014-09-11 20:54:06.795913+05	mysteryjeans
205	176	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:07.026969+05	mysteryjeans	2014-09-11 20:54:07.027008+05	mysteryjeans
206	177	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:07.225091+05	mysteryjeans	2014-09-11 20:54:07.225132+05	mysteryjeans
207	178	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:07.477728+05	mysteryjeans	2014-09-11 20:54:07.477765+05	mysteryjeans
208	179	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:07.673563+05	mysteryjeans	2014-09-11 20:54:07.6736+05	mysteryjeans
209	180	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:54:07.879368+05	mysteryjeans	2014-09-11 20:54:07.879431+05	mysteryjeans
210	181	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:55:14.949485+05	mysteryjeans	2014-09-11 20:55:14.949537+05	mysteryjeans
211	182	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:56:28.489649+05	mysteryjeans	2014-09-11 20:56:28.489687+05	mysteryjeans
212	183	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 20:58:18.775365+05	mysteryjeans	2014-09-11 20:58:18.775403+05	mysteryjeans
213	184	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:01:06.603179+05	mysteryjeans	2014-09-11 21:01:06.603216+05	mysteryjeans
214	185	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:01:24.553135+05	mysteryjeans	2014-09-11 21:01:24.553172+05	mysteryjeans
215	186	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:01:54.482413+05	mysteryjeans	2014-09-11 21:01:54.48245+05	mysteryjeans
216	187	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:03:15.493847+05	mysteryjeans	2014-09-11 21:03:15.493884+05	mysteryjeans
217	188	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:03:39.075561+05	mysteryjeans	2014-09-11 21:03:39.075598+05	mysteryjeans
218	189	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:08:51.044779+05	mysteryjeans	2014-09-11 21:08:51.044818+05	mysteryjeans
219	190	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:09:12.34895+05	mysteryjeans	2014-09-11 21:09:12.348987+05	mysteryjeans
220	191	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-11 21:10:34.060582+05	mysteryjeans	2014-09-11 21:10:34.060618+05	mysteryjeans
221	192	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 21:12:39.832072+05	mysteryjeans	2014-09-11 21:12:39.832107+05	mysteryjeans
222	193	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 21:39:19.803909+05	mysteryjeans	2014-09-11 21:39:19.803951+05	mysteryjeans
223	194	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 21:39:49.78321+05	mysteryjeans	2014-09-11 21:39:49.783246+05	mysteryjeans
224	195	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 21:40:23.309217+05	mysteryjeans	2014-09-11 21:40:23.309254+05	mysteryjeans
225	196	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-11 21:41:46.49658+05	mysteryjeans	2014-09-11 21:41:46.496617+05	mysteryjeans
226	197	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 01:43:12.263781+05	mysteryjeans	2014-09-12 01:43:12.263818+05	mysteryjeans
227	198	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 01:43:28.511138+05	mysteryjeans	2014-09-12 01:43:28.511174+05	mysteryjeans
228	199	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:10:02.641732+05	mysteryjeans	2014-09-12 02:10:02.641769+05	mysteryjeans
229	200	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:12:27.764564+05	mysteryjeans	2014-09-12 02:12:27.764601+05	mysteryjeans
230	201	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:29:49.913868+05	mysteryjeans	2014-09-12 02:29:49.913905+05	mysteryjeans
231	202	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:30:34.112936+05	mysteryjeans	2014-09-12 02:30:34.112973+05	mysteryjeans
232	203	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:30:42.721237+05	mysteryjeans	2014-09-12 02:30:42.721273+05	mysteryjeans
233	204	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:30:45.953185+05	mysteryjeans	2014-09-12 02:30:45.953222+05	mysteryjeans
234	205	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:37:01.743577+05	mysteryjeans	2014-09-12 02:37:01.743618+05	mysteryjeans
235	206	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:40:21.544956+05	mysteryjeans	2014-09-12 02:40:21.544995+05	mysteryjeans
236	207	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:40:30.952488+05	mysteryjeans	2014-09-12 02:40:30.952525+05	mysteryjeans
237	208	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:40:42.552722+05	mysteryjeans	2014-09-12 02:40:42.552763+05	mysteryjeans
238	209	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:41:07.3161+05	mysteryjeans	2014-09-12 02:41:07.316138+05	mysteryjeans
239	210	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:41:20.225479+05	mysteryjeans	2014-09-12 02:41:20.225516+05	mysteryjeans
240	211	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:41:41.979322+05	mysteryjeans	2014-09-12 02:41:41.97936+05	mysteryjeans
241	212	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:41:46.505317+05	mysteryjeans	2014-09-12 02:41:46.505353+05	mysteryjeans
242	213	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:42:00.731656+05	mysteryjeans	2014-09-12 02:42:00.731697+05	mysteryjeans
243	214	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:42:05.115294+05	mysteryjeans	2014-09-12 02:42:05.115331+05	mysteryjeans
244	215	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:42:31.587708+05	mysteryjeans	2014-09-12 02:42:31.587746+05	mysteryjeans
245	216	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:42:37.135777+05	mysteryjeans	2014-09-12 02:42:37.135815+05	mysteryjeans
246	217	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:42:47.140047+05	mysteryjeans	2014-09-12 02:42:47.140084+05	mysteryjeans
247	218	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 02:43:18.603807+05	mysteryjeans	2014-09-12 02:43:18.603843+05	mysteryjeans
248	219	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:03:34.892142+05	mysteryjeans	2014-09-12 03:03:34.892195+05	mysteryjeans
249	220	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:03:44.19363+05	mysteryjeans	2014-09-12 03:03:44.193667+05	mysteryjeans
250	221	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:08:14.424813+05	mysteryjeans	2014-09-12 03:08:14.42485+05	mysteryjeans
251	222	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:08:47.4227+05	mysteryjeans	2014-09-12 03:08:47.422737+05	mysteryjeans
252	223	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:09:38.264377+05	mysteryjeans	2014-09-12 03:09:38.264413+05	mysteryjeans
253	224	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:09:46.159496+05	mysteryjeans	2014-09-12 03:09:46.159533+05	mysteryjeans
254	225	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:10:26.40671+05	mysteryjeans	2014-09-12 03:10:26.406749+05	mysteryjeans
255	226	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:11:00.865007+05	mysteryjeans	2014-09-12 03:11:00.865045+05	mysteryjeans
256	227	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:11:25.366206+05	mysteryjeans	2014-09-12 03:11:25.366245+05	mysteryjeans
257	228	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:15:04.811561+05	mysteryjeans	2014-09-12 03:15:04.811598+05	mysteryjeans
258	229	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:16:22.863916+05	mysteryjeans	2014-09-12 03:16:22.863953+05	mysteryjeans
259	230	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:17:20.298052+05	mysteryjeans	2014-09-12 03:17:20.298088+05	mysteryjeans
260	231	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:36:18.273388+05	mysteryjeans	2014-09-12 03:36:18.273425+05	mysteryjeans
261	232	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:36:48.165408+05	mysteryjeans	2014-09-12 03:36:48.165443+05	mysteryjeans
262	233	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:37:27.893346+05	mysteryjeans	2014-09-12 03:37:27.893385+05	mysteryjeans
263	234	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:37:41.918495+05	mysteryjeans	2014-09-12 03:37:41.918532+05	mysteryjeans
264	235	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:38:40.531091+05	mysteryjeans	2014-09-12 03:38:40.531127+05	mysteryjeans
265	236	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:40:40.101881+05	mysteryjeans	2014-09-12 03:40:40.101917+05	mysteryjeans
266	237	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:41:59.191234+05	mysteryjeans	2014-09-12 03:41:59.191269+05	mysteryjeans
267	238	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:42:41.99963+05	mysteryjeans	2014-09-12 03:42:41.999666+05	mysteryjeans
268	239	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:43:10.166535+05	mysteryjeans	2014-09-12 03:43:10.166571+05	mysteryjeans
269	240	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:43:21.836007+05	mysteryjeans	2014-09-12 03:43:21.836044+05	mysteryjeans
270	241	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:43:56.360772+05	mysteryjeans	2014-09-12 03:43:56.360848+05	mysteryjeans
271	242	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:44:29.397043+05	mysteryjeans	2014-09-12 03:44:29.397083+05	mysteryjeans
272	243	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:44:50.526134+05	mysteryjeans	2014-09-12 03:44:50.526169+05	mysteryjeans
273	244	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:45:15.981055+05	mysteryjeans	2014-09-12 03:45:15.981092+05	mysteryjeans
274	245	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:46:36.28504+05	mysteryjeans	2014-09-12 03:46:36.285077+05	mysteryjeans
275	246	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:58:33.837367+05	mysteryjeans	2014-09-12 03:58:33.837407+05	mysteryjeans
276	247	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:59:33.727411+05	mysteryjeans	2014-09-12 03:59:33.727455+05	mysteryjeans
277	248	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 03:59:51.721814+05	mysteryjeans	2014-09-12 03:59:51.721849+05	mysteryjeans
278	249	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:02:09.007449+05	mysteryjeans	2014-09-12 04:02:09.007486+05	mysteryjeans
279	250	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:02:40.520818+05	mysteryjeans	2014-09-12 04:02:40.520858+05	mysteryjeans
280	251	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:04:25.785004+05	mysteryjeans	2014-09-12 04:04:25.785041+05	mysteryjeans
281	252	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:06:16.331236+05	mysteryjeans	2014-09-12 04:06:16.331273+05	mysteryjeans
282	253	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:07:10.547835+05	mysteryjeans	2014-09-12 04:07:10.547875+05	mysteryjeans
283	254	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:08:06.307645+05	mysteryjeans	2014-09-12 04:08:06.307684+05	mysteryjeans
284	255	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:08:21.562147+05	mysteryjeans	2014-09-12 04:08:21.562184+05	mysteryjeans
285	256	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:09:22.334161+05	mysteryjeans	2014-09-12 04:09:22.334199+05	mysteryjeans
286	257	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:09:30.84031+05	mysteryjeans	2014-09-12 04:09:30.840388+05	mysteryjeans
287	258	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:09:37.633316+05	mysteryjeans	2014-09-12 04:09:37.63336+05	mysteryjeans
288	259	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:15:56.437529+05	mysteryjeans	2014-09-12 04:15:56.43757+05	mysteryjeans
289	260	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:20:49.101758+05	mysteryjeans	2014-09-12 04:20:49.101794+05	mysteryjeans
290	261	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 04:23:50.353535+05	mysteryjeans	2014-09-12 04:23:50.353612+05	mysteryjeans
291	262	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:05:13.438917+05	mysteryjeans	2014-09-12 05:05:13.438981+05	mysteryjeans
292	263	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:06:47.504437+05	mysteryjeans	2014-09-12 05:06:47.504474+05	mysteryjeans
293	264	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:09:26.715558+05	mysteryjeans	2014-09-12 05:09:26.715595+05	mysteryjeans
294	265	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:11:24.864529+05	mysteryjeans	2014-09-12 05:11:24.864567+05	mysteryjeans
295	266	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:17:56.281498+05	mysteryjeans	2014-09-12 05:17:56.281535+05	mysteryjeans
296	267	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:18:43.649548+05	mysteryjeans	2014-09-12 05:18:43.649584+05	mysteryjeans
297	268	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:22:37.776526+05	mysteryjeans	2014-09-12 05:22:37.776565+05	mysteryjeans
298	269	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:26:23.694762+05	mysteryjeans	2014-09-12 05:26:23.694799+05	mysteryjeans
299	270	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:27:27.513479+05	mysteryjeans	2014-09-12 05:27:27.513531+05	mysteryjeans
300	271	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:28:40.060251+05	mysteryjeans	2014-09-12 05:28:40.060288+05	mysteryjeans
301	272	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:35:05.367439+05	mysteryjeans	2014-09-12 05:35:05.367476+05	mysteryjeans
302	273	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:36:25.200959+05	mysteryjeans	2014-09-12 05:36:25.200995+05	mysteryjeans
303	274	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:37:14.481953+05	mysteryjeans	2014-09-12 05:37:14.481991+05	mysteryjeans
304	275	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:42:27.200878+05	mysteryjeans	2014-09-12 05:42:27.200915+05	mysteryjeans
305	276	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:43:12.400669+05	mysteryjeans	2014-09-12 05:43:12.400707+05	mysteryjeans
306	277	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:43:26.580419+05	mysteryjeans	2014-09-12 05:43:26.580455+05	mysteryjeans
307	278	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:45:15.087264+05	mysteryjeans	2014-09-12 05:45:15.087304+05	mysteryjeans
308	279	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:46:24.314898+05	mysteryjeans	2014-09-12 05:46:24.314944+05	mysteryjeans
309	280	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:47:03.758837+05	mysteryjeans	2014-09-12 05:47:03.758889+05	mysteryjeans
310	281	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:50:05.764293+05	mysteryjeans	2014-09-12 05:50:05.76433+05	mysteryjeans
311	282	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:51:25.930066+05	mysteryjeans	2014-09-12 05:51:25.930102+05	mysteryjeans
312	283	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:52:07.76624+05	mysteryjeans	2014-09-12 05:52:07.766281+05	mysteryjeans
313	284	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:56:01.088516+05	mysteryjeans	2014-09-12 05:56:01.088553+05	mysteryjeans
314	285	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 05:58:48.569089+05	mysteryjeans	2014-09-12 05:58:48.569127+05	mysteryjeans
315	286	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:00:24.662437+05	mysteryjeans	2014-09-12 06:00:24.662474+05	mysteryjeans
316	287	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:01:55.279148+05	mysteryjeans	2014-09-12 06:01:55.279184+05	mysteryjeans
317	288	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:04:45.796837+05	mysteryjeans	2014-09-12 06:04:45.796874+05	mysteryjeans
318	289	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:07:36.197476+05	mysteryjeans	2014-09-12 06:07:36.197513+05	mysteryjeans
319	290	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:07:44.446158+05	mysteryjeans	2014-09-12 06:07:44.446225+05	mysteryjeans
320	291	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:08:41.132998+05	mysteryjeans	2014-09-12 06:08:41.133035+05	mysteryjeans
321	292	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:08:52.712489+05	mysteryjeans	2014-09-12 06:08:52.712536+05	mysteryjeans
322	293	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:13:54.670697+05	mysteryjeans	2014-09-12 06:13:54.670748+05	mysteryjeans
323	294	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:29:10.730576+05	mysteryjeans	2014-09-12 06:29:10.730614+05	mysteryjeans
324	295	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:31:15.727417+05	mysteryjeans	2014-09-12 06:31:15.727454+05	mysteryjeans
325	296	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:34:18.127642+05	mysteryjeans	2014-09-12 06:34:18.127696+05	mysteryjeans
326	297	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:35:00.292615+05	mysteryjeans	2014-09-12 06:35:00.292663+05	mysteryjeans
327	298	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:35:06.791514+05	mysteryjeans	2014-09-12 06:35:06.791552+05	mysteryjeans
328	299	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:37:08.062263+05	mysteryjeans	2014-09-12 06:37:08.062299+05	mysteryjeans
329	300	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:37:20.963512+05	mysteryjeans	2014-09-12 06:37:20.963548+05	mysteryjeans
330	301	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:38:49.3336+05	mysteryjeans	2014-09-12 06:38:49.333636+05	mysteryjeans
331	302	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:39:54.554985+05	mysteryjeans	2014-09-12 06:39:54.555022+05	mysteryjeans
332	303	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:40:06.158032+05	mysteryjeans	2014-09-12 06:40:06.158069+05	mysteryjeans
333	304	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:40:56.773387+05	mysteryjeans	2014-09-12 06:40:56.773426+05	mysteryjeans
334	305	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:41:11.794078+05	mysteryjeans	2014-09-12 06:41:11.794115+05	mysteryjeans
335	306	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:41:22.612171+05	mysteryjeans	2014-09-12 06:41:22.61221+05	mysteryjeans
336	307	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:41:30.755783+05	mysteryjeans	2014-09-12 06:41:30.75582+05	mysteryjeans
337	308	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:41:43.562987+05	mysteryjeans	2014-09-12 06:41:43.563027+05	mysteryjeans
338	309	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:42:09.67043+05	mysteryjeans	2014-09-12 06:42:09.670473+05	mysteryjeans
339	310	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:42:20.226822+05	mysteryjeans	2014-09-12 06:42:20.226862+05	mysteryjeans
340	311	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:44:04.679814+05	mysteryjeans	2014-09-12 06:44:04.679857+05	mysteryjeans
341	312	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:46:53.528454+05	mysteryjeans	2014-09-12 06:46:53.528496+05	mysteryjeans
342	313	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:48:12.033785+05	mysteryjeans	2014-09-12 06:48:12.033853+05	mysteryjeans
343	314	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:51:59.818049+05	mysteryjeans	2014-09-12 06:51:59.818086+05	mysteryjeans
344	315	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:53:21.548861+05	mysteryjeans	2014-09-12 06:53:21.54892+05	mysteryjeans
345	316	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:54:09.998464+05	mysteryjeans	2014-09-12 06:54:09.998501+05	mysteryjeans
346	317	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:54:31.677982+05	mysteryjeans	2014-09-12 06:54:31.67802+05	mysteryjeans
347	318	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:54:47.074456+05	mysteryjeans	2014-09-12 06:54:47.074498+05	mysteryjeans
348	319	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:56:12.170261+05	mysteryjeans	2014-09-12 06:56:12.170298+05	mysteryjeans
349	320	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:56:43.647139+05	mysteryjeans	2014-09-12 06:56:43.647205+05	mysteryjeans
350	321	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:58:00.684062+05	mysteryjeans	2014-09-12 06:58:00.684102+05	mysteryjeans
351	322	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:58:17.800285+05	mysteryjeans	2014-09-12 06:58:17.800322+05	mysteryjeans
352	323	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:59:19.697965+05	mysteryjeans	2014-09-12 06:59:19.698004+05	mysteryjeans
353	324	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 06:59:35.604371+05	mysteryjeans	2014-09-12 06:59:35.604416+05	mysteryjeans
354	325	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:02:54.591602+05	mysteryjeans	2014-09-12 07:02:54.591646+05	mysteryjeans
355	326	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:03:18.561061+05	mysteryjeans	2014-09-12 07:03:18.561101+05	mysteryjeans
356	327	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:03:40.785477+05	mysteryjeans	2014-09-12 07:03:40.785514+05	mysteryjeans
357	328	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:04:10.75871+05	mysteryjeans	2014-09-12 07:04:10.758748+05	mysteryjeans
358	329	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:04:17.286311+05	mysteryjeans	2014-09-12 07:04:17.286348+05	mysteryjeans
359	330	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:05:29.035152+05	mysteryjeans	2014-09-12 07:05:29.035191+05	mysteryjeans
360	331	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:05:39.434901+05	mysteryjeans	2014-09-12 07:05:39.434938+05	mysteryjeans
361	332	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:06:26.47916+05	mysteryjeans	2014-09-12 07:06:26.479196+05	mysteryjeans
362	333	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:09:28.517881+05	mysteryjeans	2014-09-12 07:09:28.517919+05	mysteryjeans
363	334	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:09:46.796903+05	mysteryjeans	2014-09-12 07:09:46.796941+05	mysteryjeans
364	335	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:10:26.605294+05	mysteryjeans	2014-09-12 07:10:26.605383+05	mysteryjeans
365	336	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:11:42.449808+05	mysteryjeans	2014-09-12 07:11:42.449846+05	mysteryjeans
366	337	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:12:13.400429+05	mysteryjeans	2014-09-12 07:12:13.400469+05	mysteryjeans
367	338	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:13:12.873539+05	mysteryjeans	2014-09-12 07:13:12.873582+05	mysteryjeans
368	339	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 07:14:12.546601+05	mysteryjeans	2014-09-12 07:14:12.546645+05	mysteryjeans
369	340	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 20:58:43.849569+05	mysteryjeans	2014-09-12 20:58:43.849605+05	mysteryjeans
370	341	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-12 21:11:48.164703+05	mysteryjeans	2014-09-12 21:11:48.164741+05	mysteryjeans
371	342	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 00:28:48.14367+05	mysteryjeans	2014-09-13 00:28:48.143707+05	mysteryjeans
372	343	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 01:56:25.027287+05	mysteryjeans	2014-09-13 01:56:25.027325+05	mysteryjeans
373	344	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:02:44.076962+05	mysteryjeans	2014-09-13 02:02:44.076999+05	mysteryjeans
374	345	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:05:19.624635+05	mysteryjeans	2014-09-13 02:05:19.624678+05	mysteryjeans
375	346	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:06:14.536876+05	mysteryjeans	2014-09-13 02:06:14.536913+05	mysteryjeans
376	347	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:06:35.033787+05	mysteryjeans	2014-09-13 02:06:35.033853+05	mysteryjeans
377	348	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:07:33.041965+05	mysteryjeans	2014-09-13 02:07:33.042008+05	mysteryjeans
378	349	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:08:32.458111+05	mysteryjeans	2014-09-13 02:08:32.458155+05	mysteryjeans
379	350	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:14:28.518846+05	mysteryjeans	2014-09-13 02:14:28.518913+05	mysteryjeans
380	351	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:15:21.636677+05	mysteryjeans	2014-09-13 02:15:21.636719+05	mysteryjeans
381	352	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:19:04.927666+05	mysteryjeans	2014-09-13 02:19:04.927739+05	mysteryjeans
382	353	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:19:21.712859+05	mysteryjeans	2014-09-13 02:19:21.712903+05	mysteryjeans
383	354	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:19:40.316228+05	mysteryjeans	2014-09-13 02:19:40.316266+05	mysteryjeans
384	355	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:22:03.833884+05	mysteryjeans	2014-09-13 02:22:03.833921+05	mysteryjeans
385	356	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:22:42.728565+05	mysteryjeans	2014-09-13 02:22:42.728607+05	mysteryjeans
386	357	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:26:40.071581+05	mysteryjeans	2014-09-13 02:26:40.071626+05	mysteryjeans
387	358	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:28:17.966313+05	mysteryjeans	2014-09-13 02:28:17.966379+05	mysteryjeans
388	359	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:28:39.459044+05	mysteryjeans	2014-09-13 02:28:39.459086+05	mysteryjeans
389	360	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:29:03.063279+05	mysteryjeans	2014-09-13 02:29:03.063323+05	mysteryjeans
390	361	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:29:28.444693+05	mysteryjeans	2014-09-13 02:29:28.444739+05	mysteryjeans
391	362	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:30:21.434619+05	mysteryjeans	2014-09-13 02:30:21.434656+05	mysteryjeans
392	363	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:30:49.82377+05	mysteryjeans	2014-09-13 02:30:49.823809+05	mysteryjeans
393	364	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:31:57.474011+05	mysteryjeans	2014-09-13 02:31:57.474049+05	mysteryjeans
394	365	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 02:35:19.858059+05	mysteryjeans	2014-09-13 02:35:19.858097+05	mysteryjeans
395	366	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 03:47:24.534157+05	mysteryjeans	2014-09-13 03:47:24.534194+05	mysteryjeans
396	367	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 04:05:38.83751+05	mysteryjeans	2014-09-13 04:05:38.837547+05	mysteryjeans
397	368	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 04:11:22.825475+05	mysteryjeans	2014-09-13 04:11:22.825511+05	mysteryjeans
398	369	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 04:14:27.03782+05	mysteryjeans	2014-09-13 04:14:27.037857+05	mysteryjeans
399	370	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 04:27:10.637262+05	mysteryjeans	2014-09-13 04:27:10.637298+05	mysteryjeans
400	371	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 04:45:11.331491+05	mysteryjeans	2014-09-13 04:45:11.331532+05	mysteryjeans
401	372	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 05:31:14.067537+05	mysteryjeans	2014-09-13 05:31:14.067582+05	mysteryjeans
402	373	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 05:49:21.700885+05	mysteryjeans	2014-09-13 05:49:21.700922+05	mysteryjeans
403	374	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 05:58:34.114496+05	mysteryjeans	2014-09-13 05:58:34.114534+05	mysteryjeans
404	375	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:01:06.619785+05	mysteryjeans	2014-09-13 06:01:06.619822+05	mysteryjeans
405	376	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:12:26.793941+05	mysteryjeans	2014-09-13 06:12:26.79398+05	mysteryjeans
406	377	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:14:13.01621+05	mysteryjeans	2014-09-13 06:14:13.016247+05	mysteryjeans
407	378	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-13 06:24:12.490727+05	mysteryjeans	2014-09-13 06:24:12.490764+05	mysteryjeans
408	379	15	6.50	1	0.13	6.50	6.63	0.0200000000000000004	PE	2014-09-13 06:28:38.86806+05	mysteryjeans	2014-09-13 06:28:38.8681+05	mysteryjeans
409	380	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-13 06:31:54.342857+05	mysteryjeans	2014-09-13 06:31:54.342896+05	mysteryjeans
410	381	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:36:24.130365+05	mysteryjeans	2014-09-13 06:36:24.130426+05	mysteryjeans
411	382	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:37:01.763951+05	mysteryjeans	2014-09-13 06:37:01.763989+05	mysteryjeans
412	383	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:37:53.082121+05	mysteryjeans	2014-09-13 06:37:53.082158+05	mysteryjeans
413	384	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-13 06:40:55.970182+05	mysteryjeans	2014-09-13 06:40:55.970219+05	mysteryjeans
414	385	4	500.00	1	10.00	500.00	510.00	0.0200000000000000004	PE	2014-09-14 23:52:57.820372+05	mysteryjeans	2014-09-14 23:52:57.820411+05	mysteryjeans
415	386	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 04:01:46.748196+05	mysteryjeans	2014-09-15 04:01:46.748235+05	mysteryjeans
416	387	16	13.50	1	0.27	13.50	13.77	0.0200000000000000004	PE	2014-09-15 04:02:51.290628+05	mysteryjeans	2014-09-15 04:02:51.290666+05	mysteryjeans
417	388	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 04:21:31.387991+05	mysteryjeans	2014-09-15 04:21:31.388027+05	mysteryjeans
418	389	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 05:59:06.515866+05	mysteryjeans	2014-09-15 05:59:06.515907+05	mysteryjeans
419	390	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 05:59:24.065414+05	mysteryjeans	2014-09-15 05:59:24.065452+05	mysteryjeans
420	391	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:00:09.330878+05	mysteryjeans	2014-09-15 06:00:09.330916+05	mysteryjeans
421	392	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:05:05.992202+05	mysteryjeans	2014-09-15 06:05:05.992257+05	mysteryjeans
422	393	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:06:13.121255+05	mysteryjeans	2014-09-15 06:06:13.121314+05	mysteryjeans
423	394	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:19:11.493384+05	mysteryjeans	2014-09-15 06:19:11.493422+05	mysteryjeans
424	395	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:21:23.706797+05	mysteryjeans	2014-09-15 06:21:23.706853+05	mysteryjeans
425	396	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:34:13.572921+05	mysteryjeans	2014-09-15 06:34:13.572976+05	mysteryjeans
426	397	2	595.00	1	11.90	595.00	606.90	0.0200000000000000004	PE	2014-09-15 06:34:51.45359+05	mysteryjeans	2014-09-15 06:34:51.453628+05	mysteryjeans
427	398	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-15 06:38:49.287272+05	mysteryjeans	2014-09-15 06:38:49.287328+05	mysteryjeans
428	399	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-15 06:41:02.907884+05	mysteryjeans	2014-09-15 06:41:02.907923+05	mysteryjeans
429	400	2	595.00	2	23.80	1190.00	1213.80	0.0200000000000000004	PE	2014-09-15 06:44:18.840071+05	mysteryjeans	2014-09-15 06:44:18.840135+05	mysteryjeans
\.


--
-- Name: sales_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doorsale
--

SELECT pg_catalog.setval('sales_order_item_id_seq', 429, true);


--
-- Data for Name: sales_payment_method; Type: TABLE DATA; Schema: public; Owner: doorsale
--

COPY sales_payment_method (code, name, is_active, updated_by, updated_on, created_on, created_by) FROM stdin;
CO	Cash On Delivery	t	system	2014-07-22 05:11:14.806316+05	2014-07-22 05:11:14.806316+05	system
CH	Check / Money Order	t	system	2014-07-22 05:11:14.828812+05	2014-07-22 05:11:14.828812+05	system
CC	Credit Card	t	system	2014-07-22 05:11:14.850444+05	2014-07-22 05:11:14.850444+05	system
PO	Purchase Order	t	system	2014-07-22 05:11:14.872682+05	2014-07-22 05:11:14.872682+05	system
\.


--
-- Name: accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


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

ALTER TABLE ONLY financial_tax
    ADD CONSTRAINT financial_tax_rate_name_key UNIQUE (name);


--
-- Name: financial_tax_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY financial_tax
    ADD CONSTRAINT financial_tax_rate_pkey PRIMARY KEY (id);


--
-- Name: geo_address_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY geo_address
    ADD CONSTRAINT geo_address_pkey PRIMARY KEY (id);


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
-- Name: payments_card_issuer_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_card_issuer
    ADD CONSTRAINT payments_card_issuer_pkey PRIMARY KEY (descriptor);


--
-- Name: payments_gateway_param_gateway_id_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_gateway_param
    ADD CONSTRAINT payments_gateway_param_gateway_id_name_key UNIQUE (gateway_id, name);


--
-- Name: payments_gateway_param_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_gateway_param
    ADD CONSTRAINT payments_gateway_param_pkey PRIMARY KEY (id);


--
-- Name: payments_gateway_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_gateway
    ADD CONSTRAINT payments_gateway_pkey PRIMARY KEY (name);


--
-- Name: payments_transaction_param_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_transaction_param
    ADD CONSTRAINT payments_transaction_param_pkey PRIMARY KEY (id);


--
-- Name: payments_transaction_param_transaction_id_name_key; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_transaction_param
    ADD CONSTRAINT payments_transaction_param_transaction_id_name_key UNIQUE (transaction_id, name);


--
-- Name: payments_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY payments_transaction
    ADD CONSTRAINT payments_transaction_pkey PRIMARY KEY (id);


--
-- Name: sales_cart_item_cart_product; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_cart_item
    ADD CONSTRAINT sales_cart_item_cart_product UNIQUE (cart_id, product_id);


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
-- Name: sales_payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: doorsale; Tablespace: 
--

ALTER TABLE ONLY sales_payment_method
    ADD CONSTRAINT sales_payment_method_pkey PRIMARY KEY (code);


--
-- Name: accounts_user_billing_address_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_billing_address_id ON accounts_user USING btree (billing_address_id);


--
-- Name: accounts_user_groups_group_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_groups_group_id ON accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_groups_user_id ON accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_shipping_adress_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_shipping_adress_id ON accounts_user USING btree (shipping_adress_id);


--
-- Name: accounts_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_user_permissions_permission_id ON accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_user_permissions_user_id ON accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX accounts_user_username_like ON accounts_user USING btree (username varchar_pattern_ops);


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

CREATE INDEX catalog_product_tax_rate_id ON catalog_product USING btree (tax_id);


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

CREATE INDEX financial_tax_rate_name_like ON financial_tax USING btree (name varchar_pattern_ops);


--
-- Name: geo_address_country_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_address_country_id ON geo_address USING btree (country_id);


--
-- Name: geo_address_customer_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_address_customer_id ON geo_address USING btree (customer_id);


--
-- Name: geo_address_state_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX geo_address_state_id ON geo_address USING btree (state_id);


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
-- Name: payments_card_issuer_descriptor_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_card_issuer_descriptor_like ON payments_card_issuer USING btree (descriptor varchar_pattern_ops);


--
-- Name: payments_gateway_name_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_gateway_name_like ON payments_gateway USING btree (name varchar_pattern_ops);


--
-- Name: payments_gateway_param_gateway_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_gateway_param_gateway_id ON payments_gateway_param USING btree (gateway_id);


--
-- Name: payments_gateway_param_gateway_id_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_gateway_param_gateway_id_like ON payments_gateway_param USING btree (gateway_id varchar_pattern_ops);


--
-- Name: payments_transaction_gateway_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_transaction_gateway_id ON payments_transaction USING btree (gateway_id);


--
-- Name: payments_transaction_gateway_id_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_transaction_gateway_id_like ON payments_transaction USING btree (gateway_id varchar_pattern_ops);


--
-- Name: payments_transaction_order_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_transaction_order_id ON payments_transaction USING btree (order_id);


--
-- Name: payments_transaction_param_transaction_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX payments_transaction_param_transaction_id ON payments_transaction_param USING btree (transaction_id);


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
-- Name: sales_order_payment_method_code; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_payment_method_code ON sales_order USING btree (payment_method_code);


--
-- Name: sales_order_payment_method_code_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_payment_method_code_like ON sales_order USING btree (payment_method_code varchar_pattern_ops);


--
-- Name: sales_order_shipping_address_id; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_order_shipping_address_id ON sales_order USING btree (shipping_address_id);


--
-- Name: sales_payment_method_code_like; Type: INDEX; Schema: public; Owner: doorsale; Tablespace: 
--

CREATE INDEX sales_payment_method_code_like ON sales_payment_method USING btree (code varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_address_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_address
    ADD CONSTRAINT geo_address_country_id_fkey FOREIGN KEY (country_id) REFERENCES geo_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_address_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_address
    ADD CONSTRAINT geo_address_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_address_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY geo_address
    ADD CONSTRAINT geo_address_state_id_fkey FOREIGN KEY (state_id) REFERENCES geo_state(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: payments_gateway_param_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_gateway_param
    ADD CONSTRAINT payments_gateway_param_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES payments_gateway(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_transaction_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_transaction
    ADD CONSTRAINT payments_transaction_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES payments_gateway(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_transaction_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_transaction
    ADD CONSTRAINT payments_transaction_order_id_fkey FOREIGN KEY (order_id) REFERENCES sales_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_transaction_param_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY payments_transaction_param
    ADD CONSTRAINT payments_transaction_param_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES payments_transaction(id) DEFERRABLE INITIALLY DEFERRED;


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
    ADD CONSTRAINT sales_order_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES geo_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES financial_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: sales_order_payment_method_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_payment_method_code_fkey FOREIGN KEY (payment_method_code) REFERENCES sales_payment_method(code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sales_order_shipping_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY sales_order
    ADD CONSTRAINT sales_order_shipping_address_id_fkey FOREIGN KEY (shipping_address_id) REFERENCES geo_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tax_rate_id_refs_id_504c9250; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY catalog_product
    ADD CONSTRAINT tax_rate_id_refs_id_504c9250 FOREIGN KEY (tax_id) REFERENCES financial_tax(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f43d458c; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT user_id_refs_id_f43d458c FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f8c8af81; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_f8c8af81 FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f905ace9; Type: FK CONSTRAINT; Schema: public; Owner: doorsale
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f905ace9 FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


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

