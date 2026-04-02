trigger ResearchMappingTrigger on Research_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchMappingHandler.handleAfterDelete(Trigger.old);
    }
}
