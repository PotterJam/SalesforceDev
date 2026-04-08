trigger TagMappingTrigger on Tag_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagMappingHandler.handleAfterDelete(Trigger.old);
    }
}
