trigger RatingEndpointTrigger on Rating_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
