trigger ProductNodeTrigger on Product_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductNodeHandler.handleAfterDelete(Trigger.old);
    }
}
