trigger VarianceDispatchTrigger on Variance_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
