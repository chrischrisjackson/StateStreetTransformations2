USE ROLE SS_DBA;

CREATE
OR REPLACE 
PIPE SS_DEV.RAW.INDEXSECURITY_PIPE 
AUTO_INGEST = TRUE 
INTEGRATION = 'STATESTREET_INTEGRATION' 
AS COPY INTO INDEXSECURITY
  (
      ENTITY_CODE,
      EFFECTIVE_DATE,
      DATATYPE,
      INDEX_TYPE,
      ASSET_IDENTIFIER,
      COUPON_RATE,
      MATURITY_DATE,
      CURRENCY_CODE,
      BEG_MKT_VALUE_BASE,
      END_MKT_VALUE_BASE,
      BEG_MARKET_CAP_BASE,
      END_MARKET_CAP_BASE,
      PRICE_BASE,
      RETURN_BASE,
      LOC_CURRENCY,
      BEG_MKT_VALUE_LOC,
      END_MKT_VALUE_LOC,
      BEG_MARKET_CAP_LOC,
      END_MARKET_CAP_LOC,
      PRICE_LOC,
      RETURN_LOC,
      SHARES_PERF,
      SOURCE_FILENAME,
      SOURCE_FILE_ROW_NUMBER
  )
FROM
  (
    SELECT
      T.$1,
      T.$2,
      T.$3,
      T.$4,
      T.$5,
      T.$6,
      T.$7,
      T.$8,
      T.$9,
      T.$10,
      T.$11,
      T.$12,
      T.$13,
      T.$14,
      T.$15,
      T.$16,
      T.$17,
      T.$18,
      T.$19,
      T.$20,
      T.$21,
      T.$22,
      METADATA$FILENAME,
      METADATA$FILE_ROW_NUMBER
    FROM
      @STATESTREET_AZURE_STAGE_INDEXSECURITY (FILE_FORMAT => SS_FILEFORMAT_CSV) T
  );