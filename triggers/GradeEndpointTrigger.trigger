trigger GradeEndpointTrigger on Grade_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
