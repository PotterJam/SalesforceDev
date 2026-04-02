trigger SeverityMappingTrigger on Severity_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityMappingHandler.handleAfterDelete(Trigger.old);
    }
}
