@isTest
public class EzshopTesting {
    @testsetup static void insertrec(){
        Category__c cat=new Category__c(name='Hyd');
        Sub_Category__c sub = new Sub_Category__c(name='hitech',Category__c=cat.Id);
        Brands__c br = new Brands__c(name='Response',Sub_Category__c=sub.Id);
        insert cat;
        insert sub;
    }
    
    static testMethod void SearchInVFControllerTest() {
        list<Cart__c> cart = new List<Cart__c>();
        for(Integer i=0;i<5;i++){
            Cart__c c = new Cart__c(Name__c='sunil' +i);
            cart.add(c);
        }
        insert cart;
        test.starttest();
        SearchInVFController tot = new SearchInVFController();
        tot.getTotal();
        test.stoptest();
    }
    @isTest
    private static void testClass()
    {
        SearchInVFController constructor = new SearchInVFController() ;
        
    }
    static testMethod void clearTest() {
        Test.startTest();
        SearchInVFController clear = new SearchInVFController();
        clear.Search();
        Test.stopTest();
    }
    static testMethod void cartsTest() {
        Brands__c brand = new Brands__c();
        Cart__c testcart = new Cart__c ( Name__c ='test',
                                        Brands__c= brand.Id,
                                        Price__c= 300,
                                        Image__c= 'hello'
                                       );
        
        insert testcart;
        test.starttest();
        SearchInVFController bcontrol=new SearchInVFController();
        bcontrol.carts();
        test.stoptest();
    }
    static testMethod void ordersTest(){
        Order__c ord = new Order__c(Name__c='sunilvarma');
        test.starttest();
        SearchInVFController Ordercontrol=new SearchInVFController();
        Ordercontrol.orders();
        test.stoptest();
    }
   /* static testMethod void doDeleteTest(){
        list<Cart__c> items = new List<Cart__c>();
        
        Brands__c brand = new Brands__c(name='helloo');
        Cart__c del = new Cart__c();
        
        del.Name__c='sun'; 
        del.Brands__c=brand.Id;
        del.Price__c=300;   
        items.add(del);
        system.debug(''+del);
        test.starttest();
        
        SearchInVFController t=new SearchInVFController();
        t.recId = del.Id;
        t.del();
        test.stoptest();
    }*/
    static testMethod void SearchTest() {
        Test.startTest();
        SearchInVFController Obj = new SearchInVFController();
        Obj.searchKey='name';
        Obj.Search();
        Test.stopTest();
        
    }
    static testMethod void saveorderTest(){
        test.startTest();
        PageReference pageRef = Page.test1;
        Test.setCurrentPage(pageRef);
        SearchInVFController  controller = new SearchInVFController();
        System.assertNotEquals(null,controller.saveorder());
        test.stopTest();
    }
    static testMethod void invoiceTest(){
        list<Order__c> ordlist=new list<Order__c>();
        Order__c ord = new Order__c();
        ord.Name__c ='ks';
        
        ordlist.add(ord); 
        insert ordlist;
        system.debug('ordlist'+ordlist);
        test.startTest();
        PageReference pageRef = Page.test1;
        pageref.getParameters().put(' invOId', String.valueOf(ord.Id));
        pageref.getParameters().put('InvODate',String.valueOf(ord.Created_date__c));
        
        Test.setCurrentPage(pageRef);
        SearchInVFController  controller = new SearchInVFController();
        controller.invId = ord.Id;
        
        controller.invoice();
        //System.assertNotEquals(null,controller.invoice());
        test.stopTest();
    }    
    static testMethod void buyTest(){
        test.startTest();
        SearchInVFController Obj = new SearchInVFController();
        Obj.buy();
        test.stopTest();
    }
    static testMethod void details1Test(){
        Category__c cat = new Category__c();
        cat.Name='ss';
        insert cat;
        Sub_Category__c sub = new Sub_Category__c();
        sub.Name='sfdc';
        sub.Category__c=cat.Id;
        insert sub;
        Brands__c br = new Brands__c();
        br.Name='hell';
        br.Sub_Category__c=sub.Id;
        insert br;
        Products__c pro = new Products__c(name='s',
                                          Model__c='dfh2',
                                          Category__c=cat.Id ,
                                          Image__c='img',
                                          Brand__c = br.Id,
                                          Date_First_Available__c=system.today(),
                                          Price__c=125,
                                          Deal_Price__c=1478,
                                          Item_Weight__c=20,
                                          Return_Exchange__c='Yes, UpTo 30 Days',
                                          Sub_Category__c=sub.Id,
                                          Warranty_Details__c='1 Year');
        test.startTest();
        SearchInVFController dtl = new SearchInVFController();
        dtl.details1();
        test.stopTest();
    }
    static testMethod void cartssTest() {
        Category__c cat = new Category__c();
        cat.Name='ss';
        insert cat;
        Sub_Category__c sub = new Sub_Category__c();
        sub.Name='sfdc';
        sub.Category__c=cat.Id;
        insert sub;
        Brands__c br = new Brands__c();
        br.Name='hell';
        br.Sub_Category__c=sub.Id;
        insert br;
        //list<Products__c>  testlist = new list<Products__c>();
        Products__c testpr = new Products__c();
        testpr.name='testpr';
        testpr.Category__c=cat.Id;
        testpr.Sub_Category__c=sub.Id;
        testpr.Model__c='sfs';
        testpr.Deal_Price__c=8597;
        testpr.Image__c='heloo123';
        testpr.Brand__c=br.Id;
        insert testpr;
       // testlist.add(testpr);	  
    //  Products__c testpr1 = new Products__c();
     //  testpr1= [select Id , Name, Brand__c,Deal_Price__c,Model__c,Image__c from Products__c where id=: testpr.Id];  
      //  system.debug('0'+testpr1);
           test.startTest();
        // PageReference pageRef = Page.ezshopindex;
      //  pageref.getParameters().put('accId', testpr.Id);
      //  Test.setCurrentPage(pageRef);
		ApexPages.currentPage().getParameters().put('accId', testpr.Id);
        SearchInVFController  ctrl = new SearchInVFController(); 
       // ctrl.Pro = testpr1;
        //  ctrl.accId = testpr.Id;
       /* ctrl.pro.Id = testpr.Id;
        ctrl.Pro.Name = testpr.Name;
        ctrl.Pro.Brand__c= testpr.Brand__c;
        ctrl.Pro.Model__c = testpr.Model__c;
        ctrl.Pro.Image__c = testpr.Image__c;
        ctrl.Pro.Deal_Price__c= testpr.Deal_Price__c;*/
         ctrl.cartss();
               test.stopTest();
    }
    
    static testMethod void payOrderTest() {
        Category__c cat = new Category__c();
        cat.Name='ss';
        insert cat;
        Sub_Category__c sub = new Sub_Category__c();
        sub.Name='sfdc';
        sub.Category__c=cat.Id;
        insert sub;
        Brands__c br = new Brands__c();
        br.Name='hell';
        br.Sub_Category__c=sub.Id;
        insert br;
        Cart__c ac = new Cart__c();
        ac.Name__c = 'N_Test';
        ac.Brands__c = br.Id ;
        ac.Price__c = 100;
        ac.Model__c = 'M_Model';
        ac.Image__c = 'I_Test';
        INSERT ac;
        Test.startTest();
          SearchInVFController obj = new SearchInVFController();
          obj.payOrder();
        PageReference pageRef = Page.Redirect;
        Test.setCurrentPage(pageRef);
        System.assertNotEquals(null,obj.payOrder());
        Test.stopTest();
    }
}