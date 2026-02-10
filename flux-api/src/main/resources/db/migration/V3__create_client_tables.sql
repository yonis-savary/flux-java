CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    user_company INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    address_zip VARCHAR(10),
    address_city VARCHAR(50),
    registration_id VARCHAR(20),
    tax_number VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    logo_path VARCHAR(255),
    website VARCHAR(255),
    CONSTRAINT fk_client_user_company FOREIGN KEY (user_company) REFERENCES user_company(id)
);

CREATE TABLE connector_type_category (
    id SERIAL PRIMARY KEY,
    label VARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE connector_type (
    id SERIAL PRIMARY KEY,
    label VARCHAR(20) NOT NULL UNIQUE,
    category INT NOT NULL,
    CONSTRAINT fk_connector_type_category FOREIGN KEY (category) REFERENCES connector_type_category(id)
);

CREATE TABLE client_connector (
    id SERIAL PRIMARY KEY,
    client INT NOT NULL,
    type INT NOT NULL,
    json_params TEXT NOT NULL,
    CONSTRAINT fk_client_connector_client FOREIGN KEY (client) REFERENCES client(id),
    CONSTRAINT fk_client_connector_type FOREIGN KEY (type) REFERENCES connector_type(id)
);

CREATE TABLE client_order_status (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL
);

CREATE TABLE client_order (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    client INT NOT NULL,
    quote_reference VARCHAR(50) UNIQUE,
    invoice_reference VARCHAR(50) UNIQUE,
    address VARCHAR(255),
    address_zip VARCHAR(10),
    address_city VARCHAR(50),
    registration_id VARCHAR(20),
    tax_number VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    total_income NUMERIC(10,5),
    title VARCHAR(255),
    paid_at TIMESTAMP,
    apply_vat_tax BOOLEAN DEFAULT TRUE,
    quote_comment TEXT,
    invoice_comment TEXT,
    day_delay SMALLINT,
    allowed_payment_methods VARCHAR(100),
    bank_name TEXT,
    bank_bic TEXT,
    brank_iban TEXT,
    rejected_at TIMESTAMP,
    status INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_client_order_client FOREIGN KEY (client) REFERENCES client(id),
    CONSTRAINT fk_client_order_status FOREIGN KEY (status) REFERENCES client_order_status(id)
);

CREATE TABLE client_order_attachment_type (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    label VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE client_order_attachment (
    id SERIAL PRIMARY KEY,
    type INT NOT NULL,
    client_order UUID NOT NULL,
    file UUID NOT NULL,
    CONSTRAINT fk_co_attachment_type FOREIGN KEY (type) REFERENCES client_order_attachment_type(id),
    CONSTRAINT fk_co_attachment_client_order FOREIGN KEY (client_order) REFERENCES client_order(uuid),
    CONSTRAINT fk_co_attachment_file FOREIGN KEY (file) REFERENCES file(uuid)
);


CREATE TABLE client_order_detail (
    id SERIAL PRIMARY KEY,
    client_order UUID NOT NULL,
    label VARCHAR(100) NOT NULL,
    description TEXT,
    unit_price NUMERIC(10,5) NOT NULL,
    quantity REAL NOT NULL DEFAULT 1,
    CONSTRAINT fk_co_detail_client_order FOREIGN KEY (client_order) REFERENCES client_order(uuid)
);
