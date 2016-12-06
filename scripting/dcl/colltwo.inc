#if defined _dynamic_collection_collectiontwo_
  #endinput
#endif
#define _dynamic_collection_collectiontwo_


methodmap CollectionTwoMembers < Dynamic
{
	public CollectionTwoMembers()
	{
		Dynamic collectiontwomembers = Dynamic();
		return view_as<CollectionTwoMembers>(collectiontwomembers);
	}
	
	property int m_iSomeIntTwo
	{
		public get()
		{
			return this.GetInt("m_iSomeIntTwo", 0);
		}
		public set (int iSomeInt)
		{
			this.SetInt("m_iSomeIntTwo", iSomeInt);
		}
	}
	
	property bool m_bSomeBoolTwo
	{
		public get()
		{
			return this.GetBool("m_bSomeBoolTwo", false);
		}
		public set (bool bSomeBool)
		{
			this.SetBool("m_bSomeBoolTwo", bSomeBool);
		}
	}
	
	public bool GetSomeString(char[] szBuffer, int iLength)
	{
		return this.GetString("m_szSomeStringTwo", szBuffer, iLength);
	}
	
	public void SetSomeString(const char[] szBuffer)
	{
		this.SetString("m_szSomeStringTwo", szBuffer, 128);
	}
}

methodmap CollectionTwo < Collection
{
	public CollectionTwo()
	{
		return view_as<CollectionTwo>(new Collection());
	}
	
	public CollectionTwoMembers Items(int index)
	{
		return view_as<CollectionTwoMembers>(this.Items(index));
	}
}

