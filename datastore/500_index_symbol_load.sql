INSERT INTO symbol_ref( symbol, external_id, name, source, active )
VALUES
-- NEED TO ADD EXTERNAL ID WHICH IS THE SYMBOL BUT USE THE ORIGINAL AS EXTERNAL ID
('IDXGSPC','^GSPC', 'S&P 500', 'StockSource', true),
('IDXDJI','^DJI','Dow Jones Industrial Average','StockSource', true),
('IDXIXIC', '^IXC','NASDAQ Composite', 'StockSource', true),
('IDXNYA', '^NYA','NYSE COMPOSITE (DJ)', 'StockSource', true),
('IDXAX', '^XAX', 'NYSE AMEX COMPOSITE INDEX', 'StockSource', true),
('IDXBUK100P', '^BUK100P', 'Cboe UK 100', 'StockSource', true),
('IDXRUT', '^RUT', 'Russell 2000', 'StockSource', true),
('IDXVIX', '^VIX', 'CBOE Volatility Index', 'StockSource', true),
('IDXFTSE', '^FTSE', 'FTSE 100', 'StockSource', true),
('IDXGDAXI', '^GDAXI', 'DAX PERFORMANCE-INDEX', 'StockSource', true),
('IDXFCHI', '^FCHI', 'CAC 40', 'StockSource', true),
('IDXSTOXX50E', '^STOXX50E', 'ESTX 50 PR.EUR', 'StockSource', true),
('IDXT100', '^N100', 'Euronext 100 Index', 'StockSource', true),
('IDXBFX', '^BFX', 'BEL 20', 'StockSource', true),
('IDXN225', '^N225', 'Nikkei 225', 'StockSource', true),
('IDXHSI', '^HSI', 'HANG SENG INDEX', 'StockSource', true),
('IDXSTI', '^STI', 'STI Index', 'StockSource', true),
('IDXAXJO', '^AXJO', 'S&P/ASX 200', 'StockSource', true),
('IDXAORD', '^AORD', 'ALL ORDINARIES', 'StockSource', true),
('IDXSESN', '^BSESN', 'S&P BSE SENSEX', 'StockSource', true),
('IDXJKSE', '^JKSE', 'IDX COMPOSITE', 'StockSource', true)
