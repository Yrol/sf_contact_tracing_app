public class CTLocationController {

    public static List<Location__c> getRecentStatusChanges() {
        List<Location__c> locations = [SELECT Name, Address__c, Red_Score__c, Pincode__c, Status__c, CreatedBy.Name, LastModifiedBy.Name, Owner.Name FROM 
                                Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        return locations;
    }

    public static List<Location__c> getRecentStatusChanges(String keywords) {
        keywords = keywords + '%';
        List<Location__c> locations = [SELECT Name, Address__c, Red_Score__c, Pincode__c, Status__c, CreatedBy.Name, LastModifiedBy.Name, Owner.Name FROM 
                                        Location__c WHERE Pincode__c LIKE :keywords OR Address__c LIKE :keywords ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        return locations;
    }

    public static Location__c getLocationById(String locationId) {
        List<Location__c> locations = [SELECT Id, Name, Address__c, Red_Score__c, Pincode__c, Status__c, CreatedBy.Name, LastModifiedBy.Name, Owner.Name FROM 
                                        Location__c WHERE Id=:locationId];

        if(locations != null && locations.size() > 0) {
            return locations[0];
        }

        return null;
    }
}
