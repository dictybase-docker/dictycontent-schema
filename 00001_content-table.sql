-- +goose Up
-- SQL in this section is executed when the migration is applied.

CREATE TABLE namespace (
    namespace_id SERIAL NOT NULL,
    name text NOT NULL,
    PRIMARY KEY(namespace_id)
);

CREATE TABLE content (
    content_id SERIAL NOT NULL,
    name text,
    slug text NOT NULL,
    created_by integer NOT NULL,
    updated_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT NOW(),
    updated_at timestamp with time zone DEFAULT NOW(),
    content json NOT NULL,
    namespace_id integer NOT NULL,
    FOREIGN KEY (namespace_id) references namespace(namespace_id) ON DELETE cascade INITIALLY DEFERRED,
    CONSTRAINT content_c1 UNIQUE (slug,namespace_id),
    PRIMARY KEY (content_id)
);
