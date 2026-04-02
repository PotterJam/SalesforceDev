trigger GradeRelayTrigger on Grade_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeRelayHandler.handleAfterDelete(Trigger.old);
    }
}
