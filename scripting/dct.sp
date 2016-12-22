/*
 * Dynamic Collection Tester
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
#include "dct/collone.sp"
#include "dct/colltwo.sp"
#include "dct/collthree.sp"

public Plugin myinfo = 
{
	name = "Dynamic Collection Tester", 
	author = "dubbeh", 
	description = "Plugin for testing collections inside Dynamic", 
	version = "1.0.2", 
	url = "www.dubbeh.net"
};


CollectionOne g_CollOne;
CollectionTwo g_CollTwo;
CollectionThree g_CollThree;

// Member values to test against for validity in the collections
int iCollectionOne = 111;
bool bCollectionOne = true;
char szCollectionOneString[] = "Some String In Collection One";
int iCollectionTwo = 222;
bool bCollectionTwo = false;
char szCollectionTwoString[] = "Some String In Collection Two";
int iCollectionThree = 333;
bool bCollectionThree = true;
char szCollectionThreeString[] = "Some String In Collection Three";

public void OnPluginStart()
{
	PrintToServer("DCT - Plugin started...");
}

public void OnPluginEnd ()
{
	PrintToServer("DCT - Plugin stopping...");
}

public void OnMapStart ()
{
	int iIndex = 0;
	
	LogMessage("DCT - Intitializing Collection One.");
	g_CollOne = new CollectionOne();
	for (iIndex = 0; iIndex < 2; iIndex++)
	{
		CollectionOneMembers collone = CollectionOneMembers();
		collone.m_iSomeIntOne = iCollectionOne;
		collone.m_bSomeBoolOne = bCollectionOne;
		collone.SetSomeString(szCollectionOneString);
		g_CollOne.AddItem(collone);
	}
	LogMessage("DCT - Finished initializing Collection One.");
	
	LogMessage("DCT - Intitializing Collection Two.");
	g_CollTwo = new CollectionTwo();
	for (iIndex = 0; iIndex < 2; iIndex++)
	{
		CollectionTwoMembers colltwo = CollectionTwoMembers();
		colltwo.m_iSomeIntTwo = iCollectionTwo;
		colltwo.m_bSomeBoolTwo = bCollectionTwo;
		colltwo.SetSomeString(szCollectionTwoString);
		g_CollTwo.AddItem(colltwo);
	}
	LogMessage("DCT - Finished initializing Collection Two.");
	
	LogMessage("DCT - Intitializing Collection Three.");
	g_CollThree = new CollectionThree();
	for (iIndex = 0; iIndex < 2; iIndex++)
	{
		CollectionThreeMembers collthree = CollectionThreeMembers();
		collthree.m_iSomeIntThree = iCollectionThree;
		collthree.m_bSomeBoolThree = bCollectionThree;
		collthree.SetSomeString(szCollectionThreeString);
		g_CollThree.AddItem(collthree);
	}
	LogMessage("DCT - Finished initializing Collection Three.");
	
	LogMessage("DCT - Collection One is `%s`", ValidateCollectionOne() ? "VALID" : "INVALID");
	LogMessage("DCT - Collection Two is `%s`", ValidateCollectionTwo() ? "VALID" : "INVALID");
	LogMessage("DCT - Collection Three is `%s`", ValidateCollectionThree() ? "VALID" : "INVALID");
	
}

public void OnMapEnd()
{
	LogMessage("DCT - Disposing Collection One.");
	g_CollOne.Dispose(true);
	LogMessage("DCT - Disposing Collection Two.");
	g_CollTwo.Dispose(true);
	LogMessage("DCT - Disposing Collection Three.");
	g_CollThree.Dispose(true);
}

bool ValidateCollectionOne ()
{
	int iIndex;
	CollectionOneMembers collone;
	char szSomeString[128];
	
	if (g_CollOne.Count != 2)
	    return false;
	
	for (iIndex = 0; iIndex < g_CollOne.Count; iIndex++)
	{
		collone = g_CollOne.Items(iIndex);
		if (collone.IsValid)
		{
			collone.GetSomeString(szSomeString, sizeof(szSomeString));
			
			if ((collone.m_iSomeIntOne != iCollectionOne) ||
				(collone.m_bSomeBoolOne != bCollectionOne) ||
				(strcmp(szSomeString, szCollectionOneString)))
			{
				return false;
			}
		} else {
			return false;
		}
	}
	
	return true;
}

bool ValidateCollectionTwo ()
{
	int iIndex;
	CollectionTwoMembers colltwo;
	char szSomeString[128];
	
	if (g_CollTwo.Count != 2)
	    return false;
	
	for (iIndex = 0; iIndex < g_CollTwo.Count; iIndex++)
	{
		colltwo = g_CollTwo.Items(iIndex);
		if (colltwo.IsValid)
		{
			colltwo.GetSomeString(szSomeString, sizeof(szSomeString));
			
			if ((colltwo.m_iSomeIntTwo != iCollectionTwo) ||
				(colltwo.m_bSomeBoolTwo != bCollectionTwo) ||
				(strcmp(szSomeString, szCollectionTwoString)))
			{
				return false;
			}
		} else {
			return false;
		}
	}
	
	return true;
}

bool ValidateCollectionThree ()
{
	int iIndex;
	CollectionThreeMembers collthree;
	char szSomeString[128];
	
	if (g_CollThree.Count != 2)
	    return false;
	
	for (iIndex = 0; iIndex < g_CollThree.Count; iIndex++)
	{
		collthree = g_CollThree.Items(iIndex);
		if (collthree.IsValid)
		{
			collthree.GetSomeString(szSomeString, sizeof(szSomeString));
			
			if ((collthree.m_iSomeIntThree != iCollectionThree) ||
				(collthree.m_bSomeBoolThree != bCollectionThree) ||
				(strcmp(szSomeString, szCollectionThreeString)))
			{
				return false;
			}
		} else {
			return false;
		}
	}
	
	return true;
}
