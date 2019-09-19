public class AccountTableController {
    
    @AuraEnabled
    public static list<account> totalAccounts()
    {
        list<account> lstacc=[select id,name, rating from account where rating!=NULL];
        return lstacc;
    }
    

}