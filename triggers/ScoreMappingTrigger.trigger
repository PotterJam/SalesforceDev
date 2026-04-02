trigger ScoreMappingTrigger on Score_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreMappingHandler.handleAfterDelete(Trigger.old);
    }
}
