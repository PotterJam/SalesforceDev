trigger RiskDeltaTrigger on Risk_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
