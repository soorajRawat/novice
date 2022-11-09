public class AccountHandler {
    public static Account insertNewAccount(String nName){
       Account a = new Account();
        a.Name=nName;
        try{
            insert a;
            return a;
        
        }catch(exception e){
            return null;
        }
            }
   
}