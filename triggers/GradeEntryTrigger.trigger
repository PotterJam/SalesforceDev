trigger GradeEntryTrigger on Grade_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeEntryHandler.handleAfterDelete(Trigger.old);
    }
}
