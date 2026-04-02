trigger EscalationRecordTrigger on Escalation_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationRecordHandler.handleAfterDelete(Trigger.old);
    }
}
