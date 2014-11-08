/*
	MultIV Life Main Server Function File
	Author : Rusty
*/


function Life_LoopTest(stopstep)
{
	local looper = 0;
	local load = 0;
	while (true)
	{
		//Script Here
		//print("Loop Test <" + looper + ">");
		looper++;
		if (looper >= 1200000) 
		{ 
			looper = 0;
			print("Loop Test Reset");
			load++;
			print("Current Load = " + load);
		}
		if (load == stopstep)
		{
			print("Loop Test Break");
			print("Loop Load = " + load);
			return;
		}
		//-----------
	}
}
function Life_LoginCheck(x)
{
	/*
	do
	{
	
	} while ()
	*/
}

function Life_RegisterCheck(x)
{
	/*
	do
	{
	
	} while ()
	*/
}