trigger CeilingRecordTrigger on Ceiling_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRecordHandler.handleAfterDelete(Trigger.old);
    }
}
