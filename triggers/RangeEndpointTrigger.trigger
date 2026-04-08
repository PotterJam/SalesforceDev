trigger RangeEndpointTrigger on Range_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
