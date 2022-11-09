trigger LeastAmountOpp on Account (before update) {
    for(Account acc:trigger.new){
        if(trigger.isupdate){
        list<account> AccEntry=[Select Id,Least_Amount_Opportunity__c, (Select Name, Amount ,AccountId
                           from Opportunities order by Amount ASC limit 1) from account  ];
        for(account acc1:AccEntry){
            for(Opportunity leastOpp:acc1.Opportunities){
                if(acc.Id==leastOpp.accountId){
                    acc.Least_Amount_Opportunity__c=leastOpp.Name;
                }
                
                }
        	}         
        }  
    }      

}