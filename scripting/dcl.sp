/*
 * Dynamic Collection Leaker
 *
 * Coded by dubbeh - www.dubbeh.net
 *
 * Licensed under the GPLv3
 *
 */

#pragma semicolon 1

#include <sourcemod>
#include <dynamic>

// Dynamic Collections
#include "dcl/collone.sp"
#include "dcl/colltwo.sp"
#include "dcl/collthree.sp"

public Plugin myinfo = 
{
	name = "Dynamic Collection Leaker", 
	author = "dubbeh", 
	description = "Plugin to set off the Dynamic collection leak", 
	version = "1.0.0", 
	url = "www.dubbeh.net"
};

CollectionOne g_CollOne;
CollectionTwo g_CollTwo;
CollectionThree g_CollThree;

public void OnPluginStart()
{
	PrintToServer("DCL - Plugin started...");
}

public void OnPluginEnd ()
{
	PrintToServer("DCL - Plugin stopping...");
	//g_CollOne.Dispose(true);
	//g_CollTwo.Dispose(true);
	//g_CollThree.Dispose(true);
}

public void OnMapStart ()
{
	int iIndex = 0;
	
	LogMessage("DCL - Intitializing Collection One.");
	g_CollOne = new CollectionOne();
	for (iIndex = 0; iIndex <= 2; iIndex++)
	{
		CollectionOneMembers collone = CollectionOneMembers();
		collone.m_iSomeIntOne = iIndex + 100;
		collone.m_bSomeBoolOne = true;
		collone.SetSomeString("Some String In Collection One");
		g_CollOne.AddItem(collone);
	}
	LogMessage("DCL - Finished initializing Collection One.");
	
	LogMessage("DCL - Intitializing Collection Two.");
	g_CollTwo = new CollectionTwo();
	for (iIndex = 0; iIndex <= 2; iIndex++)
	{
		CollectionTwoMembers colltwo = CollectionTwoMembers();
		colltwo.m_iSomeIntTwo = iIndex + 200;
		colltwo.m_bSomeBoolTwo = false;
		colltwo.SetSomeString("Some String In Collection Two");
		g_CollTwo.AddItem(colltwo);
	}
	LogMessage("DCL - Finished initializing Collection Two.");
	
	LogMessage("DCL - Intitializing Collection Three.");
	g_CollThree = new CollectionThree();
	for (iIndex = 0; iIndex <= 2; iIndex++)
	{
		CollectionThreeMembers collthree = CollectionThreeMembers();
		collthree.m_iSomeIntThree = iIndex + 300;
		collthree.m_bSomeBoolThree = true;
		collthree.SetSomeString("Some String In Collection Three");
		g_CollThree.AddItem(collthree);
	}
	LogMessage("DCL - Finished initializing Collection Three.");
}

public void OnMapEnd()
{
	LogMessage("DCL - Disposing Collection One.");
	g_CollOne.Dispose(true);
	LogMessage("DCL - Disposing Collection Two.");
	g_CollTwo.Dispose(true);
	LogMessage("DCL - Disposing Collection Three.");
	g_CollThree.Dispose(true);
}
