--
-- VTBClients database creation script
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: VTBClients; Type: DATABASE; Schema: -; Owner: postgres
--

\connect "VTBClients"

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE public."Users" (
  "@Users" BIGINT NOT NULL,
  "PhoneNumber" VARCHAR(15) NOT NULL,
  "VTBClient" BOOLEAN NOT NULL,
  "INN" VARCHAR(12),
  "KPPs" VARCHAR(9) [],
  "OrgName" TEXT,
  "Account" VARCHAR(20),
  "BankName" TEXT,
  "BankCity" TEXT,
  "BankBIC" VARCHAR(9),
  "BankCorrAccount" VARCHAR(20),
  CONSTRAINT "Organizations_pkey" PRIMARY KEY("@Organizations")
);

CREATE TABLE public."Drafts" (
  "@Drafts" BIGSERIAL,
  "PayerPN" VARCHAR(15),
  "RecieverPN" VARCHAR(15),
  "PayerID" BIGINT,
  "RecieverID" BIGINT,
  "Reason" TEXT,
  "Total" MONEY,
  "DateFrom" TIMESTAMP WITH TIME ZONE DEFAULT now(),
  "Confirmed" BOOLEAN DEFAULT FALSE,
  PRIMARY KEY("@Drafts")
);

COMMENT ON COLUMN public."Drafts"."PayerPN"
IS 'Телефонный номер отправителя';

COMMENT ON COLUMN public."Drafts"."RecieverPN"
IS 'Телефонный номер получателя';

COMMENT ON COLUMN public."Drafts"."Reason"
IS 'Назначение платежа';

COMMENT ON COLUMN public."Drafts"."Total"
IS 'Сумма платежа';