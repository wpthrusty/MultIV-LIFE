//MultiIV Life MySQL Server Function
//Author : Rusty (Coder)
//Thanks Chris for MultiIV MySQL Module https://github.com/christopherftw09

print("Start MultiIV Life MySql Function");
function LifeMySqlPing()
{
	local Life_MySQL = mysql.connect(Life_MySqlHost, Life_MySqlUsername, Life_MySqlPassword, Life_MySqlDatabase);
	if (mysql.ping(Life_MySQL))
	{
		print("MultiIV Life : MySQL Server connection OK!");
	} else 
	{
		print("MultiIV Life : MySQL Server Connection Problem!!!");
	}
}
LifeMySqlPing();

function LifeGetData(pName)
{

}

function LifeSaveData(pName)
{

}

function LifeUpdateData(x)
{

}

function LifeDeleteData(pName)
{

}
