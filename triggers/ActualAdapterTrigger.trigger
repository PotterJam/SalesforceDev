trigger ActualAdapterTrigger on Actual_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
