trigger MilestoneMappingTrigger on Milestone_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneMappingHandler.handleAfterDelete(Trigger.old);
    }
}
