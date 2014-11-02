function tableExists(table)
{
	local statement = SQLite.Prepare("select tbl_name from sqlite_master where tbl_name=?");
	statement.Bind(1, table);
	local result = statement.Execute();

	return result.len() > 0;
}

function createTable(table)
{
	SQLite.Prepare("create table " + table + " (column1 TEXT, column2 INTEGER, column3 REAL)").Execute();
}

function createTableIfMissing(table)
{
	if(!tableExists(table))
		createTable(table);
}

function isTablePopulated(table)
{
	local result = SQLite.Prepare("select * from " + table + " limit 1").Execute();

	return result.len() > 0;
}

function insertNewRow(table)
{
	local statement = SQLite.Prepare("insert into " + table + " values(?, ?, ?)");
	statement.Bind(1, "value1");
	statement.Bind(2, 1337);
	statement.Bind(3, 66.6);
	statement.Execute();
}

function insertRowIfMissing(table)
{
	if(!isTablePopulated(table))
		insertNewRow(table);

}

function printRow(table, row)
{
	local result = SQLite.Prepare("select * from " + table).Execute();
	print("column1: " + result[row].column1 + " | column2: " + result[row].column2 +" | column3: " + result[row].column3);
}

createTableIfMissing("test");
insertRowIfMissing("test");
printRow("test", 0);
