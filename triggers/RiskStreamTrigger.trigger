trigger RiskStreamTrigger on Risk_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskStreamHandler.handleAfterDelete(Trigger.old);
    }
}
