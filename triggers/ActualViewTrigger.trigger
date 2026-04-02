trigger ActualViewTrigger on Actual_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualViewHandler.handleAfterDelete(Trigger.old);
    }
}
