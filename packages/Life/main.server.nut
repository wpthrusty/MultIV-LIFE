local playerVehicles = {};

// Player connect event

function OnPlayerConnect(player)
{
	//In coming connected player message
	player.BroadcastMessage("#ffffff" + player.GetName() + " has join the game ");
	player.SendMessage("#ffffff" + "Hi " + player.GetName() + " welcome to MultiIV Life Server");
	player.SendMessage("This is a Life Server Tested Version 1.0");
	player.SendMessage("Author : Rusty @ Wolf Pack of Thailand Team");
}

Event.Add(Player, "connect", OnPlayerConnect);

// Player in-game event

function OnPlayerInGame(player)
{
	Player.BroadcastMessage("#00ff00" + player.GetName() + " has joined the game");
	
	// Set spawn position and spawn the player
	player.SetSpawnPosition(-229.635574, 431.741943, 14.742328);
	player.SetSpawnHeading(102.232361);
	player.Spawn(-229.635574, 431.741943, 14.742328, 102.232361);

	// Show available commands to the player
	player.SendMessage("#00ff00COMMANDS: #ffffff/vehicle, /weapon, /kill");
}

Event.Add(Player, "inGame", OnPlayerInGame);

// Player disconnect event

function OnPlayerDisconnect(player, reason)
{
	Player.BroadcastMessage("#00ff00" + player.GetName() + " has left the game" + ((reason == 1) ? " (Connection lost)" : ""));

	// Destroy the players vehicle (if any)
	if (playerVehicles.rawin(player))
	{
		playerVehicles[player].Destroy();

		delete playerVehicles[player];
	}
}

Event.Add(Player, "disconnect", OnPlayerDisconnect);

// Player death event

function OnPlayerDeath(player)
{
	Player.BroadcastMessage("#ff0000" + player.GetName() + " has died");
}

Event.Add(Player, "death", OnPlayerDeath);

// Vehicle command

function VehicleCommand(player, command, ...)
{
	if (vargv.len() != 1 && vargv.len() != 3 && vargv.len() != 5)
	{
		player.SendMessage("#ff0000USAGE: #ffffff/" + command + " model [col1 col2 [col3 col4]]");

		return;
	}

	// Destroy the players vehicle (if any)
	if (playerVehicles.rawin(player))
	{
		playerVehicles[player].Destroy();

		delete playerVehicles[player];
	}

	// Get the players position and heading
	local position = player.GetPosition();
	local heading = player.GetCurrentHeading();

	// Spawn the vehicle
	local vehicle;

	if (vargv.len() == 1)
		vehicle = Vehicle.Create(vargv[0].tointeger(), position.x, position.y, position.z, 0.0, 0.0, heading);
	else if (vargv.len() == 3)
		vehicle = Vehicle.Create(vargv[0].tointeger(), position.x, position.y, position.z, 0.0, 0.0, heading, vargv[1].tointeger(), vargv[2].tointeger());
	else if (vargv.len() == 5)
		vehicle = Vehicle.Create(vargv[0].tointeger(), position.x, position.y, position.z, 0.0, 0.0, heading, vargv[1].tointeger(), vargv[2].tointeger(), vargv[3].tointeger(), vargv[4].tointeger());

	// Store vehicle in table
	playerVehicles[player] <- vehicle;

	// Put player in vehicle
	player.PutInVehicle(vehicle, 0);

	player.SendMessage("#00ff00Here's your vehicle!");
}

Command.Add("vehicle", VehicleCommand);
Command.Add("veh", VehicleCommand);
Command.Add("v", VehicleCommand);

// Weapon command

function WeaponCommand(player, command, ...)
{
	if (vargv.len() != 1)
	{
		player.SendMessage("#ff0000USAGE: #ffffff/" + command + " type");

		return;
	}

	// Give weapon to player
	player.GiveWeapon(vargv[0].tointeger(), 9999);
		
	player.SendMessage("#00ff00Here's your weapon!");
}

Command.Add("weapon", WeaponCommand);
Command.Add("wep", WeaponCommand);
Command.Add("w", WeaponCommand);

// Kill command

function KillCommand(player, command, ...)
{
	player.SetHealth(0.0);
}

Command.Add("kill", KillCommand);
Command.Add("k", KillCommand);