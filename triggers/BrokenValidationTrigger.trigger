trigger BrokenValidationTrigger on NonExistent_Object__c (before insert) {
    System.debug('This trigger references an object that does not exist.');
}
