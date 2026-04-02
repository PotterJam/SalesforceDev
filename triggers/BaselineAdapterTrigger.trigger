trigger BaselineAdapterTrigger on Baseline_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
