CREATE TABLE ramp_exceptional_job_items (
    rampId VARCHAR(45) NOT NULL,
    flowId VARCHAR(128) NOT NULL,
    jobId VARCHAR(128) NOT NULL,
    treatment VARCHAR(1) NOT NULL,
    `TIMESTAMP` BIGINT NULL,
    PRIMARY KEY (rampId, flowId, jobId)
);
