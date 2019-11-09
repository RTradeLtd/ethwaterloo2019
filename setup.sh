#! /bin/bash

psql -c "CREATE TABLE public.contracts
(
    id bigserial PRIMARY KEY,
    contract_address character varying,
    sponsor_address character varying,
    finder_address character varying
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public.prices
(
    id bigserial PRIMARY KEY,
    date date,                         
    ticker character varying(16),
    price numeric(5,2)
)
WITH (
    OIDS = FALSE
);"

psql -c "CREATE SEQUENCE public.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;"

while IFS= read -r line; do
    date=$(echo "$line" | awk '{print $1}')
    ticker=$(echo "$line" | awk '{print $2}')
    price=$(echo "$line" | awk '{print $3}')
    command="INSERT INTO PRICES (date, ticker, price) VALUES ('$date', '$ticker', '$price')"
    output="psql -c \"$command\""
    echo $output >> commands
done < prices.txt