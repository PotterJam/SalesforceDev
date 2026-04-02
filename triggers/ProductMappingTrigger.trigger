trigger ProductMappingTrigger on Product_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductMappingHandler.handleAfterDelete(Trigger.old);
    }
}
