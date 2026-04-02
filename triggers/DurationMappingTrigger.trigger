trigger DurationMappingTrigger on Duration_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationMappingHandler.handleAfterDelete(Trigger.old);
    }
}
