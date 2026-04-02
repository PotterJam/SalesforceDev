trigger ProjectMappingTrigger on Project_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectMappingHandler.handleAfterDelete(Trigger.old);
    }
}
