@isTest
public class leadToContactMacthTest {
    @testSetup static void enterContacts(){
        List<Contact> contactsIn= New List<Contact>();
        for(Integer i=0;i<20;i++){
            Contact con=new Contact();
            con.FirstName='FName'+i;
            con.LastName='LName'+i;
            con.Email='rawat.sooraj@gmail.com';
            contactsIn.add(con);
        }
        insert contactsIn;
    }
    @isTest static void LeadUpdate(){
        List<Lead> leadIn= New List<Lead>();
        for(Integer i=18;i<30;i++){
            Lead ld=new Lead();
            ld.FirstName='FName'+i;
            ld.LastName='LName'+i;
            ld.Email='rawat.sooraj@gmail.com';
            leadIn.add(ld);
        }
        Test.startTest();
      try { insert leadIn; 
           } 
        catch(Exception e) { 
            System.assert(e.getMessage().contains('FirstName and LastName and Email already exist')); 
        }
       
    }
        }