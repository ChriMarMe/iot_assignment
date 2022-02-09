\c internet_of_dinge;

CREATE SCHEMA IF NOT EXISTS iotproject;

CREATE TABLE iotproject.soilmoisture(
    id SERIAL PRIMARY KEY,
    add_time TIMESTAMP DEFAULT NOW(),
    batterie REAL,
    hardware_flag REAL,
    interrupt_flag REAL,
    sensor_flag REAL,
    tempc_ds18b20 REAL,
    conduct_soil REAL,
    temp_soil REAL,
    water_soil REAL
);

CREATE TABLE iotproject.gajewskisensor(
    id SERIAL PRIMARY KEY,
    add_time TIMESTAMP DEFAULT NOW(),
    css811_eco2 REAL,
    css811_etvoc REAL,
    mq9_ac REAL,
    mq9_av REAL,
    mq9_dv REAL
);