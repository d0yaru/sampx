#include <a_samp>
#include <Pawn.CMD>
//#include <a_mysql>
#include <sscanf2>
#include <MapAndreas>
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
#define BASICSPAWN (1)// ����� ������
//#define BASIC (1)
/*
0. ������������ ������� /restart
1. �������� �� ������� �� �����
2. ����� ������ /spawn
3.
*/
//#define HOSPITAL (1)
//------------------------------------------------------------------------------
#define	SCM	SendClientMessage
#define	f	format

new str_chat[4096];
//------------------------------------------------------------------------------
//#define MAX_PASSWORD    33


//new MySQL:mysql;
//new str_mysql[4096];


//------------------------------------------------------------------------------
/*enum pInfo {
	bool:pCheck,// ���� �� ������� � ����
	bool:pLogin,
	pID,
	pName[MAX_PLAYER_NAME],
	pPassword[MAX_PASSWORD],
	pMoney,
	Float:pHealth
}
new PI[MAX_PLAYERS][pInfo];*/
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
main(){}
public OnPlayerCommandText(playerid, cmdtext[]){return 0;}
public OnPlayerConnect(playerid){return 1;}
public OnPlayerDisconnect(playerid, reason){return 1;}
public OnPlayerSpawn(playerid){return 1;}
public OnPlayerDeath(playerid, killerid, reason){return 1;}
public OnVehicleSpawn(vehicleid){return 1;}
public OnVehicleDeath(vehicleid, killerid){return 1;}
public OnPlayerText(playerid, text[]){return 1;}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger){return 1;}
public OnPlayerExitVehicle(playerid, vehicleid){return 1;}
public OnPlayerStateChange(playerid, newstate, oldstate){return 1;}
public OnPlayerEnterCheckpoint(playerid){return 1;}
public OnPlayerLeaveCheckpoint(playerid){return 1;}
public OnPlayerEnterRaceCheckpoint(playerid){return 1;}
public OnPlayerLeaveRaceCheckpoint(playerid){return 1;}
public OnRconCommand(cmd[]){return 1;}
public OnPlayerRequestSpawn(playerid){return 1;}
public OnObjectMoved(objectid){return 1;}
public OnPlayerObjectMoved(playerid, objectid){return 1;}
public OnPlayerPickUpPickup(playerid, pickupid){return 1;}
public OnVehicleMod(playerid, vehicleid, componentid){return 1;}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid){return 1;}
public OnVehicleRespray(playerid, vehicleid, color1, color2){return 1;}
public OnPlayerSelectedMenuRow(playerid, row){return 1;}
public OnPlayerExitedMenu(playerid){return 1;}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid){return 1;}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){return 1;}
public OnRconLoginAttempt(ip[], password[], success){return 1;}
public OnPlayerUpdate(playerid){return 1;}
public OnPlayerStreamIn(playerid, forplayerid){return 1;}
public OnPlayerStreamOut(playerid, forplayerid){return 1;}
public OnVehicleStreamIn(vehicleid, forplayerid){return 1;}
public OnVehicleStreamOut(vehicleid, forplayerid){return 1;}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){return 1;}
public OnPlayerClickPlayer(playerid, clickedplayerid, source){return 1;}
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if (GetPointZPos(fX, fY, fZ))
	{
		SetPlayerPos(playerid, fX, fY, fZ+2);
	}
	return 1;
}
public OnGameModeInit()
{
	return 1;
}
public OnGameModeExit()
{
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	//--------------------------------------------------------------------------
	f_SpawnInfo(playerid, 47, 2495.4131,-1682.6493,13.3389,358.4333);
	f_SpawnPlayer(playerid);
	//--------------------------------------------------------------------------

	return 1;
}
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
// f_SpawnInfo(playerid, 47, 2495.4131,-1682.6493,13.3389,358.4333);
stock f_SpawnInfo(playerid, skin, Float:x, Float:y, Float:z, Float:angle)
{
	SetSpawnInfo(playerid, 0, skin, x, y, z, angle, 0, 0, 0, 0, 0, 0);
	return 1;
}
//------------------------------------------------------------------------------
stock f_SpawnPlayer(playerid)
{
	SpawnPlayer(playerid);
	return 1;
}
//------------------------------------------------------------------------------
stock f_TeleportPlayer(playerid,Float:X,Float:Y)
{
	f(str_chat, sizeof(str_chat), "{ffcc00}>> SetCot [%f][%f].", X, Y);
	SCM(playerid, -1, str_chat);

	SetPlayerInterior(playerid, 0);
	SetPlayerPosFindZ(playerid, X, Y, 999.0);
	return 1;
}
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
CMD:restart(playerid, params[])
{
	SCM(playerid, -1, "{ffcc00}>> ������� �������.");
	GameModeExit();
	return 1;
}
//------------------------------------------------------------------------------
CMD:spawn(playerid, params[])
{
	SCM(playerid, -1, "{ffcc00}>> Spawn ������.");
	f_SpawnPlayer(playerid);
	return 1;
}
//------------------------------------------------------------------------------
/*CMD:tpcor(playerid, params[])
{
    SCM(playerid, -1, "{ffcc00}>> �������� ������.");
	SetPlayerInterior( playerid, 0 );
	SetPlayerPosFindZ( playerid, 0.0, 0.0, 999.0 );
	
	return 1;
}*/
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------

/*stock ConnectMySQL()
{
    new currenttime = GetTickCount();
    mysql = mysql_connect("127.0.0.1", "sampx", "qwer5678", "sampx");
    mysql_pquery(mysql, "SET NAMES 'cp1251'");
    mysql_set_charset("cp1251", mysql);
    printf("=======> mysql connect %i", Float:mysql);
    printf("MySQL ����������� �� %i ms", GetTickCount() - currenttime);
    return 1;
}
stock DisconnectMySQL()
{
    mysql_close(mysql);
    return 1;
}*/
//------------------------------------------------------------------------------
/*forward NewSpawnPlayer(playerid);
public NewSpawnPlayer(playerid)
{
	SetSpawnInfo(playerid, 0, 26, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}*/
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
/*CMD:spplayer(playerid, params[])
{
    SCM(playerid, -1, "{ffcc00}>> ������� ������.");
	NewSpawnPlayer(playerid);
	return 1;
}
//------------------------------------------------------------------------------
forward CheckAcc(playerid);
public CheckAcc(playerid)
{
    GetPlayerName(playerid, PI[playerid][pName], MAX_PLAYER_NAME);
    mysql_format(mysql, str_mysql, sizeof(str_mysql), "SELECT `Password` FROM `players` WHERE `NickName` = '%s'", PI[playerid][pName]);
	new Cache:result = mysql_query(mysql, str_mysql);
	if(cache_num_rows() > 0)
	{
		SCM(playerid, -1, "{00ff00}������� ���������������, ������������� /login [������]");
		cache_get_value_name(0, "Password", PI[playerid][pPassword], 32);
		PI[playerid][pCheck] = true;
	}
	else SCM(playerid, -1, "{ff4400}������� �� ���������������, ������������������ /reg [������]");
	cache_delete(result);
	return 1;
}
//------------------------------------------------------------------------------
CMD:login(playerid, params[])
{
	if(!PI[playerid][pCheck]) return SCM(playerid, -1, "{ff4400}������� �� ���������������, ������������������ /reg [������]");
    new pass[MAX_PASSWORD];
    //--------------------------------------------------------------------------
    if(sscanf(params, "s", pass)) return SCM(playerid, -1, "{ff0000}�����������: /login [������]");
	if(strlen(pass) < 3 || strlen(pass) > 30) return SCM(playerid, -1, "{ff0000}������ ������ ��������� �� 3 �� 30 ��������.");
	for(new i; i < strlen(pass); i++)
	{
	    switch(pass[i])
	    {
	        case '0'..'9', '�'..'�', 'a'..'z', '�'..'�', 'A'..'Z': continue;
	        default: return SCM(playerid, -1, "{ff0000}������ ����� ��������� ������ (Aa-Zz, ��-��, 0-9)");
	    }
	}
	//--------------------------------------------------------------------------
	if(!strcmp(PI[playerid][pPassword], pass))
	{
	    //cmd::pload(playerid, "");
	    PI[playerid][pLogin] = true;
	    NewSpawnPlayer(playerid);
	    SCM(playerid, -1, "{00ff00}�� ������� ��������������.");
	}
	else
	{
	    if(GetPVarInt(playerid, "BadAttempt") >= 3) return Kick(playerid);
	    f(str_chat, sizeof(str_chat), "{ff0000}�� ����� �������� ������! � ��� �������� %d �������(�)", 3 - GetPVarInt(playerid, "BadAttempt"));
    	SCM(playerid, -1, str_chat);
	    SetPVarInt(playerid, "BadAttempt", GetPVarInt(playerid, "BadAttempt") + 1);
	}
	return 1;
}
//------------------------------------------------------------------------------
CMD:reg(playerid, params[])
{
    if(PI[playerid][pCheck]) return SCM(playerid, -1, "{00ff00}������� ���������������, ������������� /login [������]");
    new pass[MAX_PASSWORD];
    //--------------------------------------------------------------------------
    if(sscanf(params, "s", pass)) return SCM(playerid, -1, "{ff0000}�����������: /reg [������]");
	if(strlen(pass) < 3 || strlen(pass) > 30) return SCM(playerid, -1, "{ff0000}������ ������ ��������� �� 3 �� 30 ��������.");
	for(new i; i < strlen(pass); i++)
	{
	    switch(pass[i])
	    {
	        case '0'..'9', '�'..'�', 'a'..'z', '�'..'�', 'A'..'Z': continue;
	        default: return SCM(playerid, -1, "{ff0000}������ ����� ��������� ������ (Aa-Zz, ��-��, 0-9)");
	    }
	}
	//--------------------------------------------------------------------------
	GetPlayerName(playerid, PI[playerid][pName], MAX_PLAYER_NAME);
	mysql_format(mysql, str_mysql, sizeof(str_mysql), "INSERT INTO `players` (`NickName`, `Password`) VALUES ('%s','%s')", PI[playerid][pName], pass);
	mysql_query(mysql, str_mysql, false);
	//--------------------------------------------------------------------------
	CheckAcc(playerid);
	return 1;
}*/
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
