//MultiIV Life MySQL Server Function
//Author : Rusty (Coder)
//Thanks Chris for MultiIV MySQL Module https://github.com/christopherftw09

print("Start MultiIV Life MySql Function");
function LifeMySQLConn()
{
	local Life_MySQL = mysql.connect(Life_MySqlHost, Life_MySqlUsername, Life_MySqlpassword, Life_MySqlDatabase);
	if (mysql.ping(Life_MySQL))
	{
		print("MultiIV Life : MySQL Server connection OK!");
	} else 
	{
		print("MultiIV Life : MySQL Server Connection Problem!!!");
	}
}
Event.Add(Player, "mysqlconn", LifeMySQLConn);