trigger OrderManagerTrigger on Order_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderManagerHandler.handleAfterDelete(Trigger.old);
    }
}
