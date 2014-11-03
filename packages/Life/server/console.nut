// Generic 'help' command - remember to update this as new commands are added
print("================================");
print(Life_BCName + ": type 'help' in console to see available console commands");
print("================================");
Command.AddConsole("help",
	function (command)
	{
		print("MultIV Life Console Command List");
		print(
			"help , say <message>, setmoney <database player ids> <amount>\n" + 
			"pingsql , warn <playerid> , kick <playerid> , ban <playerid>\n" + 
			"sqltestcon <ip> <user> <password> <database> \n" + 
			""
		);
		print("================================");
	}
);
// Syntax: say <message>
Command.AddConsole("say",
	function (command, ...)
	{
		local message = Implode(vargv);

		if (message.len() > 0)
		{
			Player.BroadcastMessage(Life_BCName + " : " + message);
			print("In-game " + Life_BCName + " : " + message);
		}
		else
		{
			print("Syntax: say <message>");
		}
	}
);
Command.AddConsole("pingsql",
	function (command, ...)
	{
		LifeMySqlPing();
		SafetySql();
	}
);

Command.AddConsole("setmoney",
	function (command, ...)
	{
		if (vargv.len() > 0 && vargv.len() >= 0)
		{
			local CID = vargv[0].tointeger();
			local money = vargv[1].tointeger();
			print(Life_BCName + ": SetPlayerData (ID: " + CID + ") Amount : " + money);
			local sqlcon = mysql.connect(Life_MySqlHost, Life_MySqlUsername, Life_MySqlPassword, Life_MySqlDatabase);
			local query = "UPDATE players SET money = '" + money + "' WHERE ids = '" + CID + "'";
			print(Life_BCName + ": Database Update players <ID:" + CID + ">");
			SafetySql();
		}
		else
		{
			print("Syntax: setmoney <players id in database> <amount>");
		}
	}
);

Command.AddConsole("sqltestcon",
	function (command, ...)
	{
		if (vargv.len() != 0 && vargv.len() != 0 && vargv.len() != 0 && vargv.len() != 0)
		{
			print(Life_BCName + ": MySql Connect to IP : " + vargv[0].tostring() + " | Username : " + vargv[1].tostring() + " | Password : " + vargv[2].tostring() + " | Database : " + vargv[3].tostring() + " |");
			local sqlcon = mysql.connect(vargv[0].tostring(), vargv[1].tostring(), vargv[2].tostring(), vargv[3].tostring());
			if (!mysql.ping(sqlcon))
			{
				print(Life_BCName + ": MySQL Server connection OK!");
			} 
			else 
			{
				print(Life_BCName + ": MySQL Server Connection Problem!!!");
			}
				mysql.close(sqlcon);
				return;
			}
		else 
		{
			print("MySql Test Connection Command Guide");
			print("Syntax: sqltestcon <ip> <user> <password> <database>");
			return;
		}
	}
);

// Implode an array/a table into a string, courtesy of Jan (https://www.multiv-mod.com/forums/viewtopic.php?f=15&t=441#p4152)
function Implode(pieces, glue=" ")
{
	if ((typeof pieces != "array" && typeof pieces != "table") || pieces.len() == 0)
		return "";

	local output = "";

	foreach (value in pieces)
		output += value + glue;

	return output.slice(0, output.len() - glue.len());
}
