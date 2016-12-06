#if defined _dynamic_collection_collectionone_
  #endinput
#endif
#define _dynamic_collection_collectionone_


methodmap CollectionOneMembers < Dynamic
{
	public CollectionOneMembers()
	{
		Dynamic collone = Dynamic();
		return view_as<CollectionOneMembers>(collone);
	}
	
	property int m_iSomeIntOne
	{
		public get()
		{
			return this.GetInt("m_iSomeIntOne", 0);
		}
		public set (int iSomeInt)
		{
			this.SetInt("m_iSomeIntOne", iSomeInt);
		}
	}
	
	property bool m_bSomeBoolOne
	{
		public get()
		{
			return this.GetBool("m_bSomeBoolOne", false);
		}
		public set (bool bSomeBool)
		{
			this.SetBool("m_bSomeBoolOne", bSomeBool);
		}
	}
	
	public bool GetSomeString(char[] szBuffer, int iLength)
	{
		return this.GetString("m_szSomeStringOne", szBuffer, iLength);
	}
	
	public void SetSomeString(const char[] szBuffer)
	{
		this.SetString("m_szSomeStringOne", szBuffer, 128);
	}
}

methodmap CollectionOne < Collection
{
	public CollectionOne()
	{
		return view_as<CollectionOne>(new Collection());
	}
	
	public CollectionOneMembers Items(int index)
	{
		return view_as<CollectionOneMembers>(this.Items(index));
	}
}

