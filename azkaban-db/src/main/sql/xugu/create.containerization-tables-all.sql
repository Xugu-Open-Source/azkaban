CREATE TABLE IF NOT EXISTS image_types (
  id               INT             IDENTITY NOT NULL PRIMARY KEY,
  name             VARCHAR(64)     NOT NULL UNIQUE,
  description      VARCHAR(2048),
  active           BOOLEAN,
  deployable       VARCHAR(64),
  created_on       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by       VARCHAR(64)     NOT NULL,
  modified_on      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by      VARCHAR(64)     NOT NULL
);

CREATE TABLE IF NOT EXISTS image_versions (
  id               INT             IDENTITY NOT NULL PRIMARY KEY,
  path             VARCHAR(1024)   NOT NULL,
  description      VARCHAR(2048),
  version          VARCHAR(64)     NOT NULL,
  type_id          INT NOT NULL,   FOREIGN KEY(type_id) references image_types (id),
  state            VARCHAR(64)     NOT NULL,
  release_tag      VARCHAR(64)     NOT NULL,
  created_on       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by       VARCHAR(64)     NOT NULL,
  modified_on      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by      VARCHAR(64)     NOT NULL,
  UNIQUE (type_id, version)
);

CREATE TABLE IF NOT EXISTS image_ownerships (
  id               INT             IDENTITY NOT NULL PRIMARY KEY,
  type_id          INT NOT NULL,   FOREIGN KEY(type_id) references image_types (id),
  owner            VARCHAR(64)     NOT NULL,
  role             VARCHAR(64)     NOT NULL,
  created_on       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by       VARCHAR(64)     NOT NULL,
  modified_on      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by      VARCHAR(64)     NOT NULL
);

CREATE TABLE IF NOT EXISTS image_rampup_plan (
  id               INT             IDENTITY NOT NULL PRIMARY KEY,
  name             VARCHAR(1024)   NOT NULL,
  description      VARCHAR(2048),
  type_id          INT NOT NULL,   FOREIGN KEY(type_id) references image_types (id),
  active           BOOLEAN         NOT NULL,
  created_on       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by       VARCHAR(64)     NOT NULL,
  modified_on      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by      VARCHAR(64)     NOT NULL
);

CREATE TABLE IF NOT EXISTS image_rampup (
  id                INT            IDENTITY NOT NULL PRIMARY KEY,
  plan_id           INT            NOT NULL, FOREIGN KEY(plan_id) references image_rampup_plan (id),
  version_id        INT            NOT NULL, FOREIGN KEY(version_id) references image_versions (id),
  rampup_percentage INT            NOT NULL DEFAULT 0,
  stability_tag     VARCHAR(64)    NOT NULL,
  created_on        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by        VARCHAR(64)    NOT NULL,
  modified_on       TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by       VARCHAR(64)    NOT NULL
);

CREATE TABLE IF NOT EXISTS version_set (
     id  INT IDENTITY NOT NULL,
     md5  CHAR(32) NOT NULL,
     json VARCHAR(4096) NOT NULL,
     created_on datetime DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (id)
);
