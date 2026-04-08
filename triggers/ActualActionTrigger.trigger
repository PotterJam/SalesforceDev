trigger ActualActionTrigger on Actual_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualActionHandler.handleAfterDelete(Trigger.old);
    }
}
