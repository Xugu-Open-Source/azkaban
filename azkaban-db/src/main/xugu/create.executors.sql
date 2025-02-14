CREATE TABLE executors (
  id     INT         IDENTITY NOT NULL PRIMARY KEY,
  host   VARCHAR(64) NOT NULL,
  port   INT         NOT NULL,
  active BOOLEAN                          DEFAULT FALSE,
  UNIQUE (host, port)
);
