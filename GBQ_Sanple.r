# Note first run will save credentials in .httr-oauth file in cwd
# if you need to reset then first delete this file,
# then issue bigrquery::set_access_cred(N

library(bigrquery)


project <- "sa-datamarts" # put your projectID here

sql <- "SELECT year, month, day, weight_pounds FROM [publicdata:samples.natality] LIMIT 5"
query_exec(sql, project = project)

# Put the results in a table you own (which uses project by default)
query_exec(sql, project = project, destination_table = "mark_sandbox.results")

# Use a default dataset for the query
sql <- "SELECT year, month, day, weight_pounds FROM natality LIMIT 5"
query_exec(sql, project = project, default_dataset = "publicdata:samples")