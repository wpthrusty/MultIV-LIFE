//MultiIV Life MySQL Server Function
//Author : Rusty (Coder)
//Thanks Chris for MultiIV MySQL Module https://github.com/christopherftw09

print("Start MultiIV Life MySql Function");
local Life_MySQL = mysql.connect(Life_MySqlHost, Life_MySqlUsername, Life_MySqlPassword, Life_MySqlDatabase);
mysql.debug(true);
function LifeMySqlPing()
{
	if (!mysql.ping(Life_MySQL))
	{
		print(Life_BCName + " : MySQL Server connection OK!");
	} 
	else 
	{
		print(Life_BCName + " : MySQL Server Connection Problem!!! <" + mysql.errno(Life_MySQL) + ">");
	}
}
LifeMySqlPing();

function SafetySql()
{
	local Life_MySQL = mysql.connect(Life_MySqlHost, Life_MySqlUsername, Life_MySqlPassword, Life_MySqlDatabase);
	mysql.close(Life_MySQL);
	print(Life_BCName + " : Close Connect to MySql Server for low resource using");
};

function LifeCreatePlayerData(pName)
{
	local query = "INSERT INTO players (name) VALUES ('" + pName + "')";
	local handle = mysql.query(Life_MySQL, query);
    mysql.store_result(handle);
    mysql.fetch_row(handle);
    mysql.free_result(handle);
	SafetySql();
}

function LifeGetData(pIDS)
{
	mysql.query(Life_MySQL, "SELECT * FORM players WHERE ids ='" + pIDS + "'");
}

function LifeSavePlayerData(pIDS, pMoney)
{
	local query = "UPDATE players SET money = '" + pMoney + "' WHERE ids = '" + pIDS + "'";
	/*
	local handle = mysql.query(Life_MySQL, query);
    mysql.store_result(handle);
    mysql.fetch_row(handle);
    mysql.free_result(handle);
	*/
	SafetySql();
}

function LifeUpdateData()
{
	LifeMySqlPing();
	print(Life_BCName + " : Update Life Database");
	SafetySql();
}

function LifeDeleteData(pName)
{
	
}
