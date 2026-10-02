function fetch_object()
{
	
	
	var xmlobj;
	
	try
	{
		
		if (window.XMLHttpRequest)
		{
			
			xmlobj=new XMLHttpRequest();	
			
		}
		
	}catch(e)
	{
		
		if (window.ActiveXObject)
		{
			
			xmlobj=new	ActiveXObject();
			
		}
	}
	
	
	
}