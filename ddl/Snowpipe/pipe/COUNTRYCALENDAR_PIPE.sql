USE ROLE SS_DBA;

CREATE
OR REPLACE 
PIPE SS_DEV.RAW.COUNTRYCALENDAR_PIPE 
AUTO_INGEST = TRUE 
INTEGRATION = 'STATESTREET_INTEGRATION' 
AS COPY INTO COUNTRYCALENDAR
FROM
  (
    SELECT
      T.$1 AS CALENDAR_DT,
      T.$2 AS COUNTRY_CD,
      T.$3 AS DAY_TYPE_CD,
      T.$4 AS MONTH_END_CD,
      T.$5 AS NEXT_BUSINESS_DT,
      T.$6 AS NEXT_MONTH_END_DT,
      T.$7 AS PRIOR_BUSINESS_DATE,
      T.$8 AS PRIOR_MONTH_END_DT,
      METADATA$FILENAME AS SOURCE_FILENAME,
      METADATA$FILE_ROW_NUMBER AS SOURCE_FILE_ROW_NUMBER,
      CURRENT_TIMESTAMP()
    FROM
      @STATESTREET_AZURE_STAGE_COUNTRYCALENDAR (FILE_FORMAT => SS_FILEFORMAT_CSV) T
  );