#if defined _dynamic_collection_collectionthree_
  #endinput
#endif
#define _dynamic_collection_collectionthree_


methodmap CollectionThreeMembers < Dynamic
{
	public CollectionThreeMembers()
	{
		Dynamic collthreemembers = Dynamic();
		return view_as<CollectionThreeMembers>(collthreemembers);
	}
	
	property int m_iSomeIntThree
	{
		public get()
		{
			return this.GetInt("m_iSomeIntThree", 0);
		}
		public set (int iSomeInt)
		{
			this.SetInt("m_iSomeIntThree", iSomeInt);
		}
	}
	
	property bool m_bSomeBoolThree
	{
		public get()
		{
			return this.GetBool("m_bSomeBoolThree", false);
		}
		public set (bool bSomeBool)
		{
			this.SetBool("m_bSomeBoolThree", bSomeBool);
		}
	}
	
	public bool GetSomeString(char[] szBuffer, int iLength)
	{
		return this.GetString("m_szSomeStringThree", szBuffer, iLength);
	}
	
	public void SetSomeString(const char[] szBuffer)
	{
		this.SetString("m_szSomeStringThree", szBuffer, 128);
	}
}

methodmap CollectionThree < Collection
{
	public CollectionThree()
	{
		return view_as<CollectionThree>(new Collection());
	}
	
	public CollectionThreeMembers Items(int index)
	{
		return view_as<CollectionThreeMembers>(this.Items(index));
	}
}

