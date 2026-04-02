trigger RiskTaskTrigger on Risk_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskTaskHandler.handleAfterDelete(Trigger.old);
    }
}
