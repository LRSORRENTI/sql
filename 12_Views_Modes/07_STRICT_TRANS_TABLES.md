# STRICT_TRANS_TABLES 

This mode defines how MySql defines missing or invalid values 

If we turn this mode off, and try to insert a string into a decimal column, we end up with the insert going through, but the value becomes 0.0

There's a lot more to changing the modes, but changing these modes isn't extremely common, usually ensuring that proper data types are being stored is something you'll want to keep enabled 