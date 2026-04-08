trigger TargetMappingTrigger on Target_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetMappingHandler.handleAfterDelete(Trigger.old);
    }
}
