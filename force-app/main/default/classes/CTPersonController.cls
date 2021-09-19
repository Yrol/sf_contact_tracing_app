public class CTPersonController {
    
    public static String getToken(String mobileNo) {
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        return EncodingUtil.base64Encode(hash);
    }

    public static List<Person__c> getRecentHealthChanges() {
        List<Person__c> persons = [SELECT Name, Mobile__c, CreatedBy.Name, LastModifiedBy.Name, Health_Status__c, Status_Update_Date__c,Token__c FROM 
                                Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        return persons;
    }

    public static List<Person__c> searchPeople(String keywords) {
        keywords = keywords + '%';
        List<Person__c> persons = [SELECT Name, Mobile__c, CreatedBy.Name, LastModifiedBy.Name, Health_Status__c, Status_Update_Date__c,Token__c FROM 
                        Person__c WHERE Name LIKE :keywords OR Mobile__c  LIKE :keywords OR Token__c LIKE :keywords ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];

        return persons;
    }

    public static Person__c getPersonById(String personId) {
        List<Person__c> persons = [SELECT Id, Name, Mobile__c, CreatedBy.Name, LastModifiedBy.Name, Health_Status__c, Status_Update_Date__c,Token__c FROM 
                        Person__c WHERE Id=:personId];

        if(persons != null &&  persons.size() > 0){
            return persons[0];
        }

        return null;
    }

    public static Map<String, Integer> getHealthStatusCount() {
        Map<String, Integer> healthStatusGroup = new Map<String, Integer>();

        for(AggregateResult ar: [SELECT Health_Status__c HealthStatus, Count(Id) NumberOfPeople FROM Person__c GROUP BY Health_Status__c]){
            String healthStatus = String.valueOf(ar.get('HealthStatus'));
            Integer count = Integer.valueOf(ar.get('NumberOfPeople'));
            healthStatusGroup.put(healthStatus, count);
        }

        return healthStatusGroup;
    }
}
