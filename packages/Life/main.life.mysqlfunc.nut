//MultiIV Life MySQL Server Function
//Author : Rusty (Coder)
//Thanks Chris for MultiIV MySQL Module https://github.com/christopherftw09

print("Start MultiIV Life MySql Function");
local Life_MySQL = mysql.connect(Life_MySqlHost + ":" + Life_MySqlPort, Life_MySqlUsername, Life_MySqlPassword, Life_MySqlDatabase);
function LifeMySqlPing()
{
	if (mysql.ping(Life_MySQL))
	{
		print(Life_BCName + ": MySQL Server connection OK!");
	} 
	else 
	{
		print(Life_BCName + ": MySQL Server Connection Problem!!!");
	}
}
LifeMySqlPing();

function LifeCreatePlayerData(pName)
{
	local query = "INSERT INTO players (name) VALUES ('" + pName + "')";
	local handle = mysql.query(Life_MySQL, query);
    mysql.store_result(handle);
    mysql.fetch_row(handle);
    mysql.free_result(handle);
}

function LifeGetData(pIDS)
{
	mysql.query(Life_MySQL, "SELECT * FORM players WHERE ids ='" + pIDS + "'");
}

function LifeSavePlayerData(pIDS, pMoney)
{
	local query = "UPDATE players SET money = '" + pMoney + "' WHERE ids = '" + pIDS + "'";
	local handle = mysql.query(Life_MySQL, query);
    mysql.store_result(handle);
    mysql.fetch_row(handle);
    mysql.free_result(handle);
}

function LifeUpdateData(x)
{
	
}

function LifeDeleteData(pName)
{
	
}
