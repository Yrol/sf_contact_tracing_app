public with sharing class CTLocationTriggerHandler {

    public static void beforeInsert(List<Location__c> newRecords) {

        for(Location__c newLocation: newRecords){
            newLocation.Status__c = 'Green';
        }
    }

    public static void beforeUpdate(List<Location__c> newRecords, Map<Id, Location__c> oldRecords) {

        for(Location__c newLocation: newRecords){
            if(newLocation.Status__c != oldRecords.get(newLocation.Id).Status__c){
                newLocation.Status_Update_Date__c = Date.today();
            }
        }
    }
}
