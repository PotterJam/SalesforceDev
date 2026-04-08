trigger VarianceActionTrigger on Variance_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceActionHandler.handleAfterDelete(Trigger.old);
    }
}
