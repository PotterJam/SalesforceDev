trigger CeilingMappingTrigger on Ceiling_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingMappingHandler.handleAfterDelete(Trigger.old);
    }
}
