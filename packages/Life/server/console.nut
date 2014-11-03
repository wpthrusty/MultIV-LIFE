// Generic 'help' command - remember to update this as new commands are added
print("================================");
print(Life_BCName + ": type 'help' in console to see available console commands");
print("================================");
Command.AddConsole("help",
	function (command)
	{
		print("MultIV Life Console Command List");
		print(
			"help , say <message>, setmoney <playerid> <amoung>\n" + 
			"pingsql , warn <playerid> , kick <playerid> , ban <playerid>"
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
		}
		else
		{
			print("Syntax: setmoney <playerid> <amoung>");
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
