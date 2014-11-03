// MultiIV Life Server Config
// Author : Rusty (Coder)

//MySQL Server Config
const Life_MySqlHost					=	"localhost";
const Life_MySqlUsername 				=	"root";//Edit your mysql server username
const Life_MySqlPassword 				=	"root";//Edit your mysql server password
const Life_MySqlDatabase 				=	"MultiIV_Life";//Edit your mysql database for server (Default : MultiIV_Life)

print("MySQL Server Config : Host : " + Life_MySqlHost + " Username : " + Life_MySqlUsername + " Password : " + Life_MySqlPassword + " Database : " + Life_MySqlDatabase);
//-----------------------

const Life_DeathMSG 					=	true; //Broadcast Death Message to all player
const Life_BroadcastMessage 			=	true; // Auto Broadcast Message | Default : true | to turn of use false
const Life_BroadcastMessageDelay		=	5000; //Auto Broadcast Message Delay Time