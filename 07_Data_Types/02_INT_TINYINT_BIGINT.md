# INT, TINYINT, BIGINT

Using correct data types is crucial for memory management, so far for all of our numeric values we've been using INT, but in the real world using more accurate data types for values is best practice.

If you know that a number for a row in a table will always be small, using TINYINT is a good choice. TINYINT requires only 1 byte of storage and can store values from -128 to 127 (or 0 to 255 if unsigned). This can be a more efficient choice compared to larger data types like INT or BIGINT when you are certain that the values will fall within the TINYINT range.