@isTest
public  class  LeadUpdateTest { 
    @TestSetUp static void leadEntry(){
        Lead lRec1 = new Lead();
        lRec1.FirstName='Adam';
        lRec1.LastName='bryan';
        lRec1.Phone=null ;
        lRec1.MobilePhone='2901988838';
        lRec1.Company='Julen';
        lRec1.Status='Working-Contacted';
        
        Insert lRec1;}
    
    @isTest static void leadTest(){
       
        Lead lc=[select Id,Phone from Lead];
        update lc;
        Test.startTest();
        Update lc;
       
        Test.stopTest();
        Lead l=[select Id,Phone from Lead where id=:lc.id];
        
        System.assertEquals('2901988838',l.Phone);

    }
     @isTest static void leadTest1(){
       
        Lead lc=[select Id,Phone from Lead];
         lc.Phone='88673';
        update lc;
        Test.startTest();
        Update lc;
       
        Test.stopTest();
        Lead l=[select Id,Phone from Lead where id=:lc.id];
        
        System.assertEquals('88673',l.Phone);

    }
     @isTest static void leadTest3(){
       
        Lead lc=[select Id,Phone from Lead];
         lc.Phone=null;
         lc.MobilePhone=null;
        update lc;
        Test.startTest();
        Update lc;
       
        Test.stopTest();
        Lead l=[select Id,Phone from Lead where id=:lc.id];
        
        System.assertEquals(null,l.Phone);

    }
    @isTest static void leadTest4(){
       
        Lead lc=[select Id,Phone from Lead];
         lc.Phone='98989';
         lc.MobilePhone=null;
        update lc;
        Test.startTest();
        Update lc;
       
        Test.stopTest();
        Lead l=[select Id,Phone from Lead where id=:lc.id];
        
        System.assertEquals('98989',l.Phone);

    }
  }