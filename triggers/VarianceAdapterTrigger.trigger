trigger VarianceAdapterTrigger on Variance_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
