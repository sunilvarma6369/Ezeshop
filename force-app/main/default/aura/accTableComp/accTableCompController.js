({
	doinit : function(component, event, helper) {
		var action=component.get("c.totalAccounts");
        action.setParams({})
        
        action.setCallback(this, function(response){
            console.log(response);
            if(response.getState() ==='SUCCESS')
            {
                console.log(response.getReturnValue());
                
                component.set("v.lstacc",response.getReturnValue());
            }  
        })
        
        $A.enqueueAction(action);
	}
})