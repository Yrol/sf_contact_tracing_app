trigger CTPersonTrigger on Person__c (before insert, after update, before update) {
    switch on Trigger.operationType {
        
        when BEFORE_INSERT {
            for(Person__c personRecord: Trigger.New){
                personRecord.Token__c = CTPersonController.getToken(personRecord.Mobile__c);
                personRecord.Health_Status__c = 'Green';
            }
        }

        when BEFORE_UPDATE {
            for(Person__c personRecord: Trigger.New){
                //change the update date only if the Health Status has been updated
                if(Trigger.oldMap.get(personRecord.Id).Health_Status__c != personRecord.Health_Status__c) {
                     personRecord.Status_Update_Date__c = Date.today();
                }
            }
        }
    }
}