trigger CustomerControllerTrigger on Customer_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerControllerHandler.handleAfterDelete(Trigger.old);
    }
}
