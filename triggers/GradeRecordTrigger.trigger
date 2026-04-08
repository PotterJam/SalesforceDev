trigger GradeRecordTrigger on Grade_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRecordHandler.handleAfterDelete(Trigger.old);
    }
}
