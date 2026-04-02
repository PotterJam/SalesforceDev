trigger RangeMappingTrigger on Range_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeMappingHandler.handleAfterDelete(Trigger.old);
    }
}
