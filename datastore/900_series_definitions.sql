INSERT INTO series_definition (name, description, type, config, active)
VALUES
('TR', 'True Range for Symbol', 'SYMBOL', 
    '{
        "sname" : "TR({0})",
        "ftype" : "EQ",
        "arg_count" : 1,
        "equation" : "SMAX(H({0})-L({0}),SMAX(H({0})-SHIFT(C({0}),1),SHIFT(C({0}),1)-L({0})))"
    }', 
true),
('DVCHNG', 'Inter-day Volume Change for Symbol', 'SYMBOL', 
    '{
        "sname" : "DVCHNG({0})",
        "ftype" : "EQ",
        "arg_count" : 1,
        "equation" : "V({0})-SHIFT(V({0}),1)"
    }', 
true),
('DCHNG', 'Daily Change for Symbol', 'SYMBOL', 
    '{
        "sname" : "DCHNG({0})",
        "ftype" : "EQ",
        "arg_count" : 1,
        "equation" : "C({0})-O({0})"
    }', 
true),
('TP', 'True Price for Symbol', 'SYMBOL', 
    '{
        "sname" : "TP({0})",
        "ftype" : "EQ",
        "arg_count" : 1,
        "equation" : "(C({0})+H({0})+L({0}))/3"
    }', 
true),
('DG', 'Daily Gainers', 'AGGREGATE', 
    '{
        "sname" : "DG",
        "ftype" : "AGG_FUNC",
        "arg_count" : 0,
        "function" : "daily_gainers",
        "base_series" : "DCHNG"
    }',
true),
('DVG', 'Daily Volume Gainers', 'AGGREGATE', 
    '{
        "sname" : "DVG",
        "ftype" : "AGG_FUNC",
        "arg_count" : 0,
        "function" : "daily_gainers",
        "base_series" : "DVCHNG"
    }',
true)
;
