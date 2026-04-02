trigger GradeAdapterTrigger on Grade_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
