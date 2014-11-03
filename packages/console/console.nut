// Generic 'help' command - remember to update this as new commands are added
Command.AddConsole("help",
	function(command, ...) {
		print(
			"Available console commands:\n" +
			" list\n" +
			" rescan\n" +
			" start <packagename>\n" +
			" stop <packagename>\n" +
			" stopall\n" +
			" restart <packagename>\n" +
			" restartall\n" +
			" say <message>" +
			" help"
		);
	}
);

// Syntax: list
Command.AddConsole("help",
	function (command)
	{
		print("MultIV Life Console Command List");
		print("");
		print("================================");
	}
);
Command.AddConsole("list",
	function (command, ...)
	{
		print("Available packages:");

		foreach (package in Package.All())
		{
			if (package != Package.Current())
				print(" " + package.GetName() + (package.GetState() == 1 ? " (Started)" : ""));
		}
	}
);

// Syntax: rescan
Command.AddConsole("rescan",
	function (command, ...)
	{
		Package.Rescan();
	}
);

// Syntax: start <packagename>
Command.AddConsole("start",
	function (command, ...)
	{
		if (vargv.len() != 1)
		{
			print("Syntax: start <packagename>");
			return;
		}

		// Find package
		local packageName = vargv[0];
		local package = Package.Find(packageName);

		if (!package || package == Package.Current())
		{
			print("Error: package '" + packageName + "' not found!");
		}
		else if (package.GetState() == 1)
		{
			print("Error: package '" + packageName + "' is already started!");
		}
		else
		{
			package.Start();
			print("Package '" + packageName + "' started.");
		}
	}
);

// Syntax: stop <packagename>
Command.AddConsole("stop",
	function (command, ...)
	{
		if (vargv.len() != 1)
		{
			print("Syntax: stop <packagename>");
			return;
		}

		// Find package
		local packageName = vargv[0];
		local package = Package.Find(packageName);

		if (!package || package == Package.Current())
		{
			print("Error: package '" + packageName + "' not found!");
		}
		else if (package.GetState() == 0)
		{
			print("Error: package '" + packageName + "' is not started!");
		}
		else
		{
			package.Stop();
			print("Package '" + packageName + "' stopped.");
		}
	}
);

// Syntax: stopall
Command.AddConsole("stopall",
	function (command, ...)
	{
		foreach (package in Package.All())
		{
			if (package != Package.Current())
				package.Stop();
		}

		print("All packages stopped.");
	}
);

// Syntax: restart <packagename>
Command.AddConsole("restart",
	function (command, ...)
	{
		if (vargv.len() != 1)
		{
			print("Syntax: restart <packagename>");
			return;
		}

		// Find package
		local packageName = vargv[0];
		local package = Package.Find(packageName);

		if (!package || package == Package.Current())
		{
			print("Error: package '" + packageName + "' not found!");
		}
		else if (package.GetState() == 0)
		{
			print("Error: package '" + packageName + "' is not started!");
		}
		else
		{
			package.Restart();
			print("Package '" + packageName + "' restarted.");
		}
	}
);

// Syntax: restartall
Command.AddConsole("restartall",
	function (command, ...)
	{
		foreach (package in Package.All())
		{
			if (package != Package.Current())
				package.Restart();
		}

		print("All packages restarted.");
	}
);

// Syntax: say <message>
Command.AddConsole("say",
	function (command, ...)
	{
		local message = Implode(vargv);

		if (message.len() > 0)
		{
			Player.BroadcastMessage("CONSOLE: " + message);
			print("CHAT: CONSOLE: " + message);
		}
		else
		{
			print("Syntax: say <message>");
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