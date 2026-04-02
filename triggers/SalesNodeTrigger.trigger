trigger SalesNodeTrigger on Sales_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesNodeHandler.handleAfterDelete(Trigger.old);
    }
}
