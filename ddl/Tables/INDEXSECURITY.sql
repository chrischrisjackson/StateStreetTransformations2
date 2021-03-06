USE SCHEMA RAW;

CREATE OR REPLACE SEQUENCE INDEXSECURITY_SEQ;

CREATE
OR REPLACE TABLE INDEXSECURITY(
	PRIMARY_KEY INT DEFAULT INDEXSECURITY_SEQ.NEXTVAL PRIMARY KEY,
	ENTITY_CODE STRING(27),
	EFFECTIVE_DATE DATE,
	DATATYPE STRING(27),
	INDEX_TYPE STRING(50),
	ASSET_IDENTIFIER STRING(255) NOT NULL,
	COUPON_RATE NUMBER(38, 19),
	MATURITY_DATE DATE,
	CURRENCY_CODE STRING(30),
	BEG_MKT_VALUE_BASE NUMBER(38, 19),
	END_MKT_VALUE_BASE NUMBER(38, 19),
	BEG_MARKET_CAP_BASE NUMBER(38, 19),
	END_MARKET_CAP_BASE NUMBER(38, 19),
	PRICE_BASE NUMBER(38, 19),
	RETURN_BASE NUMBER(38, 19),
	LOC_CURRENCY STRING(30),
	BEG_MKT_VALUE_LOC NUMBER(38, 19),
	END_MKT_VALUE_LOC NUMBER(38, 19),
	BEG_MARKET_CAP_LOC NUMBER(38, 19),
	END_MARKET_CAP_LOC NUMBER(38, 19),
	PRICE_LOC NUMBER(38, 19),
	RETURN_LOC NUMBER(38, 19),
	SHARES_PERF NUMBER(38, 19),
	SOURCE_FILENAME STRING(1000),
	SOURCE_FILE_ROW_NUMBER NUMBER(38),
	INGESTION_TIME TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);