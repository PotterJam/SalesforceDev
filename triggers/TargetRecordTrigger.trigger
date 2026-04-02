trigger TargetRecordTrigger on Target_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRecordHandler.handleAfterDelete(Trigger.old);
    }
}
