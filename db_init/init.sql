-- create input directory
CREATE DIRECTORY INPUT_DIR as '/usr/dbuserdata';

-- create external table for exams CSV data
CREATE TABLE EXAMS (
    gender varchar(6),
    race_ethnicity varchar(50),
    parental_level_of_education varchar(200),
    lunch varchar(50),
    test_preparation_course varchar(50),
    math_score integer,
    reading_score integer,
    writing_score integer
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY INPUT_DIR
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        SKIP 1
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        (
            gender,
            race_ethnicity,
            parental_level_of_education,
            lunch,
            test_preparation_course,
            math_score,
            reading_score,
            writing_score
        )
    )
    LOCATION ('exams.csv')
)
;
