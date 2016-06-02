# Note first run will save credentials in .httr-oauth file in cwd
# if you need to reset then first delete this file,
# then issue bigrquery::set_access_cred(N

library(bigrquery)

rm(list=ls())   

project <- "sa-datamarts" # put your projectID here

sql <- "SELECT
  FISC_WK_CDESC,
RGN_CDESC,
DIST_CDESC,
PROD_DEPT_CDESC,
PROD_SDSC, 
STORE_CDESC,
SUM( TY_SLS) as SALES
FROM
[mark_sandbox.DM_SALES_DAY_STORE_SKU_2WKSAMPLE_2]
GROUP BY
FISC_WK_CDESC,
RGN_CDESC,
DIST_CDESC,
PROD_DEPT_CDESC,
PROD_SDSC, 
STORE_CDESC"

SalesData <- query_exec(sql, project = project, destination_table = "LargeResults")

attach(SalesData)

boxplot(SALES ~ FISC_WK_CDESC, main="Sales", 
        ylab="Department Sales at Store", xlab="Fiscal Week",
        ylim=c(0,600000), las=1)
