trigger VarianceNodeTrigger on Variance_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceNodeHandler.handleAfterDelete(Trigger.old);
    }
}
