trigger GradeFlowTrigger on Grade_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeFlowHandler.handleAfterDelete(Trigger.old);
    }
}
