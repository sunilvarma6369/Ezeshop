public class fetchContactDetails {   
    //public String strSelected  {get;set;}
 //public List<SelectOption> options {get;set;}

    @AuraEnabled
	public static List<String> getPicklistFieldValues(){
        
        List<String> picklistValues = new List<String>();  
        SObjectType objectType = Schema.getGlobalDescribe().get('product2');
        List<Schema.PicklistEntry> pick_list_values = objectType.getDescribe().fields.getMap().get('Category__c').getDescribe().getPickListValues();
        for (Schema.PicklistEntry aPickListValue : pick_list_values) {                   
            picklistValues.add(aPickListValue.getValue()); 
        }
        system.debug('picklistValues::::'+picklistValues);
        return picklistValues;
    }
    
    public static list<Product2> fetchProductList(){

        return [select Id, name, Category__c from product2 where Category__c != null limit 10];             

    }

    
}