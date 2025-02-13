CREATE TABLE triggers (
  trigger_id     INT    IDENTITY NOT NULL,
  trigger_source VARCHAR(128),
  modify_time    BIGINT NOT NULL,
  enc_type       TINYINT,
  data           BLOB,
  PRIMARY KEY (trigger_id)
);
