public with sharing class PersonTriggerHandler {

    public static void beforeInsert(List<Person__c> newRecords) {
        for(Person__c personRecord: newRecords){
            personRecord.Token__c = CTPersonController.getToken(personRecord.Mobile__c);
            personRecord.Health_Status__c = 'Green';
        }
    }

    public static void beforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecords) {

        for(Person__c personRecord: newRecords){
            //change the update date only if the Health Status has been updated
            if(oldRecords.get(personRecord.Id).Health_Status__c != personRecord.Health_Status__c) {
                personRecord.Status_Update_Date__c = Date.today();
            }
        }
    }
}
