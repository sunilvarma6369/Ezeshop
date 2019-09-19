({
	calldetails : function(component, event, helper) {
       var changeValue = component.find("carddetail").get("v.value");
        if(changeValue==='Debit Card'){
            var debitId = component.find("debitId"); 
            var creditId = component.find("creditId");
            $A.util.removeClass(debitId,"slds-hide");
            $A.util.addClass(creditId,"slds-hide");
        }else if(changeValue==='Credit Card'){
            var creditId = component.find("creditId");
            $A.util.removeClass(creditId,"slds-hide");
             var debitId = component.find("debitId");
            $A.util.addClass(debitId,"slds-hide");
        } 
	},
    upiCall : function(component, event, helper) {
       var changeValue = component.find("uyp").get("v.value");
        
        if(changeValue==='upi'){
            var debitId = component.find("debitId"); 
            var creditId = component.find("creditId");
            $A.util.addClass(debitId,"slds-hide");
            $A.util.addClass(creditId,"slds-hide");
             var upiId = component.find("upiId");
            $A.util.removeClass(upiId,"slds-hide");

        }
	}
})