trigger GradeBindingTrigger on Grade_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBindingHandler.handleAfterDelete(Trigger.old);
    }
}
