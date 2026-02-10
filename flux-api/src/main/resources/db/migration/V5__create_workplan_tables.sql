CREATE TABLE workplan (
    id SERIAL PRIMARY KEY,
    client INT NOT NULL,
    name VARCHAR(200) NOT NULL,
    color VARCHAR(7) DEFAULT '#00FF00',
    issue_key VARCHAR(30),
    issue_connector INT NOT NULL,
    code_connector INT NOT NULL,
    finished_at TIMESTAMP,
    CONSTRAINT fk_workplan_client FOREIGN KEY (client) REFERENCES client(id),
    CONSTRAINT fk_workplan_issue_connector FOREIGN KEY (issue_connector) REFERENCES client_connector(id),
    CONSTRAINT fk_workplan_code_connector FOREIGN KEY (code_connector) REFERENCES client_connector(id)
);

CREATE TABLE workplan_issue (
    id SERIAL PRIMARY KEY,
    workplan INT NOT NULL,
    issue_key VARCHAR(30) NOT NULL,
    CONSTRAINT uq_workplan_issue UNIQUE(workplan, issue_key),
    CONSTRAINT fk_workplan_issue_workplan FOREIGN KEY (workplan) REFERENCES workplan(id)
);

CREATE TABLE workplan_json_issue (
    id SERIAL PRIMARY KEY,
    workplan INT NOT NULL,
    issue_key VARCHAR(20) NOT NULL,
    json_cache TEXT,
    json_cache_date TIMESTAMP,
    position INT,
    CONSTRAINT uq_workplan_json_issue UNIQUE(workplan, issue_key),
    CONSTRAINT fk_workplan_json_issue_workplan FOREIGN KEY (workplan) REFERENCES workplan(id)
);

CREATE TABLE workplan_note (
    id SERIAL PRIMARY KEY,
    workplan INT NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    content TEXT,
    CONSTRAINT fk_workplan_note_workplan FOREIGN KEY (workplan) REFERENCES workplan(id)
);
