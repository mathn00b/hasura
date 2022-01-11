ALTER TABLE payment.user_payment_method
    ADD COLUMN email VARCHAR(255);
ALTER TABLE payment.user_payment_method
    ADD COLUMN phone_number VARCHAR(255);

COMMENT ON COLUMN payment.user_payment_method.email is 'user''s email' ;
COMMENT ON COLUMN payment.user_payment_method.phone_number is 'user''s phone number';