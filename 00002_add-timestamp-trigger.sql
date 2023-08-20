-- +goose Up
-- +goose StatementBegin
CREATE OR REPLACE FUNCTION updated_at_column()	
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;	
END;
$$ language 'plpgsql';

CREATE TRIGGER updated_at_content
    BEFORE UPDATE ON content
    FOR EACH ROW EXECUTE PROCEDURE  updated_at_column();
-- +goose StatementEnd
