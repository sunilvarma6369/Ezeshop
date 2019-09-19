public with sharing class SearchInVFController {
    public list <Products__c> prod {get;set;}
    public list <Products__c> det {get;set;}
    public Products__c Pro {get;set;}
    public static list <Cart__c> Records {get;set;}
    public Cart__c cartOrder { get; set; }
    public String cartRecId{get;set;}
    public String accId{get;set;}
    public String invId{get;set;}
    public String searchKey {get;set;}
    public  boolean flag1 {get;set;}
    public  boolean flag2 {get;set;}
    public  boolean flag3 {get;set;}
    public  boolean flag4 {get;set;}
    public  boolean flag5 {get;set;}
    public  boolean flag8 {get;set;}
    public  boolean flag {get;set;}
    public  list <Order__c> Recs {get;set;} 
    public list<Products__c> det1{get;set;}
    public List<Cart__c> delDlt{set;get;}
    public  Integer total;
    public Integer sum;
    Order__c request;
    public Object sumAmount{set;get;}
    private ApexPages.StandardController controller;
    public List<Category__c> accs {set;get;}
    public List<Order__c> inv{get;set;}
    public string invOId { get; set;}
    public date InvODate { get; set;}
    public string selectedValue{ get; set;}
    //constructor
    public SearchInVFController( ) {
        flag=false;
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=false;
        flag5=false;
        flag8=true;
        this.controller = controller;
        cartOrder = New Cart__c();
        AggregateResult[] groupedResults = [SELECT SUM(Price__c)aver FROM Cart__c ];
        sumAmount = groupedResults[0].get('aver');
        inv = [select Name__c,Model__c,Price__c,name from Order__c];
        pro = new Products__c();
        det1=[select id,name,Model__c,Category__c ,Image__c,Brand__c,Price__c,
              Deal_Price__c,Item_Weight__c,Sub_Category__c,
              Warranty_Details__c from Products__c ];
        accs = [select id,name from Category__c ];
        Cart__c cartOrder = New Cart__c();
    }
    //Invoice
    public pagereference invoice(){
        inv = [select Name__c,Model__c,Price__c,name,Created_date__c from Order__c where id =:invId]; 
        invOId=inv[0].name; InvODate=inv[0].Created_date__c;
        pagereference redinv = new PageReference('/apex/test1');
        return redinv;
    }
    public void search(){
        flag=false;
        flag1=true;
        flag2=false;
        flag3=false;
        flag4=false;
        flag5=false;
        flag8=false;
        string searchquery='select Name,Image__c,brand__c,Price__c,Deal_Price__c from Products__c where name like \'%'+searchKey+'%\' Limit 10';
        prod= Database.query(searchquery);
    }
    public void details1()
    {
        flag=false;
        flag1=false;
        flag2=false;
        flag3=true;
        flag4=false;
        flag5=false;
        flag8=false;
        det=[select id,name,Model__c,Category__r.name ,Image__c,Brand__r.name,Date_First_Available__c,Price__c,
             Deal_Price__c,Item_Weight__c,Return_Exchange__c,Sub_Category__r.name,
             Warranty_Details__c from Products__c where id =:accId];
    }
    public Integer getTotal() {
        total = [SELECT count() FROM Cart__c];
        return total;
    }
    public  void carts()
    {
        flag=false;
        flag1=false;
        flag2=true;
        flag3=false;
        flag4=false;
        flag5=false;
        flag8=false;
        Records = [SELECT Id,Name__c, Brands__c,Price__c,Image__c FROM Cart__c];
        //delCartItems();
         system.debug('******************cartRecords'+Records);
    }
    public  void orders()
    {
        flag=false;
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=false;
        flag5=true;
        flag8=false;
        Recs = [SELECT Name__c FROM Order__c];
    }
    // Add to Cart
    public void cartss(){
        Pro = [Select Id, Name, Brand__c,Deal_Price__c,Model__c,Image__c from Products__c where id =:accId];
        cartOrder.Name__c =  pro.Name;
        cartOrder.Model__c =  pro.Model__c;
        cartOrder.Brands__c =  pro.Brand__c;
        cartOrder.Image__c =  pro.Image__c;
        cartOrder.Price__c =  pro.Deal_Price__c;
        Insert cartOrder;
        system.debug(''+cartOrder);
        pagereference redirect = new PageReference('/apex/ezshopindex');
    }
    //deleting Cart Items
    public void doDeleteCart() {
       system.debug('Delete function');
       system.debug('******************cart'+cartRecId);
        delDlt=[select Id,Name__c,Price__c from Cart__c where Name__c =:cartRecId];
        system.debug('isdelDlt '+delDlt);
        delete delDlt;
       // return null;
         
    }
    public PageReference saveorder() {
        PageReference congratsPage = Page.ezshopindex;
        congratsPage.setRedirect(true);
        return congratsPage;
    }
    //Cart moved to orders
    public pagereference payOrder(){
        List<Cart__c> cartList = [Select Id, Name__c, Brands__c,Price__c,Model__c,Image__c from Cart__c];
        List<Order__c> oList = New List<Order__c>();
        for(Cart__c cartOrder : cartList){
            Order__c oOrder = New Order__c();
            oOrder.Name__c =  cartOrder.Name__c;
            oOrder.Model__c =  cartOrder.Model__c;
            oOrder.Brand__c =  cartOrder.Brands__c;
            oOrder.Image__c =  cartOrder.Image__c;
            oOrder.Price__c =  cartOrder.Price__c;
            oList.add(oOrder);
        } 
        Insert oList;
        delete cartList;
        pagereference redirect = new PageReference('/apex/Redirect');
        return redirect;
    }
    //payment Page
    public void buy(){
        flag=false; 
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=true;
        flag5=false;
        flag8=false;
    }
    //Categories
    public String selCat {get;set;}
    public list<Products__c> picklist {set;get;}
    List<selectOption> CatOptions = new List<selectOption>();
    public List<selectOption> getCatnames() {
        List<selectOption> CatOptions = new List<selectOption>();
        CatOptions.add(new selectOption('--Category--','--Category--'));
        for(Category__c objCat : [select name from Category__c]){
            CatOptions.add(new selectOption(objCat.name,objCat.name));
        }
        return CatOptions;
    }
    public void pick(){
        flag=false; 
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=false;
        flag5=false;
        flag8=true;
        picklist = [select id,name,Category__r.name,Image__c,Deal_Price__c from Products__c where Category__r.name =: selCat ];
        system.debug(''+picklist);
    }
    
}