CREATE TABLE ramp_exceptional_flow_items (
    rampId VARCHAR(45) NOT NULL,
    flowId VARCHAR(128) NOT NULL,
    treatment VARCHAR(1) NOT NULL,
    `TIMESTAMP` BIGINT NULL,
    PRIMARY KEY (rampId, flowId)
);
