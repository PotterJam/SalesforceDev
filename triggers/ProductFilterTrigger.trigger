trigger ProductFilterTrigger on Product_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductFilterHandler.handleAfterDelete(Trigger.old);
    }
}
