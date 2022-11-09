trigger updateTask on Task (after update) {
   
    List<Task> newTask=new List<Task>();
   
    if(trigger.isupdate){
        for(Task tsk: trigger.new){
            List<Opportunity> relatedOpps =[SELECT Id,StageName,Amount,Account.OwnerId FROM Opportunity WHERE Id =:tsk.WhatId ];
            for(Opportunity opps :relatedOpps){
                if(tsk.ActivityDate==system.today() && opps.Amount>100000 && opps.StageName!='Closed Won'){
                    newTask.add(new Task(Subject= 'Immediate Attention Required: Oppty Not Closed',
                                         Description='Please action ASAP and close the opportunity',
                                         Priority='High',OwnerId=opps.Account.OwnerId));
                
            }
        }
            }
        if(newTask.size()>0){
            insert newTask ;
        }  
    }

}