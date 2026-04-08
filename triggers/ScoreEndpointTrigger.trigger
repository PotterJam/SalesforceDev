trigger ScoreEndpointTrigger on Score_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
