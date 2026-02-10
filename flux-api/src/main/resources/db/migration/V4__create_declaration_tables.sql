
CREATE TABLE declaration_type (
    id SERIAL PRIMARY KEY,
    code VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE declaration (
    id SERIAL PRIMARY KEY,
    user_company INT NOT NULL,
    year INT,
    month INT,
    type INT NOT NULL,
    value REAL NOT NULL,
    CONSTRAINT fk_declaration_user_company FOREIGN KEY (user_company) REFERENCES user_company(id),
    CONSTRAINT fk_declaration_type FOREIGN KEY (type) REFERENCES declaration_type(id)
);
