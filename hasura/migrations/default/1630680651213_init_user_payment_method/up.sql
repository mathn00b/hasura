CREATE TYPE card_type AS ENUM (
    'MasterCard',
    'Visa',
    'Mir',
    'UnionPay',
    'JCB',
    'AmericanExpress',
    'DinersClub',
    'Unknown');

CREATE TABLE IF NOT EXISTS payment.user_payment_method(
    id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id VARCHAR NOT NULL,
    payment_method_id VARCHAR NOT NULL,
    last_digits VARCHAR NOT NULL,
    card_type card_type NOT NULL,
    default_method BOOLEAN NOT NULL
);

COMMENT ON TABLE payment.user_payment_method IS 'This table exist payment user method info';
COMMENT ON COLUMN payment.user_payment_method.user_id IS 'User id';
COMMENT ON COLUMN payment.user_payment_method.payment_method_id IS 'Id payment method from yooMoney';
COMMENT ON COLUMN payment.user_payment_method.last_digits IS 'Last user card digits';
COMMENT ON COLUMN payment.user_payment_method.card_type IS 'User card type';
COMMENT ON COLUMN payment.user_payment_method.default_method IS 'User use default this card';