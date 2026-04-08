trigger OrderNodeTrigger on Order_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderNodeHandler.handleAfterDelete(Trigger.old);
    }
}
