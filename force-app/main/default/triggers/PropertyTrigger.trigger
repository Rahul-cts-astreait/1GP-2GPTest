trigger PropertyTrigger on AgCRMTest1__Property__c (before insert, before update) {
    for (AgCRMTest1__Property__c prop : Trigger.new) {
        if (prop.Name == null) {
            prop.Name = 'Default Name';
        }
    }
}