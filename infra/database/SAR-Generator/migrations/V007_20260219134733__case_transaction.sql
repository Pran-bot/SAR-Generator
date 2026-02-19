CREATE OR REPLACE FUNCTION sync_case_id()
RETURNS trigger AS $$
BEGIN
  NEW.case_id := NEW.id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_sync_case
BEFORE INSERT ON cases
FOR EACH ROW
EXECUTE FUNCTION sync_case_id();