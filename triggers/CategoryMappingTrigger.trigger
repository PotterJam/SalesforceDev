trigger CategoryMappingTrigger on Category_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryMappingHandler.handleAfterDelete(Trigger.old);
    }
}
