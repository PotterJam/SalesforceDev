trigger LimitMappingTrigger on Limit_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitMappingHandler.handleAfterDelete(Trigger.old);
    }
}
