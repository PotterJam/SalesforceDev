trigger ProductControllerTrigger on Product_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductControllerHandler.handleAfterDelete(Trigger.old);
    }
}
