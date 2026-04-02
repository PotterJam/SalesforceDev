trigger AlertMappingTrigger on Alert_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertMappingHandler.handleAfterDelete(Trigger.old);
    }
}
