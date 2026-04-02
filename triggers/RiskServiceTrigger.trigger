trigger RiskServiceTrigger on Risk_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskServiceHandler.handleAfterDelete(Trigger.old);
    }
}
