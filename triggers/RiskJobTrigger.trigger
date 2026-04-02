trigger RiskJobTrigger on Risk_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskJobHandler.handleAfterDelete(Trigger.old);
    }
}
