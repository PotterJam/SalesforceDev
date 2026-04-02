trigger RiskManagerTrigger on Risk_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskManagerHandler.handleAfterDelete(Trigger.old);
    }
}
