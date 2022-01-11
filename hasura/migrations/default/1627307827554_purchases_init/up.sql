CREATE SCHEMA IF NOT EXISTS purchases;

CREATE TYPE transaction_status AS ENUM ('successful', 'canceled', 'requires_confirmation');
CREATE TYPE subscribe_type AS ENUM ('instant', 'recurring');

CREATE TABLE IF NOT EXISTS purchases.transactions (
    transaction_id UUID NOT NULL UNIQUE,
    user_id VARCHAR NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    create_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status transaction_status NOT NULL,
    confirmation_url VARCHAR,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE IF NOT EXISTS purchases.bought_products(
    owner_id VARCHAR NOT NULL,
    transaction_id UUID NOT NULL,
    product_id VARCHAR NOT NULL,
    subscribe_type subscribe_type NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE NOT NULL,
    period INT NOT NULL,
    last_renewal_date TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (transaction_id) REFERENCES purchases.transactions(transaction_id)
);