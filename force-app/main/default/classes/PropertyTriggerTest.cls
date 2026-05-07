@isTest
public without sharing class PropertyTriggerTest {

    @isTest
    static void testBeforeInsert() {
        // Create test data
        AgCRMTest1__Property__c prop = new AgCRMTest1__Property__c();
        // Name intentionally left null

        Test.startTest();
        insert prop;
        Test.stopTest();

        // Fetch record from DB
        List<AgCRMTest1__Property__c> insertedProps = 
            [SELECT Id, Name FROM AgCRMTest1__Property__c WHERE Id = :prop.Id];

        System.assert(!insertedProps.isEmpty(), 'Property should be inserted');
        System.assertEquals('Default Name', insertedProps[0].Name);
    }

    @isTest
    static void testBeforeUpdate() {
        // Insert initial record
        AgCRMTest1__Property__c prop = new AgCRMTest1__Property__c(Name = 'Test');
        insert prop;

        // Update with null name
        prop.Name = null;

        Test.startTest();
        update prop;
        Test.stopTest();

        AgCRMTest1__Property__c updatedProp = 
            [SELECT Id, Name FROM AgCRMTest1__Property__c WHERE Id = :prop.Id LIMIT 1];

        System.assertEquals('Default Name', updatedProp.Name);
    }
}