trigger RiskRequestTrigger on Risk_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRequestHandler.handleAfterDelete(Trigger.old);
    }
}
