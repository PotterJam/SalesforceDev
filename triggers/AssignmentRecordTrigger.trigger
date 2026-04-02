trigger AssignmentRecordTrigger on Assignment_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRecordHandler.handleAfterDelete(Trigger.old);
    }
}
