CREATE SCHEMA IF NOT EXISTS iotproject;

CREATE TABLE iotproject.soilmoisture(
    uid INTEGER NOT NULL PRIMARY KEY,
    hardware_flag VARCHAR(1),
    interrupt_flag VARCHAR(1),
    sensor_flag VARCHAR(1),
    tempc_ds18b20 REAL,
    batterie REAL,
    conduct_soil REAL,
    temp_soil REAL,
    water_soil REAL
);

CREATE TABLE iotproject.gajewskisensor(
    uid INTEGER NOT NULL PRIMARY KEY,
    css811_eco2 REAL,
    css811_etvoc REAL,
    mq9_ac REAL,
    mq9_av REAL,
    mq9_dv REAL
);