({
    
    doInit : function(component, event, helper) {
        
        var action = component.get("c.getPicklistFieldValues");       
        
        action.setCallback(this, function(data){
            
            component.set("v.productList",data.getReturnValue());
            console.log(data.getReturnValue());
        });       
        
        $A.enqueueAction(action);
        
    },
   
    
})