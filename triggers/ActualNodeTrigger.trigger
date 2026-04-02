trigger ActualNodeTrigger on Actual_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualNodeHandler.handleAfterDelete(Trigger.old);
    }
}
