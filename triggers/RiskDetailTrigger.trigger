trigger RiskDetailTrigger on Risk_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskDetailHandler.handleAfterDelete(Trigger.old);
    }
}
