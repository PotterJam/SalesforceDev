trigger ActualServiceTrigger on Actual_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualServiceHandler.handleAfterDelete(Trigger.old);
    }
}
