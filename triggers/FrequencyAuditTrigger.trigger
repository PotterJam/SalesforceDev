trigger FrequencyAuditTrigger on Frequency_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyAuditHandler.handleAfterDelete(Trigger.old);
    }
}
