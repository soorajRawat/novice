public class ContactSearch {
    public static Contact[] searchForContacts(String A , String B){
       // String c=A;
       // 
        //String d=B;
        Contact[] contactFind = [Select IndividualId,FirstName,LastName FROM Contact where(LastName=:A AND MailingPostalCode=:B)];
        return contactFind;
    }

}
