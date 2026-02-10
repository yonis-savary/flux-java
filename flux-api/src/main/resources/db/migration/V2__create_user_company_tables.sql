CREATE TABLE user_company (
    id SERIAL PRIMARY KEY,
    "user" INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    address_zip VARCHAR(10),
    address_city VARCHAR(50),
    registration_id VARCHAR(20),
    tax_number VARCHAR(20),
    default_hourly_fees NUMERIC(10,5),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    CONSTRAINT fk_user_company_user FOREIGN KEY ("user") REFERENCES "user"(id)
);

CREATE TABLE file (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    user_company INT NOT NULL,
    name VARCHAR(200) NOT NULL,
    path VARCHAR(255) NOT NULL,
    CONSTRAINT fk_file_user_company FOREIGN KEY (user_company) REFERENCES user_company(id)
);

CREATE TABLE user_company_document (
    id SERIAL PRIMARY KEY,
    user_company INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    file UUID NOT NULL,
    CONSTRAINT fk_uc_document_user_company FOREIGN KEY (user_company) REFERENCES user_company(id),
    CONSTRAINT fk_uc_document_file FOREIGN KEY (file) REFERENCES file(uuid)
);

CREATE TABLE user_company_payment_informations (
    id SERIAL PRIMARY KEY,
    user_company INT NOT NULL UNIQUE,
    day_delay SMALLINT,
    allowed_payment_methods VARCHAR(100),
    bank_name TEXT,
    bank_bic TEXT,
    brank_iban TEXT,
    CONSTRAINT fk_uc_payment_user_company FOREIGN KEY (user_company) REFERENCES user_company(id)
);

CREATE TABLE user_company_product (
    id SERIAL PRIMARY KEY,
    user_company INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,5) NOT NULL DEFAULT 0.00000,
    CONSTRAINT fk_uc_product_user_company FOREIGN KEY (user_company) REFERENCES user_company(id) ON DELETE CASCADE
);