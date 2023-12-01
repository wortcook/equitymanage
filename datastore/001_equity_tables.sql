--------------------------------------------------
-- DATE INDEX TABLE
-- SINCE WE WANT ANY DATA TO BE SEQUENTIAL, WE
-- NEED TO CREATE A TABLE THAT WILL HOLD THE
-- DATE AND THE INDEX OF THE DATE
-- Drop the table if it already exists
DROP INDEX IF EXISTS idx_date_index_date;
DROP INDEX IF EXISTS idx_date_index_index;
DROP TABLE IF EXISTS date_index;
-- Create the table
CREATE TABLE date_index (
    id SERIAL PRIMARY KEY,
    index_date DATE NOT NULL,
    index INT NOT NULL
);

-- Create an index on index_date
CREATE UNIQUE INDEX idx_date_index_date ON date_index(index_date);

-- Create an index on index
CREATE UNIQUE INDEX idx_date_index_index ON date_index(index);

--------------------------------------------------
-- SymbolRef table
-- This table will hold the symbol, name and source
-- of the symbol
--------------------------------------------------
DROP INDEX IF EXISTS idx_symbol_ref_symbol;
DROP TABLE IF EXISTS symbol_ref;
CREATE TABLE symbol_ref (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(255) NOT NULL,
    external_id VARCHAR(255) NOT NULL,
    name VARCHAR(500) NOT NULL,
    source VARCHAR(5000) NOT NULL,
    active BOOLEAN DEFAULT TRUE
);
CREATE UNIQUE INDEX idx_symbol_ref_symbol ON symbol_ref(symbol);

--------------------------------------------------
-- StockDataPoint table
--------------------------------------------------
DROP INDEX IF EXISTS idx_stock_data_point;
DROP TABLE IF EXISTS stock_data_point;
CREATE TABLE stock_data_point (
    id SERIAL PRIMARY KEY,
    symbol_ref_id INT REFERENCES symbol_ref(id),
    date_index_id INT REFERENCES date_index(id),
    open DOUBLE PRECISION DEFAULT -1.0,
    high DOUBLE PRECISION DEFAULT -1.0,
    low DOUBLE PRECISION DEFAULT -1.0,
    close DOUBLE PRECISION DEFAULT -1.0,
    volume_m DOUBLE PRECISION DEFAULT -1.0
);
CREATE UNIQUE INDEX idx_stock_data_point ON stock_data_point(symbol_ref_id, date_index_id);

--------------------------------------------------
-- Series
--------------------------------------------------
--------------------------------------------------
-- SeriesDataPoint 
--------------------------------------------------
DROP INDEX IF EXISTS idx_series_data_point;
DROP TABLE IF EXISTS series_data_point;

DROP INDEX IF EXISTS idx_series;
DROP TABLE IF EXISTS series;

DROP INDEX IF EXISTS idx_series_definition_name;
DROP TABLE IF EXISTS series_definition;

DROP TYPE IF EXISTS series_type;
CREATE TYPE series_type AS ENUM ('SYMBOL', 'AGGREGATE', 'COMPUTE', 'PREDICTIVE');


CREATE TABLE series_definition (
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    description VARCHAR(5000) NOT NULL,
    type series_type NOT NULL,
    config JSONB NOT NULL,
    active BOOLEAN DEFAULT TRUE
);
CREATE UNIQUE INDEX idx_series_definition_name ON series_definition(name);

CREATE TABLE series (
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    series_definition_id INT REFERENCES series_definition(id)
);
CREATE UNIQUE INDEX idx_series ON series(name, series_definition_id);

CREATE TABLE series_data_point (
    id SERIAL PRIMARY KEY,
    series_id INT REFERENCES series(id),
    date_index_id INT REFERENCES date_index(id),
    value DOUBLE PRECISION NOT NULL
);
CREATE UNIQUE INDEX idx_series_data_point ON series_data_point(series_id, date_index_id);
