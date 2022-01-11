CREATE SCHEMA IF NOT EXISTS payment;

CREATE TABLE IF NOT EXISTS payment.transaction (
    id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id VARCHAR NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    create_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status transaction_status NOT NULL,
    confirmation_url VARCHAR,
    payment_id VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS payment.bought_product(
    id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    owner_id VARCHAR NOT NULL,
    transaction_id uuid NOT NULL,
    product_id VARCHAR NOT NULL,
    subscribe_type subscribe_type NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    period INT NOT NULL,
    last_renewal_date TIMESTAMP WITH TIME ZONE,
    active BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (transaction_id) REFERENCES payment.transaction (id)
);