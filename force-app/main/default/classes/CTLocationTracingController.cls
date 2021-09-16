public class CTLocationTracingController {

    public static List<Location_Tracing__c> getVisitors(String locationId) {
        List<Location_Tracing__c> locationsTracing = [SELECT Id, Visit_Date__c, Location__c, Person__r.Health_Status__c, Person__r.Name FROM 
                                                      Location_Tracing__c WHERE Id=:locationId ORDER By Visit_Date__c];
        return locationsTracing;
    }

    public static List<Location_Tracing__c> getLocationByPersonIds(Set<Id> personIds) {
        List<Location_Tracing__c> locationsTracing = [SELECT Id, Visit_Date__c, Person__r.Name, Location__c FROM 
                                                        Location_Tracing__c WHERE Person__c IN :personIds AND
                                                        Visit_Date__c=LAST_N_DAYS:10];
        return locationsTracing;
    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationsIds) {
        List<Location_Tracing__c> locationsTracing = [SELECT Id, Visit_Date__c, Person__r.Name, Location__c FROM 
                                                Location_Tracing__c WHERE Location__c IN :locationsIds AND
                                                Person__r.Health_Status__c = 'Green'];

        return locationsTracing;
    }
}
