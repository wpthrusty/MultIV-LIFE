// MultiIV Life Server Config
// Author : Rusty (Coder)

print("Server Config Loader");

//MySQL Server Config
local Life_MySqlHost					=	"localhost";
local Life_MySqlUsername 				=	"root";//Edit your mysql server username
local Life_MySqlPassword 				=	"root";//Edit your mysql server password
local Life_MySqlDatabase 				=	"MultiIV_Life";//Edit your mysql database for server (Default : MultiIV_Life)

print("MySQL Server Config : Host" + Life_MySqlHost + " Username : " + Life_MySqlUsername + " Password : " + Life_MySqlPassword + " Database : " + Life_MySqlDatabase);
//-----------------------

local Life_DeathMSG 					=	true; //Broadcast Death Message to all player
local Life_BroadcastMessage 			=	true; // Auto Broadcast Message | Default : true | to turn of use false
local Life_BroadcastMessageDelay		=	5000; //Auto Broadcast Message Delay Time