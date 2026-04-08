trigger EscalationMappingTrigger on Escalation_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationMappingHandler.handleAfterDelete(Trigger.old);
    }
}
