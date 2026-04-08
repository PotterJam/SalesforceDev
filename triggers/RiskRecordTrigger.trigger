trigger RiskRecordTrigger on Risk_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRecordHandler.handleAfterDelete(Trigger.old);
    }
}
