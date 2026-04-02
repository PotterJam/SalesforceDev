trigger PhaseRecordTrigger on Phase_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRecordHandler.handleAfterDelete(Trigger.old);
    }
}
